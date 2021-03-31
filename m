Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3370
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:19 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o19so21529154edc.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6r3wJkTfgXOb09KzV4WZdWmyuiaF5CHkBHLFr4r259Y=;
        b=kxLm/x5RnQwGDcoFaDHNV5puG9fm7YUDM/MTfIhYtvfSaeRnvkIKskFSE1TXifFFZs
         gUbhZtDJsenbUAfUMvPDOuqv8sbCGffXM4FHPKiqxvIXW4GPP7WtMeAsQ0Rs0T91JjOy
         CWpTrHHCg+WxMnfXO+o8fcPVFik2JIcbWg4yuJlb02fbIIit1rTrZMq1JhJyv5XDN+D3
         e57cMpJaOFK6PsOQ1+rUoPRAdiztTIaQoaaV/VbB0fI0iIbVK+3LXt5F7RKTl96pC70R
         vBEtVWLf31BCJJrKGCXmnqUr0CbjP6zLhU5GxaGrV8NryY8+dvg/MY8vSRphiPH7dekS
         +LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6r3wJkTfgXOb09KzV4WZdWmyuiaF5CHkBHLFr4r259Y=;
        b=ku4KWpMFH6kQFKT4NC4WOoMYmENc/HWpDpDtUPysU4+D39n0gmMABn72Mwp7VKOueL
         XvTlfMduxfFcY5/x2YZqmAotZszw6l1vq04OZjo0FENiD83gdFlM67tDLYAxuea3cwOu
         L59dKXPvESzyN2XzfV9puUG8lyPTEY7dr796XPo8q0ZDAKZZNn8Fs6rPYr7CriH+c4nL
         6BEFVwj1kkENVbitRP+6AnS6jQxCjUdmocqCqSs/gp9+mGKHfUXDzv5F7sg2H+/wGvOt
         it4EuXfOqbpltPpfYPBKLBM0lZzFMFK+hW07ZvoJm/rEEVRuSorz1GL8YbGKzL7rCe8D
         +fVg==
X-Gm-Message-State: AOAM531wPgp6BPIwpFgusYcd9gPO0Nmgz3zXTnElDFsAqgzQS2uaDwd8
	4/Wki2+3rZTsdRKYjlYW2pg=
X-Google-Smtp-Source: ABdhPJysMkymAWBe4J7W/ABLX6GzYXFMPVZFutnRVMW+vnfPqU2qlmfCb2OiXvEFyEAfRMwrzON+xg==
X-Received: by 2002:a05:6402:158d:: with SMTP id c13mr2527746edv.297.1617183617806;
        Wed, 31 Mar 2021 02:40:17 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id h17sm1098489eds.26.2021.03.31.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in core/rtw_eeprom.c
Date: Wed, 31 Mar 2021 11:39:31 +0200
Message-Id: <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index 3cbd65dee741..6176d741d60e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
 _func_enter_;
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	mask = 0x01 << (count - 1);
@@ -49,8 +49,8 @@ _func_enter_;
 		if (data & mask)
 			x |= _EEDI;
 		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
-		goto out;
+			pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
+			goto out;
 		}
 		rtw_write8(padapter, EE_9346CR, (u8)x);
 		udelay(CLOCK_RATE);
@@ -59,7 +59,7 @@ _func_enter_;
 		mask = mask >> 1;
 	} while (mask);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	x &= ~_EEDI;
@@ -73,7 +73,7 @@ u16 shift_in_bits(_adapter *padapter)
 	u16 x, d = 0, i;
 _func_enter_;
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	x = rtw_read8(padapter, EE_9346CR);
@@ -85,7 +85,7 @@ _func_enter_;
 		d = d << 1;
 		up_clk(padapter, &x);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 		x = rtw_read8(padapter, EE_9346CR);
@@ -123,23 +123,23 @@ void eeprom_clean(_adapter *padapter)
 	u16 x;
 _func_enter_;
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	x = rtw_read8(padapter, EE_9346CR);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	x &= ~(_EECS | _EEDI);
 	rtw_write8(padapter, EE_9346CR, (u8)x);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	up_clk(padapter, &x);
-		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true) {
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	down_clk(padapter, &x);
@@ -156,14 +156,14 @@ u16 eeprom_read16(_adapter *padapter, u16 reg) /*ReadEEprom*/
 _func_enter_;
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 	/* select EEPROM, reset bits, set _EECS*/
 	x = rtw_read8(padapter, EE_9346CR);
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
 		goto out;
 	}
 
-- 
2.20.1

