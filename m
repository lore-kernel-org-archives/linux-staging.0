Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92C1FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:52:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-522a9e0e6e9so309207a12.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617157; x=1691221957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktco/0n5t/HDVDJQ8DdZKkOO0x7lbAhQv9MKtg9SERo=;
        b=QLo4auealrQ/TNfcwOTZ5nzxBOH1Aw3ZFwSBEyD+UD4WR9dFt3jFwhvzzqZEw+vrqD
         dUSAdUoFqLQEwRXRY3p0TiZNcX0zaVyfupBE0N6D3ktDUNFe6FmhFJ2/kF3Nftgtohib
         j5vMrvhVlqz40FsruiNBFJNIqQxDR3+8o5/cE4DwTh6Tu2Pq0fsWeVcI0JmVcfg+uQp9
         ZNGiboohVpHtEkuhC/DlkAhzmT0rxaAKCOAGLY0Nsl/tfi3/1wbfcBAOjzXqAdFrDAr/
         eKXBZS8iUJM7rwTR8y3EHYz/vqGquyuxpnbaWF7+bNUsbLnSxcHkoh44HszCI3QfuPTT
         MpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617157; x=1691221957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktco/0n5t/HDVDJQ8DdZKkOO0x7lbAhQv9MKtg9SERo=;
        b=XycajtQ4Pk8wb/ssEfRjI8DEoNG8djqHi0c8WDHx84JZIHhwGmqoU73Pd2Lkw+4Qo5
         niyrF3wsSYBWKL0mbTvTAfPqKF6PjCCYQisuwyP9uh5L1aZyMXkR5fu7oFTdy/W8VuZ/
         qfQPTmuFTyM08Z2VkFZtLQ99YcWeeFee0oJMgOMw3sEMeM/vHsJ6jF7c+qaEhAp47oFk
         4u7XldbHDwaaGrLquMHWRrGDPg11MDcXnofhKRXGU1vZS3SXtpkTOsY5bQQhjt5hbOfy
         k9HdZY19XHCy5naovhiAZlFe27e0xTEcwJpNn8zh2S6xen5DCYn9+my/73Td2CcOzmLY
         g+tA==
X-Gm-Message-State: ABy/qLaV5HHRah63yCgDlVNfM4zyXW5ReV7QazauYGp6RvWUiduFzHCi
	RBosmBcWAgf+75wm5Zyotym/gzxkIFA=
X-Google-Smtp-Source: APBJJlGZILCzcfl6g9OzlFTMCyGvQlM75U3RGWYE5aOC0anDRMckkWuY44EQvBI6MuX9F/iO52cr3w==
X-Received: by 2002:a17:906:112:b0:99b:c845:7917 with SMTP id 18-20020a170906011200b0099bc8457917mr1448447eje.4.1690617156836;
        Sat, 29 Jul 2023 00:52:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906250a00b0099304c10fd3sm2981025ejb.196.2023.07.29.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:52:36 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:52:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove unused variable p_intb
Message-ID: <196f555d3762bf4fa8302f19b46f1510ea68cb31.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Remove unused variable p_intb of rtl92e_ack_irq.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 5ac6af7e3a79..5bfd84b08dd9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1912,7 +1912,7 @@ void rtl92e_enable_tx(struct net_device *dev)
 		rtl92e_writel(dev, TX_DESC_BASE[i], priv->tx_ring[i].dma);
 }
 
-void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta, u32 *p_intb)
+void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta)
 {
 	*p_inta = rtl92e_readl(dev, ISR);
 	rtl92e_writel(dev, ISR, *p_inta);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index fa3b71dbb091..11366fda4ec3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -13,7 +13,7 @@ bool rtl92e_is_halfn_supported_by_ap(struct net_device *dev);
 bool rtl92e_get_nmode_support_by_sec(struct net_device *dev);
 bool rtl92e_is_tx_stuck(struct net_device *dev);
 bool rtl92e_is_rx_stuck(struct net_device *dev);
-void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta, u32 *p_intb);
+void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta);
 void rtl92e_enable_rx(struct net_device *dev);
 void rtl92e_enable_tx(struct net_device *dev);
 void rtl92e_enable_irq(struct net_device *dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index aaff8d739efe..cfad170008c6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1982,7 +1982,7 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
 
-	rtl92e_ack_irq(dev, &inta, &intb);
+	rtl92e_ack_irq(dev, &inta);
 
 	if (!inta) {
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
-- 
2.41.0

