use strict;
use warnings;

for (grep { -f $_ && !m/\.(cabal|pl|hsfiles)$/n } <* **/* .*>) {
	print "{-# START_FILE $_ #-}\n";
	open (my $fh, '<', $_) or die;
	for (<$fh>) {
		s|\Q{{copyright}}\E|{{copyright}}{{^copyright}}{{year}} {{author}}{{/copyright}}|;
		s|\Q{{author}}\E|{{author-name}}{{#author-email}} <{{author-email}}>{{/author-email}}|;
		print
	}
}
