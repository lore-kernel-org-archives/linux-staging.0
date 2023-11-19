Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532FE570
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIsnpHF1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-408434ce195so10204975e9.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432104; x=1701036904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JW5pjvIHBsT19T4YqQCt3aUKtIVdNobRc7IkJBk4VJ0=;
        b=gIsnpHF1YepqalIJ/qpQ+DMiJd9MyPv4jPEyhWuf05/xT9+2UPnnh2QAaHkTmjnWqr
         zrGiyC5dVU1+DYIEfUg3oS9JKAbLf9Ab4bRlR1NuSLti+I0YPl8LfBEDC7b5616XcMMN
         efXNveN85JtKQQvQhDQ8yH6s1RiMLrg06nwGJtpJFA5tobQ3GflBsJvB2hOibDEDcx1V
         CylgXdPsjSWjVLyc0p2IV1Zyo3zLN+RMSUpSolT0l4t8I/ph8RjAIrjwxmoQFwzO9HjG
         KWX3yO1QkZqaLACR5nS5+Z0dCbetRG0EfaOlVyrb4JkIrA2nGV+/YpY5UQBgCon2ZRHI
         OGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432104; x=1701036904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW5pjvIHBsT19T4YqQCt3aUKtIVdNobRc7IkJBk4VJ0=;
        b=hW/dIeqb7X3hXzA+m4zWZSVRJbCfid0bMCs0cwMbGthWbyVP5pkhIFvk0sR20O0n5t
         A4/tl70YJndGtWvSOgFLjKABpYqHKZICmp2GhHqrNEaFKDKES11p9kVwCC5AixovVd10
         yYKhTHRFDZ+wn2NwyMRSp5bJ/rVVSj3RjypL/RRSMX0GQyUYyFzyDNUeKuYjvEL9R46H
         HWoMRE4htCcOFJ0iHxstHRsnjczqA4gugIjx/dayk/UAk2PIW495Uzny+8KSnto4kQvX
         ffLc5M5zyErYQwaXauBWmWvwAgv0rhU/jiw/W5x48rOldQcq1f07CO8xWPRq8v6VMbrA
         3LoQ==
X-Gm-Message-State: AOJu0YyIrNAboyt0JAXRkMeF7MyV6xpN2SSwfsbjpPhIBI0wYmpK4zNK
	BDXmT2FqkkRTAuMJ1vTxQeo=
X-Google-Smtp-Source: AGHT+IHIvpO45+wS0G8kjwufV8asqnLtzug6h6GjBBG9Nd/wYBm09d8I2YJ+K4i+7aTiV2JdhMaQbw==
X-Received: by 2002:a5d:6510:0:b0:332:c6ae:ea10 with SMTP id x16-20020a5d6510000000b00332c6aeea10mr1035615wru.1.1700432103762;
        Sun, 19 Nov 2023 14:15:03 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0032d886039easm9100269wro.14.2023.11.19.14.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:03 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:02 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] staging: rtl8192e: Remove unused function
 dot11d_reset()
Message-ID: <09306a7f674e0cf1244c47ef8ddfc5ae147124f8.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused function dot11d_reset().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 17 -----------------
 drivers/staging/rtl8192e/dot11d.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 95fb56cb77fc..f0241982c7a8 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -42,20 +42,3 @@ void dot11d_channel_map(struct rtllib_device *ieee)
 	ieee->bss_start_channel = 10;
 }
 EXPORT_SYMBOL(dot11d_channel_map);
-
-void dot11d_reset(struct rtllib_device *ieee)
-{
-	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(ieee);
-	u32 i;
-
-	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
-	memset(dot11d_info->max_tx_power_list, 0xFF, MAX_CHANNEL_NUMBER + 1);
-	for (i = 1; i <= 11; i++)
-		(dot11d_info->channel_map)[i] = 1;
-	for (i = 12; i <= 14; i++)
-		(dot11d_info->channel_map)[i] = 2;
-	dot11d_info->state = DOT11D_STATE_NONE;
-	dot11d_info->country_len = 0;
-	RESET_CIE_WATCHDOG(ieee);
-}
-
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 9e8328af887c..0ca803be3965 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -72,6 +72,5 @@ static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
 
 void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
-void dot11d_reset(struct rtllib_device *dev);
 
 #endif
-- 
2.42.0

