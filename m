Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F84184C
	for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 13:07:03 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666ed230c81so1537419b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687093623; x=1689685623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooiaPbgSDk2Vavd/yz78VigQmMncQVwP5N8EDeWNlmo=;
        b=j+it1mrQUvR/fZDFPPpYHa5RUyGfo/KR3ts/RFYP6cRh8d32bZFpPVhN409/WDBC9X
         6+7y6VwhwA1/XDSjGOy6p/VPFjpqG3+hhvk7JTfeOpzkBAKASts7Dla9lbrKFn3apDC2
         DtV5jg5oZnTrtG9k/NCZ4+c3tM6z1aWzFh4/6JbZEDX9az+neu7UTbQrmU5boSSSq2Ec
         41nuPaRAe537iaI+HSgVLBNbWp4BDJpbJCyr6EbTP9zjV0aCZfLDrAaj+nsuyNBOnf+P
         WX4w0d/J0lZcmgy+acQq5cq7ICtuMv0E9KxCk4Rez3AjBHZkwqv0tfp42afWRR7khSKm
         K8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687093623; x=1689685623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooiaPbgSDk2Vavd/yz78VigQmMncQVwP5N8EDeWNlmo=;
        b=e812j1A8g+RsOT58jRLNzQe0Ay750cg3/Eudn6ldjz5Q5jlMQBzb07uyIx8NCbd2aB
         o2d2YKJI+C1ufcj+vnPvDWlHnhIUVy4bATEXMNgkkj01tOTSmRQ/QQYXhHkFZYtpJD0d
         r60HrHk3BC+Ng9xbZYdsUIYXrKUvdIAQZXfjpzexi0sgoCvOwd8MpjGqBosUCbDPKgtN
         Lti30DZh7WmKRsU7TKaEQbaEMO3m1l+fRvqPHxVcVA4Y211/3NR/9l3HqjqsJsubvwKL
         nax/JjYxJBkzZ1dj2J4CKSQGgzvtYRy8+z1tk6OIOeI4y66vXIuRWKuhLM39teHEZ6fh
         2Mjg==
X-Gm-Message-State: AC+VfDy/S2gYAqV0Yjovi/G84KHrosaySj3vzXRf92qtYzErvRDX0lCl
	ka/hQzYz3Z2ccq7XfBxImA0=
X-Google-Smtp-Source: ACHHUZ79lFMtx+Pb0R/irseT7cjmzdFjy784QY0jo3sRAMHQO/wo6KPP3MDUrfzs48j3sNOBNNPMzQ==
X-Received: by 2002:a05:6a00:1691:b0:665:c10f:709c with SMTP id k17-20020a056a00169100b00665c10f709cmr11340188pfc.21.1687093623535;
        Sun, 18 Jun 2023 06:07:03 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78049000000b0065e154bac6dsm16159760pfm.133.2023.06.18.06.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 06:07:03 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:36:58 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v3 4/4] staging: rtl8192e: Rename variable InitialGainHandler
Message-ID: <59e1d108e07a159e766d33df1556ffbeab1f7693.1687092111.git.yogi.kernel@gmail.com>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687092111.git.yogi.kernel@gmail.com>

Rename variable InitialGainHandler to init_gain_handler to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 7b0da55fa7aa..267fc6f8800e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1109,11 +1109,11 @@ void rtl92e_scan_op_backup(struct net_device *dev, u8 Operation)
 	if (priv->up) {
 		switch (Operation) {
 		case SCAN_OPT_BACKUP:
-			priv->rtllib->InitialGainHandler(dev, IG_Backup);
+			priv->rtllib->init_gain_handler(dev, IG_Backup);
 			break;
 
 		case SCAN_OPT_RESTORE:
-			priv->rtllib->InitialGainHandler(dev, IG_Restore);
+			priv->rtllib->init_gain_handler(dev, IG_Restore);
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index b82d2b7aa26c..eb20b8014997 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -734,7 +734,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
-	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
+	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ee9b99b4c5e..0551f9b108f6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1711,7 +1711,7 @@ struct rtllib_device {
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
-	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
+	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
 	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
-- 
2.34.1

