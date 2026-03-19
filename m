Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6919F12D
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773883276; cv=none; b=TA+Z6TgIiZiSyiPYt2Qf+nRrMGFI66X3JzNHJewcaU5Ld9WvRXCEGtz2N7Jt69cGLpasNW2QMBPJXwxHQ4aFyMRpg8yYSdCQ1C8PG9GbuUYgPLXjSYH1lpIU4X5TOys+SruEqWW6kIxbo0nNQJU1VtvMHsf22xKkN5dVNlMUU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773883276; c=relaxed/simple;
	bh=NE69JShXx4G64oAX+wcmp5LDeerBa8zNTg4WLoydDRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q8ISCEaQ2GOU4KE4hDrsCAOZ4Dir2hS4Ig19UlwgoiFFxkjbNTvqO3By8DpXwlYFBHVMsyuFOJitAF6MaLr7wJc2TUMKRXDRbiK/OXXM/WYaTS3FxbXUIV/DdlNvuWMtA4ZEp3/HThEcJr4/6p75aVcNc5u2wPIfQJwZK20PWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4wQheNr; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4wQheNr"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2c0c482e069so505690eec.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 18:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773883275; x=1774488075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oS4jeO/jAAHCRe6uzEr8vJYgUmlewRiMwMIZLSgF0u4=;
        b=R4wQheNrcvfOW6FE4Y14SeW1q9R0Y1kmqBTKewvfjgdlmMWcbfELOW1Ctywzwqsc1b
         pSU0W/QK8cSgznYMb3XWrkZ47fj5vaBt53S5qPrEUUz9hCW4u/j1RJwoD0RPANFgoick
         n+Igd+kTw3xiEGA5lN9IVkOdFTMUNPBPgcbLkwq+GEy7vh/qEyareJNEy3TWxaYDXa3n
         9vtBrNxUwSmjC0SLdnk4KbtzlEgkADfJ8OTvl1QAmNwGhQ4AoHqKYeoP1UuAH7nNB0US
         R1JUeuyyETigiLjUZ5Dq/G/5L8WwSMHHHu/xhgDEEPHuaz2S4knY5ddoXzsrW0ZiC0Zs
         Ql7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773883275; x=1774488075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS4jeO/jAAHCRe6uzEr8vJYgUmlewRiMwMIZLSgF0u4=;
        b=mc/oVoUjP/Z9JJEwMy6DZ3RZUZrmJgw5w7Wzfhs3Lop/PH2jM6j3qKXn7T5l8yqh72
         QqYBkVKzS0rTkNgYCyjFHVjsX9Utpma12PnxVOt4muDJghOZmqgZnw9+wZv0zbnN3oMI
         8O5s47iH39QZaF6H8J3Rm6PDRRMc+Y7m3HbUf/4TFB0BpVdkVcoCWY4QIFBo7sglQVRr
         2zsTXpkJAh3ui1dzZ7KjfsiHXwODnFWCKv05Vjj0xUFXL/MZ7rPOR6++yV79OVVLwYS2
         uUrntk60ymwngmvoOBw8BAEjavmxFyBT11KozOt7l1K8d13sKXgBc+xVHogHZPxjaH9M
         BLuA==
X-Gm-Message-State: AOJu0Yzhj1QkioDWk7VsmKj2ldyYVXJZ9WVM3drTsTAeJMnLdWM2zJ2F
	dvNCianc/tX9XZQOAPpZ0eoO0myQDQzqXV6G9Js8cFJ/1FU4KpY8GFfY
X-Gm-Gg: ATEYQzxk7xFjj0c3NXvreLyI94W9ZYa7OIJAnQCcTdV39Age89qcygwZu4FyGVZsc36
	vnsWaUDjAh4IDEzHmj1VCFyCAze/oNDwZMA+XIxu3lT4sdUvLAmfTwrDLllTZkyIR5Lk61DCCJv
	xsa1DjD7JBSZ8Y3qPn7wCZATq0u5bF3TdSg5AG+7lz7Rx67Tiam9Cfth95R5QqxIiPixYGvi06X
	I1PuP5hrRdy50NOeZWFiQ3qRoBBBwzR8bFqdm5ChL0qHCD/ylpSkf0ohGoERpPqYcrH5o+TGWUJ
	WbWC0WkvyhocX33b+mx+drPcx51si22bNhnVyuy3xHYOYiTra8a45S0afUrgeH6pt6SmSGX+YKL
	HnwUgQCAwmEdYxk3BloBng7CePgjpHpvdFilV9UO1W2rbsDtlMaKvPG1tzBMlxLsnKez9xg2MU4
	qfT+Yabn94hJWq8gls4+T9CYTM0Z2lVhFfjkv71HV8bXLnhyZpW7G5N+XHRZFePN+asg==
X-Received: by 2002:a05:7300:fd0a:b0:2c0:d4a3:ed32 with SMTP id 5a478bee46e88-2c0e5063dfemr2406959eec.17.1773883274527;
        Wed, 18 Mar 2026 18:21:14 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e53e616csm6179499eec.13.2026.03.18.18.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 18:21:13 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: greybus: remove unused conn argument from loopback macro
Date: Thu, 19 Mar 2026 01:20:08 +0000
Message-Id: <20260319012008.248-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'conn' argument in the gb_dev_loopback_ro_attr macro is not
used in the macro body. Remove it to clean up the code and fix
the checkpatch warning.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..34e79e99c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
-- 
2.34.1

