Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD81CEAD1
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242586; cv=none; b=ZEEqYFSPPYnSHH6dMe0nochWnWmlSp7+IkBg7pC2Q5nUD2TcAr7Q1V9P57fYA8e7FAhRdQ4MwT0elUL4m3gsLIm3Xn1ZBkym1mq4a3E6vtOe7GhU40TIHdHJTRymbrOSIxC+YVLFhaMfEiRHrH6NAHY8a16/QIzkn+GNArBQEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242586; c=relaxed/simple;
	bh=C1m2qIRcVhbyiBfPZcibOHclNLGXibt0YYCUhqw/+Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYGz5LK4sZFclYvP/nTvWKCniYElvZdzZpX3YUymQ3JnV9TCvo22JAXFih8aDzAXYJFQCxZ66HS2632duEoDCHt0OsjDasj/zG8YhzDWxxG/6gK5mANAOjOoig6MWurWF2GgZEH+I9bvAXFYywwmCIJAA0qGW6c3jQEd0ZHGJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw6jkvRU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw6jkvRU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21a0374a1fcso5057705ad.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242584; x=1735847384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4COc1F2QXFTwXqtvB4VWYIZTqsLaKCmT1xH03KuvEOg=;
        b=Cw6jkvRUPjK34SY2iwW1BrNY2wjOkHfsfVKoAbdFDHdXelHk8pB5SWc8LMzfVO3rN9
         hAl+81Ig4WiHdbn/+1Dm+3e3yBBWVl8hwOVghNolabKdVBziGDjvmzrHDxFe/a4E2+5+
         55obPaXkdCjnfbQVHatj6mvfoM+3LBkwRMAufVNEAF6evuuq+cNmul8A3VuyzDuN97WC
         NiRp0/a2CFcDKeHLV9rhqTfppCk1uuKEcDpnRU4voolSzIK3tTtcFElkC9k/WOLzkdQS
         Hch+CFkYrfCxnc6HkksTQzrABP6mvpeUCnlDqmGsmU5D1ZuVo/kkgT+h/ncTMfi43bOe
         Z1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242584; x=1735847384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4COc1F2QXFTwXqtvB4VWYIZTqsLaKCmT1xH03KuvEOg=;
        b=ETW9JqbpmVJ9jpGPfnWR5dbb0Tfp818vQN3OQpZx5UfB1DvIPMFc3khBannRWNe07f
         WIjy2dLvD2aP6irHwlFE9ebrl6gl7ZgauWBiuz4W7qy5y5IlY1BRYv5bs9rHjoUnXcHQ
         hxeECCIXwBm9T7x836GS/5T8ynbxY5SRnM+4MqgoQ0cXMY1laHEPU1xSUagAGvyUtqu7
         VrmUXbYaQL5Sr+phcFvQbgh/9J5NyAaI8Atm4p+P65wmAbrWFtleHp5Jy16P3BOhdkv3
         l8KnbYqCHuRRk4wQShlCVc0FCthyrjutO3Jz8KatN6iOvCjoQJpZ8Y6YKPkgFAeMzfq0
         bSQg==
X-Forwarded-Encrypted: i=1; AJvYcCX5SALj8O1UfQNTHDi4vomU89y5uA7Vy3J30XDlR2+LrVsRCPSVSF7BNBSPV1Kh3OLkrtXOLtpCUrro4bIt@lists.linux.dev
X-Gm-Message-State: AOJu0YyRADIv03rskGaKmdJY0bEFpJKMUmjWLLIlq9tm83LR2LpT5WFU
	uqD57W6nnlZxPmsaKrYYIrpkOsXmatjdeEG9Rfb5nrYWZ7746XOk
X-Gm-Gg: ASbGnctuC6X8qK6Z25/4h5W8ERIQ8rrXuToCnRxt0TzpfAPfU/n0YoA2VDF8im1oEsD
	RBCRAFPT7FFPx2Fp1hMzWYDJps/qwdiH+wyQfAXeRxsvBn2XqXDQJZnP5dRgZR5U+Pxuf5U6DpQ
	EIjdFRsAkCrXBH8ZrjFfBaDSa7XQAq/zut6u4tE4E8/0MiwWGOpdUWEx8/7f/JYdySNiDxAlhK1
	LoCe+Rpnh8HCFsR2C5/AsLUGD8HpFAfjnl2HXRUOpmrHU2glBZROgI=
X-Google-Smtp-Source: AGHT+IG17vjbgwMDwKMBDYcO5TCiXPz5GHom6B27qRh7AqF7BUvk2ZTdW0B7Pdz++QoHgNIV/bSGJg==
X-Received: by 2002:a05:6a21:999e:b0:1e1:94e6:db0f with SMTP id adf61e73a8af0-1e5e07f182fmr14783323637.8.1735242584397;
        Thu, 26 Dec 2024 11:49:44 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:44 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 12/15] staging: gpib: lpvo_usb: Return error value from gpib_register_driver()
Date: Fri, 27 Dec 2024 01:06:36 +0530
Message-Id: <20241226193637.241049-13-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 796c3a5be545..d8af811c75ca 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1181,7 +1181,9 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 		return rv;
 
 	if (!assigned_usb_minors) {
-		gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		rv = gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		if (rv)
+			goto exit;
 	} else {
 		/* check if minor is already registered - maybe useless, but if
 		 *  it happens the code is inconsistent somewhere
-- 
2.34.1

