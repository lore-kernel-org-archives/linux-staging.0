Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75B2C81
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:38 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZczz-0001WC-PR; Sun, 10 Oct 2021 19:52:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/11] staging: r8188eu: remove odm dualmac smart concurrent info
Date: Sun, 10 Oct 2021 19:51:59 +0200
Message-Id: <20211010175204.24029-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010175204.24029-1-martin@kaiser.cx>
References: <20211010175204.24029-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dualmac smart concurrent info is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c     | 3 ---
 drivers/staging/r8188eu/include/odm.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index cd09cdbdb863..38151936eddb 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -252,9 +252,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_BWIFI_TEST:
 		pDM_Odm->bWIFITest = (bool)Value;
 		break;
-	case	ODM_CMNINFO_SMART_CONCURRENT:
-		pDM_Odm->bDualMacSmartConcurrent = (bool)Value;
-		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
 		/* do nothing */
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index b3a9902761df..22451d1a6970 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -273,7 +273,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_EXT_TRSW,
 	ODM_CMNINFO_BINHCT_TEST,
 	ODM_CMNINFO_BWIFI_TEST,
-	ODM_CMNINFO_SMART_CONCURRENT,
 	/* HOOK BEFORE REG INIT-----------  */
 
 	/*  Dynamic value: */
@@ -660,7 +659,6 @@ struct odm_dm_struct {
 	bool	bInHctTest;
 	bool	bWIFITest;
 
-	bool	bDualMacSmartConcurrent;
 	u32	BK_SupportAbility;
 	u8	AntDivType;
 /* HOOK BEFORE REG INIT----------- */
-- 
2.20.1

