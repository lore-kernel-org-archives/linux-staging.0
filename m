Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2152F25
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:26 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkEy-0001bS-E4; Sun, 06 Feb 2022 17:18:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/14] staging: r8188eu: another set of simple cleanups
Date: Sun,  6 Feb 2022 17:17:55 +0100
Message-Id: <20220206161809.423031-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set of simple cleanups in several parts of the driver.

Please apply this on top of my previous series (staging: r8188eu: more
rf cleanups).

Tested with EdimaxV2 on an arm32 embedded system.

Martin Kaiser (14):
  staging: r8188eu: only OFDM_index_old[0] is used
  staging: r8188eu: only OFDM_index[0] is used
  staging: r8188eu: replace local OFDM_index with single variable
  staging: r8188eu: remove debug code to bypass LC calibration
  staging: r8188eu: remove debug code to bypass IQ calibration
  staging: r8188eu: move local definitions into rtw_fw.h
  staging: r8188eu: remove unused enum _IFACE_TYPE
  staging: r8188eu: remove unused enum _ADAPTER_TYPE
  staging: r8188eu: remove the global DriverState
  staging: r8188eu: remove unused struct adapter components
  staging: r8188eu: in_cta_test is always 0
  staging: r8188eu: irq_alloc is not used
  staging: r8188eu: not_indic_disco is unused
  staging: r8188eu: remove unused struct hostapd_priv

 drivers/staging/r8188eu/core/rtw_fw.c        | 45 ++++++++++++++++++++
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 30 +++++--------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 16 +------
 drivers/staging/r8188eu/include/drv_types.h  | 36 ----------------
 drivers/staging/r8188eu/include/odm.h        |  2 +-
 drivers/staging/r8188eu/include/rtw_fw.h     | 45 --------------------
 drivers/staging/r8188eu/include/rtw_mlme.h   |  5 ---
 drivers/staging/r8188eu/os_dep/usb_intf.c    |  8 ++--
 8 files changed, 61 insertions(+), 126 deletions(-)

-- 
2.30.2

