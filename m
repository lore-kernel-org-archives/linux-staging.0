Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6979C5
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 19:13:29 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cy23so24165000edb.12
        for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080408; x=1681672408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdvGLimWlyViKT5AvlOeO6Wk+zSpkACpdO1SpV6s/lw=;
        b=Ye4AH+lF1JQ9QT7C2JKPCwHf5ic80KnDEqxrGQnMgHjrORQW3VFRHZxeNxHtPzGp0w
         kTSaapUvLzFiD2G8yIFQk5fEn0bx6WX2A1FBJ2FpaAkgyFhhTacaCEqZTZkK9460HClj
         kKJBgqaRpFynMAYZ7u59x5Hv2Y7NBjGtM5z+RMtp5ryWkzTUY/wtniOZ3zlXkQaDtQR7
         M6CayalS9qvppGw/ACjtCA77UIkdL1mviKXgUGQ3ggXKlFvxtqNfDr3wvsB51RJBjqSJ
         0pRO/VATExCVwb0NedhFlCOKQ5RdGK1B7nsoT25ccWF5Eh2FmoDNEZ+tLVbLxuyp05IA
         2T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080408; x=1681672408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdvGLimWlyViKT5AvlOeO6Wk+zSpkACpdO1SpV6s/lw=;
        b=x6Vq9L82awITB0vLAnLmXPkVVsRhlV3k/9oTMb2xmCQjo6NSzEJ3M9GjMUOug9nfgC
         OQSkcfXh9ayl0IAPOu9GwWl3PYAGj7ASTT9/6O8CckEkBbS/6qklJYSTz31+Ail/GoyW
         U47mo3EnzQHnaikcimCTLaiKprc1rJMPvsTOOSJO5R+M0TYFn4tYHbBph2LBxfgRy21b
         tTkBTu9qFob39U/bipQZcROQhQgwP8eScfyIjpTOVJ3mkXqW4FohEiMDAen8wBECb4O9
         92cyFPpndEU13aMIFNSV/6UgLpmM+jlReg2Ei4t1hq7pJb/rRq2h1hJQJl+RtUCYYeUj
         uPpQ==
X-Gm-Message-State: AO0yUKWGWAPM42CVFhssaq58JFhqPmccQGoKy4joD/IHGxMotmk9qWsX
	JFQhNvcmnPhkncgIg2gbvlo=
X-Google-Smtp-Source: AK7set/I5Le01T4EAEssvXbcwKWxRM238msATyMDuN0QaQJuBVuN/ijQ2S1LDBg1bPmh7Mm/TvuREQ==
X-Received: by 2002:a17:906:213:b0:931:5145:c51f with SMTP id 19-20020a170906021300b009315145c51fmr4773605ejd.4.1679080407988;
        Fri, 17 Mar 2023 12:13:27 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id d1-20020a50cd41000000b004af720b855fsm1448742edj.82.2023.03.17.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:27 -0700 (PDT)
Date: Fri, 17 Mar 2023 20:13:25 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] staging: rtl8192e: Replace macro skb_tail_pointer_rsl
 with standard f.
Message-ID: <f8c55bd613470a80ae9f45f908be84c0ffb6ebdb.1679077522.git.philipp.g.hortmann@gmail.com>
References: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679077522.git.philipp.g.hortmann@gmail.com>

Replace macro skb_tail_pointer_rsl with function skb_tail_pointer to
increase readablility.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
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

