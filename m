Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB72ED5
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 09:35:02 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x31so2115293pfh.9
        for <linux-staging@lists.linux.dev>; Fri, 01 Apr 2022 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Vn5NpwWl2cUBu3wyjrfqRsuWIfgmZwnj+QZMZfZlE/o=;
        b=CPE6jLWhuduMCAlXTGzuwb+9zkkIdlAQuOgnc0x6jioAs4AQZNKD2gjBz1Rno1Pn/l
         3Tu1PCdfhKnDpauhEo9sd0Uea3Ap3nuOoO7HbqPjRbjq5aBkQnqUN/Mf4iiyGZKHoxUG
         cSFgEq9/EkisIEdCM+hLr8UXEIxc865l0zVGwT9w54NMxYJmWWgHhy6zj8ppru8rIkHV
         rjsax0X+KVtTy4SeB5tgzqxiC6uALyRBu/7FLQwhY6q8l3HvCj0w4+zXAnFcUNucsnsY
         73dvrJoyTV7xv3VX/AETE/Z/Vb+ly4ONIjdVrs/09mozESXk+7xX/rdj7FQKYooeWkyB
         AJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Vn5NpwWl2cUBu3wyjrfqRsuWIfgmZwnj+QZMZfZlE/o=;
        b=K5YWlKtzQfCiC9lQn8qdGM+Nu2edszKvfmklvqoifdXR0Pr3VPT8aIkBV8H+lWoWbE
         VOjz6zwM5opCwJM3t6EANCdjdgyrocWqaMqvwji6zCLESbZ0xaWDRQMUJuUxxaYlOgKy
         ZdkHtmyeToFi2dWvCuOC0nNCx2bNk7Z0NE9E8P0ZIPXzJOxdQfxeT/Bxy4WAJh7YUWfr
         wQ1YhBB5f4U0Bwxu1/zxUW6UvR/niGzCh3PYtKF6m352bQrpwm1mQYiR3sISpUIZbiwh
         PGf7YFwZ1x5hENiNSa7X2268HblDJbBEBzooo+rveqvfRtw6dwN57TMpf0GfGkNCD+Tn
         ESgQ==
X-Gm-Message-State: AOAM530YIF+Y+NGhjtZRtIwWrO/28osuIiXhHjL+Rqfw9z4QDChbLjfW
	8DBvtXx7bd9rwGwg86ZWwKg=
X-Google-Smtp-Source: ABdhPJzFDfY8T2KmlZBnyKjVPHPRbcL8J3AJgUkKFtxAkNZ3slUYcVxRLw3Bb62kN5W4umPef3HiGQ==
X-Received: by 2002:a63:b55d:0:b0:398:5eeb:e637 with SMTP id u29-20020a63b55d000000b003985eebe637mr13994421pgo.314.1648805702073;
        Fri, 01 Apr 2022 02:35:02 -0700 (PDT)
Received: from ubuntu-vm.jnpr.net ([116.197.184.14])
        by smtp.gmail.com with ESMTPSA id d21-20020a056a0010d500b004fd9ee64134sm2321715pfu.74.2022.04.01.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 02:35:01 -0700 (PDT)
From: Sathish Kumar <skumark1902@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sathish Kumar <skumark1902@gmail.com>
Subject: [PATCH] staging: rtl8712: Fix multiple blank lines warning
Date: Fri,  1 Apr 2022 15:04:49 +0530
Message-Id: <20220401093449.6872-1-skumark1902@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patch fixes the checkpatch.pl warnings like:
CHECK: Please don't use multiple blank lines
+
+

Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_ioctl_rtl.c | 1 -
 drivers/staging/rtl8712/rtl871x_ioctl_set.c | 1 -
 drivers/staging/rtl8712/rtl871x_recv.c      | 1 -
 drivers/staging/rtl8712/rtl871x_security.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
index b78101afc93d..2b539335206a 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
@@ -367,7 +367,6 @@ uint oid_rt_get_scan_in_progress_hdl(struct oid_par_priv *poid_par_priv)
 	return RNDIS_STATUS_SUCCESS;
 }
 
-
 uint oid_rt_forced_data_rate_hdl(struct oid_par_priv *poid_par_priv)
 {
 	return RNDIS_STATUS_SUCCESS;
diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_set.c b/drivers/staging/rtl8712/rtl871x_ioctl_set.c
index 6cdc6f1a6bc6..603a3a48f952 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_set.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_set.c
@@ -22,7 +22,6 @@
 #include "usb_osintf.h"
 #include "usb_ops.h"
 
-
 static u8 validate_ssid(struct ndis_802_11_ssid *ssid)
 {
 	u8 i;
diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
index 66cc50f24e29..de9a568eaffa 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.c
+++ b/drivers/staging/rtl8712/rtl871x_recv.c
@@ -455,7 +455,6 @@ static sint validate_recv_mgnt_frame(struct _adapter *adapter,
 	return _FAIL;
 }
 
-
 static sint validate_recv_data_frame(struct _adapter *adapter,
 				     union recv_frame *precv_frame)
 {
diff --git a/drivers/staging/rtl8712/rtl871x_security.c b/drivers/staging/rtl8712/rtl871x_security.c
index e0a1c30a8fe6..e46a5dbc7b65 100644
--- a/drivers/staging/rtl8712/rtl871x_security.c
+++ b/drivers/staging/rtl8712/rtl871x_security.c
@@ -381,7 +381,6 @@ void seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code,
 #define P1K_SIZE         10    /*  80-bit Phase1 key                */
 #define RC4_KEY_SIZE     16    /* 128-bit RC4KEY (104 bits unknown) */
 
-
 /* 2-unsigned char by 2-unsigned char subset of the full AES S-box table */
 static const unsigned short Sbox1[2][256] = {/* Sbox for hash (can be in ROM) */
 	{
-- 
2.17.1

