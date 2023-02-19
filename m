Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C25322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:15:55 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id s24so4880976edw.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676841355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjjWJfxbsqn6gyfLTHs1w3kGrQ+J6hwOQ7AqbciTCCg=;
        b=XyNxU/u1C28TR7N2u8CLt4P3JlztWLoYHs2eQZG2zcwlNAfYebV+Sw7ji8BxliZ/Xj
         yB9ZsktPVh/pR3BMXxDjuBmz3BlMClDdiPfW3eMLZlQyoKXMTQWbfyj4KPbWSZw7vnrt
         T/FXvyuT4meqWUnPJapFvOWTtFvrGlu2iUHLW+TSlqPnmvOf3S0nQy5+69cyFqF8w6Us
         nMPOpdMWT8UxZEqtT0gKOt1L5O0TBpFwgd14kF+a8nrxDhHZ7aFK7AveH/DEgQ/TK0k+
         2rWSaQyYfGgL78qA+e52VkZ4d77fi1qELdO6RX0Vuz3ir4EOv+z7wTkw025EqYgeFVVV
         IvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676841355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjjWJfxbsqn6gyfLTHs1w3kGrQ+J6hwOQ7AqbciTCCg=;
        b=fdGYqzC10cKzbZJPUO5afkldBnSmdF7TgIfDFc9YIAN+gembdh+LBep+X2hSpZlLZn
         8/lv+Ypia8sAJJBzfVq93XMz0cn1VIk8aTrss7JBCpfaOjvKHgyMPXZfra7MAO1b2LkS
         ZclPYXbvupWcaO1Qsq7JvdEh6CURtNJvDha3ki1xK0eFzNIDtvm0y9f5O7QBQZqSnRdE
         97TlKnwuvBN0jbKJweP5y/D9mMDlcN8rzWWSfa/c0CfRADBa3sfG0hS8iRXaGAtUaxds
         nrrpCuNZrlrS1x32k5Jilb4IsyNLAEaxoIiZ5KFe3eMMing8Pikf4jkqo/krcDz3Fh6K
         V+8g==
X-Gm-Message-State: AO0yUKU8g8BVG6CTPL0LPOI7GqgfiJGLicZQAiXbkNQpSdZ7jP/XDgUc
	dEJMIys97Xig9LSrGccXorY=
X-Google-Smtp-Source: AK7set9SvehXBcrEpoyGfQKTNjPGQESa91OB0Y+u65s42bvmW77t1O35tpE28ZZjQ35AtBRD5KKezA==
X-Received: by 2002:a17:906:51d8:b0:8ae:cd8e:3957 with SMTP id v24-20020a17090651d800b008aecd8e3957mr5745457ejk.4.1676841355330;
        Sun, 19 Feb 2023 13:15:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090637d700b008c5075f5331sm1801552ejc.165.2023.02.19.13.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:15:54 -0800 (PST)
Date: Sun, 19 Feb 2023 22:15:52 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove entry .tx_fill_descr.. from
 struct rtl819x_ops
Message-ID: <1ae7d44ef74dc6cb61ff43f670b21d702403d7fb.1676840647.git.philipp.g.hortmann@gmail.com>
References: <cover.1676840647.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676840647.git.philipp.g.hortmann@gmail.com>

Remove entry .tx_fill_descriptor and replace it with function name
rtl92e_fill_tx_desc. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 4 ----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 3bebc1153572..dd1f4a3c4bf9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -28,7 +28,6 @@ static char *ifname = "wlan%d";
 static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
 	.link_change			= rtl92e_link_change,
-	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
 	.tx_fill_cmd_descriptor		= rtl92e_fill_tx_cmd_desc,
 	.rx_query_status_descriptor	= rtl92e_get_rx_stats,
 	.rx_command_packet_handler = NULL,
@@ -496,7 +495,7 @@ static void _rtl92e_prepare_beacon(struct tasklet_struct *t)
 	skb_push(pnewskb, priv->rtllib->tx_headroom);
 
 	pdesc = &ring->desc[0];
-	priv->ops->tx_fill_descriptor(dev, pdesc, tcb_desc, pnewskb);
+	rtl92e_fill_tx_desc(dev, pdesc, tcb_desc, pnewskb);
 	__skb_queue_tail(&ring->queue, pnewskb);
 	pdesc->OWN = 1;
 }
@@ -1637,7 +1636,7 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 		if (priv->rtllib->LedControlHandler)
 			priv->rtllib->LedControlHandler(dev, LED_CTL_TX);
 	}
-	priv->ops->tx_fill_descriptor(dev, pdesc, tcb_desc, skb);
+	rtl92e_fill_tx_desc(dev, pdesc, tcb_desc, skb);
 	__skb_queue_tail(&ring->queue, skb);
 	pdesc->OWN = 1;
 	spin_unlock_irqrestore(&priv->irq_th_lock, flags);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 9edadc62faa9..0d4ae3a310da 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -207,10 +207,6 @@ struct rtl819x_ops {
 	enum nic_t nic_type;
 	void (*init_before_adapter_start)(struct net_device *dev);
 	void (*link_change)(struct net_device *dev);
-	void (*tx_fill_descriptor)(struct net_device *dev,
-				   struct tx_desc *tx_desc,
-				   struct cb_desc *cb_desc,
-				   struct sk_buff *skb);
 	void (*tx_fill_cmd_descriptor)(struct net_device *dev,
 				       struct tx_desc_cmd *entry,
 				       struct cb_desc *cb_desc,
-- 
2.39.2

