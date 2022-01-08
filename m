Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F12CA7
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:21 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAg-0005EJ-JJ; Sat, 08 Jan 2022 13:50:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/12] staging: r8188eu: another round of cleanups
Date: Sat,  8 Jan 2022 13:49:47 +0100
Message-Id: <20220108124959.313215-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set with simple cleanups in several places.

Tested with Edimax V2 on an arm32 embedded system, using staging-testing
plus the recent patchsets by Michael and Phil.

Martin Kaiser (12):
  staging: r8188eu: ODM_MAC_EDCA_TURBO is always set
  staging: r8188eu: ODM_BB_FA_CNT is always set
  staging: r8188eu: ODM_BB_CCK_PD is always set
  staging: r8188eu: remove unused chip type settings
  staging: r8188eu: remove obsolete defines and comments
  staging: r8188eu: CurrentBW4024GTxPwrIdx is set but not used
  staging: r8188eu: CurrentBW2024GTxPwrIdx is set but not used
  staging: r8188eu: CurrentOfdm24GTxPwrIdx is set but not used
  staging: r8188eu: CurrentCckTxPwrIdx is set but not used
  staging: r8188eu: HW_VAR_MEDIA_STATUS1 is never set
  staging: r8188eu: remove HAL_*_ENABLE defines
  staging: r8188eu: we always enqueue in rtw_set_chplan_cmd

 drivers/staging/r8188eu/core/rtw_cmd.c        | 26 ++++++---------
 drivers/staging/r8188eu/hal/odm.c             | 11 -------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  5 +--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 32 -------------------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 19 -----------
 drivers/staging/r8188eu/include/HalVerDef.h   |  5 ---
 drivers/staging/r8188eu/include/hal_intf.h    |  1 -
 drivers/staging/r8188eu/include/odm.h         |  5 ---
 .../staging/r8188eu/include/rtl8188e_hal.h    |  6 ----
 drivers/staging/r8188eu/include/rtw_cmd.h     |  2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  2 +-
 11 files changed, 12 insertions(+), 102 deletions(-)

-- 
2.30.2

