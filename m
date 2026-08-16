Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D79E31F98B
	for <linux-staging@lists.linux.dev>; Sun, 16 Aug 2026 01:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786842215; cv=none; b=UXDI/yslisetMPbt0FehQ4JY9HMUBiLM+yYjYZlpYcEJXEpILeT0OY1dD1G7ncqTguOozOilYsz3FRhNrWXNMoxJGfNb9stqpunfbKpMrk8bqbRIJRGH6Xe8DhIvvqD2UMdVtaUQDxYSn6ASCJjQKRF7XgjDLxlaALNkzdg/Km0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786842215; c=relaxed/simple;
	bh=FifGW5MG7JbFILeAVwa1jNog8QfeQwpsY+9kcqd4X7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIGou7cKLYZQaoacKyDnW0rFOchh7NOjTgMEM8uWdbJKPBBh87t4zg56tKHHMZbNlGC2WcRDFm+gGqjo+3CYFrS8WdOTAQGjHpxWkIwwUwxlNm91hZHUtM0Lv3JNF6rq80mFSLVe0ULZmN9SBmLLyc6PaYsCOMzit+E42efAHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWWD/8zJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWWD/8zJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ced3386430so23482775ad.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 18:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786842213; x=1787447013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsCwMPKOG1ojLz18oQtlTHtiNUW+J/Ma5sW3249cgm8=;
        b=XWWD/8zJH7MQS332UIwxtm+G4dUQ6fmP4cG/5FiwbyRbJcAfwakGuu5+d8A/M4mVXW
         e2HXfwFjh+/Vc2bp21Wqt8IbBwTQ87wtyoFwnowdHYVoLytaD61X4i0yUZS4Db394hUq
         w7Aq//mg/McNH+kp/PMlZKxCg87gLF5QzPnM21WIyNwzDdGK8pCZokvmeKmXiTFePH7R
         bHfTnmR2ese2TN6OH0mTPopWS6OOuShvT8QZ7HJ7/pg8ngxdR2vht9c9IXeMR/M1tDeZ
         JRzii2N6eroXZfr2NZEvbHE+u3eUJoWZpozGzCT8P54HvQtwuxTOwU4vsMQ0+owBwpNs
         9wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786842213; x=1787447013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsCwMPKOG1ojLz18oQtlTHtiNUW+J/Ma5sW3249cgm8=;
        b=ciQmBDta043TJieLIJaWZVsXqQ8PZidVLvT6Gh2W92dwpdGu9GkZ1X7NLUQMx0j7JS
         jX6tnUlw113VGMnduGZl95NoEGnrn846KqyjpOU/HbxV9LzxTqKhYfo85uifQTk6wgrJ
         D8BEZa31cLRUg6b7zSaAKL45S9Q7T71+J5CrK76pPY9HbvbrOkmPxpwJMsVrfLZ3JboT
         Wfa01mk8EoV74ti8ZUXiaLdQyNzNc3/BuWxX5sXgg1GgbCSkI3UGLCU0SfEV7Tg/3Gyr
         ULqTAVSWcA2E1zXM/YEtphG/AjNHSegKiUpMMUtNkJ99tnjxQGHO6kGjDz/buS/wif2M
         Wsrg==
X-Forwarded-Encrypted: i=1; AHgh+RrSN6Xgsb9DE/a8d+Gi2SemV11UiSO+RTOBMAbmzMUSX8yfGYzemOdQDlvkmfP9S5fCS2k2YWSL/lfxmmI3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy48IrHrG/OTGr19RhKsGlINiTWEJvkGGTeURVbUqgZpMEh5vPU
	8lVJdlAQfuw8yg+Cwwr1Uur4GaDH2nr6kSDnObRlpRm/nP1HpxquIyXB
X-Gm-Gg: AR+sD13brWBQfUaFmN/ELwjm2PrU9Bk6sTQA2bvI5Dh8D00e68Z2Yf7IMoxOeWQ+ucE
	BWWvQroYJmbL9HDj6eaaRNK5B6R57sJz/z9OsI/sYEg+hQ9CnoJaVJeOrw4R1XXJ3UCC7cPmXLn
	6Wkq4pNExF5ic82mlG/cve3xm8BsTq/5NPooHrwierFRgfa7ngevxmrz0HMu3IybUWsbayTSV8C
	SZmrEQNxZmTQLERvmqH+CFH7XBbkx3Mwoz4+S0pYVzdcbR2y3Tk8C+3LJpr4Oq/RA4yZwZR3wJQ
	M7QsyKJtmiAbsxf0ffPSh4wPl0/vXL/b72Drfwdowu0tfSwzyCc2P3xDYp7yzDp0iU+U5Cmck+q
	WeDz1gbmRLAOlnokcgC54K3+hbPn+WQyuBW2vUukB9hkmj+4s3Cd8kTo4/x8HngJ3mo6ZmuAJab
	GEFmyaKTwI0tr1i5BHXPtkI7cHhsUqGDml4+q768EXLu0ygvDoHbt4edNHnhverkN8KSSOzhRJ8
	nygrIvUaiPpGOH0tTNpwacNEUEaymHTqaMwVvsobn8/
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr19336093637.2.1786842212702;
        Sat, 15 Aug 2026 18:03:32 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm32113463c88.6.2026.08.15.18.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 18:03:32 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Sun, 16 Aug 2026 01:01:26 +0000
Message-ID: <20260816010126.159514-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up loop bound calculation by replacing sizeof(bds_factors) /
sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
to improve readability and maintainability. Move loop counter
increment to the same line as the for loop and declare the loop
counter locally.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
v3: Declare loop counter variable locally in the for loop and remove
    previous function-scope declaration as suggested by Andy Shevchenko.
v2: Move loop increment to the same line as the for statement as
    suggested by Dan Carpenter.

 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..eacd7ee5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2118,7 +2118,6 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	static const struct bayer_ds_factor bds_factors[] = {
 		{8, 1}, {6, 1}, {4, 1}, {3, 1}, {2, 1}, {3, 2}
 	};
-	unsigned int i;
 
 	if (width == 0 && height == 0)
 		return;
@@ -2160,8 +2159,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
-	     i++) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(bds_factors); i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
 		    effective_res->height >= out_height *
-- 
2.43.0

