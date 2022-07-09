Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA522F36
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:26 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyJ-0005n0-0S; Sat, 09 Jul 2022 19:10:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/14] staging: r8188eu: efuse_utilized is never read
Date: Sat,  9 Jul 2022 19:09:59 +0200
Message-Id: <20220709171000.180481-14-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709171000.180481-1-martin@kaiser.cx>
References: <20220709171000.180481-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The efuse_utilized variable in function efuse_phymap_to_logical is
written to but never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 87ebfb013193..ddda3f994fa7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -91,7 +91,6 @@ efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 	u8 offset, wren;
 	u16	i, j;
 	u16	**eFuseWord = NULL;
-	u16	efuse_utilized = 0;
 	u8 u1temp = 0;
 
 	efuseTbl = kzalloc(EFUSE_MAP_LEN_88E, GFP_KERNEL);
@@ -113,7 +112,6 @@ efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 	/*  */
 	rtemp8 = *(phymap + eFuse_Addr);
 	if (rtemp8 != 0xFF) {
-		efuse_utilized++;
 		eFuse_Addr++;
 	} else {
 		goto exit;
@@ -151,13 +149,11 @@ efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 				if (!(wren & 0x01)) {
 					rtemp8 = *(phymap + eFuse_Addr);
 					eFuse_Addr++;
-					efuse_utilized++;
 					eFuseWord[offset][i] = (rtemp8 & 0xff);
 					if (eFuse_Addr >= EFUSE_REAL_CONTENT_LEN_88E)
 						break;
 					rtemp8 = *(phymap + eFuse_Addr);
 					eFuse_Addr++;
-					efuse_utilized++;
 					eFuseWord[offset][i] |= (((u16)rtemp8 << 8) & 0xff00);
 
 					if (eFuse_Addr >= EFUSE_REAL_CONTENT_LEN_88E)
@@ -170,7 +166,6 @@ efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 		rtemp8 = *(phymap + eFuse_Addr);
 
 		if (rtemp8 != 0xFF && (eFuse_Addr < EFUSE_REAL_CONTENT_LEN_88E)) {
-			efuse_utilized++;
 			eFuse_Addr++;
 		}
 	}
@@ -190,10 +185,6 @@ efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 	/*  */
 	memcpy(pbuf, efuseTbl, _size_byte);
 
-	/*  */
-	/*  5. Calculate Efuse utilization. */
-	/*  */
-
 exit:
 	kfree(efuseTbl);
 	kfree(eFuseWord);
-- 
2.30.2

