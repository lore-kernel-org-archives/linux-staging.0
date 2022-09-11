Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AEB7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:46:27 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t7so10848901wrm.10
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=HkRQXD8heGTebUpGA++qzsjiZZghTy1mCCFzSRDXdig=;
        b=WYPJuHp1aGBbMeZbq/Lfgta/tRfmmVoikgKDHaLzGrSNx8mG4JLQlANVjyhn2Ifcii
         IOfyustG56sQ51RMk51Xe0SMz92qDkgy7NVqmrcTZuv2/W2W7XoWqc5SPt/CrWkV6lmc
         Zd0mf86u0Gq2y0ZaoBNIJsAJXUSsP3PGcvdaVJFEDwWsVkqAEn976paNHgZwCpLmZvGk
         R1yHLg2V/bDQBUv/ioiCIaNwys4i6xyAMJ3ADc01dNCf2pbr7v/F963GTZVvFQNcb7ox
         7h5Zr4C9keDvZBLmsMgevB/SVZKRTzl18IIbalaBAbYvB9RrhVM+yWHVO3zmjRwm8Ea+
         268Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HkRQXD8heGTebUpGA++qzsjiZZghTy1mCCFzSRDXdig=;
        b=vGXhslqWKE5/2tRNeSgHoSL9/YLoLhcXaWGRBgmZrSekG7N2nBuueBAFhY6jzUCNi1
         DC9wGB38G0eH1kPQFP2qRBqVrgsJ94LedZfMUBJ+JHaagxgGueMHgUfN/JlPsWKrUslM
         TdJTMdK5M9RkXVQhYTdvrrjBoOIFEI1/JX23MSz1vRahFPivNtoO1JDpHZ61uhyhvff0
         lDuzg4sRhnOAHUWofl1OnrS8QyT4QR77klN2zU5vEATJPiklAM4P23YtowbTspO7Qi0+
         VCaj0sTGZoD1xCjXM17TggElDqU1CRz5m+GimaWrWU7enXAzMs8MXHlgmqbjrB1eN6jW
         5L3w==
X-Gm-Message-State: ACgBeo09WSy1PQnV0w7R2bQ9Trc+2fbXY0zc6mWc9+VE1EatsqjJharr
	SigpmfXIDwQ/zAtCATHmTqo=
X-Google-Smtp-Source: AA6agR669Jcnw8mlp+34lVaPiR8YUjeEvxn8gntiKWs+uLTYRlZppFLL0LDnT5UzroM3Lehu1xP/cQ==
X-Received: by 2002:adf:e649:0:b0:228:a8f6:42b4 with SMTP id b9-20020adfe649000000b00228a8f642b4mr12240264wrn.167.1662893185777;
        Sun, 11 Sep 2022 03:46:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id j13-20020adff54d000000b00229d55994e0sm4579677wrp.59.2022.09.11.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:46:25 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:46:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] staging: vt6655: Rename function MACbSafeTxOff
Message-ID: <50211bbdd866be93fe9ea912a433e56460bf7f28.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACbSafeTxOff to vt6655_mac_safe_tx_off to avoid
CamelCase which is not accepted by checkpatch.pl. Remove unnecessary
declaration of function and make function static.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++----
 drivers/staging/vt6655/mac.h | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index e0216d320235..24851fe53683 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -18,7 +18,7 @@
  *      vt6655_mac_restore_context - Restore Context of MAC Registers
  *      MACbSoftwareReset - Software Reset MAC
  *      vt6655_mac_safe_rx_off - Turn Off MAC Rx
- *      MACbSafeTxOff - Turn Off MAC Tx
+ *      vt6655_mac_safe_tx_off - Turn Off MAC Tx
  *      MACbSafeStop - Stop MAC function
  *      MACbShutdown - Shut down MAC
  *      MACvInitialize - Initialize MAC
@@ -376,7 +376,7 @@ static bool vt6655_mac_safe_rx_off(struct vnt_private *priv)
  * Return Value: true if success; otherwise false
  *
  */
-bool MACbSafeTxOff(struct vnt_private *priv)
+static bool vt6655_mac_safe_tx_off(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
@@ -443,8 +443,8 @@ bool MACbSafeStop(struct vnt_private *priv)
 		vt6655_mac_save_soft_reset(priv);
 		return false;
 	}
-	if (!MACbSafeTxOff(priv)) {
-		pr_debug(" MACbSafeTxOff == false)\n");
+	if (!vt6655_mac_safe_tx_off(priv)) {
+		pr_debug(" vt6655_mac_safe_tx_off == false)\n");
 		vt6655_mac_save_soft_reset(priv);
 		return false;
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index e6ff860c1bfa..12b4f8937d14 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -554,7 +554,6 @@ void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char re
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
 bool MACbSoftwareReset(struct vnt_private *priv);
-bool MACbSafeTxOff(struct vnt_private *priv);
 bool MACbSafeStop(struct vnt_private *priv);
 bool MACbShutdown(struct vnt_private *priv);
 void MACvInitialize(struct vnt_private *priv);
-- 
2.37.3

