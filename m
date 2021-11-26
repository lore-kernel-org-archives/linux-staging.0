Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E12C81
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 15:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7ABC93056;
	Fri, 26 Nov 2021 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637939727;
	bh=/QdZV30yPq99eRr0pxm9Zq7VOdDbPkWQRZKXgaDIhek=;
	h=Date:From:To:Cc:Subject:From;
	b=QIyFfr3CbekKZxodT1CsJ5ywNA1tiAPJWxQN16FKr3s+DE47fP0xPc8MABGKi7n+M
	 h4LwG5EN3pfb4rJr4TLhRaGFUNkJJXFTi5iJ8S+dDBWhDfYtISHtJW1Vg/uxnePqVE
	 fCWNFAOKUyi7zqjtBTppODOULGhul8fZHWNsscMU=
Date: Fri, 26 Nov 2021 16:15:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 5.16-rc3
Message-ID: <YaD6DdgslN17VWV8@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.16-rc3

for you to fetch changes up to b535917c51acc97fb0761b1edec85f1f3d02bda4:

  staging: rtl8192e: Fix use after free in _rtl92e_pci_disconnect() (2021-11-17 14:08:57 +0100)

----------------------------------------------------------------
Staging fixes for 5.16-rc3

Here are some small staging driver fixes and one driver removal for
5.16-rc3.

The fixes resolve a number of small issues found in 5.16-rc1, nothing
huge at all.  The driver removal was due to a platform being removed in
5.16-rc1, but this driver was forgotten about.  It wasn't being built
anymore so it's safe to delete.

All have been in linux-next for a while with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dan Carpenter (2):
      staging: r8188eu: fix a memory leak in rtw_wx_read32()
      staging: rtl8192e: Fix use after free in _rtl92e_pci_disconnect()

Fabio M. De Francesco (1):
      staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context

Larry Finger (1):
      staging: r8188eu: Fix breakage introduced when 5G code was removed

Michael Straube (1):
      staging: r8188eu: use GFP_ATOMIC under spinlock

Noralf Trønnes (1):
      staging/fbtft: Fix backlight

Rob Herring (1):
      staging: Remove Netlogic XLP network driver

Takashi Iwai (1):
      staging: greybus: Add missing rwsem around snd_ctl_remove() calls

 drivers/staging/Kconfig                      |    2 -
 drivers/staging/Makefile                     |    1 -
 drivers/staging/fbtft/fb_ssd1351.c           |    4 -
 drivers/staging/fbtft/fbtft-core.c           |    9 +-
 drivers/staging/greybus/audio_helper.c       |    8 +-
 drivers/staging/netlogic/Kconfig             |    9 -
 drivers/staging/netlogic/Makefile            |    2 -
 drivers/staging/netlogic/TODO                |   11 -
 drivers/staging/netlogic/platform_net.c      |  219 ------
 drivers/staging/netlogic/platform_net.h      |   21 -
 drivers/staging/netlogic/xlr_net.c           | 1080 --------------------------
 drivers/staging/netlogic/xlr_net.h           | 1079 -------------------------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |    6 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |    8 +-
 drivers/staging/r8188eu/os_dep/mlme_linux.c  |    2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |    3 +-
 16 files changed, 21 insertions(+), 2443 deletions(-)
 delete mode 100644 drivers/staging/netlogic/Kconfig
 delete mode 100644 drivers/staging/netlogic/Makefile
 delete mode 100644 drivers/staging/netlogic/TODO
 delete mode 100644 drivers/staging/netlogic/platform_net.c
 delete mode 100644 drivers/staging/netlogic/platform_net.h
 delete mode 100644 drivers/staging/netlogic/xlr_net.c
 delete mode 100644 drivers/staging/netlogic/xlr_net.h
