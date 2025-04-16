Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60C241139
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836140; cv=none; b=LMuQBxCtBq1GFMdJc6QGG67qRXquYczlTdsl44xEmpTzNfgQQ25FWh6VKhNwvVXL2PWxODPug/fxcIpq1+JOiDOUiK3y15UpUfbLbqjDGt29EOGRnlKnpB8JZZRJMc2adHyfad/+tDX3i7LbVFmDaRKUJfZ7SuV5G0eMMC3Z9R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836140; c=relaxed/simple;
	bh=oZv9J6EAs+La9Yoz4jWDKoBjoVKNXoiy6YS2fSQlpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNaAOU+qOMKjKRcyf5cyqh7fVNw5efRO8Z0VM2N4OtIKl6Hg3zugbxF+Y8HjsXkhKLUntPlb0IUSaYiznVAjnX0/6i9CcHgjIygmOvLbP8EaqnxLNS8Yxjg1boQQ7ZkDchW6ZAffJ6L6/B86XX4wuWYKtph0x24B5pLADr5x8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=j+zjza2a; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="j+zjza2a"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-226185948ffso1262295ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836138; x=1745440938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=j+zjza2a5iVXg6V/vKE0SVeBaDJUmbKMchjq3oPQ7ueTGOBEBxdcBUx+nqr3glnnyp
         KU4i9gpC4+uI4BRJWAjHsqkX1iB9S3yaWkcjoISZaoWxds7rvIA2I+X4SOkOZ6x/3Mm5
         ISj0r5x4BGICFbLoWUX5Pu3peIellKCXD5lx26aTxgtCwdMvuTQYH7oyLmt41o89YNM2
         CkS2PfZYqtPwJZ4C+mBLM+R3d7estBFdo3Fe3hBB2PyBY1riS2oNnB2PSCdXo6tECR13
         4LSfuxHoAE6SutZyg7NY1dS1fYqITqiMWbB3f0tke4sitGIu9jaKtZfGQwcwWu6CKSI/
         Q+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836138; x=1745440938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=eixP4H9nOHHfP7wOZKnnuE+/NJ0ZN0VnYeQy3rQQNaGNGt1OxA2ZxEy9+JHZvxyEIA
         vH+Hc2HmP8KLYW4QTriUuMR5EjSXtwZvKX42elnaSMGbFFOeVdiGKlJR94jYIseHN58j
         EeQ+TdjeTtQ0kH3IR6RKJOnvfjmDmNN+Mq2T1kv7Bki/Xv9zQivongFmH4tb45AzZBib
         XysoTnq3iJXAXMZePCI91xEBkcGXBv+2DtxbNBYpum8ZMaCirIk32EUa+7SMjLF2ifaV
         CIqmX9rkHkqQmLPcDRr2ugMJD65wD6ofUhe9sNZLqYksTxILseyzk8SeUXPDSwwIC+9f
         s1kw==
X-Gm-Message-State: AOJu0Yx+JGGziHcq+DCbdKLMgJiBcK9jdUyZIIV9q1137DkXLIGazeWg
	IgwNsFKGMLHYvrtTeD7T9RNflEOGt15N/92FJ46PKFDgZFRWIeaT6gOb0RjU0A==
X-Gm-Gg: ASbGncvsOEe43oQCnYLlmvzXyTjaL3PUjiQwpeCZGidrwVk+lGLW2OiPMabL/I6akzO
	RxJP2rsQurddgnSZ7e5QClRba7FzFZlcAB8bLLjNcp+eOJE3+GpYx+n0s8Pq+GXZ02rBciZL91M
	ufQ1cvDbGSigTI7giSG0DtEowwP0FzvTny9UB7PuUw9wbND+bQoXZJ16P+vBvpMfEBWb0nLQK/l
	zpvR5ZrijwHQDFuvoag99VCt/HsdmzYWcOm6q7wuFOjX9xfyPcv7Iwr3l0ssRIEBNr557EuAacX
	GzJwjRdFAz77+OJ38lLlQJza3w07/rOvSncT6FMKk3EYst9d2ZvFsLE3HREgBvi/V60sNO1e/Jw
	MRfn5kw==
X-Google-Smtp-Source: AGHT+IF0xLStOVVrog4mqNhmnW4YOlgEC/0TphCbwZqL8gsXZoUG+2xj/8FpaIJKuy1Jt0V4UFA0/w==
X-Received: by 2002:a17:902:ccc8:b0:22c:2492:b96b with SMTP id d9443c01a7336-22c358d9c65mr56564125ad.15.1744836138067;
        Wed, 16 Apr 2025 13:42:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4b96sm18797775ad.174.2025.04.16.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 09/18] staging: gpib: gpio: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:55 +0000
Message-ID: <20250416204204.8009-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 87622ee841c7..443d739c7edf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1308,7 +1308,7 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0

