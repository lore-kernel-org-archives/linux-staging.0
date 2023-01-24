Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADDE8F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:04:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o17-20020a05600c511100b003db021ef437so35296wms.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDxe4oIJJSUOqPRwp3G0IGOgJo50hIDpNvcK0HbcW+I=;
        b=WBkvXYXkvoKDXytnJfUU8oWA+parU/KCWf/I5sg/p3eClZPsxIvW7DeUIiwOvH4Fj3
         YlCE0XCIY1laBfVZPEPVSalqFcfhOSB+YDt14gYlwJ0M4e8zOjXdpdEhi6w9yJDn+CPo
         Er42ROETd++Gt9iprGqRzUYfy6e1IX+kVPp98lJz8C8iRn/bn7k7ZGIN1M/1hExJitRQ
         G9RhNts8dN939D3TP93LgjGPuZ0DTwjXh0CyW0KRsn2dNQK0pcovmQNqZ651WyL3X/OF
         /84Kv89aQwLEfWXz5zqHeVFjwEdPHnlyyTUkibhbbrLuSPPG5GOCx2Wnejt9PySD3ZLk
         yuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDxe4oIJJSUOqPRwp3G0IGOgJo50hIDpNvcK0HbcW+I=;
        b=YzwNiFbsB0+RBN3qSSRU2rNcxxbkH0rMxxoIJvWuVJB12FyNEAfhbmqolSoKl0zB6z
         LH+CFLm3SsKtkpDZVKn/AQxDCVUcTQsGfOHeZib4gWHbr7QCE4wAsheyU62i5av9A919
         thKsAnVfVuJw6ruGWXPRfRcn+wSYjYHogOQqtgY7QKzIhKyLkv51chrIbOzv+MPEqrhN
         1dxA9fMaZZGkz21lpEqpbnjjdPMzGnffgGGT9QAZi7kCVhAsW5F6zYS8cfIH/6RRjeDX
         AV0fXWGMe5bk2mXcDEIULHme5Y+CtVa4ffdVXbtQusaQT3Oe5fUnQzDXP9No7cQW/oEr
         xHGg==
X-Gm-Message-State: AFqh2krWP2TCFycpxJVnd/DbppOA7kTRtqNHXPKvLGQuYYo24p1gdokj
	oCze0WP/az04TRKIJtXXr30=
X-Google-Smtp-Source: AMrXdXvbJ+ZGoez6kgmrT3njEyJRbIcpsgf36SFSsjNMJoZqRUMrig2dz8kXsww2MkR8pm4anfOVlg==
X-Received: by 2002:a05:600c:1695:b0:3da:f452:a975 with SMTP id k21-20020a05600c169500b003daf452a975mr6480278wmn.1.1674597873237;
        Tue, 24 Jan 2023 14:04:33 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b00297dcfdc90fsm2825015wro.24.2023.01.24.14.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:04:32 -0800 (PST)
Date: Tue, 24 Jan 2023 23:04:30 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8192e: Remove unused variables txbeac..,
 txman.. and txcmdp..
Message-ID: <e18b8ce4a253f9ed24d30296a924ba13d13997bc.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

txbeaconerr, txmanageokint and txcmdpktokint are initialized and increased
but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 +-------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4cc90425fa4c..2c5edda74e73 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2139,11 +2139,7 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		goto done;
 	}
 
-	if (inta & IMR_TBDER)
-		priv->stats.txbeaconerr++;
-
 	if (inta  & IMR_MGNTDOK) {
-		priv->stats.txmanageokint++;
 		_rtl92e_tx_isr(dev, MGNT_QUEUE);
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 		if (priv->rtllib->ack_tx_to_ieee) {
@@ -2155,10 +2151,8 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		spin_lock_irqsave(&priv->irq_th_lock, flags);
 	}
 
-	if (inta & IMR_COMDOK) {
-		priv->stats.txcmdpktokint++;
+	if (inta & IMR_COMDOK)
 		_rtl92e_tx_isr(dev, TXCMD_QUEUE);
-	}
 
 	if (inta & IMR_HIGHDOK)
 		_rtl92e_tx_isr(dev, HIGH_QUEUE);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index f8b2201ea288..c6a4ac6ce959 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txbeaconerr;
-	unsigned long txmanageokint;
-	unsigned long txcmdpktokint;
 	unsigned long txbytesmulticast;
 	unsigned long txbytesbroadcast;
 	unsigned long txbytesunicast;
-- 
2.39.1

