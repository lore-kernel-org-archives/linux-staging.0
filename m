Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B86D00
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:01:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h13so4949386eds.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=elDtaXxqbBz7CfvdseF55dVdfqtzeGsUAApAih4pNfs=;
        b=ftd6A96TpJuaxPHFNifHwgr3lhJgmLSmAwt7+SMzZWikWuTE+XRo7UyGWJlQwSWXXI
         EbfPgzA+kmb/+5dj95qoZ4pgdD7alHALrMKU5kX/N1R6R6iILUO+FwYbMlRtpbJAAfLO
         G4j0aqMHrAYYaHpd1nSOHLvTSq6Rtlf5YAfHFSc4M79sOuRUMdtnian9U0nfaKcZQJ1n
         dneIrAtkgqKspn612j0YOjBO6nehWlBU6RNZ/80NHnAcNju9wcARwkZ9gjFmZCjAwPKO
         s65rC8jr2CURc5FzjFIzgBUtkrp23xbFrkjHWVHipIKaIyAqJiw7AMeqrkHfX3fkP0dl
         heUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=elDtaXxqbBz7CfvdseF55dVdfqtzeGsUAApAih4pNfs=;
        b=NrQnh/8iJL4mbr/MWfAeUnTxa18saFkN80fwVx61io9CfmC69fSjBWOCu5kFvHu61x
         xqiFtSmGv53aR5gld216/zEideL9BdcDVhNCyR89N7yog5iby6lD893HEkUDr+uqNbfq
         n5DXB54n56Ey/IAyKMVbfOILRFXPpERBaRK2ANm1N9kSl+WKT59frypxlu3dabn2ntWF
         bVGgTgktLbkm16hsrlkVCufidytYi1FdUB1GkuxQNfNxfNEIPy6HwOYiho6jEuGJ+nas
         fQnPEI//WE5yAihitiS/UeNRYMaYIymH4/fWhYKCa8HVt59XFX3La0uto4H74t5SJ6Yg
         qFPg==
X-Gm-Message-State: AOAM533hjyGwInUIyDL/2Tu64sidYUtVOrpqAGglFPEWnUcpcymLIa43
	XI/Q/BOeiLZgHzcRf1NMD4A=
X-Google-Smtp-Source: ABdhPJzrbD8JQ4Ps3PSU6oxxB6KviXa/ulMSwYHv2YIg2imWt9UeTKDgRfXWJkOunP3IFJor0zB2fg==
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr14947384edr.376.1617357711241;
        Fri, 02 Apr 2021 03:01:51 -0700 (PDT)
Received: from agape ([5.171.72.128])
        by smtp.gmail.com with ESMTPSA id r5sm5285533eds.49.2021.04.02.03.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:01:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 03/16] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
Date: Fri,  2 Apr 2021 12:01:23 +0200
Message-Id: <7f2f51a4b3301bec3f3c5a1523f7de0cb2ff2efe.1617356821.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617356821.git.fabioaiuto83@gmail.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs
fix patch-related checkpatch issues

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c | 56 ++++++++-------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index 3cbd65dee741..be0eda1604d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -35,10 +35,9 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
 	u16 x, mask;
 _func_enter_;
 
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved)
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
+		if (padapter->bSurpriseRemoved)
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
+	if (padapter->bSurpriseRemoved)
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
+	if (padapter->bSurpriseRemoved)
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
+	if (padapter->bSurpriseRemoved)
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
+	if (padapter->bSurpriseRemoved)
 		goto out;
-	}
+
 	x = rtw_read8(padapter, EE_9346CR);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved)
 		goto out;
-	}
+
 	x &= ~(_EECS | _EEDI);
 	rtw_write8(padapter, EE_9346CR, (u8)x);
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved)
 		goto out;
-	}
+
 	up_clk(padapter, &x);
-		if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved)
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
+	if (padapter->bSurpriseRemoved)
 		goto out;
-	}
+
 	/* select EEPROM, reset bits, set _EECS*/
 	x = rtw_read8(padapter, EE_9346CR);
 
-	if (padapter->bSurpriseRemoved == true) {
-		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
+	if (padapter->bSurpriseRemoved)
 		goto out;
-	}
 
 	x &= ~(_EEDI | _EEDO | _EESK | _EEM0);
 	x |= _EEM1 | _EECS;
-- 
2.20.1

