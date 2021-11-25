Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319868
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 15:56:10 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqGSZ-0005zf-2g; Thu, 25 Nov 2021 16:14:51 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: efuse_WordEnableDataRead is not used
Date: Thu, 25 Nov 2021 16:14:32 +0100
Message-Id: <20211125151436.5895-3-martin@kaiser.cx>
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

The efuse_WordEnableDataRead function is not used and can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 37 ---------------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  2 --
 2 files changed, 39 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 62d194587fb1..0cc3aa1b08b0 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -59,43 +59,6 @@ ReadEFuseByte(
 	*pbuf = (u8)(value32 & 0xff);
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	efuse_WordEnableDataRead
- *
- * Overview:	Read allowed word in current efuse section data.
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/16/2008	MHC		Create Version 0.
- * 11/21/2008	MHC		Fix Write bug when we only enable late word.
- *
- *---------------------------------------------------------------------------*/
-void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata)
-{
-	if (!(word_en & BIT(0))) {
-		targetdata[0] = sourdata[0];
-		targetdata[1] = sourdata[1];
-	}
-	if (!(word_en & BIT(1))) {
-		targetdata[2] = sourdata[2];
-		targetdata[3] = sourdata[3];
-	}
-	if (!(word_en & BIT(2))) {
-		targetdata[4] = sourdata[4];
-		targetdata[5] = sourdata[5];
-	}
-	if (!(word_en & BIT(3))) {
-		targetdata[6] = sourdata[6];
-		targetdata[7] = sourdata[7];
-	}
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	EFUSE_ShadowMapUpdate
  *
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 68394c6302a3..cff9e748544d 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -30,8 +30,6 @@
 
 void ReadEFuseByte(struct adapter *adapter, u16 _offset, u8 *pbuf);
 
-void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
-
 void EFUSE_ShadowMapUpdate(struct adapter *adapter);
 
 #endif
-- 
2.20.1

