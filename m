Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF32C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:48:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j128-20020a1c2386000000b003301a98dd62so11976026wmj.5
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I1aSLk3W8G9yuphhnCgQYAWu3kk6gw0wJUjcpepyNuI=;
        b=EblOfLQhB3inCnviNIteijFBd0HGCk9g2K81U4oNrFFfMyZ/XeCkQLYy1D5jqxwE3r
         xgYrG2AZ89IRMEnr0HIz/T5EhjVAUQGCGM9LM+p974QmJeud5n6oOfdzjq0KwI1NfRo/
         ZTYbUc0ZGufZd/C4EXmMhnXZku1JgYJd91zbyXF13LgnTrgi2T3gkMIql7fyJ5pWVxXu
         wL+R3TRlA/ANZ68JF6toANvWssLBF4kiBOkM+42LmGofuPdmx/CF4yTon9WzRs94wsOm
         x4LlAYidSeJjmO0gpm0y7FAGC4IOweu8WqXJ3sqyiygfOU4kjXJB+5Tkcf31lJZP1QR4
         cbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I1aSLk3W8G9yuphhnCgQYAWu3kk6gw0wJUjcpepyNuI=;
        b=cgLX/cSXJlD6B1aBNhDZzi33VuQQZo1pqIstZk45/zKT5CLq9jepUt+0wmr5NE7SO6
         8pfmgc/FQVuyo+cmRcBLC2VlKX09zFlyDI0zfyb75b4wVpbz0byQjIsVHzetV2dRy12T
         /FntXjMmw1vBH6nsq2kxhDWpCV+4YsfJoPQSKf5pSWaRvJEY0aVyBC09wEuqFDil3WJ0
         f2GUnFdBncQXC0j6aAOg0d40vjsiQGEIFJbDZ0j17m2HnepHWSkaVpueyMLc8CUgb+HB
         SKowibTtChD3qSeLqZ0SVsRh+YOuLqbYqJYaXxcWUHndmfxuMWRsgytcveNZjpBwU4av
         rprg==
X-Gm-Message-State: AOAM53388VNGG8dUCbHn4BriBakdpein/ynEJJ/0cRKT1509p+VmM8LF
	2ODSPWUdfU51AeHN26vSdZ8=
X-Google-Smtp-Source: ABdhPJzRy52uSalUV5xegNUwXlv65ztTorvrZwkUar/gB2ye/P8jGkmovlOArnY5vHo4UEtav+c3lg==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr40281990wmc.19.1636224505574;
        Sat, 06 Nov 2021 11:48:25 -0700 (PDT)
Received: from tom-ThinkPad-T470p.station (net-188-153-110-208.cust.vodafonedsl.it. [188.153.110.208])
        by smtp.gmail.com with ESMTPSA id l16sm11373206wmq.46.2021.11.06.11.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:48:24 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: fix camelcase byData in card.c
Date: Sat,  6 Nov 2021 19:48:19 +0100
Message-Id: <20211106184822.24242-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase variable "byData" into linux kernel coding style
equivalent variable "data" in card.c.
"by" prefix in hungarian notation stands for byte or unsigned char

References:
https://www.kernel.org/doc/html/latest/process/coding-style.html
https://www.cse.iitk.ac.in/users/dsrkg/cs245/html/Guide.htm

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Make the commit body message more clearer

Changes since v2:
 - Update linux coding style link as suggested by gregkh

 drivers/staging/vt6655/card.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 26e08fec6e6a..fac2d0566d2e 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -183,7 +183,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 	unsigned char bySlot = 0;
 	unsigned char bySIFS = 0;
 	unsigned char byDIFS = 0;
-	unsigned char byData;
+	unsigned char data;
 	int i;
 
 	/* Set SIFS, DIFS, EIFS, SlotTime, CwMin */
@@ -194,15 +194,15 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x20;
 			priv->abyBBVGA[2] = 0x10;
 			priv->abyBBVGA[3] = 0x10;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x1C)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x1C)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			MACvSetBBType(priv->port_offset, BB_TYPE_11A);
 			priv->abyBBVGA[0] = 0x18;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x14) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x14) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0x57);
 			}
@@ -220,14 +220,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x1C;
 			priv->abyBBVGA[2] = 0x00;
 			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x20)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x20)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x18) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x18) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0xD3);
 			}
@@ -243,14 +243,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x1C;
 			priv->abyBBVGA[2] = 0x00;
 			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x20)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x20)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x18) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x18) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0xD3);
 			}
@@ -798,12 +798,12 @@ bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
 {
 	void __iomem *iobase = priv->port_offset;
 	unsigned short ww;
-	unsigned char byData;
+	unsigned char data;
 
 	MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
-		VNSvInPortB(iobase + MAC_REG_TFTCTL, &byData);
-		if (!(byData & TFTCTL_TSFCNTRRD))
+		VNSvInPortB(iobase + MAC_REG_TFTCTL, &data);
+		if (!(data & TFTCTL_TSFCNTRRD))
 			break;
 	}
 	if (ww == W_MAX_TIMEOUT)
-- 
2.25.1

