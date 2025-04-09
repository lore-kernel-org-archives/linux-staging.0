Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9D1DE8A8
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180757; cv=none; b=XUXkPgUS+ZMawe1lJ/E76SphFQC/4Mj5pSd/zO9/2z+hhJpQ/JVlxIyowcH2pJ9pRe6ZC39fmCYi1oRkMGfP+ky+znr8p49HfcxP+c7HSJCJTGmVoXynmYj2pqSMY20uCVpt5mAReQ3UX+E9STo4TFN7oyux3fgnBBLhAM3brpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180757; c=relaxed/simple;
	bh=hVp5WFva9rgZVexzBPn+XxH7bJEYj+ZOJVusQwSN3IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9d53VNzGDeI8B9H56mTScWyjwGqN+gYpFRcA1jjR/O3WB0jpXF9W5vgE4LMH7KH23dcvSBELxcB+07Jf8Jo+M9k/EGDLqXrVKm/IGAcNErT68FlQeLDK74dbGMjpTCVOYXqB/xGOMipkAqbxG6rSKCbGhAxBd+hikNif5s1P2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UmCzDMxp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UmCzDMxp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso64529225ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180755; x=1744785555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt5oeg1YeiWkj0MO+LI199fGU/IYOFN5i4d+y5e7ahU=;
        b=UmCzDMxpT0CBqgWPrKGrYX/SNtxJH1TXBcraxE5qQBOj8wPFOd/Nu88mXmLvvP+EqK
         GJcWMI5vm4jC8djkT+Hq+arLb46OnF1Gx6xRimD5D9RcHpzfukDSo/2/f+mfHoRwlQDO
         aGIxxirQIo8+joA2o8Qa1qRhBFvALngoWUs3XrguZzBy0fot0EDRYWoJnkWPsnFx55PI
         nOMNUX9S8+lgT4FRiBWAdCKwoANBaC5BQVwLOorqhZDRzYl+IdORPljqMmmLmjYQ0qEd
         QoE8rdbXA0qIY2JSYpiq9odYP7v1sUlCQZFyPUMCXtvcEXDdJ4PxdKsRbLsxAmVsdhnY
         Qj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180755; x=1744785555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt5oeg1YeiWkj0MO+LI199fGU/IYOFN5i4d+y5e7ahU=;
        b=lAukgYEX3l9wHifF9Y8ZeU/JsiC29MDxj9Y0Ban9ED1A8INek+A64vfn6Vh34EC2GP
         5IxAfr6CxqYcbf6yLsWBKUqpCvnm9Zz3ynT99/rMozdE7hZniplZ8RlNSVA6z7Gve680
         MK8XUY75NdBvLOBluPrCOg5i3PCXAftEdbzee9///r0H11T5cpJn06QfrylKXzNB5xVA
         ZBqjsN60EksKV61FUf1blfTwp8zbJAtsEKuho0dP7LM5oAOeq3RG2wYRok6hpIV/D5Gq
         I5ynToLjrGBLQ4EKecYeJ+JqDexrbj21JJnLjhtA21sRFm2L7VtWoqx2NxHbfXBvzBbX
         8MVw==
X-Gm-Message-State: AOJu0YwWfDV8MgCmomwOFPINkjQjf55ZPaR/Ruz2uUB7B9Kd6n/4AQi9
	WTjeKGheA/J1Rsq78N6HD9yTPTHX9FIjjRUR2MycSpcHO0+z2EHmLBgNDRut3Q==
X-Gm-Gg: ASbGncsrhPPuxyFBv+6rtxZZEOj9GRd5rtSQ5xSPXUEkFfynBv/CMXBf3x7YuloBYgA
	PyZQHkDZAeVJI9oUEHt2WMrOgq+Ff9PBvNmn1der4n0GOrpLo0J8MzLLTn1RCYcv4XtilbSsBEr
	24Ka77YFNC7NTVemSU3mh1RRI4mlvU6e5MJ3Xq1CGkhu+kWtrEmnyltLq2zcDmmot6sD6FNRddh
	osrAH0vyEk4uWgeAibux60g/LVtfRlBljH0gT0HxoyNSXBWhiEK7RQPQrs5/riuI2FQ3pSnOdh7
	aWP6R3uV61jBLs49LlwDUPNq01ZbK86t+WVqdQH/uzNH9SoYWXqt7EbnL79k0h4f4KRg2wveYp8
	FPtb53g==
X-Google-Smtp-Source: AGHT+IGnU25bUP5atRZcFC1y9/sAb5cC/bQ9EwUgqsr5SeEgKypjDzpbSo8xQOr2SRDfkZR9JAXTww==
X-Received: by 2002:a17:903:3d0d:b0:224:2717:798d with SMTP id d9443c01a7336-22ac2c2eb98mr27424215ad.50.1744180754853;
        Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cc91ecsm4078515ad.212.2025.04.08.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 6/6] staging: gpib: Removing function ibAPE
Date: Wed,  9 Apr 2025 06:39:04 +0000
Message-ID: <20250409063904.342292-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <ibAPE>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index fce33f5715fb..4c01c436b9a7 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
 int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
 int ibgts(struct gpib_board *board);
-- 
2.43.0

