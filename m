Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E320E026;
	Tue,  1 Apr 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526806; cv=none; b=u3aJvtVq2+oPHkp8qm3vrwsiSyRN7g391bHDuytfO7y2AeYOcDVLg6QUdSZcaN/IhhY22LVhVhnWdRufPwj3zvEV68R6OF+0cWt+lbzH5pOyzF7Ufuxrgj/6v+F3v7oNVOUEYP1M82sVGSDAaphjAQH1GpWdFx0WLBn1nkXYQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526806; c=relaxed/simple;
	bh=8Z/Q1Yqqxhozl8RrcKexRki6sw2jFiBNt//dnoasYvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjlomF13sBT5OikQeGCnQZfB2VAKiccOYjMfrsxrjE0INCeTw8Vz4sgKMJoZT9hhoq7qoag2DbK97IPBF3zlBG7MStChyhARzc5Tf/ufAzqQkDgQhPf2oUVJO5RbixkcjANOv91GDRnbDAWZteZ4dDeFBFFw0U8Dhit3C1/UXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg13Yfuc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg13Yfuc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso50418745e9.2;
        Tue, 01 Apr 2025 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526803; x=1744131603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=eg13YfucE80kpFzSweVwE7QubM5Wd+YXUm2ocmJBqb1ePRBno8g+VuEhzb4RYBz8kF
         s7oJiSnKYimbpoNzp35SgHLEQik7YFNfAzAq1kl2ELa8LfLZ2owkbB90w/mq8fsv4c9/
         CLJ6Go+/srz2QXPJmkejQzOzNfoVV33FkJ/MVV6Q8ys+BaQtlR/f+XzzJW0RC/5bnhMZ
         3NCbKkVoI7VZCSnmTB8v4JgHlYx8caZY7mmBCINzAUDkKENEOulK1D9ZGU+mO+yXJUQs
         jF+U95FHIaK0sJtrO0m3dTOzjppSMvxfJ44/SMkW8qceNOSN/5N9C8vTyln7KJGHxr2B
         tm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526803; x=1744131603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=htKEc+RUP2pVzo5FIFfd9/w8Bu+VfF9T5lBQP6vfsHV1TUIsfeWSWYO4GQmZwPdOWC
         DBWCmmEmOo8xECp5NNMGnaEhSQ5v2YSaY90Uu97IaTeE+z4hoSQenYtSP0HsZxofgUlV
         XRyO+Ox+xmk5Jun+lF9AJ7uhbLYOqWDfU0TOPzrczjPT0yUTzNu7IZWc8CpYnOD7GIEu
         jOrteY2EzOtEnH3po4TbF2yb3RmGkk5qAnC8/2L/fHASzTcg1u+uYiEkxl52JEbljRDe
         X++SDT4TLowHpJMA/EJMGn7yhRBxHD0UD848RhQ57gIy62MJkjT4sNxJEa/Hp7CUmdTw
         RM5w==
X-Forwarded-Encrypted: i=1; AJvYcCVWRmpbtmQ6MnRD1//gUJfDDZUN8rBPW3t0FvM5gNTJdfTOl2qM5Ef1t5+3DirOImAX57ZOKHRZ24XD@lists.linux.dev, AJvYcCVlnZTfSZg67zypXDP6O3bbxqyH505aAFTiD2tGE7i/Tage9ttWEyDtuCunMvSa9eYSwCgk4EHzGA0CfrJk@lists.linux.dev
X-Gm-Message-State: AOJu0YxTnNB0Lh3hxZgLxNee+iFKXURlbmEL3+EeaCrO9A2TkQEUpmz/
	MA9Fm+f/7GgqRUmQ6Ny5o/IoDGf0Lo+/gUPrF4hQBZECQdD8JS5SYMWejLRxSgc=
X-Gm-Gg: ASbGncsDFW9ptOof/IKWjYS+ru4MaG2TF5g+GRVxDtSY0BIc2i5PzutmO0vc8svB1o6
	2WjPtEVLcN4jBSkI7Q9G1eFF33wCcsTuhK0oXjeh6WyT9LRqdU2rlPFf5lbuW4LbfwChE1+9lS6
	LzbWgpI1VLflrDjWgLktAWUE7xdZ/z3ceuhqqSnzlpz+Xr5Eni4JWHC7Vuyi4oHcKF+0LAPJgkw
	nWqv4N2VhfohzCJ2i1a0/cngZIjKO1v8AY9nU6YK58X1MQN6GaHHvzvRXC2OcLjrjwXS3SKhJ1c
	tBrqEjSR3jRYZM6TTgGF0mhfr7NrAEFmqAyCXxo=
X-Google-Smtp-Source: AGHT+IFSgsTbCWtBoeDbXY6I9urDkDUv7DQvWlpcTV0hHI0IuTaiNzFmS1JTlnH4rFWfxvOkaBq/KQ==
X-Received: by 2002:a05:600c:470d:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43db622ade6mr116598445e9.12.1743526802414;
        Tue, 01 Apr 2025 10:00:02 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:02 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Tue,  1 Apr 2025 19:59:34 +0300
Message-ID: <a147e8cb87627fdc218bdc6df70c980df90fde29.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743524096.git.karanja99erick@gmail.com>
References: <cover.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..3b43f8cfd6f4 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave-CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW-CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

