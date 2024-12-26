Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912A1D364C
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242590; cv=none; b=KDd5d0Z7lxpxmR39YAOJuWtBwyMOaz2PhU09rxgCND/VMEpkxcEGxyDTXRUDR2xtQmDfFi4DuK8e7GyXB6yA+gdQXpHu/9y2qrC3mBqxQBLbeh1kDUsiytmWuXeamOBaN38cuACzezhBDdMfphfVMbilV2io2Ugjk2KWmZD4aWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242590; c=relaxed/simple;
	bh=lM4F4tNWhI9bXPIjvz5N58CH3ALV+ujeYhLvFQ2TUJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AP88tcdEF5mP+V6Oo1VQM9fdPUFxmpxJRVPlKnBhcSaOteQYA/WLLgX33joq5SSOLDx9bhAJl5HEhvbRsYWeR9duXsqU6iZt8mv/Am8qf9DPxSLm1LC3CvtZ8NDptFQUyb7WTvqdqZRRSEk0A/srcZwMGY1sqNgTeAEGOXLadAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVfuO7dA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVfuO7dA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644db9f3cso9240495ad.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242588; x=1735847388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaMYoJWCSlwYzZZh/EkMcwMBpZjwpcPJiIs7cTJyhsk=;
        b=cVfuO7dA8jxxaINSmqsKJamXW9IMqCycBIlvQy6ckmV7nMXXfYvsO0/KfI9QdRwOzU
         9Ku4DI9Gn1jZaO5ZtLRwF0ugXG2Re6RJgp6+tkHjhZHse3pNwrLYiSDu7yDkc0sKFOIP
         j8fLOEDJEpjRlSW4dEmFv0atag51+eYV0Rpy5Nd2m6ZfQVxcaxU5JEEOiDuAhGAZJKvk
         FgwGTOorldCJyqq27BRz6kfsFbHykMdp4MW3TJmCNbrmLLmI3YdUSafakLd+lXikHbHe
         QS07uNDYq98KBbOchyOtvK30+Cyzl7OA7VCXz9Qj+scyROuoREl8yzhb1HZI818S/x5Y
         /0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242588; x=1735847388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaMYoJWCSlwYzZZh/EkMcwMBpZjwpcPJiIs7cTJyhsk=;
        b=vB/wer6egxvvjpomuzt7pXuWqojMso+XQNyvzPmKATZQD9Rhb0bn6UJIHqi2WmIqcd
         iZOcRVLSHS3dWJJjzB+9cWvSuEH86f7a/TbOlep3K5u3AifpPflBioOUwNvScIiv90Hq
         L5/jIebAQh9qws4aST/d7aeeC18WSks9eR0FWCW4YFbrmRh33brYwJnin5oZjlzvkc+e
         IaEs0FzDSgFrvIQsPZ/JkJNiOMpyOFByFhUA+OC4VZr0btHB4wy40jbgBvMJHyFl54jR
         xUN6vYb0nbzoVKQPToAC7FL6Cs9TRNZjDpQC4Po4qnUe8lxCrNsaupsODujyHiQSL3XO
         B9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzuyH9z13mDoRimeLcJgXhcF3GPtoxLc/GRumV38wmM2nxeuyrnm97688vqUMvMAoiDbA0kWM7IMJH0jXK@lists.linux.dev
X-Gm-Message-State: AOJu0YyLqw9HH72VOqT1A0g4qkeRKHwop6i4S8yDsCOQ7o0IKCjQHvX6
	zOpL2y2lQ+8T/NKlH22wl2HAGe+zLoGtsDHfEJ3kbNh4WkjQAaJ9BJm2dRYqEds=
X-Gm-Gg: ASbGnctbquf+jFsLlOVRm5fPaJdfKZMKgwYvPCl44syz5fyncS3sNJ24mT1L3Nbp6lb
	E4d+CE3G1owOnnT/F7YZ6IPwaZfl4MLbD8Rum85/7sfZ7Ifo2m+69m9bKxygJ88Npch/PjBgqIv
	vFFwEYPidXFG/95cdyMgDIyqCss/asMyHBQTQyfj6fD3ubsbAs0FdF0ugBS3OpXkPWPlSQwMzaY
	sBEgTwdshR+twI50gAyX23/ftUL5iyqJwJ0PXSa44z7WnSfQ6nsa2w=
X-Google-Smtp-Source: AGHT+IFKEXpSh+f0GaZDDZpL0smypeehq7M391fZ2nFcOvkX0+NwgFglxPr3xc4HbKcntFIcmLMPkw==
X-Received: by 2002:a17:902:c408:b0:216:526a:5403 with SMTP id d9443c01a7336-219e6e887dbmr127996065ad.3.1735242588222;
        Thu, 26 Dec 2024 11:49:48 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:47 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 13/15] staging: gpib: ni_usb: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:37 +0530
Message-Id: <20241226193637.241049-14-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usb_register() function can fail and returns an error value which
is not returned. The function gpib_register_driver() can also fail
which can result in semi-registered module.

In case gpib_register_driver() fails unregister the previous usb driver
registering function. Return the error value if gpib_register_driver()
or usb_register() functions fail.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index b7b6fb1be379..f20a23a023d9 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2619,14 +2619,21 @@ static struct usb_driver ni_usb_bus_driver = {
 static int __init ni_usb_init_module(void)
 {
 	int i;
+	int ret = 0;
 
 	pr_info("ni_usb_gpib driver loading\n");
 	for (i = 0; i < MAX_NUM_NI_USB_INTERFACES; i++)
 		ni_usb_driver_interfaces[i] = NULL;
-	usb_register(&ni_usb_bus_driver);
-	gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
 
-	return 0;
+	ret = usb_register(&ni_usb_bus_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
+	if (ret)
+		usb_deregister(&ni_usb_bus_driver);
+
+	return ret;
 }
 
 static void __exit ni_usb_exit_module(void)
-- 
2.34.1

