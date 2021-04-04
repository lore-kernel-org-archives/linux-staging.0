Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86431259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x16so8769243wrn.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wM65qpTGPdNiE6psQoUXh4NGVD1kefhM3YwIRcpdY1c=;
        b=lIBrj6AgrPBn0ZRbyCYCmXFADDWbWXJn5FXQacv8O8gmVSE5F4LHcvHjZ37YnXRW3P
         UY/42ktc2sqVVfFxwM90Rs0JBqyx3+EyWgYveJiJPsGFbsMI68Az1zY68bAoOsAATWPF
         v40D3qvqKmhHnDAE9XYrOFHeOSCZsLyJ6IHqs6+BWuY2h1Kj/hSlCV0N07rfMLqvB6pc
         V+bDy5mRXwB+8knxLTMsRZLGcEaLkAQ0v26fkOpNvAJecaNvTGt40dcjWYzUZRJEol6+
         L9IMcpwAy8fcFojpcq2WwAA1NxuOEtXcrbPZ4bxChn+zbdKxz3dNkOdjI72us8QB5L3W
         NZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wM65qpTGPdNiE6psQoUXh4NGVD1kefhM3YwIRcpdY1c=;
        b=rQX7pCgCzNGFlBTs3wkImg76FTlcg2SagxuRluZ9V64eNsaCwWXtrqMpjwRNN1AJX9
         elFShRU74NAdunoPJldAUtZHicbUViarJrR4IUjR957G7Mcfqw7H2RY8/gLVFdbLMGqb
         KxBspjpQaKIXjDXpo7tsVX9AfKkr0Zby7fBi/80CIf3tcd7dUSMWGRuogmmQ6XJ2CT2F
         eXxOIRj2hJciw5oK5vgaA3SvQ53WF7CJ32RNNYmtrv6QMdBGJJkLQ8ro6mdqhnP+V36U
         0/jTdzNAyfTOq8UgxzJMidEb/oUDOMKNABBHv8gpd/yMtVh0lHQ2Wb5dID9EWubZd5S8
         Grqw==
X-Gm-Message-State: AOAM532rWDNkaJWL4wtmkegdtCdXDWyu8aO5qfIaxS1DzwpxvNJ1/ivj
	kxd7qnc8KNhT5GH3zTXTp+M=
X-Google-Smtp-Source: ABdhPJzXqu5WcnjmwoXzE4/dcq+rpVirqsxuJmY7oMzLgeUVe8BRX0DfhNiITvqcMhNpTZQTI5kIKw==
X-Received: by 2002:a5d:420f:: with SMTP id n15mr1211762wrq.186.1617545402066;
        Sun, 04 Apr 2021 07:10:02 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id r1sm29375522wrj.63.2021.04.04.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 07/30] staging: rtl8723bs: fix error prone if conditions in core/rtw_eeprom.c
Date: Sun,  4 Apr 2021 16:09:23 +0200
Message-Id: <2ffcefe0b2c44cb5d392c4cd095da0f9b754cdc7.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

