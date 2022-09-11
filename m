Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968767F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:47:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id e20so10859900wri.13
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=/BEKoYFEaG0AJXKvbQY58i8UsnsML/dixE5FP50Uz/g=;
        b=CRO7b5Nn3zhP7tHDNii1L8x22na9nhVm0a6PvDyHXkMY1T2q+KAOnmB0QlwkiyN6Mb
         RdgLYWJ0XV5CtS1iDIJQ5XgCjp/+f6mRR1bIdsDMxgBtR6JoObKo82H+KD6gx2KgO2J5
         DxnYMvQXcOEaaXJJoQ3fGhVQNPJdmk55YXnVnzqr8SVbVaPIOowuJqU/P5/qFIxnyACA
         WXEq9IFo8rqoCvQXD+s1Hu3w6GKRT5PAX8phNlrE07SZt+60pRn9IKWxOmuHxr9/N2H0
         XX9V5Tc8bx3tUDKqU14Zq2C4YpnHEYQOOqpuTRfp2YgX0jNbk5/kgoq+fSX+7v5nv5mP
         PhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/BEKoYFEaG0AJXKvbQY58i8UsnsML/dixE5FP50Uz/g=;
        b=bRihz6ttEowF/kVdHhlhioWEvDnE/7m8a7+Zly8ZHlG/RG4AUFkdDtOdazEsjdRhDs
         3Ixl6Fc/caJ0M92Eu37/9glC2hc5zOUVt+LDUdOi8I3LknWlpiQnUrbr1HftZnMOozm4
         VbIWNh1d2WRIGmSm/A26SWbyRnEFMv1X3J6EiTjsVdTBw8+q7q/u5S2tgLn8GBAiSqSU
         RYuepmcWdZvkwyWnzwJH58KAOLpQAPY7H7h6rHXw9+PNeXw4BpPefE0P0PlrwCIh1MqH
         wsw8tqnje+OEC/MDlD7+Fj0W1D3oLoaAQNFfHGYVkSJej41eQGW7JkknbFD8K23MFSZN
         165Q==
X-Gm-Message-State: ACgBeo2UcIzcolRY8+rxpwlnto3EXLOd+0d1q07Xo09cyYq2jtdjNHs0
	UhX92LFGo+aLyG+XMgUkp0s=
X-Google-Smtp-Source: AA6agR7XxADmw3S4u/aVPV7k8/g8IliYlRSQAn8nrVC3puzyPiAnBOVxrHrgO4AS7E6OI+1QbE+NiA==
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id y16-20020a056000109000b00228a9633641mr12660582wrw.289.1662893250958;
        Sun, 11 Sep 2022 03:47:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id ay3-20020a05600c1e0300b003b339438733sm6264012wmb.19.2022.09.11.03.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:47:30 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:47:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] staging: vt6655: Rename function
 MACvSetCurrAC0DescAddrEx
Message-ID: <dc3f83dfa8b83a02ed95da3cfb71c0139ba8b674.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACvSetCurrAC0DescAddrEx to vt6655_mac_set_curr_ac_0...
to avoid CamelCase which is not accepted by checkpatch.pl. Remove
unnecessary declaration of function and make function static. Remove
unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 5 ++---
 drivers/staging/vt6655/mac.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 2fbee8508f0e..b4ebc7d31961 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -630,8 +630,7 @@ static void vt6655_mac_set_curr_tx_0_desc_addr_ex(struct vnt_private *priv, u32
  *
  */
 /* TxDMA1 = AC0DMA */
-void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
-			      u32 curr_desc_addr)
+static void vt6655_mac_set_curr_ac_0_desc_addr_ex(struct vnt_private *priv, u32 curr_desc_addr)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
@@ -655,7 +654,7 @@ void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
 void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32 curr_desc_addr)
 {
 	if (tx_type == TYPE_AC0DMA)
-		MACvSetCurrAC0DescAddrEx(priv, curr_desc_addr);
+		vt6655_mac_set_curr_ac_0_desc_addr_ex(priv, curr_desc_addr);
 	else if (tx_type == TYPE_TXDMA0)
 		vt6655_mac_set_curr_tx_0_desc_addr_ex(priv, curr_desc_addr);
 }
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3fbb891ac57c..acf931c3f5fd 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -559,8 +559,6 @@ void MACvInitialize(struct vnt_private *priv);
 void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32 curr_desc_addr);
-void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
-			      u32 curr_desc_addr);
 void MACvSetCurrSyncDescAddrEx(struct vnt_private *priv,
 			       u32 curr_desc_addr);
 void MACvSetCurrATIMDescAddrEx(struct vnt_private *priv,
-- 
2.37.3

