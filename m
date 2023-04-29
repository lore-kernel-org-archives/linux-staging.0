Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD40417CB
	for <linux-staging@lists.linux.dev>; Sat, 29 Apr 2023 02:26:52 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2470e93ea71so465801a91.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Apr 2023 19:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682735212; x=1685327212;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvZBb3zDkCNBninlkvm1QhcuDNTotPdtO/fg1RpYlr4=;
        b=JaEqXs1cBubSFOUHzVMLv39JOMv2/647RCSvQz9Pp+onIkgw/wVUFCIhj4QMaQ/1a3
         C7HoJ36Y4rWGtUvcVQkDQn/G1j80GIhpApfUknOA0UT+FM6RQpd4NlU0j24XIVAyUUmt
         nHA4cVttQjv9iiM4eKDjXpm2EOputAJ0B552uqHV2o1Mxar+LkMy3J8QNyk/M6QKfRH7
         KSyDgKE71FAb1MzbEcybJaHWJS4w0isWsDT0TC2Rzhfz/8Hc+3KVhpkTilGsTYOuW1t7
         OIIh6+dWMTsGHsX2LHZ5eH2DwRnaPywjY0MOtdAYx7vRrINZNxvBlAPX/eMSDGYVm8Rx
         w2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682735212; x=1685327212;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvZBb3zDkCNBninlkvm1QhcuDNTotPdtO/fg1RpYlr4=;
        b=f2G/r0Vrybw0O0aA0VNODt1/AoU3soIdLn0gIFPj5L2z8B+h39pFY/HUXSKYCtpMUY
         kkCTyUJm0aQOupxCz/DKxF9dIe3JKPax/8ZdYTSYavYAk8uOs6Z9GyW4M+K8RclQzjOJ
         kaBXh21C80qXbalHNgY9iirFWwgJ6Kyau+GUSeCpov/+so74e/lQ41D8QohTtqzLVt1m
         CKUUwd8UFJZIsZPniCTs4oxyW5tEoH2Etpn5cj8NwzDhitvIsOcTmVZyRQtNrZMOwx1b
         FdA156mZ8yx8tVvPhpKHpNiNcDeUQigT2XixVuPdUS1nA7nKF6jiZVVmq4HYYT8fuiX6
         mY6Q==
X-Gm-Message-State: AC+VfDybdwoTdKNgUmR9Map/6ra+wJWF2twqwh9u1mJt9s7hsrza2jSb
	41tueZyOZIR6Zkn13nrCxFQ=
X-Google-Smtp-Source: ACHHUZ5dNmDxgF4RnJi/Ms+PmRMtT62ARcQq2IWKnXo29oKnyv/jHRviDaAT8Lkmart5ccG1IRr8GA==
X-Received: by 2002:a17:90b:4b01:b0:23d:10f2:bda2 with SMTP id lx1-20020a17090b4b0100b0023d10f2bda2mr7443831pjb.30.1682735212160;
        Fri, 28 Apr 2023 19:26:52 -0700 (PDT)
Received: from trent-reznor ([2607:fb91:60f:60ef:dc01:5197:5d6b:1b5c])
        by smtp.gmail.com with ESMTPSA id u11-20020a655c0b000000b00528cd045e31sm256112pgr.78.2023.04.28.19.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 19:26:51 -0700 (PDT)
Date: Fri, 28 Apr 2023 19:26:48 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: use tabs for indentation
Message-ID: <ZEyAaC0riuuBJO14@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use tabs for indentation to conform to styleguide.

Signed-off-by: Daniel Watson <ozzloy@gmail.com>
---
 drivers/staging/rtl8723bs/include/sta_info.h | 26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 69c377eeeaf08..1ea3fe22b99a3 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -16,9 +16,9 @@
 /* if mode == 0, then the sta is allowed once the addr is hit. */
 /* if mode == 1, then the sta is rejected once the addr is non-hit. */
 struct rtw_wlan_acl_node {
-        struct list_head		        list;
-        u8       addr[ETH_ALEN];
-        u8       valid;
+	struct list_head list;
+	u8		 addr[ETH_ALEN];
+	u8		 valid;
 };
 
 /* mode = 0, disable */
@@ -340,19 +340,19 @@ struct	sta_priv {
 
 static inline u32 wifi_mac_hash(u8 *mac)
 {
-        u32 x;
+	u32 x;
 
-        x = mac[0];
-        x = (x << 2) ^ mac[1];
-        x = (x << 2) ^ mac[2];
-        x = (x << 2) ^ mac[3];
-        x = (x << 2) ^ mac[4];
-        x = (x << 2) ^ mac[5];
+	x = mac[0];
+	x = (x << 2) ^ mac[1];
+	x = (x << 2) ^ mac[2];
+	x = (x << 2) ^ mac[3];
+	x = (x << 2) ^ mac[4];
+	x = (x << 2) ^ mac[5];
 
-        x ^= x >> 8;
-        x  = x & (NUM_STA - 1);
+	x ^= x >> 8;
+	x  = x & (NUM_STA - 1);
 
-        return x;
+	return x;
 }
 
 
-- 
2.34.1

