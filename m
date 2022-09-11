Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F097F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:47:00 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t14so10893989wrx.8
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=nBdTSAzFShT30tVGtuaAt4w0WQVoDwWLtAj/D+fJEoQ=;
        b=Dp1BsHfW8cgZ2B+XxymWNyqAIO33+m3Ciz/srTGiMLnWBE2zrDnEMD71oIpt9fXmLW
         N9w/98zvBxDxAjqo90+qCw1Yalh3U1uJGITetUy3oPTK2zNcxUOrM1VeZqG3PCeFSjba
         Eohm3mwKx0NVPiLRZroHYWuTwRsMpXeb6pxVkT0usNQH/39pwOsBGRCCAeXHXCxJ24H1
         ESZUVQS7P00l6/qIH8mdc6BbHl3QtwHGN93MVrIKG2WTIsgEMegwEF946642oJ6mOOmS
         VJkDdMsi38iuMI727tBAhk6PHK6tHO1Yp2w+HSozZ28NDfVOqHInnZxzJkhtbBAdJJoJ
         O8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nBdTSAzFShT30tVGtuaAt4w0WQVoDwWLtAj/D+fJEoQ=;
        b=hqNivcSiD7hT5qX52A/sMjVtim88OLe9U8gVbpH5f0Y/DckgbMxhfmsw4fUaO3Yi4/
         wTK0Ue+QGmW9zuk3DRHY6Wa1kr6Ti8IWIwx83CAufT9v3xju2mjkX570BPeVj5PUxscl
         HuiPVt6kNUzjhl4yrwYtkd1Xa4H+eJwVOlUXE6Ln0ZsEM7mL9O8CXpxKL46ELiYaZsjT
         kdJ/hpwEK6+f3Uh+qQXV1XANrtIkts52R7R6z7pLLQSaeYO1tlvqxChV409yRwT9wZj5
         M4Oo9PgH3i306vfE0YY8wib273ntSD+EV+ouJuX1uoHgqq62ll+IW6oRS9kSSXWkuo0W
         cqNg==
X-Gm-Message-State: ACgBeo3VdT0Jhf3VtArdJnmMFMDST9MEwckSdFcoXjLmhmZKg35x1ADT
	EvDeDcUCKf5T0VMzIZ751Hqpp8k3Ht0=
X-Google-Smtp-Source: AA6agR4vUjvoBaO8sfin/zparxquhaBoIOhA2IGrIbQpvw0CO05HlwQ8pkB6XNsmxmW+XIe1aKrHjA==
X-Received: by 2002:a5d:6102:0:b0:228:811f:b496 with SMTP id v2-20020a5d6102000000b00228811fb496mr12649619wrt.404.1662893219120;
        Sun, 11 Sep 2022 03:46:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id p8-20020a1c5448000000b003a502c23f2asm6220317wmi.16.2022.09.11.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:46:58 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:46:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] staging: vt6655: Rename function MACvSetCurrRx0DescAddr
Message-ID: <14f7f2b06ba9f8656d91d4cb84c363e190095049.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACvSetCurrRx0DescAddr to vt6655_mac_set_curr_rx_0_desc...
to avoid CamelCase which is not accepted by checkpatch.pl. Remove
unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 drivers/staging/vt6655/mac.c  | 2 +-
 drivers/staging/vt6655/mac.h  | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 1b2ba6793ead..dc39b3668c77 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -458,7 +458,7 @@ void CARDvSafeResetRx(struct vnt_private *priv)
 	iowrite32(RX_PERPKT, priv->port_offset + MAC_REG_RXDMACTL0);
 	iowrite32(RX_PERPKT, priv->port_offset + MAC_REG_RXDMACTL1);
 	/* set MAC RD pointer */
-	MACvSetCurrRx0DescAddr(priv, priv->rd0_pool_dma);
+	vt6655_mac_set_curr_rx_0_desc_addr(priv, priv->rd0_pool_dma);
 
 	MACvSetCurrRx1DescAddr(priv, priv->rd1_pool_dma);
 }
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index e1f639787316..e88536705d23 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -527,7 +527,7 @@ void MACvInitialize(struct vnt_private *priv)
  * Return Value: none
  *
  */
-void MACvSetCurrRx0DescAddr(struct vnt_private *priv, u32 curr_desc_addr)
+void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index c6147a4f563e..b092e59a5b98 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -556,8 +556,7 @@ void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit)
 bool MACbSoftwareReset(struct vnt_private *priv);
 bool MACbShutdown(struct vnt_private *priv);
 void MACvInitialize(struct vnt_private *priv);
-void MACvSetCurrRx0DescAddr(struct vnt_private *priv,
-			    u32 curr_desc_addr);
+void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void MACvSetCurrRx1DescAddr(struct vnt_private *priv,
 			    u32 curr_desc_addr);
 void MACvSetCurrTXDescAddr(int iTxType, struct vnt_private *priv,
-- 
2.37.3

