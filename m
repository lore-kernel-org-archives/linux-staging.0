Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D578F78
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:53:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ck15so23602870edb.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677012793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5781ruJ9B83DIEjZUA3ADxzlHbWLbO7A7cvptYVnr8=;
        b=QtC9yT4Q/rx1NryfvbZbre7nYLVimqms/39fS4wORcJdWjcd4fNopCglE7t+tI1Scp
         w8WOvkiqH/nZzBvANym1TsIlOQ0lXJXOKaFkLfcBWY53O9uIOSYwSGBYaLq0KmggQ5g4
         6lCuDZKNwsaCyF2uQ3Y71jW+6G2cWhqpfJkhAQ5qMTst0G3WbkeywH2kFA6VGNH1DwhO
         kOfF5qEKmna+i8SPCBvb4um8K7yInNHorzVYrEIQ0VeCHUzS7Yz0a7C3inkXdDWJnwq7
         +/L8o/r4OKDDSZIVU9c7mAqiJI91c+bpNxw8pDPfw2/6XCt4yziGG7j8LqhOSz/Syyfe
         0FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677012793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5781ruJ9B83DIEjZUA3ADxzlHbWLbO7A7cvptYVnr8=;
        b=I2FSBjfhu4T4i3vu2w5svdNJ7qYSyhxorFRjeFLMYeiiFE9GbxkCexO9KnfxETQqy+
         AChQTjYLsbFq2yDj09agd4aQs0icjAeptyExrDam0JQHwm511mqpJ+Az+cduGFQXrqCD
         SeahL+rEPg+TMGb3mSINJUYOxxHPlzKuj2vf5QhvyA15upiYhXIi2ceaWs6iYzUWZISj
         maV6AcjW4o1NbHYMoGBmeIS6QSjf3enMyKkLQItcYETMiNGSsdDwWlmby+lyzvPaUslf
         uBvjDLU9e73qnwr7zuQMJVYUMDASioJhGzOHMkMWcDltRTrQnXg7BnkVtSS4QG9LJcIQ
         Ou6A==
X-Gm-Message-State: AO0yUKVp3HHqU/onWWIG0PjqutvCblW+eSHyfnumy4f/RdcGK5Omf+Y9
	EZa/7c8ivojZc9C02iKM9bf91JFZBgo=
X-Google-Smtp-Source: AK7set/BNSY+AU9d37NebB89iCLAKsbGLrT7IWNfsWyikQk12tv01VyG70OnvSbZoySpQ/+YCvUsGw==
X-Received: by 2002:a17:906:51d8:b0:8ae:cd8e:3957 with SMTP id v24-20020a17090651d800b008aecd8e3957mr11185525ejk.4.1677012793343;
        Tue, 21 Feb 2023 12:53:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id n27-20020a17090673db00b008d173604d72sm3311391ejl.174.2023.02.21.12.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:53:12 -0800 (PST)
Date: Tue, 21 Feb 2023 21:53:11 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: rtl8192e: Remove entry .tx_check_stuc.. from
 struct rtl819x_ops
Message-ID: <f58cc7b39f4a6bce0606bdd90a706b35b87d8256.1677010997.git.philipp.g.hortmann@gmail.com>
References: <cover.1677010997.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677010997.git.philipp.g.hortmann@gmail.com>

Remove entry .tx_check_stuck_handler and replace it with function name
rtl92e_is_tx_stuck. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 3323bdf564ee..410c03833b9f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -30,7 +30,6 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.link_change			= rtl92e_link_change,
 	.rx_command_packet_handler = NULL,
 	.irq_clear			= rtl92e_clear_irq,
-	.tx_check_stuck_handler	= rtl92e_is_tx_stuck,
 	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
 };
 
@@ -1055,7 +1054,7 @@ static enum reset_type _rtl92e_tx_check_stuck(struct net_device *dev)
 	spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 
 	if (bCheckFwTxCnt) {
-		if (priv->ops->tx_check_stuck_handler(dev))
+		if (rtl92e_is_tx_stuck(dev))
 			return RESET_TYPE_SILENT;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index d3558bf6ce23..87be8aaa7822 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -211,7 +211,6 @@ struct rtl819x_ops {
 					  struct sk_buff *skb,
 					  struct rx_desc *pdesc);
 	void (*irq_clear)(struct net_device *dev);
-	bool (*tx_check_stuck_handler)(struct net_device *dev);
 	bool (*rx_check_stuck_handler)(struct net_device *dev);
 };
 
-- 
2.39.2

