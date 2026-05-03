Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7B299944
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820045; cv=none; b=GA/Ht94C6cr5oZgcQjyErq5COiDQXXrgERFDRR2auOZ/sNPTNGYlx7SFssNd/138S9sHU1z6muFl9mlIFoSkgHrJNB0JPzWC1C7cvl/5QKI4fNdglLXJCLCO5HurwI9aBzK63QoczJEXzg8TK9z7n+3aNbEeb+Oxbxlc8P1Y6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820045; c=relaxed/simple;
	bh=gToyUiOqohbe5R57VtnsHMFMnf2LQAdLEtnfeGQxFGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVnbhU4slbWznz33zqQ1aGnP2GEXzJkab+DeohSmiuBc9cle/8Z/QYnQB6JSWY0oESw4zt4xQwiYg4bhRdgBf2wcz/c42p/4jbqtmsBrAblJXneF+zPhHeYPY++8uj+lfKJcBniY7dmUJ7ryHBDaQeUxJbY4UWBKCWcJ8NKMJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWXXjWid; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWXXjWid"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so2235352eec.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777820043; x=1778424843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkEsclOu+REOPjmojQS4a/93xHP6wsT//Khs5D3FlxM=;
        b=dWXXjWidfZn+IsT+eVtFmNaOxlwlQifcZx8l5pSB+UJPerCD7yyA5Hljl7dZnt+uN4
         5L7xArMPT1iDezwQq5NXavQLx0WMG0G3AcF2TagZUqCF1O1VZ/KRexL76buSm53VAesr
         2gsUMjFP4R5lwVF9D5b51sBBQGIByBK9K2xTm+B0iDamkclzOjtbXgPdcZslaWlukLvw
         ugYr1rHGMx865fZShfFlDiSG4kZpYYlp5o44ZRV3UQjXeccBvXIPS2V6aEBLEkPy4t05
         B64sx836GgKBaWAwKfh8eOG34THLR3JFi8axR+txvrtle3izxNPAQLfZpvjkA/YgfbTz
         +DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777820043; x=1778424843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkEsclOu+REOPjmojQS4a/93xHP6wsT//Khs5D3FlxM=;
        b=jBsc0hn9ccJ1oAkPPiF12+matBB3iEV2a4mLqwq1kWd9FAyFZSg8z5Zdqb0tBzU0B7
         kFja6TsTI4X3NXlfFWNdm5v9l+mGGAYB0TjhK/PLBUc8CTTFTo0ue4RA8mBCLOLU8//u
         pqvzTfgy68p6stMQu7owErijomzhtPEf9e6RDZCbij2Lk8W36JJ2oAFKKrs7bPfVhaUu
         9FBD1A5on8h6FDCJkqb7PPxaaW/o6FOWHlF8KfcTxZAJ2pPKrK8VTPfTaIa9yBd7NGfx
         aOK7kR+YRpKBGgvXJhOyOvmDjkiknlxJCZWBAeVJytQihhBqzetP4kRtbRFZCdeC0FHf
         +mIw==
X-Forwarded-Encrypted: i=1; AFNElJ9SawNuIx/+eljZazt06PuZy1kpmXRAegekDbDE29mWd1S3fWV76u6HkihpFH6ieEF+h6kzizzmG3ieZ50R@lists.linux.dev
X-Gm-Message-State: AOJu0YxkIv/ves4fO35jciFHtv9+FzUgDCaPIie4P8T29GFsVp5qk59M
	tEvxryC5yETZliVXPNgwJySta3TVgCXA2IvCMUBCkZBq30bMwTwqffCo
X-Gm-Gg: AeBDieumZ2eoFUzqQwSipDmk5xko8372lWtRWSGXFsOC6EbLMlyCD0mH4bs95iDyEiH
	6To1SUbCIrItpZOMuM/6M5nPLOJNulrqFzQRv2v8JXcP3OrkLtkcN3BE4OxINoUlNtqCtyXtPLR
	e/52rA0KD9o3yCzKzw1eOe1fZJx6yOS8HgkyF/oa6J85YY4k7rmWJrRBHBaMsNyjAboPRhLHwN1
	9NT5Y29TqvtuZu3eaP7aJCxpb/zGtGR7nbe5SICczsh+HftBsskSUEeHFGeEgnfRVHn8UypPpje
	wGqWvcyfpjVsk8cpQuQ41vIQhNNmORAUak71g5Oa1/zYfvp+vcayBZZqkt4jFjTTRl7BR3TMvIZ
	0ZqZOJ6s4IuO0dw3hSVjtm/jDP1jDplcHJQoMj5npTPLuhecAZ+aZVgXDMAmjRJziPX0/Qr8NPV
	c65l76cRKDs4jgB8Tl6JtOe0uta4dconPAd6d7H/uvHT5vMAY1aGcxOQ45IPpZVWS1g4SjhcCdD
	FLj3zt225bzc7vkadnO5Q==
X-Received: by 2002:a05:7300:fd0e:b0:2f2:5726:db4e with SMTP id 5a478bee46e88-2f25726e488mr69486eec.18.1777820043065;
        Sun, 03 May 2026 07:54:03 -0700 (PDT)
Received: from aidan-cachyPC ([8.3.93.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bf67a3dsm12534544eec.27.2026.05.03.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:54:02 -0700 (PDT)
From: Aidan Russell <aidanlrussell@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aidan Russell <aidanlrussell@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix spelling mistakes in comments
Date: Sun,  3 May 2026 07:53:46 -0700
Message-ID: <20260503145346.10791-1-aidanlrussell@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several spelling mistakes in comments in the rtl8723bs staging
driver.

No functional changes.

Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>
---

Changes in v2:
 * Limit patch to spelling-only comment edits.
 * Drop unrelated comment formatting

 drivers/staging/rtl8723bs/core/rtw_cmd.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 72d5905a48e9..eca1a5bc79be 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1650,7 +1650,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	return res;
 }
 
-/* dont call R/W in this function, beucase SDIO interrupt have claim host */
+/* dont call R/W in this function, because SDIO interrupt have claim host */
 /* or deadlock will happen and cause special-systemserver-died in android */
 u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3ecf4f979c03..7a6bd87c8d08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1378,7 +1378,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		u16 media_status;
 
 		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
-		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
+		/* for STA, AP, ADHOC mode, report disconnect status to FW */
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..ca1cb58fc801 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -576,7 +576,7 @@ void LPS_Leave_check(struct adapter *padapter)
  *
  * This will be called when CPWM interrupt is up.
  *
- * using to update cpwn of drv; and drv willl make a decision to up or down pwr level
+ * using to update cpwn of drv; and drv will make a decision to up or down pwr level
  */
 void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index dba146b696e0..a21aa2964a6b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -726,7 +726,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 			}
 		}
 
-		/* for parsing ICMP pakcets */
+		/* for parsing ICMP packets */
 		{
 			struct iphdr *piphdr = (struct iphdr *)tmp;
 
@@ -1358,7 +1358,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			/* set final tx command size */
 			pattrib->last_txcmdsz = pattrib->pktlen;
 
-			/* set protected bit must be beofre SW encrypt */
+			/* set protected bit must be before SW encrypt */
 			SetPrivacy(mem_start);
 			/* software encrypt */
 			xmitframe_swencrypt(padapter, pxmitframe);
-- 
2.54.0

