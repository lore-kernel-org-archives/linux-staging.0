Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net [188.165.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBFD1641A
	for <linux-staging@lists.linux.dev>; Sun, 12 Nov 2023 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.143.220])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 083D226B81
	for <linux-staging@lists.linux.dev>; Sun, 12 Nov 2023 18:57:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mr4fc (unknown [10.110.208.237])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5C52C1FE68;
	Sun, 12 Nov 2023 18:57:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
	by ghost-submission-6684bf9d7b-mr4fc with ESMTPSA
	id G4wKEgkgUWVPbgEAXATW5Q
	(envelope-from <wiktor.grzywacz@3mdeb.com>); Sun, 12 Nov 2023 18:57:13 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R0060453ac51-21fb-4da3-8799-e44204b9f805,
                    04505B612A48EC5E7F489E822CE31C5834F35F42) smtp.auth=wiktor.grzywacz@3mdeb.com
X-OVh-ClientIp:213.192.64.75
From: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix checkpatch no spaces before tabs warning
Date: Sun, 12 Nov 2023 19:57:10 +0100
Message-Id: <20231112185710.101990-1-wiktor.grzywacz@3mdeb.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2308376284534834651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddvkedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeghihhkthhorhcuifhriiihfigrtgiiuceofihikhhtohhrrdhgrhiihiifrggtiiesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdvueekledtjeetkeelffdukedtffduveefieefleetieetheehtefgtdegvefgnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdeigedrjeehpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeofihikhhtohhrrdhgrhiihiifrggtiiesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

There is some old commented out code, that triggers
a checkpatch.pl no spaces before tabs warning.

Signed-off-by: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2028791988e7..eb4e4f44d4cb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -46,7 +46,6 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -83,8 +82,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  */
 	/*  Pointer reference */
 	/*  */
-	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-- 
2.34.1

