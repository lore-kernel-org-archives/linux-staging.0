Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B42EC541
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403621; cv=none; b=RV3/0Fz/rPyZ8Rr7D0kpe2sW8uzwagMaAPu5TSZZQ9/9vxi2CQgWrJxHKUMcohIofveo7LEA8xJDLU6SaqUxT4qijkUN+jaT12shK5i4oqlPNigBukXkwNQuQptlG2OTUzG9mU/gmNtj53XtUQ70MqTBHxzSR+2TE9HubtzR2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403621; c=relaxed/simple;
	bh=j7yxnf8h+2JT9ZJc+MDeoJm1x+Ixjkh8pfLCkV59BlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/reCrojL/IvdI3l9/HO7ERifCYUopa6N13GM1KnOdyVMTJ9Rc3P+KsGs7JyzfCuVYUCGxtePfsvtpByW2AVnbV6ZkwGf/K4+s81o4g9lkjqkhudW1mpjuUPuy+eps3M0haR2QYfmYY5/Zqp69uZh4kSf27T1AcYC86OB+cmCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c02OBSp1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c02OBSp1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2955623e6faso42731325ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403619; x=1764008419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40ftHNyvGt0UU//dIiejgHUaxmho18NPHFMlv2BK3B4=;
        b=c02OBSp1FFtVjahVvbQpDn7T9Pqw4wUcphU42eRkq973bSgQMAeQmReg/nJGAyeEZv
         7xodQYtEamrbq18tfct4d2AsOqeKF72RRE3i0rCCrIwzkQRGyc/6W1wM6nkEa0j5txTG
         pSNxdfifl57+QGUFKtzcg8yEsdrsRIyIst9jS3l1g7BWkpCYNN1Ckdyt3xC5Yl5LZHcv
         tnM8whA4s2KR+/ld8cshLTLTZqxOeGmQ6Zzes7/zx4f8HHozQPr5XdkRdUmyOq1asFNe
         2vKCV2ikBXoYoSsj6+l7UJ4I9xYBvys1jveINoYrwRiEe4D/FWZrV8M2fC2SXW1+3zV6
         wpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403619; x=1764008419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40ftHNyvGt0UU//dIiejgHUaxmho18NPHFMlv2BK3B4=;
        b=CSeBhLDwx6IWXXU5+AZC3Fz3/fVZxp6BJelwrWE+v8Fwf3XkoAgoQps7vfy7uqVaB1
         SefZxaM/NZEg3+isLN+hAScKIptTge+OdriPwdx9mU6/rorY4jYS5yrkNTJZYcSKiwRQ
         w5MgK45ONBXp2DIVFsiLh1htIbYr9aOogWxEE7yMccfhSpQuQmGNi4a5ic7DU4QrRRd4
         xLa/iXC6+kVhNsjgrH8uuTzbpcDy1CuuJwLYafgdBRcPUZq9qhO0WGa0d5syg8Ja2UQF
         MtA1ynw1EKjjymWfJFdrAc/O1p1SMFMNwKOOiI3TrriL4TE8jqdk/6HNs8oSSUhEb5z/
         NqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTKwh6HUXfGZsP9Lh7sIgzK7JZ8ioJptL/x2BtHFp8SSKW5OH0TRvMHcVHg6qupk7DZzdPgUQCdDDLjTxy@lists.linux.dev
X-Gm-Message-State: AOJu0YyiNPIVjh/IxNGRHB80nY/lJchrRKHf1TKSQzhEM2bHYsszBP80
	+bMCw1ssnGNO3i9B+sPogvWMGwp7r8FrEPgiM5+s7ol33ZJ/DVELgrE7
X-Gm-Gg: ASbGncvTaegfoSrrSl+mRkCm2pRjGDgY6PEufTvdQtannXZHoTjI4ejRFWZeoZVPtfs
	9lKrfKE2UJdEZnU1XyRDF7XaJp3LU9UTGP3Rtd2pHTGD+dII/QabIHJfAM01BnI74SQoTt4JEkf
	O0ZEJsAVzSJb0loaJqjFq1NoeNcpecqQjOEZVlHOK7iCT/GyWO7osi/HKwr8wfZygT4e5aKeAc1
	zcD3S0a/M3DXynPbwqIpsxWpWcqBcuhwvcRt24XPb9s7RR25KVQTA2e4DKCDdGZ+8tazzhleBK3
	245JORwu+ol+rrTZxogxpag+8asa83KJkem9Mtfu3crc+Q19gZiOoyX/4NiiTm31CUVvOSNXPla
	GoUBYpQjKehn4IDjpUexFOWmMwRHuAWOkmvZ23RXQT6Mjf8Jn04cpFoTa9O4luShF+YZEnngumi
	5G7ZSIxajpxgFMdYWhcHNepAVpvg4RQKL8J0sXKwl9GfS+DuI=
X-Google-Smtp-Source: AGHT+IE0KnzPY3MqJ8kJIDZCYQ2VDJ9zxNa+tuMPkEvayegIewOFLVBC1q+5J/+tEzFJMFCy1Ojpkg==
X-Received: by 2002:a17:902:d54f:b0:295:615d:f1d2 with SMTP id d9443c01a7336-2986a752816mr173821305ad.48.1763403619092;
        Mon, 17 Nov 2025 10:20:19 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:18 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 08/13] staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
Date: Mon, 17 Nov 2025 23:48:13 +0530
Message-ID: <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A historical FIXME indicated that this autosuspend call could be removed
once the S2 Loader supported runtime PM. That hardware is no longer
supported and Greybus runtime PM is stable as-is, so the FIXME is
obsolete. Remove it and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 0fb15a60412f..b9e989a99f06 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -208,7 +208,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 
 	greybus_set_drvdata(bundle, fw_core);
 
-	/* FIXME: Remove this after S2 Loader gets runtime PM support */
+	/* Drop runtime PM reference unless the interface disables PM */
 	if (!(bundle->intf->quirks & GB_INTERFACE_QUIRK_NO_PM))
 		gb_pm_runtime_put_autosuspend(bundle);
 
@@ -233,7 +233,7 @@ static void gb_fw_core_disconnect(struct gb_bundle *bundle)
 	struct gb_fw_core *fw_core = greybus_get_drvdata(bundle);
 	int ret;
 
-	/* FIXME: Remove this after S2 Loader gets runtime PM support */
+	/* Get runtime PM reference unless interface disables PM */
 	if (!(bundle->intf->quirks & GB_INTERFACE_QUIRK_NO_PM)) {
 		ret = gb_pm_runtime_get_sync(bundle);
 		if (ret)
-- 
2.51.0

