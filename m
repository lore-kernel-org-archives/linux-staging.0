Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2D19C575
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585815; cv=none; b=lkQeDmzcS+i21NgN5uUa/GA3NZ/DEarx7suNrchAVNLP/174jofMYEHrupAKfHq2pwc5lAyQ61s28KzYHvrtw91/2tNFT2lhXXDjpS6gTkoSRINmGRkuQohkKW6jeIsqH4MudvGYFZoeChU4+sENtUfaHpwieZBwvtlqjbnajbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585815; c=relaxed/simple;
	bh=bryvN6+ttkW0iQP98mReS5unZVw3gunWkrBDholDReM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TTQ8qBMiop4V9A2J4a7qxba4CXHRwf0OozEh9nkru9t3ABRWUrIChA0M1JAn8Teq3MixwCjhMRdtK95d/OogBMV8W2PslD2UuEMJmlZ1qdUb/dlaZkj53Om3INAlP6aorwTU0vJ7aApIdIXoiVvMowpNUF5h+u7ZBPh9IDeQ+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkHZMiLU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkHZMiLU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2162b5d2e1fso15351315ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585813; x=1736190613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgdsETXzbb58Msi7wLGZzMbq/x8TvmIWWt76a/4RotQ=;
        b=lkHZMiLU1d4YXblhuvmPHCEiL+t95k81GrrJBgNqDIpo/hmRkbgdoh2gd9Lfj2ZvMU
         /9aPYvrRm/LTV0wqQaOmTl8mg+PlnSCsqMhJPTKGodMakWjwVwnfQ1se2A8Kqbquzl9O
         TAjLJOoJPT9Lv+rTTrnuy9vbOhdoaarbd/Q1orJGG4xzuC2wLHhBwek0nOubTujRHZ8R
         ydhVwsUjshKf+k90jUeNksL4g86FFTnGG1nJiXxfkbZLwl99XBnNEaQAPEw83hliVAal
         pHKSBBPF0r5jXnkXmJNjb2PD89RGDepdQZ+M6j8oa9B7Ee83lCRLoutog5zsHdbgCMPs
         iiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585813; x=1736190613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgdsETXzbb58Msi7wLGZzMbq/x8TvmIWWt76a/4RotQ=;
        b=hKMpeTu1hSk/DuoRN9LbPTaicM2meLwXfjYpQhUy2bgcHcMfcHmWVi4nypcKpaE3S2
         JNI+d+ZbYix20RmgRF/pGq+z4A02bgXLH8PmN5J6xl6QnPv2cKkTG9DuZi7xH5iQgXbj
         +V9WsAnLiVBeYO2m/ykc20nopjnXdCESc1ZkGnFUezL0Hfb55TkcZeM1GhB6inpC7wT8
         8ZiYBjDf/ewua1/QBoyPiZHxH2kMmgbmZR6b3goxOxLEXtE8Zx5VrhGG30xAwNTPc+iw
         TH0Gj822UATDBW9GPsy3CWsHiHzx2yX1q/q7eUlpqOv9obgtpA7qQ5SgFTB1EjsVJg4o
         Ey+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXawUea1xpCoRRQQ93rCgZ0yMMbT0lf8JMt2iYLp3IWJ9CbwPhykvhRDvxK8wU33r1OR/40yVGeh6g59kIQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7gHXwT0lpRK7sf9qSjtghcC4bmQnf/sbt9X/60wDU3BSvSj52
	jW2TK0/VCd6snYtkdB/qweyaoTMMwZnBOkfC2E4fMIfMn5a+6hhr
X-Gm-Gg: ASbGnctINyPuiDO+K7DXlW18lqy0i6s1v3Qb337iHcXODIQ3VE4b1MDBvF1jt2a4lgl
	K4h1VwxpZ4LpDcSjg40ByaKRkIPKVjWCe71ZHZldEpJq+bSbG8qYqgB4yTc1wOi4E2PbKrDR5T4
	fXvM0lxB5ZY8VG0xxb2mim7gCI9F54xB1n2M2j3RW0MSjYB4u9zWXeuf305DKgItl0x4Pr0hLyh
	NlBwza+8e/qfhbfl8JHe/6YS0G76MGY3yPe5VQmaC/k361a2gpsd0s=
X-Google-Smtp-Source: AGHT+IFEZDT0ZZZpAkuuwgyTJG0aVUCftQTdq8RZZXS1UgwHG70xom4o6GAMN0sSNki6+CrsR71DHg==
X-Received: by 2002:a17:903:228d:b0:215:a96d:ec36 with SMTP id d9443c01a7336-219e6e9a86fmr185039395ad.5.1735585812880;
        Mon, 30 Dec 2024 11:10:12 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:12 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 12/15] staging: gpib: lpvo_usb: Return error value from gpib_register_driver()
Date: Tue, 31 Dec 2024 00:26:32 +0530
Message-Id: <20241230185633.175690-13-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails. Add pr_err()
statement indicating the fail and error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 796c3a5be545..5e279d41e3f9 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1181,7 +1181,11 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 		return rv;
 
 	if (!assigned_usb_minors) {
-		gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		rv = gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		if (rv) {
+			pr_err("lpvo_usb_gpib: gpib_register_driver failed: error = %d\n", rv);
+			goto exit;
+		}
 	} else {
 		/* check if minor is already registered - maybe useless, but if
 		 *  it happens the code is inconsistent somewhere
-- 
2.34.1

