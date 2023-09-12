Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460EA95A
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:41 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31c49de7a41so898154f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546919; x=1695151719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nytdb2jTBTDlZWB9THAVoMMoHv0wERJG7iM7Ci7CqjE=;
        b=dSzsfEYj1SfNCOmrM6V670w3nXs/PrkTXprlhC3slg2otMGi+26DZF655DBM20TAfJ
         aOxnGqQ2rS20DQ5khKAxGepA15SkdGDKZ2iQRgEHZe7hJWFZ52x3oHcs/GOXEs7+Ylau
         W/vXJJgYI9Dpu/fp6xltWbacQWw2/vAIDPuXmvMQRC9Y/Olebezl/3i7C0AqXDFACTl+
         tykx3ElE8SecUfol5uWz3ae5HXZDF2FTiTnKPo8y7MiAp4m+6LB4YICATww2GYO+MnNo
         QFRdgnGTqfwm6EPYtDusvhCPimaa+SBI7rAvqWUxjaLMip6kXvMu+/h+1XXR9kj4076+
         +/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546919; x=1695151719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nytdb2jTBTDlZWB9THAVoMMoHv0wERJG7iM7Ci7CqjE=;
        b=U9bLkyqfIPH2h7mXJ3upurzWm1FqYuBD1mbduQ6W+VtCd9l9FV0uPiL7YaVej6jgMM
         zUzxYvPTSl3ugIi00+1FpNyvdPs31aPQv9FphpXuhTvYW9qZMvnL17SGYtK0Me+tj+4H
         R7+zFhWWsiDnB23XW6bAMRab0KgNM1N5pZngc363b3O2hnCWhgSYP0LImdn4o4VyZLjI
         abtSDkpKM19HpGGeQGPoLKh2z+RDPaGK9tu3Wju4dJiET3hS30A5cePic5R5Ddpt+uGa
         jLrK5QNz4H+VhUw93m9I4d8ROlVIJFncCBwoDf/pk/ORAUMDC6jOAN8rbcAGNPfu/WG4
         obgQ==
X-Gm-Message-State: AOJu0YyqoTJiuz2twlWA3uHToFiEEYfzcGTY2VXltEbYTxfWZsyGUr5V
	jsnOXv8ahUVJvd7DqLWBDkdrqLrMBPVycA==
X-Google-Smtp-Source: AGHT+IG/9MgxMeR+xBSEaeYilcAWAwpkZxKutcOmZRDSFl5HllvKV5D9rKmel+FD5ViAG9qaTeNCTg==
X-Received: by 2002:adf:f0c2:0:b0:31f:af30:1bd4 with SMTP id x2-20020adff0c2000000b0031faf301bd4mr339777wro.1.1694546919469;
        Tue, 12 Sep 2023 12:28:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b00317f3fd21b7sm13642874wro.80.2023.09.12.12.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:39 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] staging: rtl8192e: Replace rtl92e_disable_irq with
 rtl92e_irq_disable
Message-ID: <07c7312d1571e23ee382d47095931d68ba194551.1694546300.git.philipp.g.hortmann@gmail.com>
References: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694546300.git.philipp.g.hortmann@gmail.com>

Replace rtl92e_disable_irq with rtl92e_irq_disable to increase
readability. priv->irq_enabled = 0 was set in both functions.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 9 ---------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8adf53174239..e0500946dea5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1879,7 +1879,7 @@ void rtl92e_enable_irq(struct net_device *dev)
 	rtl92e_writel(dev, INTA_MASK, priv->irq_mask[0]);
 }
 
-void rtl92e_disable_irq(struct net_device *dev)
+void rtl92e_irq_disable(struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index 11366fda4ec3..3c06e1da4408 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -17,7 +17,6 @@ void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta);
 void rtl92e_enable_rx(struct net_device *dev);
 void rtl92e_enable_tx(struct net_device *dev);
 void rtl92e_enable_irq(struct net_device *dev);
-void rtl92e_disable_irq(struct net_device *dev);
 void rtl92e_init_variables(struct net_device  *dev);
 void rtl92e_start_beacon(struct net_device *dev);
 void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 50eb8f3494ec..055cd513d76a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -236,15 +236,6 @@ void rtl92e_irq_enable(struct net_device *dev)
 	rtl92e_enable_irq(dev);
 }
 
-void rtl92e_irq_disable(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	rtl92e_disable_irq(dev);
-
-	priv->irq_enabled = 0;
-}
-
 static void _rtl92e_set_chan(struct net_device *dev, short ch)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-- 
2.42.0

