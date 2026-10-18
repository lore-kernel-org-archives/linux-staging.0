Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2413F4DEB
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344468; cv=none; b=d3sLO3jEBZCmn1ePW2F8+DWyLmszjMmcrtS8LOr3FioYUL+d0jJeOLk56w18bfZsoB0We0RB5rGdqMDp9X6SRE2DkhxO7da2pfCZN66sCPJbVHUcXnq24BvCz5xAe51FZge91Jq42ZekW0uCB2TOdQdNDNvv9YhAomJnJuxQq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344468; c=relaxed/simple;
	bh=rkp+TJ9i5bbiS7zbelTL69SgmxfZjEfWqntjkizog4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxIZAE7TpbzzZerP8rEfyWy/lwqI/4x1NtUrtXCAKS91fRfRNtrE6E60UQKqO/n/tSsvlgD2c3NWa+vPUfj3Dbrg8RYb/kDeTXNyUJ1nLcpMIW5U+E7qn6ckHurxiakRVsLba8RM745FOeMHPI3+YjhJ7lRkbrzogmSneS2pyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nv0PnGL4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nv0PnGL4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35943f55c06so2040412eec.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792344464; x=1792949264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8BhmEAwrAS5v1BhAMr5BoqzbHilf+inH/YH2jYRtiI=;
        b=nv0PnGL4/2739TwVw8F1AebzmXbqF7wz50fEHLZYOqciIZR1QjnE1NVBFMsUTPEPtM
         vB/DZc7pgqWkdE7ss1TbDmAHfJFNzUo7vrEdkKkMkleNSYUiElRPjQwpaf6ntkd+Iw53
         bY7XxegxkU+7khFUPdwVP3D4yqVzaUWlwjMXIKeqoQtEPp/zFVgAR/LDQ0Gle7bA2IH/
         wVs/RDnDSfo27iXsr8ZTCvhUqvN0U8g80NZKAEia/wElQhqYiVEFx2mUgOtQOt+YLMcN
         JNWLAsdwtd+AV5IiPURYKCRfx4fxa8tsCxgVA8cQ3hALhIFIy0SblGHyNZUUqknor9tV
         rOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344464; x=1792949264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8BhmEAwrAS5v1BhAMr5BoqzbHilf+inH/YH2jYRtiI=;
        b=MfgN5ajrSxCdP8uWkqdtsiogJlKuuXMvPUeak5UOfAa1/GBKW914y0f9PCKxUcPX9I
         gcfIXfbsaNb3+PUFrsJQKDrum0RQHIO688qdNwh+kD+2VrjuUVkaQIMkDibsA4ONq0mf
         /7Tm/L3quHrlBo3Cbk7dFzw45nokUGkK3M+ujAyyMtU2zW5H97zqPE4E4fbioIVhw7aB
         tVDVGKgLVISekQ9jdOhBcEUZ65SUN+lucvpz4AEb4oKTL7gpirlCxdupsxzNI+fg+B80
         /MBEKnJzSN0WrZIDRDF0/Jk8P4JF/HB+edEaQLKjQucYUKnY0XbddCB04cnWd6ZZhdaD
         J2zA==
X-Forwarded-Encrypted: i=1; AKwUvBwzlnACPloWHLcxPG+ocCSBBnEGpNEeDs5wzquRZYVcRLg65Y7s9ZpUy9WR0lG/FVLX2cPz94lzCLbS/Fk+@lists.linux.dev
X-Gm-Message-State: AFq9FYJvSV/OHUGjgJVfb38VrwZnGhRl6NKBLZcLM+Zk1Ae63WvxJxTl
	k5kDSX4sKD0OrQT/G8rkyhk8lcvW1zURoqQAI5Df4abZl3vLdAUaBFJl
X-Gm-Gg: AYBFou1vwluEzWDyoUBt8yGFnTaPoFhl4Erk4Q1A/nUz9o3k8QQCpI7nYlFYvI8q/ar
	WAYWBsMuO3hdfTQZZPYpbflIRwXp40ZqWJt9f4dvqlzmy8uVC/wzKN5OQUrKtq8xC4EvHIIwFNQ
	qNkzSf8mp93Y1ogzJY4zznnN49jpM1P79qdDkyiBI968hBfqhUTQj358xuy35oISen95xG7rUIF
	irvvTXsDrivqAILVE+n0v7jgGGN+1Nf5Op6GoxrNrCyb87Ep09wxYQ186oC5sb+SUVj+3fc5JYe
	etKnxxpJepsrhghKMxFBCt2X3j9YXfFgAgJv6Wtz1/3AtPEc5Pg/fwar/9o7LNA1xWuIR3MIf7F
	IU7prhT59oQ2ULcsD7Urml16lAHjIkk+WOTQnfLnL4NFNX8fTVsDKUoWqaYauNp1DKLtHC/5Ke0
	FBPs/Gfd3c6g8xB1hZfNMCH2azLSu48lCCuboB3DfTbadCM1XeRwiXVwb9DjwK71mRze0qDLmxx
	KPRbdUrMjnL+k8=
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr11919489eec.10.1792344464092;
        Sun, 18 Oct 2026 10:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f0:11a:4ca8:f773:d2e6:c98e:8b27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm42654054eec.28.2026.10.18.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:27:43 -0700 (PDT)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fix loopback Kconfig help text
Date: Sun, 18 Oct 2026 22:57:11 +0530
Message-ID: <20261018172711.8013-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GREYBUS_LOOPBACK help text incorrectly describes the Debug Log
Class and names gb-log.ko as the module. Correct the description to
refer to the Loopback Class and name gb-loopback.ko, matching the
driver and Makefile.

Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/staging/greybus/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index e1d7ffdf4a6f..3ff47550081d 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -75,10 +75,10 @@ config GREYBUS_LOOPBACK
 	tristate "Greybus Loopback Class driver"
 	help
 	  Select this option if you have a device that follows the
-	  Greybus Debug Log Class specification.
+	  Greybus Loopback Class specification.
 
 	  To compile this code as a module, chose M here: the module
-	  will be called gb-log.ko
+	  will be called gb-loopback.ko
 
 config GREYBUS_POWER
 	tristate "Greybus Powersupply Class driver"
-- 
2.47.3

