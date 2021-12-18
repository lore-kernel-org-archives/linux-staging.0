Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67292C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:04:44 +0000 (UTC)
Received: from dslb-178-004-169-039.178.004.pools.vodafone-ip.de ([178.4.169.39] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1myYS1-0008I6-F3; Sat, 18 Dec 2021 13:04:33 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188: another round a cleanups
Date: Sat, 18 Dec 2021 13:04:14 +0100
Message-Id: <20211218120423.29906-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set with minor cleanups in several parts of the driver.

As usual, this was tested with an Edimax V2 on an arm32 embedded system.

Martin Kaiser (9):
  staging: r8188: make rx signal strength function static
  staging: r8188: remove the dummy ioctl handler
  staging: r8188: antAveRSSI is set but not used
  staging: r8188: antRSSIcnt is set but not used
  staging: r8188: antSumRSSI is set but not used
  staging: r8188: Bssid in struct fast_ant_train is set but not used
  staging: r8188: remove unused odm capabilities
  staging: r8188: ODM_BB_DIG is always set
  staging: r8188: ODM_BB_RA_MASK is always set

 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |  5 ++---
 drivers/staging/r8188eu/hal/odm.c            |  5 +----
 drivers/staging/r8188eu/hal/odm_HWConfig.c   |  2 --
 drivers/staging/r8188eu/hal/odm_RTL8188E.c   |  8 +-------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c    |  6 +-----
 drivers/staging/r8188eu/include/odm.h        | 14 --------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 17 -----------------
 7 files changed, 5 insertions(+), 52 deletions(-)

-- 
2.20.1

