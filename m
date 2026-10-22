Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666971;
	b=vHGdscmYoyRm7c+bKv11fNtN0OcbBCMKPOj1keGyriThC7SmAQ7HDtyJyq+T5GvANRLy
	 vaBvVsdhv8vcorOcRBYl53Drjfu+FzbBIwOEmJmmdvemNlql9KFdOWq8CsLU2w7qSIXvV
	 LMwnymOmgkHu1w1egQIBTy/lp3zqzilsLeJkNs9UWjWzUXW/ZnXG3WFfvnPwYkoWkioe7
	 XSkNl0sRMo9iFMA6Zr32vAvhmmg2H/s4FwfnXlHtvtVUfa1EOWW6CPlAV6fuDZTtU4t6Q
	 yzzwDqV1QH1A/h3vNYoLQl1tWmoXXlnKSoNvBH/qitFD7xo8TVX53iexByFA/ZRlyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
	b=ZA35MSS+Eyy2dOXs4y/YqiPXSJAjVDcYR7duE4HR78gXj+i7X3ZeTP5KkI2g6Zg2jRO5
	 1TyGQWRmD7rvYUL4arqmZzui73MVFFLwQ+PhUfxA7SXZiD/kraO3DXnpRR/CBMtB/+8oR
	 ykgQ4ZFbuuke4b/HTlB8U9lF4ROPjzIuA54dWuQHDamNqMbF5IISokwDxtkwqRaMQwMxV
	 TFBwKAahC7y6AacKcu1A5gl1Ke0RbQWoEyWiw9nadaFGWyYlWQZ19nArv7pKDcoaNEu3I
	 tXEA5Gb2vCj1dRZeVo4P7vWWkotTTqWhPuDHxKKNDmrwq5MG+0Vlg7UQiohlUqSiaaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pK7j11qp;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFB606A31D
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 11:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BFB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pK7j11qp
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1345661eec.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666970; x=1793271770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
        b=pK7j11qpev9sO8QW9KD+8LaWx2fWDVK0eEy661rn/PL5k4cOORZSb7gsFcOroGf1tu
         yT9ISyVr4yXT839ZzGFrQC3dcN0Wt5wjPG/+1AHSzuwQF2BMM/y5y3dv9ycHAw3Obvq7
         grdhlGYEa5k/yI4ryXnqXBN/VksNKNHb7wxCfajGNs2uYZVjt3+fFQrJTgjnK794o2d7
         chwvmgVq2GdyNYckhYFxRBwqb52qsVF7VLb2B6/yLIDhnIBnFwWvEmtsX9Mx3qxu4fVU
         gfoT7n9mODMsWH2YeFrDqgabXbJF6dZckM/WPahYktNmhHvfaSpop1p4R8RvF7/qYZHN
         ZdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666970; x=1793271770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
        b=FWH5eewFMscbtaECgwgro+j5hToQq1v07nNOtgAqFenItEju6KsahV7oC58fDyuYi+
         FoZ4GzXxXIK09TT7iwtmGmlezRZNZEEY5R47+qXSCv7ZCAfUis5VJnvfUaCr5EgJUoR/
         hqbbsh7T+zcuKyJEn1FFi5hF07e/jreYFCuaRyAlrRKJyLTSD1QCbAqqZOH+crEfCoR+
         0baoN/yYcw4UG/g1y18CCBF9kEzrV0RHnDRe9DXpV0KJfkSCtbUqD/63v5PPanObgcjS
         CNt5tT62GEThJcYRFAIq12WFx9np0MeG27BqDFuSaxXZouIlLR13ID2n33WpTe0I2O7e
         gCHg==
X-Forwarded-Encrypted: i=1; AKwUvBxvlZr0TqWWMWsszf4o5AlfP1oVHsvAw8jC4x7gFIBbnv9G0+/Hq4hZEZod9QXV5qGZkmlOyAAGu44gIH3B@lists.linux.dev
X-Gm-Message-State: AFq9FYIv5Ni8xNTe50naXif7U3AL2b78XrV/6KNdv0G12G75h+qzaoZB
	MIxhe87qjsMJnWbPmDmXqCrXhyJixp4Ih3FBm0JdC0YhdhatU1K1EG1s
X-Gm-Gg: AYBFou34KQVgLJ2/kaWGICHXydnsg8QyZK3T8a+xIgAqNTV5rWeiyQiIB0xSWyMJ8fh
	zyGhMTtaDdHAa7tq+SJLuW6+CcZ65vLOhJ7GuZ3nccaW6k1LrOpKBC9oNOcOjy465MrS85oTW0n
	LJJ05uONOfErqd56bh5ltvBYTBAvuVipNxMcey8WAaz7xPwuvBdTGj32mGdsnwTHMxSHRJBnqDa
	k5BXaoU8py5vGzlTs5kJFYPXkcAAvu25xnnS5ael4IMr3AjzlUUkT0P13/AjP/WoEDaGn0PAdkb
	gtf2NklmHRuh++6bcUpZpBD/e5zKXfK5FIx7hY9B3FVNLTfBEesnaqnjBHDJjKXK1617z6Ftsug
	vMSw8LATF2AEaiB6IsZA885hSisjfWrC1IRfJRnUNS7zRGKfkowxPwjcRbTeslg3rJGYaN8e+St
	TzF2sdQ1LGy1K0DevAz7LeAFbCeLfIaIUF9+5uDU+IpumCbNLwkewsBga1OojDqxPiezzi16lJw
	GFD0tfO6+GI+KkysKhRIV3exYLXWsvnbYehdjv3ulDEvwgHjo/ZHr1ePu+XxANy
X-Received: by 2002:a05:7301:d183:b0:369:860e:47c9 with SMTP id 5a478bee46e88-369861d8ad1mr627733eec.17.1792666969949;
        Thu, 22 Oct 2026 04:02:49 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:1eb2:a1a0:7ebc:597e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm17907353eec.15.2026.10.22.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:02:48 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH] staging: greybus: Use fsleep() for delay
Date: Thu, 22 Oct 2026 16:32:38 +0530
Message-ID: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

In the loopback function, usleep_range() is used for short delays
and msleep() for longer delays. This requires choosing the delay
function based on the requested time and converting microseconds
to milliseconds when using msleep().

Replace both functions with fsleep(), which selects a suitable
delay method based on the requested time. This avoids the need
to choose the delay function and convert the time manually.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..2fe845eaef29 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		if (us_wait)
+			fsleep(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

