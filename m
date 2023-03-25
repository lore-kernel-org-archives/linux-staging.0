Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A828F7
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 13:28:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y4so18337202edo.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB6p6J+61ZEfKF2taGIVauzNoOXReRV6sQgPw6xQeQ8=;
        b=IRoQcHNx0zbv/J3FOdcXg2ldsaIRZ4FBlWY3Njzt6QM/1vEljPaulBm36FmTlJTvsc
         TCavTauqk9X6Py1MX1jsLfrRCoRQrEuYBzaDSHccPctRPwWWG4Mr8K6anRxk2uvxUXAq
         ZszLz3QkxZs0l3s4zdjGWV3RGqXuGqMIh6Jhq0BhzXSI8aU7qNtxm39n5LJfzNlEGnpa
         cmo5BDKCOIcKNeHDsEALAzXDW2UKwQvfd1QXCVYnSm7vx3TB6Mx3WaHyI8hrbHO7iFgf
         lRQuM22cZQMYi/EVICjuGN4FE+NVfwJMx+1ZFPZIGQaTKpvNOnEvpsgbezZYQWUDEGVr
         Zsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB6p6J+61ZEfKF2taGIVauzNoOXReRV6sQgPw6xQeQ8=;
        b=dOlCxo6zExoKsYxaURZeTtzwk+nU1aR3WdpSUNvYZu/Mzl81toKU0GN8RHc1bM0maJ
         rR3po+gQa0KmHcE2O0TpNWFK2tkxmwzShJY47mHRjBIqSkz/a6mbAQGTi4MJDAi9FhvI
         oi5ZSl6ok/JTkrtplnTocl4xx5pPg1ibgWQnRN7bd44xYelYHdAvFiBGLhHD0nOPasge
         GiHbVz1Py9zPxK5Wr5uBtjZWWL+BrUn4prEuvOU23bjpXn6Ehi66q9GUQ9D/Nt2+xabr
         MGzIcmEEarsqwNmz9nsLffAhUy5LSMs8a3qgeg/IpTLgy48fFzJ7NDtgwFdsZRBLX4XT
         61GQ==
X-Gm-Message-State: AAQBX9cndBWHP34sCDZ2hiKgp8Eaz+AR7FWbxsxl2skb6w8MuBHajZuu
	8+DmI5mua2E3ymM5RqyNHJQ=
X-Google-Smtp-Source: AKy350ZqNN6BpGL2c1IGNcjra28ImqqwxG7CuSLhJNa4cMdlXHfBTRH10hPZGn8FnvLwA2Ti3tBung==
X-Received: by 2002:a17:907:6d27:b0:932:cfbc:7613 with SMTP id sa39-20020a1709076d2700b00932cfbc7613mr7396832ejc.24.1679750914842;
        Sat, 25 Mar 2023 06:28:34 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbe9.dynamic.kabel-deutschland.de. [95.90.187.233])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm11727610ejb.74.2023.03.25.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:28:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: rtl8192e: remove RTL819X_DEFAULT_RF_TYPE
Date: Sat, 25 Mar 2023 14:28:20 +0100
Message-Id: <20230325132823.22872-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230325132823.22872-1-straube.linux@gmail.com>
References: <20230325132823.22872-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RTL819X_DEFAULT_RF_TYPE and use RF_1T2R directly to make
follow up patches, which will remove priv->rf_type, easier to review.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a67927f0c5e3..3027d43cb362 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -343,7 +343,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 	else
 		priv->tx_pwr_data_read_from_eeprom = false;
 
-	priv->rf_type = RTL819X_DEFAULT_RF_TYPE;
+	priv->rf_type = RF_1T2R;
 
 	if (priv->card_8192_version > VERSION_8190_BD) {
 		if (!priv->autoload_fail_flag) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 68ec0aeb2dd9..914cd28897a5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -61,8 +61,6 @@
 #define HAL_HW_PCI_REVISION_ID_8192PCIE		0x01
 #define HAL_HW_PCI_REVISION_ID_8192SE	0x10
 
-#define RTL819X_DEFAULT_RF_TYPE		RF_1T2R
-
 #define RTLLIB_WATCH_DOG_TIME		2000
 
 #define MAX_DEV_ADDR_SIZE		8  /*support till 64 bit bus width OS*/
-- 
2.40.0

