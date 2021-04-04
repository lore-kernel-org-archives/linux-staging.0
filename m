Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B4259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a76so1388609wme.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmNzf36fyYg+0AMkEesws+QYsMSDK6OKbz+EDQka0qY=;
        b=uTdww3EUd2OCcuyKCtmN+7rJjNqmmf1ZGgvk77+Bh2dvIbtPYswMunZw9LOrzVyql7
         iFIc1YAkaE363bvyMLsnLdWYAUGkm7EqQIVdUhxmexXz3FiIka/8sRpyF8Gx4PdES4z7
         3SR1VRo3B4XZQSUBwBgfyO6tgYRdbLCF0Q1o8JCdq5K7JsKsU1v6bwLKBqESs3GDMilc
         3vvNUdNg7cw5TRUhaD5tiXtGWU+3fln2GOMrHf3+Zqdv3uZ7lwT6gZO8/ZMk9VUS25YE
         K6HHcrS9FJLQU9fQbty8JnwDFfw8cuDn1e5rddOK308kpr94Xvqy1vqMNhxCq6ouEDO2
         Rn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmNzf36fyYg+0AMkEesws+QYsMSDK6OKbz+EDQka0qY=;
        b=rxGxPThPgqUcrFO+yh7ErxUH8XbFmUW7rWKk1yzxsqnP/Fpwe72WG/U0Rm8ZJQmh7V
         nJodcCqpVn6aXWnVhKO7MW9NQJZLEdkQn5zs2b6k2U9aBiUN0iUlJLtEzyQ3Vf/GcxZ7
         Ffm5JqS2L3Pf6i+/nB8m6OB11npj3wPZ6zXGsolkJkQxcALgBVhVQAnQe2lEUqTFmNeW
         ZHJyhPkOviINXGJ7Vs0OegfNOfnzyD2ywKtdoyg+OW7bDSOpeSzXTpg8G3hIvVb3t6pO
         8/IESjOmNZ9M3gVQHDKzLSDikMj26HvPV5GgMbU9gZ7msiGl3xG7LrgPQ4riN1INjd1c
         sn2Q==
X-Gm-Message-State: AOAM530pK+Rlfy31oCHx5GkJZ2OshmW9xhfpRXvLT7FZavnKWJwxORrq
	94zYvebat/uyzfPc2uj76Ec=
X-Google-Smtp-Source: ABdhPJxM+4CsNJGl7zL0hga/O259V1+AteNPFUvqUd7XI4Ye6Z3BDbSnkZULgZpFf8usA8/8VGhs1w==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr20609473wmi.183.1617545400493;
        Sun, 04 Apr 2021 07:10:00 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id e10sm7276721wrw.14.2021.04.04.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 06/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
Date: Sun,  4 Apr 2021 16:09:22 +0200
Message-Id: <e302fadf18a36d8521456858caff641c0f598731.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_eeprom.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c | 56 ++++++++-------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index 3cbd65dee741..32d5e5b23337 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -35,10 +35,9 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
 	u16 x, mask;
 _func_enter_;
 
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	mask = 0x01 << (count - 1);
 	x = rtw_read8(padapter, EE_9346CR);
 
@@ -48,20 +47,18 @@ _func_enter_;
 		x &= ~_EEDI;
 		if (data & mask)
 			x |= _EEDI;
-		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
-		goto out;
-		}
+		if (padapter->bSurpriseRemoved == true)
+			goto out;
+
 		rtw_write8(padapter, EE_9346CR, (u8)x);
 		udelay(CLOCK_RATE);
 		up_clk(padapter, &x);
 		down_clk(padapter, &x);
 		mask = mask >> 1;
 	} while (mask);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	x &= ~_EEDI;
 	rtw_write8(padapter, EE_9346CR, (u8)x);
 out:
@@ -72,10 +69,9 @@ u16 shift_in_bits(_adapter *padapter)
 {
 	u16 x, d = 0, i;
 _func_enter_;
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	x = rtw_read8(padapter, EE_9346CR);
 
 	x &= ~(_EEDO | _EEDI);
@@ -84,10 +80,9 @@ _func_enter_;
 	for (i = 0; i < 16; i++) {
 		d = d << 1;
 		up_clk(padapter, &x);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 		x = rtw_read8(padapter, EE_9346CR);
 
 		x &= ~(_EEDI);
@@ -122,26 +117,22 @@ void eeprom_clean(_adapter *padapter)
 {
 	u16 x;
 _func_enter_;
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	x = rtw_read8(padapter, EE_9346CR);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	x &= ~(_EECS | _EEDI);
 	rtw_write8(padapter, EE_9346CR, (u8)x);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	up_clk(padapter, &x);
-		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	down_clk(padapter, &x);
 out:
 _func_exit_;
@@ -155,17 +146,14 @@ u16 eeprom_read16(_adapter *padapter, u16 reg) /*ReadEEprom*/
 
 _func_enter_;
 
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
+
 	/* select EEPROM, reset bits, set _EECS*/
 	x = rtw_read8(padapter, EE_9346CR);
 
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true)
 		goto out;
-	}
 
 	x &= ~(_EEDI | _EEDO | _EESK | _EEM0);
 	x |= _EEM1 | _EECS;
-- 
2.20.1

