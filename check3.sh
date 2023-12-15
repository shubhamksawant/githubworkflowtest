
import subprocess

def check_xml_updated(filename):
  """Checks if an .xml file is updated in a git commit.

  Args:
    filename: The name of the .xml file to check.

  Returns:
    True if the file is updated, False otherwise.
  """

  # Get the hash of the current commit.
  current_hash = subprocess.check_output(["git", "rev-parse", "HEAD"]).decode("utf-8")

  # Get the hash of the previous commit.
  previous_hash = subprocess.check_output(["git", "rev-parse", "HEAD~1"]).decode("utf-8")

  # Get the diff between the two commits.
  diff = subprocess.check_output(["git", "diff", "--name-only", current_hash, previous_hash]).decode("utf-8")

  # Check if the file is in the diff.
  return filename in diff

if __name__ == "__main__":
  filename = "my_file.xml"
  if check_xml_updated(filename):
    print("The file has been updated.")
  else:
    print("The file has not been updated.")
