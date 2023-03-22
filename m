Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404B8F58
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 17:14:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id r11so75884027edd.5
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679505296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwlxfJdJWd/C2Uy2mVEIXe3Fs4cv7HuOigtW0ECLJNU=;
        b=i/1NL3llpeN22VO2qWLkFXGR6pObJ6tWsek5bEwsmDVHmQLn5Bl2gl3f5JOxYQpx9L
         PzMLlJs45OcXRoVi0YrU9Q7rUAGSrw+XzQS9FeF4ivB4UgR0UheN/NJOeroUlmhrEGs6
         UTa1TjlPO1vv0eQTdCNgVgyjACRMD1FUmlixrfk2ejtsYiFG35/eqmz1iR5C/eee8ZVe
         FmrhxRhSNMfWNRUzoDtyJofLnSRSb0e9c5iQ56OtYXDonfMm3XYZ+TfJpCUh42f2DUjV
         DcgzVNigo5S1YI19l/y7SM8TuD5Dh0iHehCksJrLK4d7NmVZNJH0YFy87ZRTuA0nqYpS
         mzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwlxfJdJWd/C2Uy2mVEIXe3Fs4cv7HuOigtW0ECLJNU=;
        b=RMqsCJBOXDBKTir+znI3V5gh6xfd3EBfaOcLQrprawDNHucJjBlix0dN4DDWOHK9Ql
         wV1v4mq4Xp9dCtgacIIak/OB4GeGMXh0maIHKMe13mpxhOGLuXV5hb0nb/XiL9j1GH+/
         m+sdmjlM9BhXMm0nHJM3gzkOy/3cQzDtYiukK/tHRSfpzcpfSfD+CNvZQO34KjvgSmiG
         T7WuaiOK2WlAXZuddm2fUMUTNWn3sqGYMkhQ3eypUL/I82xiCnOgTAEJmKmvQRaD5PQR
         0TSHdH7wlQIQG9tiCiDpMVd53S8pZ2s3unU46cVeaIam6q2lMJLphVloCdFc34fNAk7S
         XjhQ==
X-Gm-Message-State: AO0yUKWDTqdqjRgxEn5v8wCtkBmlsqyg8iVNGuB63W0VNCHRsjWq0pHt
	VOmXm5Lg0qlOepzIcugBXtU=
X-Google-Smtp-Source: AK7set9/cS06/DZEfO6BPPK1A8WvSG8vShlu49d5pGRPlgSTiBTdrQ73fnb+l0dMwb3YbMfoIHAUDA==
X-Received: by 2002:a17:906:7485:b0:8b1:2614:dea6 with SMTP id e5-20020a170906748500b008b12614dea6mr7099804ejl.1.1679505296127;
        Wed, 22 Mar 2023 10:14:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906434300b008d427df3245sm7513015ejm.58.2023.03.22.10.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:14:55 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:14:53 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] staging: rtl8192e: Replace macro skb_tail_pointer_rsl
 with standard function
Message-ID: <6885112850b48c0f9ff16655f7d9efe085ccc001.1679504314.git.philipp.g.hortmann@gmail.com>
References: <cover.1679504314.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1679504314.git.philipp.g.hortmann@gmail.com>

Replace macro skb_tail_pointer_rsl with function skb_tail_pointer to
increase readablility.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Changed subject line to be without “f.”
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 47feb4248d25..2ec47c367c5f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1653,7 +1653,7 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 			priv->rx_buf[rx_queue_idx][i] = skb;
 			mapping = (dma_addr_t *)skb->cb;
 			*mapping = dma_map_single(&priv->pdev->dev,
-						  skb_tail_pointer_rsl(skb),
+						  skb_tail_pointer(skb),
 						  priv->rxbuffersize, DMA_FROM_DEVICE);
 			if (dma_mapping_error(&priv->pdev->dev, *mapping)) {
 				dev_kfree_skb_any(skb);
@@ -1909,7 +1909,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		priv->rx_buf[rx_queue_idx][priv->rx_idx[rx_queue_idx]] =
 								 skb;
 		*((dma_addr_t *)skb->cb) = dma_map_single(&priv->pdev->dev,
-							  skb_tail_pointer_rsl(skb),
+							  skb_tail_pointer(skb),
 							  priv->rxbuffersize, DMA_FROM_DEVICE);
 		if (dma_mapping_error(&priv->pdev->dev, *((dma_addr_t *)skb->cb))) {
 			dev_kfree_skb_any(skb);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8e5e29ce8f0d..cb904fc4f574 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -62,8 +62,6 @@
 #define IW_CUSTOM_MAX	256	/* In bytes */
 #endif
 
-#define skb_tail_pointer_rsl(skb) skb_tail_pointer(skb)
-
 #define queue_delayed_work_rsl(x, y, z) queue_delayed_work(x, y, z)
 #define INIT_DELAYED_WORK_RSL(x, y, z) INIT_DELAYED_WORK(x, y)
 
-- 
2.39.2

