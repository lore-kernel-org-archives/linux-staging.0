Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D921B4F21;
	Sun, 12 Jan 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736690751; cv=none; b=GaEKDmKvwJpO7V9wY9aFaGGVktJdU5f1EeOClqWWzuoe+iYun08SDexYApdPBpO1wlqLSwnd9R0MBFmq9biltisdln9XeSPBkkMkfgHzwYB169KhnUx03ct4FanUEsUFiTUqBsMGgAfkUP/TGHPI3OWTgayIvbOJKftfduCvIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736690751; c=relaxed/simple;
	bh=86kaDfOY62xlzjVV9X5PuVZgXxgCzzaneNy3EaVKF88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNukI3TOc+GMt75NV1tBf7J01A9LmLuLpq61rIYlG0UF8kW1WnNtzdd8VEsrTlkpF8aL+2gu1ZMkQT7LH1ZBN+e8ypG065taBAsCHKCgzoWqsl6IyBP3e4Q2PXJ3PSerr9V4k8BdUQvpEMczXC5gcYTHjejFefwQVyXCHrfHYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xMWVVtLe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xMWVVtLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C5AC4CEDF;
	Sun, 12 Jan 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736690751;
	bh=86kaDfOY62xlzjVV9X5PuVZgXxgCzzaneNy3EaVKF88=;
	h=Date:From:To:Cc:Subject:From;
	b=xMWVVtLe3T5s4llZxBkYtDIUkOLo/T294toyCzL966r/0n2B1JE3nODd7lNniL4RG
	 n34pTcKPOrGio3W/Io/wQNrloWMKOcLS9w3eBXO6GJmEp7ng5LfdfoCOX65NDL+yrg
	 njuDMTpvNgtKej0XhRXXw9rGhQg2On+WjPrlleBI=
Date: Sun, 12 Jan 2025 15:05:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 6.13-rc7
Message-ID: <Z4PMO3PX6837NuL6@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc7

for you to fetch changes up to 6f79db028e827b023623a6ff825952e0d5fb619f:

  staging: gpib: mite: remove unused global functions (2025-01-08 13:15:52 +0100)

----------------------------------------------------------------
Staging driver fixes for 6.13-rc7

Here are some small staging driver fixes that resolve some reported
issues and have been in my tree for too long due to the holiday break.
They resolve the following issues:
  - lots of gpib build-time fixes as reported by testers and 0-day
  - gpib logical fixes
  - mailmap fix (already in your tree, but git merge should handle it.)

All of these have been in linux-next for a while, with no reported
issues other than the duplicated change.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Arnd Bergmann (6):
      staging: gpib: make global 'usec_diff' functions static
      staging: gpib: fix Makefiles
      staging: gpib: add module author and description fields
      staging: gpib: fix pcmcia dependencies
      staging: gpib: use ioport_map
      staging: gpib: fix address space mixup

Bingwu Zhang (1):
      mailmap: update Bingwu Zhang's email address

Dave Penkler (2):
      staging: gpib: Fix erroneous removal of blank before newline
      staging: gpib: Add lower bound check for secondary address

Greg Kroah-Hartman (1):
      staging: gpib: mite: remove unused global functions

Jiapeng Chong (1):
      staging: gpib: Modify mismatched function name

Lukas Bulwahn (1):
      staging: gpib: refer to correct config symbol in tnt4882 Makefile

 .mailmap                                           |  2 +
 drivers/staging/gpib/Kconfig                       |  8 ++-
 drivers/staging/gpib/agilent_82350b/Makefile       |  2 +-
 .../staging/gpib/agilent_82350b/agilent_82350b.c   |  4 +-
 drivers/staging/gpib/agilent_82357a/Makefile       |  2 +-
 drivers/staging/gpib/cb7210/Makefile               |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c               | 12 ++--
 drivers/staging/gpib/cb7210/cb7210.h               |  4 +-
 drivers/staging/gpib/cec/Makefile                  |  2 +-
 drivers/staging/gpib/cec/cec_gpib.c                |  4 +-
 drivers/staging/gpib/common/Makefile               |  2 +-
 drivers/staging/gpib/common/gpib_os.c              | 54 +----------------
 drivers/staging/gpib/eastwood/Makefile             |  2 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c         | 12 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.h         |  4 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c           | 27 +++++----
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h           |  4 +-
 drivers/staging/gpib/gpio/Makefile                 |  2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c           |  2 +-
 drivers/staging/gpib/hp_82335/Makefile             |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c            | 21 +++----
 drivers/staging/gpib/hp_82341/Makefile             |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c           | 16 ++---
 drivers/staging/gpib/include/gpibP.h               | 12 +---
 drivers/staging/gpib/include/gpib_types.h          |  3 +-
 drivers/staging/gpib/include/nec7210.h             |  5 +-
 drivers/staging/gpib/include/tms9914.h             |  5 +-
 drivers/staging/gpib/ines/Makefile                 |  2 +-
 drivers/staging/gpib/ines/ines.h                   |  4 +-
 drivers/staging/gpib/ines/ines_gpib.c              | 22 +++----
 drivers/staging/gpib/lpvo_usb_gpib/Makefile        |  2 +-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 18 +++---
 drivers/staging/gpib/nec7210/Makefile              |  2 +-
 drivers/staging/gpib/nec7210/nec7210.c             | 16 ++---
 drivers/staging/gpib/ni_usb/Makefile               |  2 +-
 drivers/staging/gpib/pc2/Makefile                  |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c                | 16 ++---
 drivers/staging/gpib/tms9914/Makefile              |  2 +-
 drivers/staging/gpib/tms9914/tms9914.c             |  8 +--
 drivers/staging/gpib/tnt4882/Makefile              |  2 +-
 drivers/staging/gpib/tnt4882/mite.c                | 69 ----------------------
 drivers/staging/gpib/tnt4882/mite.h                | 13 +---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c        | 67 ++++++++++-----------
 43 files changed, 167 insertions(+), 297 deletions(-)
