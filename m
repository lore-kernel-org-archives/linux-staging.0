Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79455F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:32 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id u9so1834666ejj.7
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cJGiJpGnSxpfcjJ2NKRs2PospuA2P2kCoA4H2fFeYoU=;
        b=QakcbMYDHq6fCx2OCzxWmswGypW4EKbF6xwAm8I9Xa0hWA6UkzOvJQMv6QVing+uMz
         fGK9s4nCVtwm9v0L+yIXXFl8TgJOMQEh9WJ7OSvXJtf9IXHofb4GecETawLD7bKURoD8
         KtZe24s37KIelomuj36+6GasgwuaIQymB4FY+m9uTYPH2TIDmZpgzE/IMT+HZql4lk1g
         Fkh/VGLF/5AjlUlSghBVnrJjUC26i+6cg0+vlZngyERZyVG9mSmiXDiIYTgt0iWz5kb8
         V1945w6X8xLu3N5vrpjVoI31aLtqztG1Btgl95yb6ZntyqWb9AdtXvrTxqSu9SyNmT1w
         hQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cJGiJpGnSxpfcjJ2NKRs2PospuA2P2kCoA4H2fFeYoU=;
        b=WbyFV0QB4L8uffaxxSVkp22B+VG5ptgIwKIpXffSH70MT58vNDtjTWYGJNS1bpfhTQ
         dcUWa+A8S/inx1+PbQZtz3wQB9Q3TUkgmsAspGdeTBM2ODy8BBYGuskIfoxxJUbYYbjL
         l2vfFqvuEA4akLwuo5KXbi7Ymyf/xrYDBOdq2lAwRGqMjRv/gQg3AsICMFRXZvbBWMov
         ZHeuR5gqno3stIGtyDY+v3OEKeNpVBKQuyMXN4iNXHUeFjv8M5+qZp31uG5kWpMxUGoV
         bRlHjMLq3nbOjTL3ajVUqvR5cBkZos74hZW85/5ThxW7d0akujlnsUP90FlhAm1mVmAQ
         hKCA==
X-Gm-Message-State: AOAM5308k1cepu/yJzx4tI9ofurv0LbZGvIihwH+xOnm0BNjhx9ilMwA
	0hqlauf2DPEcWq0gdbPQrY7PL2AK97qA4g==
X-Google-Smtp-Source: ABdhPJz20QGJ6m5mrEzecz/qm0xF3nMQ46rIq0SYNw81TW2W1vjZ0mwwitUoOwTh9C6fRAvGYbczMg==
X-Received: by 2002:a17:906:3496:: with SMTP id g22mr8373695ejb.143.1617268891231;
        Thu, 01 Apr 2021 02:21:31 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id q10sm3144871eds.67.2021.04.01.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 05/49] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
Date: Thu,  1 Apr 2021 11:20:35 +0200
Message-Id: <97eefac38353785e4db2090109966cd9bd7efbe6.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index 3cbd65dee741..f2a2bdb47c7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -36,7 +36,6 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
 _func_enter_;
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	mask = 0x01 << (count - 1);
@@ -49,8 +48,7 @@ _func_enter_;
 		if (data & mask)
 			x |= _EEDI;
 		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
-		goto out;
+			goto out;
 		}
 		rtw_write8(padapter, EE_9346CR, (u8)x);
 		udelay(CLOCK_RATE);
@@ -59,7 +57,6 @@ _func_enter_;
 		mask = mask >> 1;
 	} while (mask);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	x &= ~_EEDI;
@@ -73,7 +70,6 @@ u16 shift_in_bits(_adapter *padapter)
 	u16 x, d = 0, i;
 _func_enter_;
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	x = rtw_read8(padapter, EE_9346CR);
@@ -85,7 +81,6 @@ _func_enter_;
 		d = d << 1;
 		up_clk(padapter, &x);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 		x = rtw_read8(padapter, EE_9346CR);
@@ -123,23 +118,19 @@ void eeprom_clean(_adapter *padapter)
 	u16 x;
 _func_enter_;
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	x = rtw_read8(padapter, EE_9346CR);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	x &= ~(_EECS | _EEDI);
 	rtw_write8(padapter, EE_9346CR, (u8)x);
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	up_clk(padapter, &x);
-		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved == true) {
 		goto out;
 	}
 	down_clk(padapter, &x);
@@ -156,14 +147,12 @@ u16 eeprom_read16(_adapter *padapter, u16 reg) /*ReadEEprom*/
 _func_enter_;
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 	/* select EEPROM, reset bits, set _EECS*/
 	x = rtw_read8(padapter, EE_9346CR);
 
 	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
 		goto out;
 	}
 
-- 
2.20.1

