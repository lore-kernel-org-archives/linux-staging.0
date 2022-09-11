Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE67F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:47:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k9so10953306wri.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=TT6OYj05Y/OPaIfMBcxSP+HaQFVzI0H6ci3zEsCyTH0=;
        b=VPuwS/1KbQj6bIjLdGNTfU5UDPGo6ceRfJnMYfBnITrtE7a1M5nBuOJtwAgQCTcXsl
         r9XjgpLmLlzTKBAvqCKW7TFzvvHhiZ5me9UQUyucu/XHKwhFo6suLw/kk1nGeLJYyL8z
         dDGxuyXKs4Ql4YX+oMe2dm/9IesjE3yEYgISfikNOqkehWEOK+bDf1pRHDm1zi9CE/PK
         N/SYG48Xl/08fiS4TahJ94ZWogJK79rWXFRgr9mYjP/QNibBJGHi2/S2FYYeEHc8OfhU
         KQXzTaiioS6QnlPPEb7Uv+cBCv0LlCswUeWUbn/c3D41QEwEMHDaAPTtH2hYz1hkp0EB
         9UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=TT6OYj05Y/OPaIfMBcxSP+HaQFVzI0H6ci3zEsCyTH0=;
        b=an0EuTj6HOTKorh+LAnpwuXT0nr2i8sffNhI2sk9BQdEozdLeiBFwvXxKvHwtKtgMY
         5oUAgEcNxnRy7fL3U8LY0yZYPb7lP59ARn8kzwgwhNiazXnauAVtSs0Sx3Y/Kr/LvOwP
         CdO7is+i8fUZ/p5DN73YDKGBWi6wzZXyGt9RRBuJDxiMWyNJUEJ7oKpHW4g4/mSSfO/L
         9IjPuHhAIpTTM/ktfLDP6nEurwifiTOrm2G8N7MtLj/xJid9xgcfsPJIgFRGuJdZNJ7R
         7GPI7JH6++75aUdnsiTLU0HlS3vsesX2aNyFUial1MT3+ldkhKdtH2s6oRypQvtZKGo5
         S1iQ==
X-Gm-Message-State: ACgBeo1ydMvWgaN9P1Os8Qsg40ZOyTDAczinjioz45veDObAE6xMUFVz
	/l4FtPy/1AXFHMXQNgBTuH9yePxyo7U=
X-Google-Smtp-Source: AA6agR6nL4INVoqEtyPqMDS+sGUJpypmgQ3Dce+GdrMZK0OzHGD8kKftBHDaZMa472Xgyc2xMcHv5A==
X-Received: by 2002:a5d:68c6:0:b0:228:74b6:2b07 with SMTP id p6-20020a5d68c6000000b0022874b62b07mr12073406wrw.60.1662893229758;
        Sun, 11 Sep 2022 03:47:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c020b00b003b4868eb6bbsm112872wmi.23.2022.09.11.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:47:09 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:47:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] staging: vt6655: Rename function MACvSetCurrRx1DescAddr
Message-ID: <0d11f588d4746988478521d323ab49e6a0b7f8b0.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACvSetCurrRx1DescAddr to vt6655_mac_set_curr_rx_1_desc...
to avoid CamelCase which is not accepted by checkpatch.pl. Remove
unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 drivers/staging/vt6655/mac.c  | 2 +-
 drivers/staging/vt6655/mac.h  | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index dc39b3668c77..d137b4b45e3b 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -460,7 +460,7 @@ void CARDvSafeResetRx(struct vnt_private *priv)
 	/* set MAC RD pointer */
 	vt6655_mac_set_curr_rx_0_desc_addr(priv, priv->rd0_pool_dma);
 
-	MACvSetCurrRx1DescAddr(priv, priv->rd1_pool_dma);
+	vt6655_mac_set_curr_rx_1_desc_addr(priv, priv->rd1_pool_dma);
 }
 
 /*
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index e88536705d23..d6614be79e39 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -561,7 +561,7 @@ void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_
  * Return Value: none
  *
  */
-void MACvSetCurrRx1DescAddr(struct vnt_private *priv, u32 curr_desc_addr)
+void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_addr)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index b092e59a5b98..fff9dc72e2c0 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -557,8 +557,7 @@ bool MACbSoftwareReset(struct vnt_private *priv);
 bool MACbShutdown(struct vnt_private *priv);
 void MACvInitialize(struct vnt_private *priv);
 void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
-void MACvSetCurrRx1DescAddr(struct vnt_private *priv,
-			    u32 curr_desc_addr);
+void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void MACvSetCurrTXDescAddr(int iTxType, struct vnt_private *priv,
 			   u32 curr_desc_addr);
 void MACvSetCurrTx0DescAddrEx(struct vnt_private *priv,
-- 
2.37.3

