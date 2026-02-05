ActiveAdmin.register Book do
  # 1. IMPORTANT: Add the new attachment names here
  permit_params :Title, :author, :isbn, :genre, :cover_image, :book_file

  index do
    selectable_column
    id_column
    column :title
    column :author
    # column :isbn
    column :genre

    # Show a small thumbnail in the list
    column "Cover" do |book|
      if book.cover_image.attached?
        image_tag url_for(book.cover_image), width: "50"
      else
        "No Image"
      end
    end

    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :author
      # row :isbn
      row :genre
      # row :published_date

      # Show large image in detail view
      row :cover_image do |book|
        if book.cover_image.attached?
          image_tag url_for(book.cover_image), width: "200"
        else
          status_tag("No Cover Uploaded")
        end
      end

      # Show link to download file
      row :book_file do |book|
        if book.book_file.attached?
          link_to "Download File", rails_blob_path(book.book_file, disposition: "download")
        else
          status_tag("No File Uploaded")
        end
      end

      row :created_at
    end
  end

  form do |f|
    f.inputs "Book Details" do
      f.input :title
      f.input :author
      # f.input :isbn
      f.input :genre
      # f.input :published_date, as: :date_picker

      # 2. Add the file uploaders to the form
      f.input :cover_image, as: :file, hint: f.object.cover_image.attached? ? "Image already uploaded" : "Upload a new image"
      f.input :book_file, as: :file, hint: f.object.book_file.attached? ? "File already uploaded" : "Upload a new file"
    end
    f.actions
  end
end
