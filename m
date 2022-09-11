Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647D7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:47:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e16so10895198wrx.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=USDvEaR9KG1B871wiabGAqJETGBO4KGWzVY0Nv0OlAs=;
        b=VXfEAyS9YcF1cQyuWRGAF1k9gOEzkVnrNBm5zjTVCc+OuDCUNXR6poIRx/VRr656ZO
         Hm/5JFPO5Zk5AobQV3FNYdQW1baSsXB2Hwrt46MncIMfnGNVH+TpC16PNG6XCBApiRy4
         hGMXpGH8AX4+WQu2r6/ZCyEOY3Ei4vjrf8yO6aUF5bU8KXgZnd9gIs2/ba2LF5sbONPM
         qLQACScQRNZ3PlwyZyJ4lymKrffM6LdoIRBcWppxXPhFv2DGCMG1zL1Fa1Aoed5YKJtv
         vzPSbMeA0kB8vVk0+0nHYl4aCRj1m9Lz5CVjQtzpk5njTZNX98PM+gEjerVZ469au0xU
         Y/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=USDvEaR9KG1B871wiabGAqJETGBO4KGWzVY0Nv0OlAs=;
        b=S68QehDXp2WwG5ef1Udk0sX4302yNQgQxJ34BE1qzFVjkp92UwIzQESChKTx9fXt/M
         2yxtR7i8agCydrk8JE9HH1ZzHiQgSYoKY0+QoJhLNgHzxkX7B88qxmCRwYgyH0EK/17x
         6r3E2mpTN/Jryu7L6goEbow5+9bkz43iHZZtk1EKIBWzW3HflJfrN57PmO0pVNTzfQlB
         KY2nXDvCeoiX5MtWNwjh0AfPyudSYfZuuY6aDhyv5XoVvbL/GnpBLCe2a2TMfwydzVsm
         bLcoQyYm4XfBJCbrCNtvWejPswUupOTqdQk2c7McKqbd3JzrXDKNwteD4GUy0Q/qZPsi
         036g==
X-Gm-Message-State: ACgBeo1CetShH/8t80QHjsR8hW+Dk/svk0OyWgLRw19sVixwq4uuxJSs
	HE4DRGbKAfmKJWhTmXO/AO0=
X-Google-Smtp-Source: AA6agR76dF0LX9ck6+79VD2KK1rv/tpH87XFaNfZbT9tOsETR7z5aXZElFSTFvS4H7MZNMn4x7HpLQ==
X-Received: by 2002:adf:e781:0:b0:228:b44c:d0f7 with SMTP id n1-20020adfe781000000b00228b44cd0f7mr11589202wrm.243.1662893237576;
        Sun, 11 Sep 2022 03:47:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d694f000000b00228c792aaaasm4613391wrw.100.2022.09.11.03.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:47:17 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:47:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] staging: vt6655: Cleanup and rename function
 MACvSetCurrTXDescAddr
Message-ID: <88dcbac76f6bad8b4eb68a3cb37cd4f9684294a0.1662890990.git.philipp.g.hortmann@gmail.com>
References: <cover.1662890990.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662890990.git.philipp.g.hortmann@gmail.com>

Rename function MACvSetCurrTXDescAddr to vt6655_mac_set_curr_tx_desc_addr
and iTxType to tx_type to avoid CamelCase which is not accepted by
checkpatch.pl. Remove unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 4 ++--
 drivers/staging/vt6655/mac.c  | 7 +++----
 drivers/staging/vt6655/mac.h  | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index d137b4b45e3b..c680925b9c92 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -409,9 +409,9 @@ void CARDvSafeResetTx(struct vnt_private *priv)
 	}
 
 	/* set MAC TD pointer */
-	MACvSetCurrTXDescAddr(TYPE_TXDMA0, priv, priv->td0_pool_dma);
+	vt6655_mac_set_curr_tx_desc_addr(TYPE_TXDMA0, priv, priv->td0_pool_dma);
 
-	MACvSetCurrTXDescAddr(TYPE_AC0DMA, priv, priv->td1_pool_dma);
+	vt6655_mac_set_curr_tx_desc_addr(TYPE_AC0DMA, priv, priv->td1_pool_dma);
 
 	/* set MAC Beacon TX pointer */
 	iowrite32((u32)priv->tx_beacon_dma, priv->port_offset + MAC_REG_BCNDMAPTR);
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index d6614be79e39..0ff98468b2e0 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -653,12 +653,11 @@ void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
 		iowrite8(DMACTL_RUN, io_base + MAC_REG_AC0DMACTL);
 }
 
-void MACvSetCurrTXDescAddr(int iTxType, struct vnt_private *priv,
-			   u32 curr_desc_addr)
+void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32 curr_desc_addr)
 {
-	if (iTxType == TYPE_AC0DMA)
+	if (tx_type == TYPE_AC0DMA)
 		MACvSetCurrAC0DescAddrEx(priv, curr_desc_addr);
-	else if (iTxType == TYPE_TXDMA0)
+	else if (tx_type == TYPE_TXDMA0)
 		MACvSetCurrTx0DescAddrEx(priv, curr_desc_addr);
 }
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index fff9dc72e2c0..0224f710d603 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -558,8 +558,7 @@ bool MACbShutdown(struct vnt_private *priv);
 void MACvInitialize(struct vnt_private *priv);
 void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
-void MACvSetCurrTXDescAddr(int iTxType, struct vnt_private *priv,
-			   u32 curr_desc_addr);
+void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32 curr_desc_addr);
 void MACvSetCurrTx0DescAddrEx(struct vnt_private *priv,
 			      u32 curr_desc_addr);
 void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
-- 
2.37.3

