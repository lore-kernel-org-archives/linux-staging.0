Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7172
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 23:05:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u16so3970006wrn.5
        for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 16:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T0vhrXmaCnBUAq1bek/phc8PfY46b3QRQs/x7Py8PZQ=;
        b=NXu8lmZVg19azqMz/JWhrBh01Nf/pLLpZ4EX5RrESK5+0NyAQ5eiQ7n3CY1/htGu7Q
         EcRmMFAMbR1LLStSbqRPOdfMXHbRdUxFb3koFaX0zKo9WYGCwmr1UN4BiStkWmo5L4Zb
         439T0DIGiaDEojISOGooRabuLZ/nbSOSkRMK1g4N8Kn7VYaWhcXkswKrqXqDc1lanBt3
         c09x5Us6oE9j6DAsnLpuqytY2lTcw8QPBHos2sZn8fOUu+xbiM3jZ5zzXMPR4sBRjo0P
         1FioM76aoNXvQSyCXpCibN3ehuKfUvUFmhbFJLfwxHKVByueiY8lw0bcuM74l6g0ks8u
         mvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T0vhrXmaCnBUAq1bek/phc8PfY46b3QRQs/x7Py8PZQ=;
        b=Z4c+YYl170AA7Bzd4dCD/zeBOcBBD+RhZ6GTBUhtlstN1QrSnlE/u98ZaJEOwJeQt2
         +EeUZe9X6ReoPGUbHCB5/J+S5tWneZ+GkNswqhg3+QSQ6hJb7ILJIa8IrukGrlsWNq9o
         kgnuqSJaEsyAIwu1+LLzO8lhhs6EnM/2q/2gSp/Dh18F3icffhhj4N5ZhCnyfWbQO5n9
         yd6cGd0HDrgvJQN5a77Sm8rmeGPB6ns2695Dxa2qiaauZ9w5p5o0mz5Szw5X88iRscqG
         6kV89u2zZtX6Kj8TYQQMv+34Sr9fYkfwClqI5MzIQVVcHZGL5Z1uLjwOASXseUuQ+n7j
         eBvw==
X-Gm-Message-State: AOAM530MOhxyxT0kna2j/I2fuQQapEYP5yojAEGmg7dxU9s8c5MysmKq
	YNHu94fNRt7Kxr7gkb5u1n4yog==
X-Google-Smtp-Source: ABdhPJxwWul77eZdHHvx6oi6bMz+Y4HPZxttbRu7mUGhTdVXHRMQ5s2ff5chvDrRR9kkeBI9UOOiMA==
X-Received: by 2002:adf:f285:: with SMTP id k5mr15177636wro.117.1629068720214;
        Sun, 15 Aug 2021 16:05:20 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id e11sm9545734wrm.80.2021.08.15.16.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 16:05:19 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove unused variable and DBG_88E in hal/rtl8188e_cmd.c
Date: Mon, 16 Aug 2021 00:05:18 +0100
Message-Id: <20210815230518.91656-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variable init_rate from rtl8188e_Add_RateATid
function in hal/rtl8188e_cmd.c, as it fixes a kernel test robot warning.
Removing the call to get_highest_rate_idx has no side effects here so is
safe.

Also remove the DBG_88E macro call in this function, as it is not
particularly clear in my opinion. Additionally, rename variable
shortGIrate to short_gi_rate to conform to kernel camel case rules,
and improve general spacing around operators, some of which triggers
checkpatch 'CHECK' messages. These are not related to the test robot
warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 6cbda9ab6e3f..8d03b24dc5af 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -155,33 +155,25 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(pAdapter);
 
-	u8 macid, init_rate, raid, shortGIrate = false;
+	u8 macid, raid, short_gi_rate = false;
 
-	macid = arg&0x1f;
+	macid = arg & 0x1f;
 
-	raid = (bitmap>>28) & 0x0f;
+	raid = (bitmap >> 28) & 0x0f;
 	bitmap &= 0x0fffffff;
 
 	if (rssi_level != DM_RATR_STA_INIT)
 		bitmap = ODM_Get_Rate_Bitmap(&haldata->odmpriv, macid, bitmap, rssi_level);
 
-	bitmap |= ((raid<<28)&0xf0000000);
+	bitmap |= ((raid << 28) & 0xf0000000);
 
-	init_rate = get_highest_rate_idx(bitmap&0x0fffffff)&0x3f;
+	short_gi_rate = (arg & BIT(5)) ? true : false;
 
-	shortGIrate = (arg&BIT(5)) ? true : false;
-
-	if (shortGIrate)
-		init_rate |= BIT(6);
-
-	raid = (bitmap>>28) & 0x0f;
+	raid = (bitmap >> 28) & 0x0f;
 
 	bitmap &= 0x0fffffff;
 
-	DBG_88E("%s=> mac_id:%d, raid:%d, ra_bitmap=0x%x, shortGIrate=0x%02x\n",
-		__func__, macid, raid, bitmap, shortGIrate);
-
-	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
+	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, short_gi_rate);
 }
 
 void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
-- 
2.31.1

