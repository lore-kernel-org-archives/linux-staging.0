Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348EB25CC42
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355799; cv=none; b=itY/jxSydCPr5TBrnPxFPFTqSEQD2iyZkMcOoeau0ZFgA/MKn35s+qSjotCX02dFVqE06JBbqbpgGZMnDqF7XRwSiPwTpbY0W9R9KPhEHHYWuGVw5H8/6v84LyopyYMBUMwe6YT3WyLRUjGzoBE0Bro/Wa422f6nESNqxf08e8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355799; c=relaxed/simple;
	bh=ywlYCY8zTz9DvIxTFUwFyz0DawpDzD+jUIkGQoNHBXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5lthlIYCiqdjThUHnPXH4KcVLukdon8QGyeglnjcuDVIj4QuIgmcIoNQnM+fuEal892qf+6e+9F40IlIFQ/c4l60fLvRhRDqizazhDObYE/Csj/IKdVGMoyYa4qSqxY++y7kiRz/X37dufSg+3aZ9OzQIz6jFPXbCdOirDRVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9fp99tS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9fp99tS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf214200so24597665e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751355794; x=1751960594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nu+bTpGkebl5ACFwafhyVcbt4recZ+wksormxu6a4Ts=;
        b=c9fp99tSDQzqwKuagisWeewht2Hiuvdn4e0YqNE4i9KVd/M/aK+b4ygaJ2KVFXmadj
         fY0IPnYnGZGiou5ow3wzvY5EgFygm6q8ILcsQUQGtip39575bGlvyMetJhYJUsVaxoNi
         bxhlvbapeSclLwgfq4alGcJf4KuR2feKIjwUhLaBNVWvZ0Ajfr1InSbhK/g0eBu0zAnK
         Xk65Uml8NQREWUzbnb0015QWm+e6v2eP/IltZSvzifTLDdbpjcRLn/GG1XKKzcLBMGJy
         /dJCAb9mr8XJpQ9/NED4HnvdxTBMkHNOdbXXQQVaX6BmsGm+aQ7CHBsYkxGyO+iEn+dD
         HQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355794; x=1751960594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nu+bTpGkebl5ACFwafhyVcbt4recZ+wksormxu6a4Ts=;
        b=p1OZ7x9MhfySKvDouWOB8hxsW61jZt3U3SCF+jnYlPAfXi6Be/NZivY6qoDK/3MLRa
         9N7On4mKaS0oq+plxeIOTnCQaxZui8SZkjhVjFlUseUkSBseWf37FwVXltzysqfrke60
         3GKKmd1TmS2mu3K4QDr5UbTSUvd5naDwgezED5PRIgiXQfabKtp3D3GqDjSyq86WrxiA
         zAQcIh7VAHgoNo0nRnQM8FEqLm08ynbeatT27xSSkaIeYq3oonduf/E0uG6dSS4NHHIF
         2xBT8vR+J1H+90CkCFf8vOZPeHDpLiyA+yd94HgZ1hM0+H4SjYhpaOmLNljQdcy+DXIr
         G9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNYSIGa3V4PNB9MfuvKJdA2SpRITYPrajS7atSxei9H19NoDYePoTiveyl+jrt6OPewCdMsZKMt+2A97PW@lists.linux.dev
X-Gm-Message-State: AOJu0YyV4icuZdcjl8c0zv44pfK1ctstf6DTTFOFmDpBloDy+5hS4+jR
	6h4fWFEO3F3nfJv6u8Vc2hCgbjpcGfUfiukFYpSOWL7AkVY6J9UgO4W+
X-Gm-Gg: ASbGncuKuNId9Nflx47mmg6SLAiySR5ad8CrCSX9235gj1oa73p9t3/SMgRZxnurS4S
	cWXwizMXmhD6r6oPwdwymIttsP9vOhigtHbJFPzD6jnT9KqvxrQbApM2CuI9UHfIxUF/1wQh7Nh
	7aIU+pfqDfwVsQfJ0nGX0hd3q2+oR5n3YH9ps0mIuKe0OTMovHd6SimotEWdrolYfVKggjUwve6
	MySwjsy+GQpjvg6g3AvNvnZzwUXRDB18oeVizDih8LlDxGeGYAGLlIXDgAhxx6TKyHSHatmIDcC
	RmZffnEa0daXK6s/gM1aoR9EE6+Ih7b/CL4ThzS1Xl7RDTmrPQpWCIgkivGDMyAb08z03Esf9AQ
	A0CnYpg==
X-Google-Smtp-Source: AGHT+IGtM2k1LNAWkFlaRdKHCCh6nVOiryJTl99LCdHmhtjL7Ubikj7DlvQfsyaDS637oDfYU+fGeQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr106494505e9.28.1751355794064;
        Tue, 01 Jul 2025 00:43:14 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453883d81besm169850235e9.38.2025.07.01.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:43:13 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: replace magic numbers in rtl8723b_InitBeaconParameters()
Date: Tue,  1 Jul 2025 09:40:49 +0200
Message-ID: <20250701074243.1300186-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Replace hardcoded values in rtl8723b_InitBeaconParameters() with defined constants
TBTT_PROHIBIT_VENDOR_DEFAULT (0x6404) and BCNTCFG_AIFS_MAX (0x660F) for clarity and
maintainability, addressing the TODO comment in the code.

The values were sourced from the following documentation:
- REG_TBTT_PROHIBIT (Offset 0x0540): Bits [15:8] = 0x64 (100ms prohibit time, 1ms units),
  Bits [7:0] = 0x04 (2ms margin, 0.5ms units), as per RTL8723BS Datasheet v1.5,
  Section 7.3.1.5 and RTL8723BS Programming Guide, p. 112.
- REG_BCNTCFG (Offset 0x0510): 0x660F sets max AIFS (0x0F) to prioritize beacon
  transmission, as per RTL8723BS Datasheet v1.5, Section 7.3.1.3.

Hi Dan,

Thank you for your detailed feedback — I truly appreciate it. I tried to contact you
earlier, but it seems my email didn't reach you. This is my first kernel contribution,
and I started by addressing TODO comments, thinking they were straightforward. I now
realize even these changes require deep hardware understanding. I used AI to assist with
parts of the commit message, but I didn't review it thoroughly enough, and I take full
responsibility for the vague comments. I could only find limited references to these
values, and the documentation seems restricted. I apologize for any oversight and
promise to research more carefully in the future. Thank you for your guidance.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..009d9010d72d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,6 +1183,10 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
+#define TBTT_PROHIBIT_VENDOR_DEFAULT  0x6404
+
+#define BCNTCFG_AIFS_MAX  0x660F
+
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
@@ -1197,8 +1201,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_VENDOR_DEFAULT);
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -1207,7 +1210,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_MAX);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.50.0

