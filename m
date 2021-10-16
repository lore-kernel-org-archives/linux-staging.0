Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FF2C80
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:30:36 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbhtY-00046d-31; Sat, 16 Oct 2021 13:30:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/8] staging: r8188eu: another round of removals
Date: Sat, 16 Oct 2021 13:30:00 +0200
Message-Id: <20211016113008.27549-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some more dead code and unused definitions.

Martin Kaiser (8):
  staging: r8188eu: remove empty trigger gpio code
  staging: r8188eu: interface type is always usb
  staging: r8188eu: remove two checks that are always false
  staging: r8188eu: remove unused function prototypes
  staging: r8188eu: PHY_SetRFPathSwitch_8188E is not used
  staging: r8188eu: clean up Hal8188EPhyCfg.h
  staging: r8188eu: remove procfs functions
  staging: r8188eu: CurrentWirelessMode is not used

 drivers/staging/r8188eu/Makefile              |   1 -
 drivers/staging/r8188eu/core/rtw_debug.c      | 886 ------------------
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  14 +-
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |   3 +-
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   8 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  38 -
 drivers/staging/r8188eu/hal/odm.c             |   3 -
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   2 -
 drivers/staging/r8188eu/hal/usb_halinit.c     |   8 -
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  78 --
 drivers/staging/r8188eu/include/hal_intf.h    |   1 -
 drivers/staging/r8188eu/include/odm.h         |  11 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   1 -
 drivers/staging/r8188eu/include/rtw_debug.h   | 148 ---
 14 files changed, 6 insertions(+), 1196 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_debug.c

-- 
2.20.1

