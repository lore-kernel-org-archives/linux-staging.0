Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150838FA0
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Btvw8mkh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9cc6c92d1e9so36040266b.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698344303; x=1698949103; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vTA02l0ubFVwBtbEfhw+KExb6bkxv2C0e8twmLrMufI=;
        b=Btvw8mkhSWZ1xu4S3p8aoiOrAu7bVEgVcftozAlcrg/pstZbFYDq14Rdmju8+VOaHg
         CvaJh/jkVEAibjZNNzybhWO4xcvubWJEShI3ZQ3B6ZWs5F2703VPuObOHzXWJ4c+h8Sp
         RDaqYrwU/68UOXlOqv19ERhZEu+6U2gvjKxEcIww79HkUHVZMVfKRGcUvMwg8cK8M1Va
         650ENtuZ2jW9IDvHr0N69eKLj77nbDP/ygIAbp7Sy949+3YRB8miB4ev3KUVl+2oTO4P
         AjLyN3aHudxINIsEzMADAp6UZLtWSfURsaznZFgTWA47rOjkfOYSvpB2IEwkPYZ12HO4
         FNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698344303; x=1698949103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTA02l0ubFVwBtbEfhw+KExb6bkxv2C0e8twmLrMufI=;
        b=uk6r5B908AkULfyhHBpuzbgA3TvYrBaIdy0mT4Wwzt2TeBg+iVoMgf7fjoxd0/hX8Q
         t+Ez6GPYsJeaNh1Qsut/2jdLbu+n+r5HeJWQR74FUDsdgEWMn6SUnEoV6GBpUSZt/Cob
         /oa4RpWOw5E2UFqCZDgMixqMubsEdA+XEg4nxhXhZU8qrv3fBWhLGxmFoQXNF1CHaumE
         cjzbUBmJXheDmngekpsgVhyNQIxtNZtPYEl5qsb8Iw7zPzCsZJXrvBcRJa27KerZSu17
         tVCfHbuK0P+VhzMznfTau8x/FYD2jt4GpdP1DjL6i7gYVp4VOTk0vfzfnjt92ZKhBqWy
         ObqQ==
X-Gm-Message-State: AOJu0Yy6WuunCOhz2lFQBkNTT9PhJOQPj8HHmpcga1UbhgGPykuJRPgu
	aZC/vFsQQ1/20dfik5Ii1Y8=
X-Google-Smtp-Source: AGHT+IGb0c8y+EU7pwRJSbuKmhoEYLvnT63W8kJwHC0nVjFBNZz0yidGLURr40R2g12EmezF/bBVmw==
X-Received: by 2002:a17:907:2d27:b0:9c7:5db4:8080 with SMTP id gs39-20020a1709072d2700b009c75db48080mr348999ejc.7.1698344302945;
        Thu, 26 Oct 2023 11:18:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709060e8600b0098e78ff1a87sm11985037ejf.120.2023.10.26.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 11:18:22 -0700 (PDT)
Date: Thu, 26 Oct 2023 20:18:21 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: rtl8192e: Fix line break issue at
 priv->rx_buf[priv->rx_idx]
Message-ID: <20231026181821.GA21819@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix line break at priv->rx_buf[priv->rx_idx] to increase readability.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index d2a8a9543579..995daab906c9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1610,8 +1610,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		skb = new_skb;
 		skb->dev = dev;
 
-		priv->rx_buf[priv->rx_idx] =
-								 skb;
+		priv->rx_buf[priv->rx_idx] = skb;
 		*((dma_addr_t *)skb->cb) = dma_map_single(&priv->pdev->dev,
 							  skb_tail_pointer(skb),
 							  priv->rxbuffersize, DMA_FROM_DEVICE);
-- 
2.42.0

