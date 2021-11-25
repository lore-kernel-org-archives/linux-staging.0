Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369A2C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:48:01 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHug-0006ye-7F; Thu, 25 Nov 2021 17:47:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: remove _ps_open_RF
Date: Thu, 25 Nov 2021 17:47:43 +0100
Message-Id: <20211125164745.8188-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125164745.8188-1-martin@kaiser.cx>
References: <20211125164745.8188-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _ps_open_RF function is empty. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 04518e9838ea..995ea4a55435 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -615,8 +615,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_BEGIN);
 
 	if (Adapter->pwrctrlpriv.bkeepfwalive) {
-		_ps_open_RF(Adapter);
-
 		if (haldata->odmpriv.RFCalibrateInfo.bIQKInitialized) {
 			PHY_IQCalibrate_8188E(Adapter, true);
 		} else {
@@ -852,12 +850,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	return status;
 }
 
-void _ps_open_RF(struct adapter *adapt)
-{
-	/* here call with bRegSSPwrLvl 1, bRegSSPwrLvl 2 needs to be verified */
-	/* phy_SsPwrSwitch92CU(adapt, rf_on, 1); */
-}
-
 static void _ps_close_RF(struct adapter *adapt)
 {
 	/* here call with bRegSSPwrLvl 1, bRegSSPwrLvl 2 needs to be verified */
-- 
2.20.1

