Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD01798F
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367177; cv=none; b=Q0DTuVEjL8QX3MfO/hx2xZh6YU0qKtfYc9O2/X9ZTNtlAHL6CiQ+Rrpa2kE4W3qBscQU9ha2k1qQFJpWY/4MxjhxaDdRct2WZteKKSql1V/pXP84VJhprk+Ot0KahMk6oHEMSHM2k30LagBOqATd2H79EnQoUE3kE0YEVrbiYQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367177; c=relaxed/simple;
	bh=TBVYFpV7cuy2w7egBvciJ32zIp9MVKJVB1lUfRY5u1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BFavv+o5HduoLGnX6CSh7Nf2XkcLiOC8YamcwEoIvlyFxcKUE6T/i3jA9fyxQlmLaQsxHmwvO2Y9Ja7FHq8my8V79ytwx2HW18Jop7aIXoRRHtwJZ9sWnlQqrjXD5XpPKDXAYUGlHgAcc8nBkrSWetfQsLeqElqsudrrv5BeMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK4AeSi2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK4AeSi2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216325f516fso10044475ad.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367175; x=1735971975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMvlHwoBXtaUcCMp+BA71aUYAVaPu0Te8Yx9Uj0Yv1c=;
        b=jK4AeSi2W00optusYjC4OBFfqbujX9+w3zxkSxDB/xDhQtbBmHFDhPMpjkDv7398oC
         hJpX1n+5BiBMH3PUDP6+OUjR4URKkusVhfeyU0s44VLYopPR5E3S1KIz5G+GqlmYJQlM
         9z5phhnXRAPqOQSfegxf5uVo4LnIbh89vrpdBPndng9bawu6RIkjI7sP9y/GTVHos5tX
         wDm7m3kfxQZvm12RjDjEqlUZYcLuelnEdZdiZ/uWwEcpmGFeDxZWQ2zifefLIZ866O5f
         QtQx+xuD+nthH16S9zTkiORJQ3eFnNsvrTuuzoYLm3faZtqJ2Yul2q4o7azUnNbQJegD
         QWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367175; x=1735971975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMvlHwoBXtaUcCMp+BA71aUYAVaPu0Te8Yx9Uj0Yv1c=;
        b=RqqDtYsWpJkwQqtidvLylyAqRA1Goh3H0x8JcvNrbnsczqcDPeXD3lTdCG16hNjR3y
         Sc3bMwju3BiF9hjgg55XSYNfM492tVByzjLz7HWJ+Mili2cwo01TXdsWDvdvmS0TS23p
         P60rTaQLnsN7qA24iG6HBqVCVm5PCvjgBYVR7OlYDnTHtACtzZAoOXTWGSxOeCqV9t+a
         q3dzxNmz8BSvW7wFf3kcjV+uMQhWr/bqeIahBzgcDST2k2uwSOig6kHmLA9Y8XW08Aez
         8N6VvUASHtVStJMgNPTffyjBTWz63M0iMPB+uTte8BftgwruB9MHfD+0J8lgmdJaIU4w
         rSGA==
X-Forwarded-Encrypted: i=1; AJvYcCWeU7RjlySQnQpm5zPjA7pIs0lypTU9LqB7PvRB0ECvuS0E4aEzHzPm5+5j3cVm6uHnsrmWGavpBVCq3Jjs@lists.linux.dev
X-Gm-Message-State: AOJu0YwdDxXq8SLGa9vHdCXlrvOoX0Ni7x35ldGXKOvxuHah2nZQNOYa
	TQR5Tp6B/j9tTaGn5lcVkdltzkplX3zcThP7c9qU2tVBwk3e514v
X-Gm-Gg: ASbGncuo83hT79Uzn8TC965DCSTOjw4j34T8/a1EpfdqiJ91cuDLe1FRwVmWzxR94lA
	Csye6hlhIfHCE8bFMMcIfxA4s6mXpQt9cAZxXk32vbX0vSh1g3DmP+xAIUl9Eg7otSANLZxiG1r
	UrO7jB1mvBwHsnfpX+x+nzuhcaS/CMO5ugnj+jS4WFNnt/X8H9jq8fANCh5yN+hUtG41CbGNcgN
	w+Q+/XXT9tixNgquKcct1VM2lz2Lmtu5z3KFYm2O9HUglE93hUu2/w=
X-Google-Smtp-Source: AGHT+IEH02MYFNkRcbTlFsFpAAQB5oNw7mtzW6LSj7AlNDmYrwGltH4vFm26DtKiLuNh9r4/ZJTTMA==
X-Received: by 2002:a17:902:f644:b0:215:94ef:6071 with SMTP id d9443c01a7336-219e6f2707amr148339295ad.14.1735367175313;
        Fri, 27 Dec 2024 22:26:15 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:15 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 13/15] staging: gpib: ni_usb: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:38:01 +0530
Message-Id: <20241228060800.107653-14-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index b7b6fb1be379..c21e35bef3ea 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2619,13 +2619,24 @@ static struct usb_driver ni_usb_bus_driver = {
 static int __init ni_usb_init_module(void)
 {
 	int i;
+	int ret;
 
-	pr_info("ni_usb_gpib driver loading\n");
 	for (i = 0; i < MAX_NUM_NI_USB_INTERFACES; i++)
 		ni_usb_driver_interfaces[i] = NULL;
-	usb_register(&ni_usb_bus_driver);
-	gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
 
+	ret = usb_register(&ni_usb_bus_driver);
+	if (ret) {
+		pr_err("ni_usb_gpib: usb_register failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ni_usb: gpib_register_driver failed\n");
+		return ret;
+	}
+
+	pr_info("ni_usb: module init is complete\n");
 	return 0;
 }
 
-- 
2.34.1

