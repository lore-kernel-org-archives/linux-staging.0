Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692B244670;
	Sun, 26 Oct 2025 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487204; cv=none; b=L0HOrTYOHksZzLssgs61hOGgxS7cG1BZqTjkApkQf4Xz52B9DGZLQpqSf52v/zBfGz4V1AOiDuYKhrUP6GOx64UMYzJvHMgkVrOG5GKskH3Dyo911+QxbVKC5sz+r9plwtW3XcLChst+HhfloLE6epY9pPJ4xRST9oHLrhV+N4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487204; c=relaxed/simple;
	bh=WXcZkA9rS9kSCjP0N3fQylh7T68NkGsLkURGcr8nqjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxKcNel/O1wvTicTlrGV/P0iNQWKZOamkJOD9Hk0L36ekHkyQz/SDZWOpiSeqy/5yVm+vKNVkZT00PZRcxVFNhtMOwgpciNwOZ2hOavq8YoRPUjg0QblLd1BUjBeR2pi6sR9YZvbbymVozc2xZIzH7wTGnzZOIdi8b6D6Y3WZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LprZfe6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LprZfe6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF375C4CEE7;
	Sun, 26 Oct 2025 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761487204;
	bh=WXcZkA9rS9kSCjP0N3fQylh7T68NkGsLkURGcr8nqjs=;
	h=Date:From:To:Cc:Subject:From;
	b=LprZfe6akDcqpOszpTqQK3fZ9R2DsZP/YtgOxuMnuMpApQBK3IpYlultqUAxbWit4
	 bbrAm5er49UITByipoXU0n9utUazQye/E9uvInQCju6RnoEyZsvCP0ve/HAjTANR1T
	 zY78/OpuxkV5cz60cXZun+RUhTvoA7r9+HzRkSgc=
Date: Sun, 26 Oct 2025 14:59:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 6.18-rc3
Message-ID: <aP4pX6-QYmlmM27h@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.18-rc3

for you to fetch changes up to b1aabb8ef09b4cf0cc0c92ca9dfd19482f3192c1:

  staging: gpib: Fix device reference leak in fmh_gpib driver (2025-10-13 10:55:03 +0200)

----------------------------------------------------------------
staging driver fixes for 6.18-rc3

Here are some small staging driver fixes for the gpib subsystem to
resolve some reported issues.  Included in here are:
  - memory leak fixes
  - error code fixes
  - proper protocol fixes

All of these have been in linux-next for almost 2 weeks now with no
reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dave Penkler (3):
      staging: gpib: Fix no EOI on 1 and 2 byte writes
      staging: gpib: Fix sending clear and trigger events
      staging: gpib: Return -EINTR on device clear

Ma Ke (1):
      staging: gpib: Fix device reference leak in fmh_gpib driver

 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 12 +++++++-----
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c             |  5 +++++
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c            | 13 ++++++++++---
 3 files changed, 22 insertions(+), 8 deletions(-)
