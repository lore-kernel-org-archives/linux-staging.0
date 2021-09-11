Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943033FD7
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 16:10:32 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP5aF-0007nr-Fy; Sat, 11 Sep 2021 18:10:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: more power management cleanup
Date: Sat, 11 Sep 2021 18:10:15 +0200
Message-Id: <20210911161019.26881-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bHWPwrPindetect is always 0 for the r8188eu driver. This makes a lot of
code unreachable.

Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

Martin Kaiser (4):
  staging: r8188eu: bHWPwrPindetect is always false
  staging: r8188eu: brfoffbyhw is always false
  staging: r8188eu: remove rtw_hw_suspend
  staging: r8188eu: remove rtw_hw_resume

 drivers/staging/r8188eu/core/rtw_cmd.c        | 10 --
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 20 ----
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  4 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 14 ---
 drivers/staging/r8188eu/include/osdep_intf.h  |  2 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  7 --
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 99 -------------------
 8 files changed, 2 insertions(+), 156 deletions(-)

-- 
2.20.1

