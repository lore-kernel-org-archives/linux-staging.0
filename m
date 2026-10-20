Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499627;
	b=IV5P+GBTIil/SY9jG9lw3fD8K2DtYh3Giq2lLJkk6AEU6JZU1djzjSmDttFgbsnWylh1
	 aSiFlSPM4ExmaJUez4xVUIEpjK7X1U+hDl/9Gjtv4zeqNwRJpkwD7BhxiOgliTdgzYoVv
	 OvPQYYNxD2Kot6Cs7zE7e8J8VcG1GI6CEHeVV+FJnbNvTZ4gi9Z4K/yrIaMz2GGdnVl3L
	 +PI25On9LWnkxnPe7kxupSByCpUEkq7I1nSCRdjp39alNdZ+Td2f5hxyLKKeOG2voadYp
	 QwbOpi3ke5D61ZZ/qy97jIzm8ZTrOd/xq+aZZbggFoQkTLgCVema1z9TJ1pZ0M8mIog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
	b=mkFkxuTeQcbz5BHkv8XKyl5SOhNr6A5K/Q1A/ISV45otuIAxx7bTwFCh0AVQ411qSTiK
	 9d0YcsUVNlgRdvNku0LbKMha1Pqu0ekfqxHMV0RHXVyEKXae03MEEyUkuXOZ4J4izf+YF
	 g/7HML6NMEHlghBwWJTPY2AdFDCRjAmpVVRvJykIrZLJ3+ZpVeJmJZ6doUNbuGbXi2WNQ
	 rbJ9x+I/NLtbfSdzvd+iMCaT7o6kHhYZsR1nLeirFoNne66YgPodM6fVB9KTMluifTd14
	 dm+ULuftfJFTzQYjUz7mB3GcyeB3iwkJi0iAY+PXzvVSwU9eDUxS3HMFNkhYG7PgQAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j6qxaBgE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE82606A31E
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 12:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE82606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j6qxaBgE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2117774f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499626; x=1793104426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=j6qxaBgEUIDhezrjIhYW8tVCHOZK3d888PR+S/jhw3c9pqxfH4c62ZDx6r1ys+zSC6
         Ag/CQhB9ag54zscovKC/t7z2dx36wz5i7npPdn3+sUjmjcGbLMSJN1iXUS3QG6MXYLq1
         sUuwyE2jQLDb4SZtPVk5TipQElUhCYRNB18Y1h6R1V9cjYagmoyerVplewYVkKM5yrFm
         i/th7w6PT4sf8eV4SP09deQoyddPqS3mFkyDAhlBynEkncm15/HK84SB8bLi7eE2TXpP
         pV9cyG9+ZMP2x9PLe69sPPX3uVW6xo+xa1EZB2Q5M0F6o4JiL3ueoOwvITniZISJ4n1r
         7xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499626; x=1793104426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=A6u/cgBzedr1ZOUWGKhCjfXY1VWvfyNefOsQb/I2IGKCu/SZTJ/3XniOymbHgYmsES
         FpNApyYRCXxfxNYjuR1oxi+UeFkC1ldolkP9gi5JGqtVh4wctEWNF8qFcda3wRK6UUcN
         8t1cwY1elQITj0tD7dJUebuUL1APGDmVYlPYGPSP7tF2WIwM2dnscE95yW5F0uufo0BU
         W3h2Fj/aswMomk7zHoJ9+Ql9ph1/inO6OeN9uPACagQtBWS7uqQR5cABKmDUaDzBU8tC
         9yqawcF5ggxpFbOo9Omb2xF7culi9RG85vaIcLmOfCmNMFlSiSsUJV6MzjoFVVLuBwrf
         4ZWg==
X-Forwarded-Encrypted: i=1; AKwUvBzlpxv6UyDjOYC/8lF6d/psWloK9jg0nsGTddK10YLySLaI/FaoLDemI/Xrn+/BXgm44GPRuO1KkxVTLsi1@lists.linux.dev
X-Gm-Message-State: AFq9FYIJzY9OEs/ChByXCcuBL4sOZOXwkyP6I5Jkb3eE2LLGqwyANfE3
	DRtiN09zmskqJKDieXICrRhmfpp4sNRflg6f1rIOFun3RUeCENi1WZR6
X-Gm-Gg: AYBFou22xmQyoZys9bz4tn8B9OtgFUSBUhnEIfVOrB1E0E0Hmqj5vDbEw1zywMj0Kvp
	QONMf79/6CZ1Zp0XPctEQudO/pSPPaEmJmVFlFn+hKFBumnlXNqYv0iOJzZc1Z2SUA1twCTPA8I
	llgYD/UGRCuUeqDupSd+6MzO8e28g4NTgtbBV6cLlhqKrgI04xsnhAhio/zbodcz3UYnHp9CoJ2
	bOz9BdNdaxZ78C0AM/5bG6EoTzWQ/I2vbao/N5+TDuWObhaS8z+E8KFnDSLkoO7zkUPZwPX58M+
	yT7iq31G6mMOYV8nx79PRhZQVn9wJ/GkPqJrATDxSaccZ5mI1XWIw6aa8ullwRVUNoHAu6lWQw2
	WGbfDIE7wTPeYCNZCmOP62St5PzrYjYEcx7SN5t5vYGXiwvlZpGND0qVG14BiJwmBV2CsqNG4oZ
	4hfh7WXKHLZLOScipv053yrGt9SN3LrmwaviZtnOoieVl8ho/Bv9/5Nnxr9uLjOV54RzLhysf98
	sBHZiQN9ABcC7NYfa3nM9fx3qXWBaVByBcj
X-Received: by 2002:a5d:60cc:0:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e07fb9180mr15932300f8f.56.1792499625481;
        Tue, 20 Oct 2026 05:33:45 -0700 (PDT)
Received: from Ubuntu-vm ([154.192.10.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm5981575f8f.54.2026.10.20.05.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:33:44 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH 1/1] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 12:33:10 +0000
Message-ID: <20261020123310.5625-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..284935fded12 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
 	kfree(request);
 	return retval;
 }
-- 
2.53.0

