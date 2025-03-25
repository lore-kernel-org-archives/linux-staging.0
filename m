Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6221A23AA;
	Tue, 25 Mar 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742897525; cv=none; b=l3aogoGjEoTtq6vBN915AVsdwxHGi+JCLUe4t+12muyo7hiPfaAh9rms6pVHIL0a49N3gmCmM3A/YFqx5uvP6hgtBaAvBba7mR4F/vNoVcWhQ4mZeh6uxWPaxsb2pkTsUDX12aOoXrLM4rgQCapgBho6lCM7JebisSD+r8QDIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742897525; c=relaxed/simple;
	bh=KpilHOOJo67Z4VWOQXgm4x9QaziC64Nge4Tp+ZLbApY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y2bQx/36qumhULiLIVVZxdMT4ccVlk3P7NbZPJPOmLryyFnIubiDfLdKB7fH09Ej8Bb/D7NfPidiFzoqf4H0zAZCF1zYVgC6Jb8lAifWSxFNFPJF1r1fOMvHC4jp2Qvt54wyletFIjVPwKFzdcC+RV+5OHsEF6poM/VmnSjMw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6vQR2Fb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6vQR2Fb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac29fd22163so912108566b.3;
        Tue, 25 Mar 2025 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742897522; x=1743502322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUyR3Oe6iYVQ9/r3ijgRJfklg/wMi4nHhN2lq9dus2Q=;
        b=O6vQR2Fb75nEl1TFJ6eHOOg/ypfOEW9qxNCRffsKq+Lm0vCyUKETdQThQaWEB1CMSc
         TDhEKXzWhqXGRVldsFgq6ExrePvOdK4RJadOGRYFXjdFtnm1WznDsTV/lj9o19Mkm1Da
         H4+90EgtHfDOFNl7q7Z937C4tFYGXAuxbWnRje5H8/8RfCCeznD66jgKFQ3K5/17OYnr
         sohiV46VGuQMhEr23OCdUAqVq85cN2AiMgCPA2mlrT44ATH6We5VS+niTyCdpc1gCYUr
         RP1+bRFoKEJvE6UfkB7viGfZa7qN117bKnByXbnA/PYCb5oKuJhZoGcWusLzO2im8OCU
         boFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897522; x=1743502322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUyR3Oe6iYVQ9/r3ijgRJfklg/wMi4nHhN2lq9dus2Q=;
        b=Cb7pbmVPSdRpresG3b9eHfaQpDmmBWmVuQJ+IXBYsL2LBtbKYIN7lUc+1YCfvKma2r
         A9Sv8/qXfrT333jMqAUe0UzH/Y1wbVkrgD/G50wuqOhJmIcEUJR03rrbvGcIiDnuOIpV
         PCDORN1puefiLqBdsglKhioNOhS4cxNsgdn5CaABSOqMGI9uXsJvALoe0U+QTfbYYkbA
         pbpBxXuUjlnx5/+Cu1KRQCfN18nlBoIBu+1+ApXC3VTdMbF8uLclNZySVDTXT3O9iGB9
         SHT8Xd+YT3rlwRH7Kp6gpeLsFXDBjq8jnQ6qQooCkfG1jLnwLIlvu8TiUYihJMAbR9/J
         QGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCURoxsOM8G+vCHlC++QLvTBfGIFfJ99uJYhmQdTJoR8S9hsydzaCjIX8FYG8gSE8p8+j66rmzDAjt4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywca3XPGDNUUEL42YIJIcpsCgJRl/BUYkn2N5B7DNdkVb2t9U4Q
	0tge31q+3mPPGVWHwZKczHcV6o3SlP2UShkQKgJ16p87N8BgRUfYuZ9ZiFN9w0w=
X-Gm-Gg: ASbGncvRDOgAP4U5MoexOBPcvASVG6+8OWuZARNFehBf5jXJLdzKPsuWNOE9FGk3Z91
	lJdqUejewASWTi1UY2WUt1Z6CM5oHK21pXyDciiXIJKYeAGwV5SqqbfzkR94BhLD4QZKppkg0+B
	bMFaRixc74wO3e7yPHIjk2gCNrW8krZFTGH6gYQz9fUAxTmDts591+sKJ885PuomPHvM4l8IdZx
	jVGPTVHe+aXPRc7rWloTLSJxTzVAgWXzXDPZxFIDoqfxZj3u2RwFYadW6tMvPwyaUAwgo7zM5L1
	chmXRQNcpaIfSNfryBuGMfHTBMJI43iaZZyF3kDSfRoPXZ9bym+YmQ==
X-Google-Smtp-Source: AGHT+IGZ3tbJNEZfEAj8nuAD8spNiWrpR+xPBxDApkcc/3wYUXEYlvHNuM/ofGxTCSCpXV/bnwY4pg==
X-Received: by 2002:a17:907:c1c:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-ac3f22b52f7mr1747463166b.34.1742897521258;
        Tue, 25 Mar 2025 03:12:01 -0700 (PDT)
Received: from localhost.localdomain ([41.90.66.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c6f47sm7429284a12.52.2025.03.25.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:12:00 -0700 (PDT)
From: nancyenos <nicymimz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	nancyenos <nicymimz@gmail.com>
Subject: [PATCH] staging: octeon: Fix unused macro Argument 'x'
Date: Tue, 25 Mar 2025 03:09:52 -0700
Message-Id: <20250325100952.2956-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

warning found by checkpath.pl

Signed-off-by: nancyenos <nicymimz@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 44cced319c11..0155f3c41657 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -8,8 +8,8 @@
 #define OCTEON_IRQ_WORKQ0 0
 #define OCTEON_IRQ_RML 0
 #define OCTEON_IRQ_TIMER1 0
-#define OCTEON_IS_MODEL(x) 0
-#define octeon_has_feature(x)	0
+#define OCTEON_IS_MODEL(x) ((void)(x), 0)
+#define octeon_has_feature(x) ((void)(x), 0)
 #define octeon_get_clock_rate()	0
 
 #define CVMX_SYNCIOBDMA		do { } while (0)
-- 
2.25.1

