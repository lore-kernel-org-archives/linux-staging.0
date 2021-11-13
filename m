Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A42C82
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 18:55:42 +0000 (UTC)
Received: from dslb-188-096-147-224.188.096.pools.vodafone-ip.de ([188.96.147.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlyBd-0002H8-7X; Sat, 13 Nov 2021 19:55:37 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/15] staging: r8188eu: more efuse cleanup
Date: Sat, 13 Nov 2021 19:55:03 +0100
Message-Id: <20211113185518.23941-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more unused parts of the efuse code.

Martin Kaiser (15):
  staging: r8188eu: remove efuse type from definition functions
  staging: r8188eu: remove efuse type from read functions
  staging: r8188eu: remove test code for efuse shadow map
  staging: r8188eu: merge small adapter info helpers
  staging: r8188eu: rtl8188e_EfuseGetCurrentSize is now unused
  staging: r8188eu: rtl8188e_Efuse_PgPacketRead is now unused
  staging: r8188eu: merge Efuse_ReadAllMap into EFUSE_ShadowMapUpdate
  staging: r8188eu: use efuse map length define directly
  staging: r8188eu: rtl8188e_EFUSE_GetEfuseDefinition is unused
  staging: r8188eu: remove defines for efuse type
  staging: r8188eu: efuse_OneByteRead is unused
  staging: r8188eu: efuse_OneByteWrite is unused
  staging: r8188eu: remove bt efuse definitions
  staging: r8188eu: remove fake efuse variables
  staging: r8188eu: remove the efuse_hal structure

 drivers/staging/r8188eu/core/rtw_efuse.c      | 162 +-------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 370 +-----------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  42 +-
 drivers/staging/r8188eu/include/hal_intf.h    |   8 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   2 -
 drivers/staging/r8188eu/include/rtw_efuse.h   |  79 +---
 6 files changed, 50 insertions(+), 613 deletions(-)

-- 
2.20.1

