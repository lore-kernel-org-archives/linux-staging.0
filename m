Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6B2CA0
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:04:47 +0000 (UTC)
Received: from dslb-178-004-169-039.178.004.pools.vodafone-ip.de ([178.4.169.39] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1myYSC-0008I6-KJ; Sat, 18 Dec 2021 13:04:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: r8188: antAveRSSI is set but not used
Date: Sat, 18 Dec 2021 13:04:17 +0100
Message-Id: <20211218120423.29906-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211218120423.29906-1-martin@kaiser.cx>
References: <20211218120423.29906-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

antAveRSSI in struct fast_ant_train is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm_RTL8188E.c | 1 -
 drivers/staging/r8188eu/include/odm.h      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 837e5a850264..1be662b62e51 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -63,7 +63,6 @@ static void odm_FastAntTrainingInit(struct odm_dm_struct *dm_odm)
 		dm_fat_tbl->Bssid[i] = 0;
 		dm_fat_tbl->antSumRSSI[i] = 0;
 		dm_fat_tbl->antRSSIcnt[i] = 0;
-		dm_fat_tbl->antAveRSSI[i] = 0;
 	}
 	dm_fat_tbl->TrainIdx = 0;
 	dm_fat_tbl->FAT_State = FAT_NORMAL_STATE;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 69faf8b50996..c77c5c1fbe7f 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -414,7 +414,6 @@ struct fast_ant_train {
 	u8	antsel_rx_keep_2;
 	u32	antSumRSSI[7];
 	u32	antRSSIcnt[7];
-	u32	antAveRSSI[7];
 	u8	FAT_State;
 	u32	TrainIdx;
 	u8	antsel_a[ODM_ASSOCIATE_ENTRY_NUM];
-- 
2.20.1

