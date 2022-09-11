Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC07F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:47:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so5140044wms.5
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=IpM8ImahcxQnr43GKJ1vwFn3rPGdh1kfMTIgO7Z6QqE=;
        b=C7GgBhmkM6QeO0YtIxxIYCFAS9mJXK+ZKLXG5Fuptua8URwAL5c024PS8Ej/EwrKAU
         zHDsP3DEo0Xkbkr3f2AvFIKWqjBvEzJsRDIgrNKr1nIWA1krj1zZAF/BZXR9TpL6S2go
         Tk5XugGqcodDKYoIOCxsF7bKF1/PcuJ7mH+DR3WNMxukOs1gB3Wq4pX88f6IECoyFkZD
         DxGy0xIU7vpFg1cJlCiVksBBsKKrRAWLXLjSXfquRVNVMihpDBdD03DM8FArvAtxdDAA
         j7Ls9Vo0PT7JGhM6sitqWSmZmFNXDZRaHdIotIlP2X5Xtu9o44Ir4ELbbgEUPLiwhNiq
         7c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=IpM8ImahcxQnr43GKJ1vwFn3rPGdh1kfMTIgO7Z6QqE=;
        b=LLq88Mts8fH/woy9slbSN+pUSmjvFT8+QFB907PHqvat/5DLGi6qj/ra3LI8gZO9vd
         cWeDZ24yp6PnWXhk4s49rJXcaJS4LSMjubMcoHaYlc1vm1ix7RbIlJOq9RIKMDbnnIOk
         xEGbrkGtFDdfzHnGXpJ5JPJ5MvSvasAhIxx06tX37OUpigJBSnKLu1N1QQLAIJ1W9rAo
         QKRhFW0al5u2okuOz81ArcCU7l0f81aKqyAZFfMysnYeDawqA779BU2hxiivUtzlZ86F
         mXo1St9X08VewloVtfLgHYWrSGHRqjxbwbcgtcdRQtHaptEiTmGkIC2B3QjRVJH8kkUo
         7Ixw==
X-Gm-Message-State: ACgBeo0INcmJz7SOFajY2qd/WYANrwxD9ss1JEprvY9w/QFkbHxLSSpf
	v1C1SKmgVUCM1LVOm5PyP3A=
X-Google-Smtp-Source: AA6agR74Rprh1P1dW/+ozFcP79MAOARJjdumplSg2HpQoAXMmj5vmDfF6vo9RkCeRRRS8+HixDGjXw==
X-Received: by 2002:a05:600c:1d1e:b0:3a5:4f8d:743f with SMTP id l30-20020a05600c1d1e00b003a54f8d743fmr10486222wms.121.1662893244059;
        Sun, 11 Sep 2022 03:47:24 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c020b00b003b4868eb6bbsm113539wmi.23.2022.09.11.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:47:23 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:47:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] staging: vt6655: Rename function
 MACvSetCurrTx0DescAddrEx
Message-ID: <4337deed83e1443ebf93c5591e17f5c6dfe0cf55.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACvSetCurrTx0DescAddrEx to vt6655_mac_set_curr_tx_0_...
to avoid CamelCase which is not accepted by checkpatch.pl. Remove
unnecessary declaration of function and make function static. Remove
unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 5 ++---
 drivers/staging/vt6655/mac.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 0ff98468b2e0..2fbee8508f0e 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -595,8 +595,7 @@ void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_
  * Return Value: none
  *
  */
-void MACvSetCurrTx0DescAddrEx(struct vnt_private *priv,
-			      u32 curr_desc_addr)
+static void vt6655_mac_set_curr_tx_0_desc_addr_ex(struct vnt_private *priv, u32 curr_desc_addr)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
@@ -658,7 +657,7 @@ void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32
 	if (tx_type == TYPE_AC0DMA)
 		MACvSetCurrAC0DescAddrEx(priv, curr_desc_addr);
 	else if (tx_type == TYPE_TXDMA0)
-		MACvSetCurrTx0DescAddrEx(priv, curr_desc_addr);
+		vt6655_mac_set_curr_tx_0_desc_addr_ex(priv, curr_desc_addr);
 }
 
 /*
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 0224f710d603..3fbb891ac57c 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -559,8 +559,6 @@ void MACvInitialize(struct vnt_private *priv);
 void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_addr);
 void vt6655_mac_set_curr_tx_desc_addr(int tx_type, struct vnt_private *priv, u32 curr_desc_addr);
-void MACvSetCurrTx0DescAddrEx(struct vnt_private *priv,
-			      u32 curr_desc_addr);
 void MACvSetCurrAC0DescAddrEx(struct vnt_private *priv,
 			      u32 curr_desc_addr);
 void MACvSetCurrSyncDescAddrEx(struct vnt_private *priv,
-- 
2.37.3

