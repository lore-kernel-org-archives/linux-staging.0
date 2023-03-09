Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21B6AD9
	for <linux-staging@lists.linux.dev>; Thu,  9 Mar 2023 11:05:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cy23so5256847edb.12
        for <linux-staging@lists.linux.dev>; Thu, 09 Mar 2023 03:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678359902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ujwdXwajbqzIp8w+URIoJrndYaLSTJTCghQ93Kw5KM=;
        b=OeS3rVlCZELUIzDgjHn6Iq007IzPrphWqsSMa9/2m7Cr+DfQWsdJIi5UtRdaplic6j
         spUwNs6zKt7od29+ibeC2IS9GiTrFz9jelKcusYjesYXWAfRJcDMbBv+bkmb/cq6u89w
         H7om1t5IhYZxLmiP6+iiQjY4dsUzH9RxS12gMKaQlEI/3ngcGk6Mj82WxqOhvTSKYI05
         K24IFuSTWIh3+ayOk6QZAZJ7wBHMgD8A4jFhk95mGx0H3Xx1ehnHkmPOjDROVZuVo4je
         d7Yny9m65Apve1lR4Gy3MX25nyAc0BaTUXNcYB2BFmrrgx0UjZeWCd2REVPGMKb4smb0
         6trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678359902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ujwdXwajbqzIp8w+URIoJrndYaLSTJTCghQ93Kw5KM=;
        b=vcaG9SBVVC/ZcO5qqL48PsC0EMMdkIAozQmucgMhn1zneYc551OS2KnQ7mvcKVanP3
         6ZcdT5kFI2cWrc3dDStzMrYbCHFJjAqxGkOQPCm0ryJzsvHNq0qanKaGwZs/Q6b2cqKu
         YhsfXC7AOgnA5GgxAp4IYrD3OKrBLHv2ITw1q5k5B1CubgBT6wV6VBtjrCikSYADlPvS
         oxbx0XaW1B19O42GopYpxNNPYAEhKnYgfRuauMiWP/zKPyDLBjPHnPO17rucUdHWSRkO
         MHXzm+s7mCz41QJRM/XkMJRE2X0dgl5UjNDJGrIcQOwnYBv8NqJh8vXRCDb+fK13637P
         lojA==
X-Gm-Message-State: AO0yUKXr7Y3N+KMk94QeYZFUhVgfPg0UqFVAck+O6xK8zWPSjNaND1Bu
	/Oht+q74PkXHZz7XO/tWYcs=
X-Google-Smtp-Source: AK7set8NV0T0MiRe6KZaSeG/N2snlRGUptr0JuTmSA/LOx0/KoXVPqhHqVCawSM+7Lxr7V0s01PUmw==
X-Received: by 2002:a17:906:2da2:b0:8ae:f1cd:9551 with SMTP id g2-20020a1709062da200b008aef1cd9551mr21512315eji.76.1678359902163;
        Thu, 09 Mar 2023 03:05:02 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id lo2-20020a170906fa0200b008e09deb6610sm8650935ejb.200.2023.03.09.03.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:05:02 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: rtl92e_clear_irq() is not used
Date: Thu,  9 Mar 2023 12:04:39 +0100
Message-Id: <20230309110439.24504-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtl92e_clear_irq() is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 9 ---------
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8edfaaeda910..db26e431f8b7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1969,15 +1969,6 @@ void rtl92e_disable_irq(struct net_device *dev)
 	priv->irq_enabled = 0;
 }
 
-void rtl92e_clear_irq(struct net_device *dev)
-{
-	u32 tmp;
-
-	tmp = rtl92e_readl(dev, ISR);
-	rtl92e_writel(dev, ISR, tmp);
-}
-
-
 void rtl92e_enable_rx(struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index 1713381dc2b4..fa3b71dbb091 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -18,7 +18,6 @@ void rtl92e_enable_rx(struct net_device *dev);
 void rtl92e_enable_tx(struct net_device *dev);
 void rtl92e_enable_irq(struct net_device *dev);
 void rtl92e_disable_irq(struct net_device *dev);
-void rtl92e_clear_irq(struct net_device *dev);
 void rtl92e_init_variables(struct net_device  *dev);
 void rtl92e_start_beacon(struct net_device *dev);
 void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val);
-- 
2.39.2

