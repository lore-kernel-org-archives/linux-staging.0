Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590F2EC541
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403599; cv=none; b=qvAwsAt/ePS65ag52Aw86ofwVOjIUikePZcUXIlNjUJDXPPnRWTVSLsQWE7/7q6fxG+lCHPaVXDJxGAN8hA+BXM2MKDK5wgmi3VqzSkrKd8EHLlHhaqiaOp6c9S1ldA1+2dtBKYiN6x3mR+7xFZBNQ2xXhBNMPeZoe9PhUhB4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403599; c=relaxed/simple;
	bh=NSR2k6HXZ70oER1MlNPtE73C7wKJHmMzlGXb549/pEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsV73Z9T5MFeRAw6U62lCmLfOrIEGaqmwshMmg4bwnbEVfvM3jyCM/4bD8YFZOlSA62N8WYgAk4iBRd98d1/aWVixYnE901T3Qou8lm2lZx3T4Ij/j2yQlX29P5fNqPkq4TQe131adepgqKkeNSZbj8M67WdR51L0Rnn7ABSc5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOt5euJY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOt5euJY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2957850c63bso47833165ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403597; x=1764008397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+mt7oH0iBZP/o/xZpySfvOUTDFx959ix8tWEjCCAv0=;
        b=bOt5euJYrM7/6TBUdwDQWIaFeAt9ZuiRGEBr2KLUdThteqBvPoLoS61IDCFYWiRQ+J
         3sRyEEMEJSEZ3FRrMaTk1mRfbHTJY5uBLegsPTMbVB+K/RGMwdGONhYV9QiuujMqD8SL
         bWGuslNZg4cmbZznmzeouA9me4HGtK8/G45WShInwQXIxLQDYXVi3DQlCbh8SPjZoJ/C
         H2b07Y04rrT0JHl/xIfRcKHgpfmGhfTeqPrlGihPa70rpOW957hQAYB8VdGEDUyTDF2r
         vyPoPQDP3Z+LkchpOef/7z3LXtYZooPzSCaS3cq/00AoSw2WIB+7mzw7e69v8oZaMk4q
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403597; x=1764008397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P+mt7oH0iBZP/o/xZpySfvOUTDFx959ix8tWEjCCAv0=;
        b=MYJoX0L6nuXH6iQts6SfOgKfsy83nXPnkb+VpdinpMvLM8DSddTEsFT7lbPgqI6Gry
         nHwgWX6brls6soLb3s+zJvkc/ybKDGSlKlOJfvo6oMAv807WZHcc5qQozYiWMxfEvII6
         DH5p1dSAyGT0GxlZmP1167Tq7MAgbIbswFOf2J3nbIFG4J5kW17EgGv8QKN2CuQ+uZ0i
         jVOaBweabGHgSyNYlO7teL5h1oNb78tuZCP1a/gygSD9CWlm3yIseQv+7gwULeV2QK1A
         BKjBM+/WCa7QCmfjW5mECGEf159zeZt3mO2DB1yY5jctAHv4hnfWBvZW3vYrp47UyDw3
         AriA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlhDtKDEINfd53LkizYG6+RSDNitIoyZ/HnOd1uGXmb2QRZQeHeo6orcqogy6r+f7bYtfBk1I9GABcvJB@lists.linux.dev
X-Gm-Message-State: AOJu0YzM+J7caXuLpiS/VjdiXQ+OSaVPFwvtm/Idl+lavyIP69H9YcSi
	YV/RVH+gkMSPSnOHjat/hxEoThYui8iiJLFANmQH/tqsAVhRMDSVkSR9
X-Gm-Gg: ASbGncvQncMjAUuYaIcRSi9j0iS/8zfnzoEqd8caWX16EtJxGxV7MjFiLLJPHJElbML
	K8hdXgziFqEwvPTSsrA5ZL1TI6WZg98fN8CBGTXDwR/n6OXDxeS1tYjkT8P16F3FkFImb5oYJzH
	d2YUmN2sPs7f4ZdNirGtmThSZTyfS8+Gpe4nYfGQsm5u0sbxsbFHyKYg+i9ksmk6Eu2S0PF9egk
	9Y0qhEGGnxAzpr0KbEL4p1afzUI7OEZXWmg/YF/6LryeZxFULYneTeZhVRtAcHpAwHIL4poRORR
	vqYR/iP4oMXGOfsCp+tyBEE3idKsb1DaMm38G2BI3nHKvrLJOnKIAjlOAyaf0Y57meFBafiu6a8
	ROZEb07OXkrb1T8mU5FzMPs7UuNfhLyrHG4+KAZCogjLBygwMdHmCi6hSftPel++0K0Z03Tz4Et
	J2hnXKoojFFaTz4VOQiqP0fv5zIubuw5WhKpzrFGzuueZS74M=
X-Google-Smtp-Source: AGHT+IFQ9LBn3ISEXKKMButpenVNHYhuSfDmCD+Hvolo3FcfK5Fs+q11eciFucVUcwxZWnGAUEwCFg==
X-Received: by 2002:a17:903:37c7:b0:269:b2e5:900d with SMTP id d9443c01a7336-299f54f68a3mr3452835ad.5.1763403596939;
        Mon, 17 Nov 2025 10:19:56 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:19:56 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 01/13] staging: greybus: Remove completed GPIO conversion TODO item
Date: Mon, 17 Nov 2025 23:48:06 +0530
Message-ID: <20251117181818.118139-2-ayaanmirzabaig85@gmail.com>
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

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..43fb6dc3dff0 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,2 @@
-* Convert all uses of the old GPIO API from <linux/gpio.h> to the
-  GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
-  lines from device tree or ACPI.
 * Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
   ::enable and ::disable.
-- 
2.51.0

