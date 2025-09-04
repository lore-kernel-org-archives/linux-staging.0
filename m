Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188B721ABDC
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952116; cv=none; b=JtFSzRZ2tygpckUTiV4nm/hhXYb/RzUkMo61nJgfwtaO/pl6dvY/SXkO9YsqVgYatJPl17i1RfJGL1Jhj00AG6rac5JBQGAIvNZZShRp1xpZBcN/04MkYr8sod3SOo0IC60oVjpcy06zGaiA0B3aZeBpM2JB8YKoqn7OxHHLAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952116; c=relaxed/simple;
	bh=ZIDFMuE4M5pN3hNXaXhKSfNWI42Rb3epwAfW5TFj8CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EvcuX1tCW8X0BDdpXQ8TtSySZi6DqAP0a0dYY4m8RFZXlmP1JJc9ElFH+mf+bozjkEuO7LxIxcIu8GE0HvyPHmddO/BhqUpY/GwAsrusQXuoe2+EdlV8m0No/bPWH/pXH/9F61ikbyaHWjv8Hq5r0rtayP2+cze2RnMzWEhr2eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPrUVKm/; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPrUVKm/"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7282a09a72aso4251636d6.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952113; x=1757556913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=mPrUVKm/xY24SBi4hY/R89ZV3xYUt2KdyUGLCsD8a8xNcBBJdYhLB3g6t2J4TFung/
         D5jTfFgwaFhCrmeDIizMbegDUr5i3KXsXZU8DwCq9QH+s4qMjxYdhLj2NO2TiZnrjr/x
         wBMJUW44CrPSS1r8lHNCypS5vwyCOawjyG95QfjwsKjTTfcdxukhZxA4i08cAfHEoD1D
         eOmmjnRLAHUHPjCPXDp/j/BtnqkLYrUsQICK8tYodypdfDyafsicxhVQQjW0z8Ge+0Lg
         cky+vSkeZRiA5TDoRJFz9Gfvf1RDGcz8hDMbC8U28onMHFu28sZdu/grQ73FHmE6JEsJ
         WeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952113; x=1757556913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=amK9VrwrWMlyeX805nGf4s+Wt3OHNJAfL93x24JMt1whVtUj+IZwZBeJZvsERr8yj7
         p9tZgqlsFWh3UvU0NFgwdBlzcDd7D3C/q1OFrQZDYQzFA0Ka5ByPMXBE92rsKDAlEMic
         NxIqbdIJvRcEJOi60T3I43nKVOy1h70xKiJ1yQDpNI/z6yVasQje6E5lFdAWq6yJmMX3
         SZ+0HMSuXzp+32ZOMP1VAaaf5D1gnE8aJHNlUT9Q6qcDBXh0KcphKYr1oUioRZJ//E7U
         Ix75QuZ5vfSpZmO0bjH/VhK/AfwhvPDGHIPsGLe+7Zj2QhwcgERkqktYzqe/Hw9+N6jW
         n+cg==
X-Gm-Message-State: AOJu0YwuclrJcNqGtI6OkNzP8abqF+84fEOOUy6zC64MT3Rwh/cW+6Ow
	KJ8Ur88QpJ3JtF+p5sgg8wRLIll857FLpCFCmYbFEBaCYQhmP+FxHgsa
X-Gm-Gg: ASbGncsO++yIe3ERAT+KT3Zyn9Z1CweihIJfkgJLWbnWD0zA5p4SAUJB2UpOfthTJss
	DM7bq9TzkZjVnO+Zi1XIZBlQ1DTJsuKlPHa4mz69Nh1Z2k6n3CoWsAQ0Rx/OKfbxlJRYIig6zKS
	qH+TLFy3JD/lnpe7H52Iea7Fn7ZJXgMcpTxHcPdZaABRZjTfkwTZUnSHqQQB7xOHqUzbqOyzlGP
	EW4sWmlmU7ytCMMt6KO2HcrdOuFhLpjZ/VIqdn8seNFXm5qL4AQVqk91FTwUp9nNNUoDYCuyNTd
	k81WgffqDFjHSFsRKYNFydpONZe7MJ0jEX9V8pdgZ6zE9F3mx2GN4IEweMiIE7HRSlaBt93G1ku
	DnwXDjCPlpcvhxN77ZFb30zYQbY4cXS9temmwISLG0AABwgF86sg=
X-Google-Smtp-Source: AGHT+IH1OzsHKnsRTKNcbM75tFjAQ6CqdQzyruBeX2Ebd/9VaKjatOzLZIdX1H7CZm9Qbdqt1kmUFA==
X-Received: by 2002:a05:6214:dc2:b0:722:30ad:9382 with SMTP id 6a1803df08f44-72230adb888mr71558806d6.5.1756952112802;
        Wed, 03 Sep 2025 19:15:12 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:12 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 08/16] staging: rtl8723bs: remove space before semicolon
Date: Thu,  4 Sep 2025 02:14:40 +0000
Message-Id: <20250904021448.216461-9-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space before semicolon

Drop the extra space before a semicolon to comply with kernel
coding style. This change affects a single line.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ab626c88e7dd..d05ff073af2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2236,7 +2236,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
 	/*  adhoc no 802.1x */
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ;
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
-- 
2.39.5

