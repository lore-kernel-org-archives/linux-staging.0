Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306512F42
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 13:09:30 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id l14so14444509eja.7
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tReQnZIM/2GXsnwHvYX7dmOzuxjlvlNGIgAsvxQ1yRc=;
        b=i64quYvlQ46IAbHchD9nAqJI/KHzq9w0j8q6dfs7eCEhjUk3Oif4adCO7pMd5bdSIM
         IOu2dEyIA3Sku7i0R8zrnGgvVpEP1w7TlRcZ7Pi15Bb/Tms7sOGXhzKYmFyAeCpp5bQI
         ccqqOeqb+PKRf26AJprMiVpbz1LB2lCUUI3YTcYSN5LL3I3A1mQdjFCr2F70zNFDftaM
         dUZ4D/AUA4JUM2BN3CEemAxPdSkdUIwhb1AUzZY10VwrG5yPY66BD+e5dQ5/iaAQBKus
         rbp5a9YmEkBQ594K4t/9XM0E7dyaIxgwjyymYaVdcKCDk+Ur67cG+QlPJHYsgtlNF5C3
         bS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tReQnZIM/2GXsnwHvYX7dmOzuxjlvlNGIgAsvxQ1yRc=;
        b=PVgXB0zKnVltvDF1ANPx05EkqZW9CqdGdO3wsHkv7I6i6u8AFLpvpOH6/NqxZIgwsU
         xUfjWftbosFBc7OJE5QeAPoiHZJdNya1MpVCSm1Y/0/Juzw/yRMp5AXau1PAXvXIboif
         +GQmVbgn5rQmObS24FyoTLz+y29hobejoXuUqJepAszUCMjHDXEV9gmOODAVUT4gjnlV
         Dkp0m2cIGDTHsKwvlXrOO/sFXJWp3H3Q5iIiZ6iDq6iKnr/rWdRz9mLDd5rDJUs9uOAR
         7f4uCpYwdSEARcgDrcJtActLq0yVQXb/I+eyjexnXfi6P9+ZOg7UPCTI85d4YLBgr7v9
         S4ng==
X-Gm-Message-State: ACgBeo02xmD4muJtJJ5gohwDNOam3neNab9TGJUY+4lcAN55I6V8Mhvj
	heSFJ5pkmZjgVuO4A8tZhe0IGXIfn6Q=
X-Google-Smtp-Source: AA6agR6VijqSfYBtjgJ/lXIIch+djV1FGMJrTaOymkJRGHnbP/TSIHqgHGRXbkuLmcToUBeMcizB/g==
X-Received: by 2002:a17:907:2ced:b0:773:6f77:f10f with SMTP id hz13-20020a1709072ced00b007736f77f10fmr2860143ejc.34.1662642568533;
        Thu, 08 Sep 2022 06:09:28 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id cf6-20020a0564020b8600b0044edf0a2deasm4847978edb.69.2022.09.08.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:09:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove unnecessary return labels.
Date: Thu,  8 Sep 2022 15:09:15 +0200
Message-Id: <20220908130915.8406-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908130915.8406-1-straube.linux@gmail.com>
References: <20220908130915.8406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the RETURN labels in rtw_alloc_etherdev_with_old_priv() and
rtw_alloc_etherdev() and return directly to clean up the code and
improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 3504a0a9ba87..875a41650896 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -54,14 +54,13 @@ struct net_device *rtw_alloc_etherdev_with_old_priv(int sizeof_priv,
 
 	pnetdev = alloc_etherdev_mq(sizeof(struct rtw_netdev_priv_indicator), 4);
 	if (!pnetdev)
-		goto RETURN;
+		return NULL;
 
 	pnetdev->dev.type = &wlan_type;
 	pnpi = netdev_priv(pnetdev);
 	pnpi->priv = old_priv;
 	pnpi->sizeof_priv = sizeof_priv;
 
-RETURN:
 	return pnetdev;
 }
 
@@ -72,19 +71,18 @@ struct net_device *rtw_alloc_etherdev(int sizeof_priv)
 
 	pnetdev = alloc_etherdev_mq(sizeof(struct rtw_netdev_priv_indicator), 4);
 	if (!pnetdev)
-		goto RETURN;
+		return NULL;
 
 	pnpi = netdev_priv(pnetdev);
 
 	pnpi->priv = vzalloc(sizeof_priv);
 	if (!pnpi->priv) {
 		free_netdev(pnetdev);
-		pnetdev = NULL;
-		goto RETURN;
+		return NULL;
 	}
 
 	pnpi->sizeof_priv = sizeof_priv;
-RETURN:
+
 	return pnetdev;
 }
 
-- 
2.37.2

