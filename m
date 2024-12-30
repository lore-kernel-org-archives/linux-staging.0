Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D21B21A0
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585817; cv=none; b=DHnukMT0Aganwczja2EfiJERTamt6ZPvWt03dhclrjYXrBG8zSfeWhBbz8cGfXu2wHcmJqMAf02puqA4iPmGj7F0JTpnxxwOXLkDmjENDWm9JZq4JWD10bE6nS2pOceBPG+bvAsto5NsVGY/eC+uEfe6g89NmZBFmy03Oo9DEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585817; c=relaxed/simple;
	bh=YMqc4H3fgdJVkppKOUIV9sXcrnbeGdblny71kyRvo4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XMr7MhZRYN+jfLM5wgGCxFnHBro40ctqdo3C4ppAUWSOk3ICxevbdML5OUZ2GxAqsrf35CU1A0sKGwRONpnsuK+NJLrM9zgIceRCy/i9NnJ5PcjBQ/lGcQZEXTfJLawYieE0W4u0zyMcBwPabm9B8sBrgnYRvdRYCFZDi3iK9ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6gj3tR9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6gj3tR9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2161d4b820bso11910095ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585815; x=1736190615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2sVOBVrwEeE+JJiB+YOksNrh6jAvMviZPje1pPppbw=;
        b=S6gj3tR94k7e8HT35fkoIR4CzQ6svLZHHu2TFz19Ikl/iYwNmN2an8OF0949+YSH7h
         YGojoc5igmc8jTI0vHYNn3jZlq64kLLeWUMObLdjqpvy7Kw09YKsW0eFD7UyC8H3gAVj
         SNjCTi319xs++WLbguk8Fkzu/otLFLQyigFvFoV9imlU5v/TqGXHh79rLTP7FSn3G5I+
         pAKiSvrlygsY8reAk/r/sxdgC5zN8S0WJfW7R0sMXQhGbCvNtqv6sZq8JovZg87g/IHO
         pJz0hKiYo30E/aop2bNyt+GD+2yV4HSDTaYa40grJDM5T7fH2AKvgoOaOX62rnZ9ulXx
         rJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585815; x=1736190615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2sVOBVrwEeE+JJiB+YOksNrh6jAvMviZPje1pPppbw=;
        b=hlqzuFsZQN9RHLVdVCQKWZPJEK0gVwEYTdmSDO2QkZUM+GMdZF+sJ2bwmsi1+BiV8F
         +30EZ2b6h2vq6j/SvrqcY3EATofIG6XB0tlhabfJ9lHkW45VkqoLKnYkNM+vQTm4aacD
         /kJSnBkCfDghdM9JULeH5WlBPhiDcKcah0+Q8ELJBX7XEnaJ1NQhQAqOk27YamrrPq5M
         Cfcm5+m2v8cF5oDTHt/49i9AWSz90rxCDQL7v+ajErHNpzcBPLBSqasa0gfgQANYMkhZ
         qgjYaPDshWATI7YNqWiQqRv2zZ6DQsbOEbT2iXo80xTdMvpeTO/zzr50vIssyzvSs18v
         b3zw==
X-Forwarded-Encrypted: i=1; AJvYcCXlN+Ab97JPskK1C1UnHw0VKtvXsI3BSEhR8+X0QDdCFE6TMI7TguDI6UW6kx9tby/1OpJ9hQwXC5sI2QeK@lists.linux.dev
X-Gm-Message-State: AOJu0YxMzfagqb4UEC0/e+hOrfg374FtuD31UpXUQj+VTBQv6x51RLZT
	Qly1mXTS51lbGKv8DFTsfxQezevt5VuFYSm1s71I5h5wS/2xWNT8XRzL0w==
X-Gm-Gg: ASbGncsq2Is/fd3hVgL2EyQwfmBZt1dRQAl2NiywjthoLMkIeZ6aPAmJ190vokK35JJ
	skEYYolkL031/5lnM61CpIa0yjdqztKYS3bHtanfMJwqkmYCphlk1zBCC1Kb8wQMPh7tPxdBoVI
	5BwAiS4ymoLcQ4um/n72C1LXE8ZYj/i73jxfMvE4f7EFyPQB6QuQihAloCPo8+CR+tgiOdj23qN
	DzV1q5z4yO4+0JogPqJSSN0Cwk92lMYtTdXRYe6SBcAwbx5V88H7zA=
X-Google-Smtp-Source: AGHT+IHnajyFEDG6mFVW8FWpXBUQF0MsBPPHjjNZiErai7Shi6fRF4Zdw2iiQMPTdQCda6s1ZqNVPg==
X-Received: by 2002:a17:902:c951:b0:216:1d5a:f348 with SMTP id d9443c01a7336-219e6f09036mr199112775ad.11.1735585815438;
        Mon, 30 Dec 2024 11:10:15 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:15 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 13/15] staging: gpib: ni_usb: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:33 +0530
Message-Id: <20241230185633.175690-14-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
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
or usb_register() functions fail. Add pr_err() statements indicating the
fail and error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index b7b6fb1be379..b1b9598c3b33 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2619,12 +2619,23 @@ static struct usb_driver ni_usb_bus_driver = {
 static int __init ni_usb_init_module(void)
 {
 	int i;
+	int ret;
 
 	pr_info("ni_usb_gpib driver loading\n");
 	for (i = 0; i < MAX_NUM_NI_USB_INTERFACES; i++)
 		ni_usb_driver_interfaces[i] = NULL;
-	usb_register(&ni_usb_bus_driver);
-	gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
+
+	ret = usb_register(&ni_usb_bus_driver);
+	if (ret) {
+		pr_err("ni_usb_gpib: usb_register failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ni_usb_gpib: gpib_register_driver failed: error = %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

