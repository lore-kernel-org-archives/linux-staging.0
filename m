Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17170
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so1102863wmd.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xHVNroS4jnPAVsDrnq4XBK53RftcSyx4S9WYDjBEhBY=;
        b=iuTv/gKlNBodt+MNFK4LDwPudDGBzY0Eh1jE8T4fmuez95ZGwUNi6QPMxheTMFrieF
         X56mfIXBO8TAvwzRXIQfkzw+acGOdsyRWoi2bANHtI2oOHNTuFDbCY2DDTBXQfWcpVpr
         QbQkc2MJFqkFUKpiyI6evNg9zwQFJbG2d725R4EuVroJSCjhOxwEcGVM4BaDzR5DgwqK
         RuZ4wkVNcv4pnCZl5UVINUwkk0Bn02voxxBDYj+V0XamaBHPeHVbrGdAekmW0oZZAFT8
         S3An5dBJjVLhg7Osnl5DJRRoOKEAxlrVf0DJK3JgoulLSimpJRNBrph0c2bBnzvS1pyZ
         Yk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xHVNroS4jnPAVsDrnq4XBK53RftcSyx4S9WYDjBEhBY=;
        b=gmKiHyCyYOx4rrYB/3pwM8ieFL62NWDnieo80PQb7EdCUxW6tL/169A7JUoxD0Rz+C
         uxYN08BdgGMD2R9uTmwrMS7okgxl5Pv/UT5ZnkeZOSt3n/fMc0WIgRTr8xpZoTg5eAaL
         xsQTkDQ/Jz1AYTv+mWiv+Syg/iyLrtTTrWXADGHhxUZb9I80PyL33tKibaQcsvWm+8zN
         QdIXckkdaUG6i4ZnP6y5lDI91EjDZGXPVCTPpUIaeHuKIrLBJDMzutMf2zvIaQyNlmrk
         qBC6j+cD+VbubuaGPcEuh74mPwJkt6nqCR00IA8lCAR26g98MsnIswDXDwkLRkypiyLp
         NRaw==
X-Gm-Message-State: AOAM533avq0oUYAjVWT2CQ2UJ9sxHfYCiIPrTWhLltlp76tgrSl0NdnP
	7Vk1C/CLyXl3ifZyZy6tbDY=
X-Google-Smtp-Source: ABdhPJy6R+/X3KHmUX4bYjhfeEUxuFXi9cbxtwfffte3IGyH/uzCWJEoDULglCDUbkaqSLRGg82mNQ==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr2750322wmi.28.1616589907123;
        Wed, 24 Mar 2021 05:45:07 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:06 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
Date: Wed, 24 Mar 2021 13:44:45 +0100
Message-Id: <20210324124456.25221-23-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum name in
include/HalPwrSeqCmd.h:

	enum pwrseq_cmd_delay_unit

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
index ba9b033685ec..e30071935d27 100644
--- a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
+++ b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
@@ -82,7 +82,7 @@
 #define	PWR_CUT_ALL_MSK			0xFF
 
 
-enum pwrseq_cmd_delay_unit {
+enum {
 	PWRSEQ_DELAY_US,
 	PWRSEQ_DELAY_MS,
 };
-- 
2.30.2

