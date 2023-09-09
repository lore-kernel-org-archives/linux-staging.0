Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E138D748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:20:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so8897455e9.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283619; x=1694888419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InFO5e10TT39/SdX7ezViSAF4gHuUpUJjSKidTX3SGs=;
        b=Pmc8hkOXvimqFYrsSjKrc1lMRGtbyDj0D8+2gEopUntxtwxFiECfpRbA1lahgZD13j
         7U/wAmdsiTBLhhpgdcxrqXOG1Cn7Xg9mwengyekxvXZiHE3hODHtuT2zG/FGW5KrCAiC
         aUEJrwMGCxJt7/7XfFAYpOsk82+yeyFzn4lXok11racqXBJANUgYEe2LNAsfkRFhArnk
         vawp8tUmG4Ho6qmLsF4O28x+hxSk9FIAkE8AFrQHR9hvO7qS3NfDo8/XOTZ0VSpfvwwB
         BycCA+69gE37PUnDXigHPT2ADmTvv96bIr2oS9xVJZKafaToJfM2xMYAPg4rRs5BpAGC
         reWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283619; x=1694888419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InFO5e10TT39/SdX7ezViSAF4gHuUpUJjSKidTX3SGs=;
        b=FWasArmWSU1EJTZK5hY91PwfAri8aQ47GS0n02SPOj73AVbb1eA+Wpezw9emFb+45E
         N3DK/AooJTqG/3Ialf9ktvwfFrM/VQ560cecmLx7KWxhPEvfOccYOU80U4drJkLBC5ET
         eXjsnr+8ZCENtUSMYCKvHz5DDBJDLyhe2ZqTJgINZi4S48GTOnxkK6TBSYvae7+08C9L
         bI1RNmTsofjUPUh/cGuvUp7tjdIDS74dO3DL9hDBlGnVarHXKewrdijGEIqFFvMUizZ3
         WvjS9n2g/JUA4H9FneRUDGn2SG6nr/+j2FhE/cJQd0gbIeSvSs3+v/EBcc9bVglL1N9a
         qo9A==
X-Gm-Message-State: AOJu0Yxmfnt5o523rA3HqkvkF84VCAjyUqpIzYAPK7TyxVHEzFEp1pUp
	ZwW5YksOEfSS7I8Bn8WFkWA=
X-Google-Smtp-Source: AGHT+IFmHBu6ljIRTmRyYy1SpBZ1gCSVnv+p1A8zib68h/rTIWoSPqEsLOkbDRwo2oE1W8EpBvX7qw==
X-Received: by 2002:a05:600c:1d0a:b0:401:c6a2:3cd5 with SMTP id l10-20020a05600c1d0a00b00401c6a23cd5mr4916851wms.2.1694283619199;
        Sat, 09 Sep 2023 11:20:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l23-20020a1c7917000000b003fe17901fcdsm8447910wme.32.2023.09.09.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:20:18 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:20:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8192e: Replace rtl92e_enable_irq with
 rtl92e_irq_enable
Message-ID: <a2409c0e7dba22035c8bc43b819b837589f50886.1694282907.git.philipp.g.hortmann@gmail.com>
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

Replace rtl92e_enable_irq with rtl92e_irq_enable to increase readability.
priv->irq_enabled = 1 was set in both functions.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
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
2.41.0

