Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F524E00C;
	Thu,  3 Apr 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686842; cv=none; b=BZfOwIbY/n5Z4bPynBwVodsZ/DZ+AQjllnAq/g48N985xYvpVIA3+lZuW+WEzRSU7fynm9IAtYl+BCetbNFYXpyGX+USU70kcUc7yQPU3iZZOSF6e8jK2tbN3R/Q+o6PgjonzUQqnxqApHQFHGgsRYyYpXjFYSd2yGFYd+aqQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686842; c=relaxed/simple;
	bh=bVf8sNtlOPiNtnb/QuJiBwy6O37jwESn47YYpAmQjV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SG6OoXR32v27nwuDD8ZGbLM7ei/zTpe9HIaorQsH831DuYwE+I1JLl4YsNURoIr8U2Fx9Mw99e+Y2z+fNKXcA3YbtkxKXtNSjtP5VN+TZZVnb7bSw96cTLBaXUKBsQIeEcVKieKUphaXPk7E0u0hG6fLKyead9G8BHsdpRFT+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN77mq+C; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN77mq+C"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9089115e9.3;
        Thu, 03 Apr 2025 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686838; x=1744291638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtb38M7XPfK2ABPkqM2/N+HipjT3AJdIZ5Gc3Kb76jY=;
        b=HN77mq+C/8sO6iLtGNjpZ5G7D8nTm25rB+gkqzvQ/uQ/k8V3xuYBIOVTBes7Zbznnq
         NqZyWwmC0M3F2Ixe0721ns6iyQ99A/KvvKs/5aNkPGc9zeV+qO3+Fnm6ubfS3Os9W4A7
         v7XMgOWoM+pJBdt2g9VS40IgRnd1kqjDb62eZLBfnidj6lCgdyLt057Qt45AOBZtjGQT
         G09UHH5kGyXoS3QoXL3kHzGEUzx2w4EPt19zfwP9aFBTpAlhlFfhwbD42n1Yxx7XMEzY
         rpPRjj62jLrhun6wj+mGZvh/4og3kW3p/xkEwaIHVoj9PXBS9WlscfO2frFoSCtOwvgX
         UOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686838; x=1744291638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtb38M7XPfK2ABPkqM2/N+HipjT3AJdIZ5Gc3Kb76jY=;
        b=HyKHc3hBfI6le/RZptrFdJcRlnT3wDuwEIVTlfXQF+9bhvaEuACf9GETRvvXm47H1U
         keOFLkTjZOBjATNJPo8EEAyyhmh1wq6C874jaz6q1X5aX5HI219KdIdHdD3eSNsQltrD
         o3w7rmnNlqiqvFicxNQCIAMmgnfldnudiikz1HKdUQRVXer7DQ8sseA6IOG6mgDze+jp
         DTFmRoKsRW8w3TNJnbsyOz6p9Xtw0B++OMe6SFZdwDnjIPO1cusI5R5nPM+0M45EHkn9
         PliKq2OQMW69mlQI5SYXdRFOJHiHNZqVlK4YMnoQ+bsC5I+g+OoFnOdUsqJ8RIfLPNdV
         iBQA==
X-Forwarded-Encrypted: i=1; AJvYcCWxA1CrSo3hZQOu4eM9SNI9LTcvDIQ0zLcuUmS99zUcmKWK9eUJu3jFlPUPSQNDttgCm9SreRaqH/rY4bVb@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ9C3pYTpKZy/0Zzbbxhfri6QaumH900ht+4kXL4aruZPHb5iD
	TsnA02bU8zsKLy8JUKLN8C8HiNIX54FY6qBiLKVaJ8eEvx45+jWd
X-Gm-Gg: ASbGncutaBeMykdWfMyw8BGfpLwCZC2sWZUpMzWL5/kmDGaFcf3O3jxiuA+7bvqcMJi
	nRH2gH2WrnTq2IWepnfke2SP7j2cRpd72ha3K86x68OP9JTXV4uffUhs1/7y80DP0C/cyiAUxuI
	0+1uuS+4OiObr04nDQGJyoursHMwq1LX5DoyfE/ycyvlv9dSXFqBkQtL+LloAlmGWL13IYeaK55
	ubqGw0OiCEkMeI+2z9HlpNgUBoxTY+wlOq9qLiU1fQldDQro0Bco1TN83TiT9qV0SGZUWCfhRkq
	McW8ip0/L6dJ88gibB5mEQqLhTZo8j+IOnlBCKwmZqA=
X-Google-Smtp-Source: AGHT+IEWrpNwkQmaE+F7DT2RwdWz5IQFeLuSWWcZCSMqyoShcSaTPUbro2aUdBJ7nPmipn5q9X16tg==
X-Received: by 2002:a05:600c:35c5:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43ec1397af4mr26286315e9.8.1743686837648;
        Thu, 03 Apr 2025 06:27:17 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm20532075e9.2.2025.04.03.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:16 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a value in pci
Date: Thu,  3 Apr 2025 14:26:41 +0100
Message-Id: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..0abac820299a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	 * if it founds something different than string, letting it
 	 * to fall back to the old code.
 	 */
-	if (cur && cur->type != ACPI_TYPE_STRING) {
+	if (cur->type != ACPI_TYPE_STRING) {
 		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
 		ACPI_FREE(obj);
 		return -EINVAL;
-- 
2.34.1

