Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3AB18B477;
	Mon, 27 Jan 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000736; cv=none; b=P9rXNsGuH1EP+ynMYfgT6EIrM/cPJDxm0KwDROjIP4xXZqsGesQ776BA7vMUOTPN+GsgyoeO0J+xjT9V5gcvL6iPy/W/veL9Ib0W4BSBV/P0IE79mXgT+1Disz5wjZXsfAiYmx+grl9zWjfx1Ffue+h2lRWNeIXOL2tD77PihCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000736; c=relaxed/simple;
	bh=z3szoN3emW+a/fwkyjwHitUGgUCvvX9839xwcA+sgkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/CRP5EC9E73gkS+1ECrCvp4ak4yV4POmO6Y06D4xSada3GXOnFe1qSFHTXC0acjG55RZxH7xFx0SNjHrNLSvn4t4Er1QeYBNoqnM0qEs/4XZwG/6M5CSDizK5y1hfpN/BoU+tVPeFk8w1JXlWQl/KSRnK2bixO1I2WHiPBbX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nYdIdRnj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nYdIdRnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49338C4CED2;
	Mon, 27 Jan 2025 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738000735;
	bh=z3szoN3emW+a/fwkyjwHitUGgUCvvX9839xwcA+sgkU=;
	h=Date:From:To:Cc:Subject:From;
	b=nYdIdRnjnwKj6Litb8uhXCiJzwohrmPsIzPRDGbIVYnzO5rBOVkqZ9eRcYqXel7Qa
	 0TTL1pnxZlsTEZbFkUXzEAjIjWWeD98RS516DZHWz00wVZUjxB9b7FIRYWlnp3H6eN
	 uU188GesbMvh5PTl0BVVT9knjJ9t3W/zxHSRhyu8=
Date: Mon, 27 Jan 2025 18:58:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver updates for 6.14-rc1
Message-ID: <Z5fJXGnAxELspPkC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.14-rc1

for you to fetch changes up to 579b6f18c5ca162af040f44684cc55f7da182236:

  staging: gpib: Agilent usb code cleanup (2025-01-19 09:06:31 +0100)

----------------------------------------------------------------
Staging driver updates for 6.14-rc1

Here's the pretty small staging driver tree update for 6.14-rc1.  Not
much happened this development cycle:
  - deleted some unused ioctl code from the rtl8723bs driver
  - gpib driver cleanups and fixes
  - other tiny minor coding style fixes.

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Ajith P V (1):
      staging: gpib: fix prefixing 0x with decimal output

Antonio Riccio (1):
      staging: vme_user: vme_tsi148.c: avoid parenthesis line ending

Chenguang Zhao (1):
      staging: rtl8723bs: Cleanups for rtw_inc_and_chk_continual_io_error

Dave Penkler (12):
      staging: gpib: Remove useless include
      staging: gpib: Remove duplicate include
      staging: gpib: Modernize gpib_interface_t initialization and make static
      staging: gpib: Add missing mutex unlock in agilent usb driver
      staging: gpib: Add missing mutex unlock in ni usb driver
      staging: gpib: Use __iomem attribute for io addresses
      staging: gpib: Use __user for user space pointers
      staging: gpib: Avoid plain integers as NULL pointers
      staging: gpib: Use C99 syntax and make static
      staging: gpib: Fix inadvertent negative shift
      staging: gpib: Fix NULL pointer dereference in detach
      staging: gpib: Agilent usb code cleanup

Greg Kroah-Hartman (2):
      Merge 6.13-rc3 into staging-next
      Merge 6.13-rc7 into staging next

Marcelo Moreira (1):
      staging: rtl8723bs: change pointer initialization style

Nihar Chaithanya (15):
      staging: gpib: Modify gpib_register_driver() to return error if it fails
      staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
      staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
      staging: gpib: cb7210: Handle gpib_register_driver() errors
      staging: gpib: cec: Handle gpib_register_driver() errors
      staging: gpib: fluke: Handle gpib_register_driver() errors
      staging: gpib: fmh: Handle gpib_register_driver() errors
      staging: gpib: gpio: Return error value from gpib_register_driver()
      staging: gpib: hp_82335: Return error value from gpib_register_driver()
      staging: gpib: hp_82341: Handle gpib_register_driver() errors
      staging: gpib: ines: Handle gpib_register_driver() errors
      staging: gpib: lpvo_usb: Return error value from gpib_register_driver()
      staging: gpib: ni_usb: Handle gpib_register_driver() errors
      staging: gpib: pc2: Handle gpib_register_driver() errors
      staging: gpib: tnt4882: Handle gpib_register_driver() errors

Paolo Perego (1):
      staging:fbtft: Using str_true_false() helper instead of hardcoded strings

Prarit Bhargava (1):
      staging: Fix tnt4882 license to be SPDX compliant

Rodrigo Gobbi (2):
      staging: rtl8723bs: delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef code
      staging: rtl8723bs: delete HAL_DEF_DBG_RX_INFO_DUMP enum and caller

Sandeep Salwan (1):
      staging: gpib: Remove commented-out debug code

Santosh Mahto (1):
      staging: gpib: Replace semaphore with completion for one-time signaling

谢致邦 (XIE Zhibang) (1):
      staging: rtl8723bs: Remove ioctl interface

 drivers/staging/fbtft/fb_ssd1351.c                 |    3 +-
 .../staging/gpib/agilent_82350b/agilent_82350b.c   |  138 ++-
 .../staging/gpib/agilent_82350b/agilent_82350b.h   |   12 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  161 ++-
 drivers/staging/gpib/cb7210/cb7210.c               |  586 +++++----
 drivers/staging/gpib/cb7210/cb7210.h               |    5 -
 drivers/staging/gpib/cec/cec.h                     |    4 -
 drivers/staging/gpib/cec/cec_gpib.c                |   60 +-
 drivers/staging/gpib/common/gpib_os.c              |  126 +-
 drivers/staging/gpib/common/iblib.c                |    2 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c         |  182 +--
 drivers/staging/gpib/eastwood/fluke_gpib.h         |    2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c           |  255 ++--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h           |    2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c           |   65 +-
 drivers/staging/gpib/hp_82335/hp82335.c            |   60 +-
 drivers/staging/gpib/hp_82335/hp82335.h            |    3 -
 drivers/staging/gpib/hp_82341/hp_82341.c           |  119 +-
 drivers/staging/gpib/hp_82341/hp_82341.h           |    2 -
 drivers/staging/gpib/include/amcc5920.h            |    2 +-
 drivers/staging/gpib/include/gpibP.h               |    2 +-
 drivers/staging/gpib/ines/ines.h                   |    7 -
 drivers/staging/gpib/ines/ines_gpib.c              |  524 ++++----
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c |   66 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |   89 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.h          |    2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c                |  248 ++--
 drivers/staging/gpib/tnt4882/mite.c                |    2 +-
 drivers/staging/gpib/tnt4882/mite.h                |    2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c        |  634 +++++-----
 drivers/staging/rtl8723bs/Makefile                 |    1 -
 drivers/staging/rtl8723bs/core/rtw_io.c            |   10 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |    1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c          |    6 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |   55 -
 drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c    |    4 -
 drivers/staging/rtl8723bs/include/hal_com.h        |    5 -
 drivers/staging/rtl8723bs/include/hal_intf.h       |    1 -
 drivers/staging/rtl8723bs/include/osdep_intf.h     |    2 -
 drivers/staging/rtl8723bs/include/rtw_recv.h       |   18 -
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c     | 1286 --------------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |    1 -
 drivers/staging/vme_user/vme_tsi148.c              |    3 +-
 43 files changed, 1850 insertions(+), 2908 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
