Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F83570AE
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239781; cv=none; b=lGxXWnJEYv07fBCsec7AMHjTs2cD3Hn0QAHbK/gklbCVfyrX4AZOBkwtL28kIwqUZBPHPzaOqKI+32ty7CEUqAWB72JTSQm/TKhoyunlwwqjyPw++5QWEbMhZVynB3/lLFNPkT4VWsnR3+2Pzo1pte9wuKvLBGi5WZyi363JyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239781; c=relaxed/simple;
	bh=UW5WKUvBen67pggCtVGJehZFTPGbRyQFJHlfNUwtv8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJ4Fbi7hqhm4CFt+M8O1Ku+B2L47wUgefTiXtqj1Jn4iZ8kHCEHmdTw9+ouJwnFoimkC9EWSxSvc1/4m9HjDVAKfB53tOQWfnR0Ic9e8r++5BHnO2CnctS20GytsZcgJFc20Cjk+Cii8qn1aX9ZVsogJ9Z2j5Mcq/tIhX+hAJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LULpLrWU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LULpLrWU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so49838475e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239776; x=1768844576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgiMLVbzqM1tBnu/9jY1dGm3VkGEYXOJ8Ly4OmREf04=;
        b=LULpLrWUUdes6yBt1EA64bClJgJbXhhdSDMiiwHrbyP+eC7H8CGwicFaRegdRW1C0Z
         7w70qiE4fUxgI8LOsQUL+QLe9bI70rDQ4NpRy4qHu9DfPYapw9e7H9l/A2eED0LgJMnP
         e4jMz0rOgApCog+fWVAg2wy+L4+i7niaoCyOSUGEq0xEyyZDjuthWi6xZcFSqInr9F+f
         RtGWKp67mvh8LmrfPLAtbIeEIN1wLjf/FxPNViwCq7LIR7JomYJ9gKMQcWl7yvlQ12js
         Tf0UxnWavUzEQe8w6L/UBov2wFSMETEl6jdTE4D2oa5v45ZNB6Xsdtk5FbFeF/4Cq+YI
         EULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239776; x=1768844576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgiMLVbzqM1tBnu/9jY1dGm3VkGEYXOJ8Ly4OmREf04=;
        b=nwdgdRMmD5hvbPrOFrnwW1gWhu12AYC9OPqNXLinO/I3oGp/IAXdLF7f6PlbcZIgcF
         CK3FEHHg4KQKGJrJvJb5ZbHOezsZqD2MB75GmAsnxgFg4W5Yw+me18V5IDvluFGT+/tB
         f47oE2HxkPvqsjmEhbA/B0NR2ndOniVp8fxqpWCtIs2Fp/K/IitfNyeO1fvjZmMSfMSZ
         ZjGSCQBwyCW5ZTTC8ODYnOVJz3v31aD7Ntq85dHj5ANa2cm4jlqnfsfly+HUilQzJnDh
         zAcZiPGhbJC5quFRDUMHFhvjU0cADi5/JDJVvsoJ6nur9FuWDPF305OFj/vb4c/5SPyQ
         2sQw==
X-Gm-Message-State: AOJu0YxrpcAEvPIFfu4JGHy6roWBxW6w2wzRogCzkmH53iO7lVXZwtJZ
	87jpfzRy5v5qS2GMgn/sdIvxvyvm2kwBlTndxB2WlLRVLdCBtTizlSt6
X-Gm-Gg: AY/fxX79Duxw56j0r3tBJ48YwH+TZ4BMmjihuLG2eqIK4XQdzwVYAuLqh1X6BMqkPKm
	5Nf+G1QZLrZxhIDhXnsjxUyn7c/5o4Os1/36Cezp7EBS9OtW2BMygz139ix6mEp0418hQPpL7tm
	HMBnAQbIyddBj1OeKLInsEbpi7hrigoZyZSgpJzXUO5h9c0R6FUNDnhmyXm/deoA9MKE3Oaftgj
	DVvnazSU22MNe8jolJEzodTInhuVf6zj+coLRJa8krRMlJxRqMWOOalsdyX0i9bfMEtzuYbjoaw
	+t32YnHgMSB2qQAmQBDuMZYkhgCG0yr/KRrtXTFLQPLOh1NFNUQz8Nuau42lh6EKRG+aZjwKIRy
	L4LY3bV2JujpQXoBadl4GUv0DKCoGQiz9ysXHn1KuNAfWyTkmTgsiyJQWhEIuEv8CaR7DNHgfXV
	c3oux1R7HvH2Oz6K1vFHRG3WvYqVdOWaxS/bz9E2E=
X-Google-Smtp-Source: AGHT+IHvWRfRY/YkEWsPeJDTnNjYCedXEUhHBHlCrIGUFXOLWyMNmawjcF8a0JulH7V1f/DJ5aIETg==
X-Received: by 2002:a05:600c:37ce:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-47d84b61341mr202229685e9.33.1768239775766;
        Mon, 12 Jan 2026 09:42:55 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:55 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 10/10] staging: rtl8723bs: Fix blank line checks in HalHWImg8723B_RF.c
Date: Mon, 12 Jan 2026 22:42:27 +0500
Message-ID: <20260112174227.14922-11-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding:
-Please use a blank line after function/struct/union/enum
 declarations.

-Please don't use multiple blank lines.

Adhere to kernel coding style by fixing blank line checks.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 1ae82afbcb64..8f875a546a33 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -271,30 +271,37 @@ static u8 gDeltaSwingTableIdx_MP_2GB_N_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 2, 3, 3, 3, 4,  5,  5,  6,  6, 6,  6,
 	7,  7,  7, 8,  8,  9,  9, 10, 10, 11, 12, 13, 14, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GB_P_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 3, 3, 4, 5, 5,  6,  6,  7,  7,  8,  8,
 	9,  9, 10, 10, 10, 11, 11, 12, 12, 13, 13, 14, 15, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GA_N_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 2, 3, 3, 3, 4,  5,  5,  6,  6,  6,  6,
 	7,  7,  7,  8,  8,  9,  9, 10, 10, 11, 12, 13, 14, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GA_P_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 3, 3, 4, 5, 5,  6,  6,  7,  7,  8,  8,
 	9,  9, 10, 10, 10, 11, 11, 12, 12, 13, 13, 14, 15, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GCCKB_N_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 3, 3, 4, 4, 5,  6,  6,  7,  7,  7,  8,
 	8,  8,  9,  9,  9, 10, 10, 11, 11, 12, 12, 13, 14, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GCCKB_P_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 2, 3, 3, 3, 4,  5,  5,  6,  6,  7,  7,
 	8,  8,  9,  9,  9, 10, 10, 11, 11, 12, 12, 13, 14, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GCCKA_N_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 3, 3, 4, 4, 5,  6,  6,  7,  7,  7,  8,
 	8,  8,  9,  9,  9, 10, 10, 11, 11, 12, 12, 13, 14, 15
 };
+
 static u8 gDeltaSwingTableIdx_MP_2GCCKA_P_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 2, 3, 3, 3, 4,  5,  5,  6,  6,  7,  7,
 	8,  8,  9,  9,  9, 10, 10, 11, 11, 12, 12, 13, 14, 15
@@ -304,7 +311,6 @@ void ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(struct dm_odm_t *pDM_Odm)
 {
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
 
-
 	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GA_P,
 	       gDeltaSwingTableIdx_MP_2GA_P_TxPowerTrack_SDIO_8723B,
 	       DELTA_SWINGIDX_SIZE);
-- 
2.47.3

