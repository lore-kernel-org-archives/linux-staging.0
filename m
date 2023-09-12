Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4FA95A
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401e6ce2d9fso17515065e9.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546927; x=1695151727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5uIdBMaIxfi6eKcNWe6YvWQH/LhS5SQKFcSkjVp8eYk=;
        b=RX169K7EZE2WlSSQinaZz1J+2+t7J/2gQbjuaZ6YMjIOs60eMeEA82xYdjbTkk2uFr
         pdCZWgpMGj2Tw51nFOges/WnsnQm+WTK9cBbJrWpgn+BQMSsd/n3bcOeGk8A0J9X73UJ
         /qbxgd6l3RVjhehTEaCnOnaNbQ3v3ttog1yQR+38vSoE8DBfkqS0jHXR4JgGvsyVWGkG
         i4lX/FlRUNxhU17H5vlfL+JZMGqxx9BwYF7Egmv7b48p6RjSmoKeAEs8McdIJIM1j8W6
         ujk3O6atSKczPOy/03uh24TSfYYjj9l5/53h9tqlsnjZyhZCljncFzwN6jxeOLZWFp/W
         J81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546927; x=1695151727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uIdBMaIxfi6eKcNWe6YvWQH/LhS5SQKFcSkjVp8eYk=;
        b=qOPhCjn7dDg3rW8M+nYYAc0LNRy99tdkX5EefH66NhYbf+ncJd2pSUSJVoQhsERQK7
         AXcMES5lmHpsOkSi8BlQzXZjuc91cpAXWd7hapJIgmtvwAGLEtGpyXqf2HFCZrlHwySA
         XfU8PFg0LiS5uVotMPrNMZHU0uWA3KrhbDGCyJI58FuqkCNsltuqhQdbniHeeOZmdhYi
         U/sPkv2W9C1rJSpIuN4PPiJ5tJdixrXFiLTyfYSZ2ebdzZH7GTZMP65uowmh1ctuuZVH
         kup3GW0UOySXfu0gKHLByXDCutUEz2lpg4a0en2trPF/jIls7lRphnvs5g0Yo4bdfATc
         WYlQ==
X-Gm-Message-State: AOJu0Yy7QVoVKWOEk020SEVHFpJshFD/s4mRQEhZnPDvatLrmiEnr66L
	HgZkJdIL68qEXs+wdf5tVTE5DQVyzQzzGw==
X-Google-Smtp-Source: AGHT+IFXKi/JHNwHdhcfx1bIIfc9BSEeVB5/r5C+fHpv5d9QsAUx6XVuoEyFuwYKXeLP5JmKd0I0uQ==
X-Received: by 2002:a05:600c:34ce:b0:401:bb6e:453a with SMTP id d14-20020a05600c34ce00b00401bb6e453amr352307wmq.0.1694546927516;
        Tue, 12 Sep 2023 12:28:47 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003fee567235bsm16953674wmr.1.2023.09.12.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:47 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:45 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] staging: rtl8192e: Replace rtl92e_enable_irq with
 rtl92e_irq_enable
Message-ID: <6e8167402d279299e3ccf3468021abb0699d0e8e.1694546300.git.philipp.g.hortmann@gmail.com>
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

Replace rtl92e_enable_irq with rtl92e_irq_enable to increase readability.
priv->irq_enabled = 1 was set in both functions.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 9 ---------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e0500946dea5..70e1eff9c600 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1870,7 +1870,7 @@ rtl92e_init_variables(struct net_device  *dev)
 	priv->bfirst_after_down = false;
 }
 
-void rtl92e_enable_irq(struct net_device *dev)
+void rtl92e_irq_enable(struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index 3c06e1da4408..14a091ae1b7d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -16,7 +16,6 @@ bool rtl92e_is_rx_stuck(struct net_device *dev);
 void rtl92e_ack_irq(struct net_device *dev, u32 *p_inta);
 void rtl92e_enable_rx(struct net_device *dev);
 void rtl92e_enable_tx(struct net_device *dev);
-void rtl92e_enable_irq(struct net_device *dev);
 void rtl92e_init_variables(struct net_device  *dev);
 void rtl92e_start_beacon(struct net_device *dev);
 void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 055cd513d76a..63bf8be3fda5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -227,15 +227,6 @@ static void _rtl92e_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	netdev_info(dev, "TXTIMEOUT");
 }
 
-void rtl92e_irq_enable(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	priv->irq_enabled = 1;
-
-	rtl92e_enable_irq(dev);
-}
-
 static void _rtl92e_set_chan(struct net_device *dev, short ch)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-- 
2.42.0

