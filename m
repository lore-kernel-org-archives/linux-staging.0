Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9092CAF
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:25 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAm-0005EJ-UC; Sat, 08 Jan 2022 13:50:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/12] staging: r8188eu: CurrentBW4024GTxPwrIdx is set but not used
Date: Sat,  8 Jan 2022 13:49:53 +0100
Message-Id: <20220108124959.313215-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220108124959.313215-1-martin@kaiser.cx>
References: <20220108124959.313215-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CurrentBW4024GTxPwrIdx in struct hal_data_8188e is set but not used.
It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c  | 1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index c06a332f6b20..fe15b15ab951 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -589,7 +589,6 @@ static void phy_PowerIndexCheck88E(struct adapter *Adapter, u8 channel, u8 *cckP
 	pHalData->CurrentCckTxPwrIdx = cckPowerLevel[0];
 	pHalData->CurrentOfdm24GTxPwrIdx = ofdmPowerLevel[0];
 	pHalData->CurrentBW2024GTxPwrIdx = BW20PowerLevel[0];
-	pHalData->CurrentBW4024GTxPwrIdx = BW40PowerLevel[0];
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 66eadd170c9b..1c52dd9d9721 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -180,7 +180,6 @@ struct hal_data_8188e {
 	u8	CurrentCckTxPwrIdx;
 	u8	CurrentOfdm24GTxPwrIdx;
 	u8	CurrentBW2024GTxPwrIdx;
-	u8	CurrentBW4024GTxPwrIdx;
 
 	/*  Read/write are allow for following hardware information variables */
 	u8	pwrGroupCnt;
-- 
2.30.2

