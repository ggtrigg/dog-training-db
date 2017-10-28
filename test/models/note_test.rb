require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "note create" do
    note = Note.new
    assert_not_nil note, "note creation nil"
    assert_nil note.annotation, "note anotation nil"
  end

  test "note save" do
    note = Note.new
    assert_not_nil note, "note creation nil"
    assert note.save
  end

  test "note parameters" do
    note = Note.new(annotation: "A test note annotation")
    assert_not_nil note, "note creation nil"
    assert_equal "A test note annotation", note.annotation, "note annotation expected"
  end
end
