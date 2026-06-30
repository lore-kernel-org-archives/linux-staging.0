Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F42416CEB
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825161; cv=none; b=Q5PKpEFGhBLX9jZeUTM+h5gYkmKXxrpwyi3VjnD2ypXsHDJHAVSuyLLs1q8oQ+s7Mdz1hD0U1GYGpfm4HewjLtYC5qLdlobt7px77wA1uRoI5TsoKamPKC8tbmYWKvf9SYtGHFq3eXjQzY8sqAvzTvA+326NCHeru6gv/FJBnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825161; c=relaxed/simple;
	bh=HVg+YqWI4chdY73d0/jR0tccjaohiK3cyNxnhw5aYa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ra+/tvQS7mnKucAzQEaBHPpdrSzJLUo+K2nSVmH2OFj/D01Y/Rdz1IVbZNSaRZeCut4VMNq+j+z36/lfH/DxdehIcjfJa+eTzn838GO9svLN0JCIEdAnBMTaulC9Mi4xSduY9mKcVmV09F+624a/Taf7O42mD+YCwzHBKvPIQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOeE2C3S; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOeE2C3S"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39aea87aaf6so6372001fa.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782825157; x=1783429957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bshkajr9LMtOLYZB9AnqP+QXGl8rV2fpMnulclow29g=;
        b=DOeE2C3SB7RotGK+XaMrH5oLlyYQmWVcly/Y3Ru29vr3AO2Asg+X8R7lxlbe1WuDzl
         9Wi3A/JpEpNIZKeAq3qvyJSIxpCv4ZtvyFqnoX3DqFl9aPEpW9KwBuaH3R9gi7vFez7h
         HDnJkidVY+suw/3ozfzDXn1Pg0ndPPzR1fhDbN6JFxLSQTcfPSfL9K5adCTL63fZUs/F
         xRyl14z6LoHaa8FZcfZimNKK+fiME3G+DnNKQpiwMDYj/ifZsuXD8RjMmtZm1auP0acT
         sOf3fkJGBNmIM0ijQIYEnh3P4q+tDFGZu8yoGFoFfNDRt18KbIQbQhYznm8wYfA+yxsd
         bKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782825157; x=1783429957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bshkajr9LMtOLYZB9AnqP+QXGl8rV2fpMnulclow29g=;
        b=N/MYhz0rMF3fSh82CsGZrpPDkEmGbCxpt0AkfrkL6nJQxdz0DhlD6wnBVK2bm9um0U
         qtXzous7jRwit9o7ZxwJcmervNi3+eR5isKUviF0Bsfl/vajRVv+xqgcew4Gr0Ez1FmN
         a/c8mdzi/vXdwOcHM+4ABdjobNk1+g5s7Y+uQxTrQIJ1q4xcddHAs2/3iKTazL9ORyPs
         VifqIhoOtRC4G+ddxofQLrvazsF5isAzs56WT/iFgyRVe9nOwL3Ynl2nXnQR+NkhFV6A
         r5sXU8ANAcgnZQM/XK1goTk0q0xsxacgNz3peXKw9SaJvzi/IozKGT4LA+OBk1bXS7XJ
         5hdA==
X-Forwarded-Encrypted: i=1; AHgh+RrMuhXlZh735zXVBl02PhXX36rPPCDVqyAy2joDbv160RuBNvZdso/JRTbr6T1vdnwX8YnsXvFTQs/VwZZq@lists.linux.dev
X-Gm-Message-State: AOJu0YwmIVwxcVkShSDvsbZzgWxqqfcNsNWHNNk8FFWwtNkxgAesnPVg
	+PWTdceg/X6oX6eYHEbzdkOEXTNt0HRRJGAqMSpGmY9fW/SQMXRzu117
X-Gm-Gg: AfdE7ckuPXmpJxHYwBbsS2DY4WLTmqMZi3F5fGzQZqxZjYwtVe/anUMFG5PUHhZqVGk
	VjXxmwwl0gs3ljdHAkEhEKxZEdyJoHX0dpqQ1na/0lyoauVDzUO8cBhJ1b4t3IGHMMJ3rzoerw2
	4MhJYGdc6YZ7scvQbpTtDC7xfcD611f58en46CtwlZui6tFAzGf0GdFVtC8eeWCgqRtkbfbH763
	Y8aVgF6jZPXysv0gYgJC2JsIGzPgz7ptGGHZO+iqonqk21mRMSfLNEaVpXr1Fl/BREAqoKPokt5
	BROwpgmZJFDHCXwF78J0YfFiO+hHBrgXCjWUuD+4xxHNmkflxp4lUp7vCJ1pLkdLyeDtTM7vz1R
	Cd1KdbwYmrwnWFG76o1QJqRlfqbpBNN3/T/KTlx1rjmzDV3aMh5Ska1n1TqVVFKqXS3nb1w==
X-Received: by 2002:a05:651c:40d4:b0:39a:d587:ceaf with SMTP id 38308e7fff4ca-39b1da5dcb4mr5857451fa.8.1782825156443;
        Tue, 30 Jun 2026 06:12:36 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1d81d0f8sm5296631fa.9.2026.06.30.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:12:36 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>,
	"Bohdan D. Marcus" <bohdanmarcus@tutanota.com>
Subject: [PATCH] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 16:12:26 +0300
Message-ID: <20260630131226.23374-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by checkpatch.pl
in atomisp_cmd.c to conform to the Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdanmarcus@tutanota.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0

