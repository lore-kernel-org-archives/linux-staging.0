Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3517E5
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:53:51 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id p16so6950547ejb.9
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=LjzanNtCvzSXtiVbp8d3CMKogQqfws09JJb6fy/x1Jc=;
        b=CLy7woEfJH3vriYTAzlxeoPr268GSKbHpkWFV90A3vONDi4xvEit/QlW+SjlWL6sBz
         L9j0a0WFgJPvggwHOzv5kNJCyVqkOrJg6eCl8wJH2cT/7Qr3tbU2SueP+hWBG8G3Fu+K
         5HKNd8mDF/5whjPnM86reTDGE4kcnP3+NPEfy3wYsLGMDVTyGlWVyWx34ddLrS69b9eB
         6d37eV3HaBK9HJY2STRXcI8V+TbjYZb0SRsMovClfKVuqCd1YveaibkxqiX6P+SJfgUY
         5tm1g2dCcLd5D4YL+4agbjTW42izAU+yOn2PYOvG4072wsXhZnV9OsN72uqJaN7epaKm
         2nZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=LjzanNtCvzSXtiVbp8d3CMKogQqfws09JJb6fy/x1Jc=;
        b=F653+FO88IhPRvzmV1hMJtj3gNYY8ppbZptx0BCa5t97yYRje+VrTXOtX0j1iJWsvx
         yEWjm/6nzGxECkBHnLnLnf3v036vFKy8EQ4XoK9I2U9nvcuejzfshFztkt2hzFGwMVdB
         Pp8Y8pgbyptOR/RbmpnIa2rLatXAlKu49S4EsmJGgks8TpSb4a9fDXsgladXNuwGKW3F
         QrCmooZ/MWnzo3VJ/idovJqdb6tfrFjAofHN9hOOwBubSJH2B0mvXb6kLrjGyaTD2sIm
         aRt8nCncYY76XMBc6kLBUpgyRHkgmp4Tss9Kh0zSvxxAfWAfkYHyN3eEi9dx/Y3gDX56
         J2QQ==
X-Gm-Message-State: ACgBeo1WS1AIAb0pfHApep3Jxwwrwv5Em55xgheVfjYDg2TVvoFjdfvC
	HI65FBEBvImlMQXLOM1exL0=
X-Google-Smtp-Source: AA6agR4t0ilfZeKxynHoTjSgGlKQTVmgmJNlumXcUFC039cRmcj27yTi217SjsKuzq7oyLWZOrUU3Q==
X-Received: by 2002:a17:907:6818:b0:730:d99f:7b91 with SMTP id qz24-20020a170907681800b00730d99f7b91mr9495350ejc.496.1661669629992;
        Sat, 27 Aug 2022 23:53:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id fe23-20020a1709072a5700b007308bdef04bsm2890491ejc.103.2022.08.27.23.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:53:49 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:53:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] staging: vt6655: Rename function MACvSetBBType
Message-ID: <44d0151d67e2a76e1cf3d88d254defa96990b142.1661666677.git.philipp.g.hortmann@gmail.com>
References: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661666677.git.philipp.g.hortmann@gmail.com>

Rename MACvSetBBType function to vt6655_mac_set_bb_type to avoid
CamelCase which is not accepted by checkpatch.pl and to clean up
namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 6711743dcf4a..c442a1e580ab 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -55,7 +55,7 @@ static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
 
 /*---------------------  Static Functions  --------------------------*/
 
-static void MACvSetBBType(void __iomem *iobase, u32 mask)
+static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
 {
 	u32 reg_value;
 
@@ -192,21 +192,21 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 
 	/* Set SIFS, DIFS, EIFS, SlotTime, CwMin */
 	if (bb_type == BB_TYPE_11A) {
-		MACvSetBBType(priv->port_offset, BB_TYPE_11A);
+		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11A);
 		bb_write_embedded(priv, 0x88, 0x03);
 		bySlot = C_SLOT_SHORT;
 		bySIFS = C_SIFS_A;
 		byDIFS = C_SIFS_A + 2 * C_SLOT_SHORT;
 		byCWMaxMin = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
-		MACvSetBBType(priv->port_offset, BB_TYPE_11B);
+		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11B);
 		bb_write_embedded(priv, 0x88, 0x02);
 		bySlot = C_SLOT_LONG;
 		bySIFS = C_SIFS_BG;
 		byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
 		byCWMaxMin = 0xA5;
 	} else { /* PK_TYPE_11GA & PK_TYPE_11GB */
-		MACvSetBBType(priv->port_offset, BB_TYPE_11G);
+		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11G);
 		bb_write_embedded(priv, 0x88, 0x08);
 		bySIFS = C_SIFS_BG;
 
-- 
2.37.2

