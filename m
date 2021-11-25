Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79C68
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 15:55:58 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqGSX-0005zf-PQ; Thu, 25 Nov 2021 16:14:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/6] staging: r8188eu: Efuse_CalculateWordCnts is not used
Date: Thu, 25 Nov 2021 16:14:31 +0100
Message-Id: <20211125151436.5895-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125151436.5895-1-martin@kaiser.cx>
References: <20211125151436.5895-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the Efuse_CalculateWordCnts function, which is not used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 16 ----------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  1 -
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index f88d086329b1..62d194587fb1 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -11,22 +11,6 @@
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
-/*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
-u8
-Efuse_CalculateWordCnts(u8 word_en)
-{
-	u8 word_cnts = 0;
-	if (!(word_en & BIT(0)))
-		word_cnts++; /*  0 : write enable */
-	if (!(word_en & BIT(1)))
-		word_cnts++;
-	if (!(word_en & BIT(2)))
-		word_cnts++;
-	if (!(word_en & BIT(3)))
-		word_cnts++;
-	return word_cnts;
-}
-
 /*  */
 /* 	Description: */
 /* 		Execute E-Fuse read byte operation. */
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 4d8eff8e860e..68394c6302a3 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -28,7 +28,6 @@
 
 /*------------------------Export global variable----------------------------*/
 
-u8 Efuse_CalculateWordCnts(u8 word_en);
 void ReadEFuseByte(struct adapter *adapter, u16 _offset, u8 *pbuf);
 
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
-- 
2.20.1

