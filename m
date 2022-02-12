Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD27257E
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:54 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5k-0007YM-8o; Sat, 12 Feb 2022 17:17:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/10] remove rf register access for path b
Date: Sat, 12 Feb 2022 17:17:27 +0100
Message-Id: <20220212161737.381841-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set removes rf register access to the registers of rf path b.

The r8188eu driver seems to use only rf path a. The private ioctls were
the only way to access rf path b registers. We limit these ioctls to rf
path a and we can then remove the code to read and write path b registers.

Martin Kaiser (10):
  staging: r8188eu: set path a explicitly
  staging: r8188eu: write only path a registers in rtw_dbg_port
  staging: r8188eu: remove path parameter from rtl8188e_PHY_SetRFReg
  staging: r8188eu: remove path parameter from phy_RFSerialWrite
  staging: r8188eu: clarify that bb_reg_dump uses only path a
  staging: r8188eu: limit rtw_wx_read_rf to path a
  staging: r8188eu: limit rtw_dbg_port to path a
  staging: r8188eu: remove path parameter from rtl8188e_PHY_QueryRFReg
  staging: r8188eu: remove path parameter from phy_RFSerialRead
  staging: r8188eu: we only need one struct bb_reg_def for path a

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 34 ++++----
 drivers/staging/r8188eu/hal/odm.c             |  2 +-
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 85 ++++++-------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  6 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     |  2 +-
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  6 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 27 ++++--
 9 files changed, 72 insertions(+), 94 deletions(-)

-- 
2.30.2

