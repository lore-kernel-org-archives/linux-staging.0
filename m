Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6022C83
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 18:56:01 +0000 (UTC)
Received: from dslb-188-096-147-224.188.096.pools.vodafone-ip.de ([188.96.147.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlyBy-0002H8-UC; Sat, 13 Nov 2021 19:55:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 14/15] staging: r8188eu: remove fake efuse variables
Date: Sat, 13 Nov 2021 19:55:17 +0100
Message-Id: <20211113185518.23941-15-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211113185518.23941-1-martin@kaiser.cx>
References: <20211113185518.23941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We removed the pseudo read code. This patch removes the fake efuse arrays
that were used by pseudo reads.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 9 ---------
 drivers/staging/r8188eu/include/rtw_efuse.h | 7 -------
 2 files changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index b7f2274c62ac..f88d086329b1 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -8,15 +8,6 @@
 #include "../include/rtw_efuse.h"
 #include "../include/rtl8188e_hal.h"
 
-/*------------------------Define local variable------------------------------*/
-u8 fakeEfuseBank;
-u32 fakeEfuseUsedBytes;
-u8 fakeEfuseContent[EFUSE_MAX_HW_SIZE] = {0};
-u8 fakeEfuseInitMap[EFUSE_MAX_MAP_LEN] = {0};
-u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN] = {0};
-
-/*------------------------Define local variable------------------------------*/
-
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index b402531e639a..9174f3d635e4 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -35,13 +35,6 @@ struct efuse_hal {
 	u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN];
 };
 
-/*------------------------Export global variable----------------------------*/
-extern u8 fakeEfuseBank;
-extern u32 fakeEfuseUsedBytes;
-extern u8 fakeEfuseContent[];
-extern u8 fakeEfuseInitMap[];
-extern u8 fakeEfuseModifiedMap[];
-
 /*------------------------Export global variable----------------------------*/
 
 u8 Efuse_CalculateWordCnts(u8 word_en);
-- 
2.20.1

