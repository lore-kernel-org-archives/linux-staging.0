Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6207712C817
	for <linux-staging@lists.linux.dev>; Fri, 10 May 2024 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348411; cv=none; b=ecdR/MKdDfpdLLsoCPQGMRCB/pNr2N0imRGSBmLA+ehTxQPJcSbtq0j+XvWBRiyrXGGOsDx/9O++QDs4gKVAWgre1QFzzyuf+qSgMoIamM1xFGZxuORHBgUwOqFuveKqFkmlnBTz7yDpbHQ2wp+OSJJy9q69d4Dak15ALDKDJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348411; c=relaxed/simple;
	bh=1XGNUjPVitKhhjXuO83/2GVp0nYJ0Aeb9pCB5XMr1n4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A56SU5/YN5eO4P9XgJ1awx9ono8Rn0Sua2iZsYWDd41hPiss8iKAnH+4cDQPqBWzkbdlt7KGoad0qfrWqxqPYHesJT4WsnZazBY9+AvwOXUNoFml6hLP5GNen/MroYvI7IRx8WVsG1XPyvyft738aITmlJtXYS3i3jKHOD37EKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4dPs5Fa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4dPs5Fa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b5f3e20615so1842014a91.1
        for <linux-staging@lists.linux.dev>; Fri, 10 May 2024 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348410; x=1715953210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1ijVzsoPBDrirJugKDkdAFNChA4uJX+cHWvWwlSmVM=;
        b=Q4dPs5Fau7A1SvfVsvibsLEC8our/4uOY6BvujmGGroXwWhCj1oYvBM0rzZhD5KqNK
         ziS1dTR+ihA6IPannGhc2U32/y2syjVDv2qzb9cRqleHJiJsT5W0+gFzlmcZfQmpcfLW
         fpy2LPi31GuJwgID5GbiSYHdDzzJoqm0aExiZCaMLJbwW+8tp7dxiJiKM+GsKi6H+HR7
         C6ZYafCMMOI2HZec3z4tGzCQGULZ/oDOV8cFoXoZx7wFnbKKTfw2SGhhHQoSWgFgIGjf
         k8aICy6Pg2kS3eGjmsZg4hlxY+H3ugkhK2g6U3SEhMCLxtv+UxXFmeeSCAchNSwoZWNV
         +J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348410; x=1715953210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1ijVzsoPBDrirJugKDkdAFNChA4uJX+cHWvWwlSmVM=;
        b=ZcZZtJAlCmjhrLEeAIo86Ef+TaYDFYCko2WxdWkxUNremrLw8cu78I3Ig8mq39CXeE
         +b1UhyJMl+n9qc8Ap94UDLZHT0qEeReYysb+mIakNk0OmGGvxiaUCQM4A9ES4i3GbZtT
         ENmQx79NbSGLpaejKpphuoVInMj4NNPyRumVbvOalp6YO9mtTCEoJEdEuqpzRMPMRRbI
         nez0vDN8b6WskhPSaHtWhxzpqBp7KYdmbzEDUBqaeTcrtdUwjKLQehJJ01DHlTkcCtOr
         cm+mPH6BKTVTAXhje0i56E8rda4exRU0NYwOwh4oAwEYpCgHf8JmcXI+FwTe3E6GyfPE
         StKw==
X-Forwarded-Encrypted: i=1; AJvYcCWcxL6h5Lr6JCGkAECCfFTX28Beht/mM2WEFSjMCeysSeNKbdQMtQoY+kO/vrpJprzKyJqwy8nnXhFLg6pcktdWxwSJ6n0d4IufYGhlwA==
X-Gm-Message-State: AOJu0YzHQCz6Su8kgzpzlfBJQER8c6g09kXY6d3GiYXh8ePeYgl+Vn6p
	32cdMQzsQ/6tiTJ2u3v0ffj5at+VSq3+JYak6SsuLzS5I1Osh27l
X-Google-Smtp-Source: AGHT+IFUrsug2vB+Pywt/1aiWlfZ+P8BRoZJhjnnpH2KLKhCUWHRA1t0jNHtItXsQrecDk+9Y0YsEg==
X-Received: by 2002:a17:90a:9281:b0:2b2:b99f:4d5b with SMTP id 98e67ed59e1d1-2b6cc454828mr2539648a91.18.1715348409574;
        Fri, 10 May 2024 06:40:09 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca5109sm5074148a91.38.2024.05.10.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 06:40:09 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	andy.shevchenko@gmail.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in atomisp_platform.h
Date: Fri, 10 May 2024 19:25:00 +0545
Message-Id: <20240510134000.23848-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codespell reported misspelled streams and corresponding in
atomisp_platform.h. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../staging/media/atomisp/include/linux/atomisp_platform.h    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 487ef5846c24..9f55f0b65864 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -134,7 +134,7 @@ struct atomisp_platform_data {
 };
 
 /*
- *  Sensor of external ISP can send multiple steams with different mipi data
+ *  Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
@@ -156,7 +156,7 @@ struct atomisp_input_stream_info {
 	/*
 	 * if more isys_configs is more than 0, sensor needs to configure the
 	 * input format differently. width and height can be 0. If width and
-	 * height is not zero, then the corresponsing data needs to be set
+	 * height is not zero, then the corresponding data needs to be set
 	 */
 	struct atomisp_isys_config_info isys_info[MAX_STREAMS_PER_CHANNEL];
 };
-- 
2.34.1

