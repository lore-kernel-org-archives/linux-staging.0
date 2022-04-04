Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C147C
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 03:52:32 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so7820653pjk.4
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 20:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=5FFxSTXwBaEGi4lfK+T2LU99v/h0J5utIcW5ijXutv0=;
        b=aOwqDqJ9BCgS/OlFhm9cTrjEoXpHxRWPaSdFORy8vWyW8x/iTrv2q1mKVoilW1X400
         OYFUvmhZHwmxTfQ43WxSyToXNH8dNyR/4aZoQHt6FGLCZ5EzRJYK6VHPPDNxH7K45XV4
         hKsn1oXQLQNJDGCbJVDdtpXbVvgSAJlh4IMtxPc/cYsKQw8j6umU8GrjzjGStAuPZ/9D
         6U6zgRbaUIcKw3Mw2HI9yunNV3XtGbQTXz5hm/NDfp6yE0ThHY3E8rTtm5YWQPuK6QF6
         lI9AQ7+LxxLZaJtacqBiWFunVSWfaX9CfPquerctUl6jstXQPOXCg9lzO1IIDS4+GUhY
         8A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5FFxSTXwBaEGi4lfK+T2LU99v/h0J5utIcW5ijXutv0=;
        b=fJiUCnbhSnDth5nitGzR4RiPV3Ueo1SPsi6o1+2+ZIL1SnPwMI5zhxmCRvj96mvFqk
         6oNBvnqQX/XUyZoIjkn7iv9Ythyb2o7+jtGqQihlHiFI67Ur0VD7RkM3mlfp6ET+9/+1
         U0MaWik2JpRgrwd+xqkTytqXnHeXHC49Mz+fk/XZ9+PxBOcAqaWZbPtRMtelZiFq1Q9c
         wvagST32l2HjARRX5SpLxzwjr73JN37q2mz+NIBKjyHPE7r7hX9wuU9m59N/BmvtPqZN
         4bWEgfC2LCY/fWpJRJnPOtacPCsiynCeqkL/Cs1n2+U+dInOGeL+URK6QI/7Qn1P4GEb
         rKuA==
X-Gm-Message-State: AOAM531StRTf0r+0NWBZcrz9pRWrjMLp6AcvUXG8PKhvzsdhDOGYZP7W
	t53tmo/dLZQCGJujRhDk52c=
X-Google-Smtp-Source: ABdhPJyudhD009LYaZ/Hx+oWc+f1KFk4uFo6y5eJN4i37qfjlVM9CRWpoE25/CLl7gD4dLO4V2JDtA==
X-Received: by 2002:a17:90a:2ecc:b0:1ca:6007:406c with SMTP id h12-20020a17090a2ecc00b001ca6007406cmr9762848pjs.84.1649044352039;
        Sun, 03 Apr 2022 20:52:32 -0700 (PDT)
Received: from ubuntu-vm.jnpr.net ([116.197.184.15])
        by smtp.gmail.com with ESMTPSA id hk16-20020a17090b225000b001ca00b81a95sm15405045pjb.22.2022.04.03.20.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 20:52:31 -0700 (PDT)
From: Sathish Kumar <skumark1902@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com
Cc: Sathish Kumar <skumark1902@gmail.com>
Subject: [PATCH v2] staging: rtl8712: Fix multiple blank lines warning from .c files
Date: Mon,  4 Apr 2022 09:22:13 +0530
Message-Id: <20220404035213.2609-1-skumark1902@gmail.com>
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
from rtl871x_ioctl_rtl.c, rtl871x_ioctl_set.c, rtl871x_recv.c,
and rtl871x_security.c

Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
---
Changes in v2:
  - Updated the subject and changelog text
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

