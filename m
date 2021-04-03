Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542E6D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y124-20020a1c32820000b029010c93864955so5250500wmy.5
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wM65qpTGPdNiE6psQoUXh4NGVD1kefhM3YwIRcpdY1c=;
        b=JNn0TNBzD9/wnZEjPFHVgzZAjke4xP2Yf1x++jZTOO/I5tj2gHKGSB4ETMoW7fc5sK
         FOCwY+9AC2csSElG6avefqE5bcEk+YcbYSN7rHWWiaSfplh2hdwtetb8pNRv05KikGrR
         V/mEhxpVPulsFOSwoOZ21tS/leX0uzh9OOlMHnYeyL9gdoNkRVlurYStooX+CwW2CqIw
         dgjffyHnW6qnmZlE2HUEePpFl+mnYG9EUN1Ibo3I65435oqIFz95H3li9igkO8WnQhTq
         pumBOZCeNdByFoP4cx5pdE3ATnNKs3ksO7v9UFrW0RkkzCDkiORMURXXHEIlgRiHAyco
         oBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wM65qpTGPdNiE6psQoUXh4NGVD1kefhM3YwIRcpdY1c=;
        b=VPGYqpw/bC5gXlHG4UOAtQDGcLkFLkRQ87jB+pfoHDo+K9mt8qINls3JXWAtRVswXj
         qsnvw89PPdK3Ss4nZ6noYYxWzqfaK68WU66aBcZ9LtwJsHuFMnA2PXeRcrBocK2y24hl
         vS7B+PFbqqzBq7D86Cj+MCBmj0cepfwZaMZzW24A8v9k9OfxA9Uf86K064QsIEDPApLN
         MLRpNCX/zgNubD/cyQ9OIqcvi9hvDXJj34DVt7G/jvMcdfdm4dAgiM8AYlHhAxhFo2UU
         f7tJzszFonDbIZsPnQe25yZB1S0KapDH0yhaA3jI1ZJG/yCtllrBZoMF2CRUiI9wdIrp
         Gm5A==
X-Gm-Message-State: AOAM531PfH1NV+G3ORQ73R9H5H6iXwp+OT3i5IRrjIgl7+ywtKwMyZpE
	yxCEsGAVXSNyiR/soeG1U5I=
X-Google-Smtp-Source: ABdhPJxCv4Kjl61hZ5FT26gSSoaZeNmSxtNbg4/YGMEnDs98BbvffsuCDdYfTOdRS8LrsgeyqsGdwA==
X-Received: by 2002:a05:600c:44c3:: with SMTP id f3mr2250459wmo.133.1617441265492;
        Sat, 03 Apr 2021 02:14:25 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id d18sm19969599wra.8.2021.04.03.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 07/30] staging: rtl8723bs: fix error prone if conditions in core/rtw_eeprom.c
Date: Sat,  3 Apr 2021 11:13:29 +0200
Message-Id: <2ffcefe0b2c44cb5d392c4cd095da0f9b754cdc7.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch issues:

CHECK: Using comparison to true is error prone
21: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:38:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
36: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:50:
+		if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
47: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:59:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
60: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:72:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
73: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:83:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
86: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:120:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
93: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:124:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
101: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:129:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
108: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:133:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
121: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:149:
+	if (padapter->bSurpriseRemoved == true)

CHECK: Using comparison to true is error prone
130: FILE: drivers/staging/rtl8723bs/core/rtw_eeprom.c:155:
+	if (padapter->bSurpriseRemoved == true)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index 32d5e5b23337..be0eda1604d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -35,7 +35,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
 	u16 x, mask;
 _func_enter_;
 
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	mask = 0x01 << (count - 1);
@@ -47,7 +47,7 @@ _func_enter_;
 		x &= ~_EEDI;
 		if (data & mask)
 			x |= _EEDI;
-		if (padapter->bSurpriseRemoved == true)
+		if (padapter->bSurpriseRemoved)
 			goto out;
 
 		rtw_write8(padapter, EE_9346CR, (u8)x);
@@ -56,7 +56,7 @@ _func_enter_;
 		down_clk(padapter, &x);
 		mask = mask >> 1;
 	} while (mask);
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	x &= ~_EEDI;
@@ -69,7 +69,7 @@ u16 shift_in_bits(_adapter *padapter)
 {
 	u16 x, d = 0, i;
 _func_enter_;
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	x = rtw_read8(padapter, EE_9346CR);
@@ -80,7 +80,7 @@ _func_enter_;
 	for (i = 0; i < 16; i++) {
 		d = d << 1;
 		up_clk(padapter, &x);
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 		x = rtw_read8(padapter, EE_9346CR);
@@ -117,20 +117,20 @@ void eeprom_clean(_adapter *padapter)
 {
 	u16 x;
 _func_enter_;
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	x = rtw_read8(padapter, EE_9346CR);
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	x &= ~(_EECS | _EEDI);
 	rtw_write8(padapter, EE_9346CR, (u8)x);
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	up_clk(padapter, &x);
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	down_clk(padapter, &x);
@@ -146,13 +146,13 @@ u16 eeprom_read16(_adapter *padapter, u16 reg) /*ReadEEprom*/
 
 _func_enter_;
 
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	/* select EEPROM, reset bits, set _EECS*/
 	x = rtw_read8(padapter, EE_9346CR);
 
-	if (padapter->bSurpriseRemoved == true)
+	if (padapter->bSurpriseRemoved)
 		goto out;
 
 	x &= ~(_EEDI | _EEDO | _EESK | _EEM0);
-- 
2.20.1

