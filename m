Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net [46.105.52.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EBD266D3
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.1.161])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id EAC4428702
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:26:31 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-26h4r (unknown [10.110.115.240])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 23FD11FE5F;
	Wed, 25 Oct 2023 10:26:31 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
	by ghost-submission-6684bf9d7b-26h4r with ESMTPSA
	id um1WBFftOGV4gwAARm6H6g
	(envelope-from <wiktor.grzywacz@3mdeb.com>); Wed, 25 Oct 2023 10:26:31 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003f3ccc1a6-09ce-433e-8256-0378fa1aff91,
                    14A0AEEFCB3B0BFA38FE34D53745A0BBD0B19B92) smtp.auth=wiktor.grzywacz@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
Subject: [PATCH] Signed-off-by: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
Date: Wed, 25 Oct 2023 12:24:20 +0200
Message-ID: <20231025102614.125291-1-wiktor.grzywacz@3mdeb.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17102138111644632453
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhephghikhhtohhrucfirhiihiifrggtiicuoeifihhkthhorhdrghhriiihfigrtgiiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfetheeftdehveeiveehfeeljeeijeekudeiieeifedvheekteevteetgfekheenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoeifihhkthhorhdrghhriiihfigrtgiiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

staging: rtl8723bs: fix checkpatch space before tab warning
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2028791988e7..8bdb685c10e7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -46,7 +46,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/*  ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -84,7 +84,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  Pointer reference */
 	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
+	/*  ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-- 
2.41.0

