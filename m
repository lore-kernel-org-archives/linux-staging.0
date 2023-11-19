Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F20719BD8
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkUb/SDA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso894235f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432098; x=1701036898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBka6fetHrkhQ8h4bMJLkDq8qXCW9llZuCFqV0CRlrc=;
        b=FkUb/SDAR7Ac8NxdOMd0uRAwc7Hcez/OsddvWF9Xo5S9TrwmwT6wJ69fVVCUP3NZxC
         XwVYa7XRybUrfIYQ3YTVw0pJwMm+7lWAWD1gACWx9c/hAcWUqdU8ah4lpBS97MbKBpS7
         irlAiIDgubqWKeTQOGeUmk9wSwnYoK9OY6BpRmj9Kp1PZzLZ0GLC8eUAFUJs4s/5/s8l
         yxr6MPNmqrbij0qzz5oeQSgj53rGoUZjkOd8NsyiltxAAlD484bpi4za5mDlCYGT1RAf
         FCHuOH/G9pueOHrlSgyl5s6/NDtdUiHgQpOztec2nA7wdNOAIPb8MAHtH6UyMbR4UnBW
         /flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432098; x=1701036898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBka6fetHrkhQ8h4bMJLkDq8qXCW9llZuCFqV0CRlrc=;
        b=IU+sKn5bgO157f4yPjsDxY8c0/QcS6zZ/xqN23m8BqsjN17LssmZ1yEMkp2f4hlJtI
         xa6e0BHe2VZ4IDD9o3BVtB/oztm64oqGmT0xCs3F6vZO6VhRVpu1wfu0ck1HImU9qH+n
         eEkg71+0W4VjeK4au2XAYZhOswBk6ZZ8x4EOyJbTPGgTyzZCuxDTSlK6X7q2qgvAASXz
         QGMkz8OjLvLeyKt/2EZcOjTwSOQ/3b1oGq5dvjmi/a8zNfQDA2G3Zaua4Bj8KCv7beJu
         i/3jLu1tGFE86RHl22+uq5TeSnTZBeGky4eb48Plk77IW4BUFccuTxvUicGfKgp4g2ZP
         8e/A==
X-Gm-Message-State: AOJu0Yway0tUsmw6cZJZ2qxhTjfWbbaN3JCEUGbzFVyVeRXE7qOaliB+
	mteSdk4qjaVQQNZzzyIay4M=
X-Google-Smtp-Source: AGHT+IG7BIz+JWuX8uDz8IATgnBHiVah94Is2WPvUwa5m1JBHtiLYc1gqqSYBCNEYA7WhQA7EVCsTA==
X-Received: by 2002:a05:600c:1c10:b0:3fe:21a6:a18 with SMTP id j16-20020a05600c1c1000b003fe21a60a18mr4882616wms.3.1700432097833;
        Sun, 19 Nov 2023 14:14:57 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id x18-20020a05600c421200b00406443c8b4fsm15254224wmh.19.2023.11.19.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:14:57 -0800 (PST)
Date: Sun, 19 Nov 2023 23:14:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] staging: rtl8192e: Remove unused function
 dot11d_scan_complete()
Message-ID: <065a8223b80730360ee3223067ee612737e777a7.1700431464.git.philipp.g.hortmann@gmail.com>
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

Remove unused function dot11d_scan_complete().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 15 ---------------
 drivers/staging/rtl8192e/dot11d.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 9eb941326bc8..95fb56cb77fc 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -59,18 +59,3 @@ void dot11d_reset(struct rtllib_device *ieee)
 	RESET_CIE_WATCHDOG(ieee);
 }
 
-void dot11d_scan_complete(struct rtllib_device *dev)
-{
-	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(dev);
-
-	switch (dot11d_info->state) {
-	case DOT11D_STATE_LEARNED:
-		dot11d_info->state = DOT11D_STATE_DONE;
-		break;
-	case DOT11D_STATE_DONE:
-		dot11d_reset(dev);
-		break;
-	case DOT11D_STATE_NONE:
-		break;
-	}
-}
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index c28067510653..9e8328af887c 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -73,6 +73,5 @@ static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
 void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
 void dot11d_reset(struct rtllib_device *dev);
-void dot11d_scan_complete(struct rtllib_device *dev);
 
 #endif
-- 
2.42.0

