Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B1748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:20:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3175e1bb38cso523472f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283613; x=1694888413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=410ZIi1RG8c1PqmFLipRBPm6x8PsGeT8nQJ7mls83l4=;
        b=LDhMmmW2XGmFl03uv2RXVo/kZ9s0S2YN3QoBcIbcywTQ9MTM/0n39L8Dt85YCiThkJ
         VBu03OWeLo2M8EucNxd+nCQYWGUReW0m3efS+fgoE3nBRwViwncY8OW6gA4ZGz8SAMLo
         UaEX6LxVTmAySlWw8nQhK8K1IrUFsD60E13fCqEAs6a9p5ltBW7WCuXc3d+ToIuA7zX5
         AA0KAk5IM7xtjn5q/c+gXcAto4EoI/6aoDaL6SYkuvk211+0unDUuLbh1004cLkmncbK
         xbNEYzpZUHj0E2T9kVbEnMdphLG6hAijGHgTN+uBYKVZ3FpqXygq1zA07XmiRjOrqTWB
         QacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283613; x=1694888413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=410ZIi1RG8c1PqmFLipRBPm6x8PsGeT8nQJ7mls83l4=;
        b=U2sAGf/NlKPN0/CMPM84CQhx665IYiZO0klrcdu0G4qmTeRWQWhzuJ1t9s0I+qhwJJ
         0PoANYcmp9cjBsYAYfHu2QeLteYHS7EDIh3NQmg8ghFOgB+nEgSkVTok3ahGCfKLqe4U
         jFBc9zz2sdPgI1WaZG8MFcRNr7/vFp0GQabqMEUIhImQqC8YaughPsAPRgJsoFh0eqMI
         WgN3bBAuS37F5JicayuFQWumiZGevW0yFQJ+nPSKbIhFMbtPQMCGpCvQf8GQ1OLj9DEZ
         IfWECjvy2SyRKtyeK3yt64QxVg0jozTMG9TBOdPbfuW+0t+tY8sklo2UvyGnY0KFyyBI
         rErA==
X-Gm-Message-State: AOJu0YwRIL8MBAXjze80yWC/hOCm2dKI6LyR/YTabnZiFM8JcZmKjIWG
	aMZ2dcUdCX+KnvnIdI5HKkkwZpUc24IRmA==
X-Google-Smtp-Source: AGHT+IFzDPo7N3GDVdGPJ8yY0Fz5QEfsV6SB/fGm0P3oFoCvLYNmLKWL7xHPcBMhe7Z6mMMiQpyo7w==
X-Received: by 2002:a05:600c:1c91:b0:401:d8a4:17b0 with SMTP id k17-20020a05600c1c9100b00401d8a417b0mr4950184wms.2.1694283613441;
        Sat, 09 Sep 2023 11:20:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c294400b003fbdbd0a7desm8388032wmd.27.2023.09.09.11.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:20:13 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:20:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8192e: Replace rtl92e_disable_irq with
 rtl92e_irq_disable
Message-ID: <257624d1aba49a922a8d061e80089b3b9d7d022e.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

Replace rtl92e_disable_irq with rtl92e_irq_disable to increase
readability. priv->irq_enabled = 0 was set in both functions.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
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
2.41.0

