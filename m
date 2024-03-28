Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA97F47E
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627979; cv=none; b=oAl7GgYahOGWRnfls4W899h4mdsumSQsGkNoV8AflyZq5CsiqYdJ8BXnz2e2GdJ1gG4KjJsSVDORy98+AOHom5WHni6///gpcB10JhjPL5Ep4EbcfIiGavaly3QSxKlyPsXxzarMm1ztGflZkNI4qb872KwcIqdf2mAw7nM5ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627979; c=relaxed/simple;
	bh=jK+AFaPuB4QJkOlQSpapYzjziTfiCfCCfo7UWLC+ajY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbpUunSu1Qk0KffwyDTsvEHOPvrEv5R3q/S5Qek6V1vv8+92fjFH+btAew6bbvmt00fMCCaSsbruwFcfk63/na7LkWIuY5LQ9dXfR4SLnIdpf2O7KLIMK7ny+PVASR5AhywwVEqqAONQ0gugImN231BEQ+ImHWlRUt1BJrUblfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8AYMmpJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8AYMmpJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-415446af364so3171235e9.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711627974; x=1712232774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=V8AYMmpJX0bzhu/4zPh1/W1DGKRXFADrVFeifSfELoKqsYl7MR67Uo8/GEqHMAKSE4
         fpqToBGTQgNPguZcW7Hw9nfoukyVp1mYLMI2BHNRZuAjmIygcr0hlNEfmJHVZiJNLQYt
         5f/e+79UlizK0V00tl0ahXusAgxtVdGpQ/4Im+pIBKufkHNbCEo2f5qtQwFd+03x5o8K
         WGvsF6fu0wIOxE9yw1wRQq0e6g5IK3Yh/XEjEFGSPx9o3jOm1DCMabDgDslBXaSIV+gk
         Ehujypy54WKc7n7Byo8gnXyht+AbYcDHtll3F+cdYbTrYySEMdDabemmStSGHTFoxBiN
         exSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711627974; x=1712232774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=BK5grvDbD+xsHAujSmXu5VRFV/62f9oU89H+7LJQGMMifinclbVh7FrLO1khyxb85J
         edb3ugvMQwrdnSpHzLILj2NlrgNiPjUUbh+0zzajuhB5DCKbanKvMJPPdo66/DqZsO6U
         dxmaR5Q1KnBcwMh24Mx6Pz1sXkrFQo9+oy92geMaGpI/XWRLu83o4pzA19+Y8bF7EYuD
         BVXj7EQgebkaUnJqztIYPes2oKX6V/Uwtz5FyehxABYizrXvHeBOMpDt/05q6EjZxwM4
         T0pT2GVU6SEvg8eny2S0BEAgpu+yLTMf9gupZY4m9vLEEoShd5qYgNQPE7VIMNcIrUb1
         fv8g==
X-Gm-Message-State: AOJu0YxCBfi0V7Hr8g/kqARib/7Mq/aWHZMJPG/r06VXC8sGNPE/kuGL
	FCEI3tt4/t6UHI7cckW/UO+94jslymHkq3TF8UtlwZzwVZfEqTV5
X-Google-Smtp-Source: AGHT+IF+IokEdEflEHk8FkCNBzqgYdy/CilxTJ3PWNYmSf1TJrLbjG9XI/v7yg25G0/pAzlMPoQCUQ==
X-Received: by 2002:a05:600c:4f89:b0:414:87f7:993 with SMTP id n9-20020a05600c4f8900b0041487f70993mr1727393wmq.18.1711627974155;
        Thu, 28 Mar 2024 05:12:54 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:125e:963c:4e4b:b7c5])
        by smtp.gmail.com with ESMTPSA id bd11-20020a05600c1f0b00b00415460a63ebsm1416456wmb.29.2024.03.28.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:12:53 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: pi433: Replace pi433_receive param void type to struct pi433_device.
Date: Thu, 28 Mar 2024 14:12:41 +0200
Message-Id: <20240328121244.1244719-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328121244.1244719-1-ikobh7@gmail.com>
References: <20240328121244.1244719-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pi433_receive is only called once.
It immediately assigns the data param to a struct pi433_device.
Rename param name to pi433.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 7efe6b8501e3..208c0c6d3649 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -409,9 +409,8 @@ static int pi433_start_rx(struct pi433_device *pi433)
 
 /*-------------------------------------------------------------------------*/
 
-static int pi433_receive(void *data)
+static int pi433_receive(struct pi433_device *pi433)
 {
-	struct pi433_device *pi433 = data;
 	struct spi_device *spi = pi433->spi;
 	int bytes_to_read, bytes_total;
 	int retval;
-- 
2.34.1

