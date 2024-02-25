Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB21B59F
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882431; cv=none; b=EU34m7wXexpU5wqisreYT0BE8G84uACbh4ZyIfa4kf9SnBwfs6rhiyeJGLBN4uV2bOsa1Hn4nr1Ou0JbPBcnY6brax5lWBxJu+qccA0gTUSGd96tPTb6kuCzkY9FncPtt9NLa9Eh2stLU9dWE+gRLRHYyO2m5z8egbAmull2O9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882431; c=relaxed/simple;
	bh=IthABUHIimXWHHseJF0VRBJddzoOxpJPDMhoS9JXf5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CB8iGwGobwbyM8dluV7wzF4uOW+2jfaaer4eKMTXb2mxbTRgSs/gzB9Mjx5HYFJ4e4hW53aSLMojePgBEE5IVIKSw+hM+9pYxBkMsUxIsBDZIMVtfnCaMBIn3zoVDTiJ/HqQnaB9NYJqG6t5qz62G65qaWkp0Be/vXdnvvaNB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXCjwbWj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXCjwbWj"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d27184197cso26263171fa.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708882428; x=1709487228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPBFT1fUIi7ksuCRDDRVswlvAaa8ikGoP2BWWAmlidQ=;
        b=AXCjwbWjmZlhDg/DxS+jEVQQjypb+nPpWPzQBYgDfbK62HMxS3vkHZiESUKkPZyaz/
         SlpTf9oofYRxjLnNxCAJb9sQZOrqbNNpOVlpmYN8PVdrBGGLeBxvMh7b64nA3nBpc0m6
         C3QXNQDvBeJDQWlRNhdkkYG0THGwn/oWt6GZttj2WcXW+vE/iq5bxG2otezEjHXwBAwA
         IJKGtx3nkSoHhkR1o9e9wa/Ub8JIIDQkDcdc0AxeHIvJvN7NJAlrGOvnjmtTIGUwlIU7
         B47vI100s6R9ddYnSLVYfp/KCYmuwKif4/nBZ1Sme732fOOE4Hzpq2E1J+vjnJECWECS
         gOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708882428; x=1709487228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPBFT1fUIi7ksuCRDDRVswlvAaa8ikGoP2BWWAmlidQ=;
        b=AMfbwECOqE/z7SQQZq2XI4xlbqJHHbhGgi6Vlhz4zESslZO73eFv/A2SdN3Vu4Gy61
         HaFovq59JU754OuJKUl58b/jlofnVgBb/9dHFyjt9fLJ2YnwLS0ur3hThkCGLDO7FhAw
         GgeQG0DDU6nxMw/1415za5xbsxvy1FD6ao6vryizK4I9i/KcMt6Ce2LLVY8n7D/FhqP3
         +pv/+n03PYLS0x5Os5Gu3ghFPICSRPtzPZGcaF/GjW6nXGHXwIN9m9OJJsVU5bypCN4I
         4oX+7GclZCHa0JKs2J0vxiESPrYM3Eb/DioTfndoKCLxGlIv3mYCaJkgrMGAB1CmZfaT
         gqig==
X-Gm-Message-State: AOJu0YxevzuDCIymNjAOx+JQiE0CCdyc9PjQtx4SllLt+6FLtV7mXPvx
	RqLs4fCChORFhICDA21zlmL1Tr8LLji+6g/yxQELDbppDoPrXy1+
X-Google-Smtp-Source: AGHT+IHsOM8tGc0IV6nc5wCo4tWx4xoV/xDFmcQqpT3Ngh5ZCvNbksI08Y5hlXG7TJXPU1CK9qZSdw==
X-Received: by 2002:a2e:8543:0:b0:2d0:a19f:e44a with SMTP id u3-20020a2e8543000000b002d0a19fe44amr2575095ljj.44.1708882427456;
        Sun, 25 Feb 2024 09:33:47 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:79c9:6db8:8198:3c60])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b00410bca333b7sm9400108wmc.27.2024.02.25.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 09:33:46 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: pi433: Remove the unused FREQUENCY define
Date: Sun, 25 Feb 2024 19:33:39 +0200
Message-Id: <20240225173341.1278918-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240225173341.1278918-1-ikobh7@gmail.com>
References: <20240225173341.1278918-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FREQUENCY is not being used, delete its comment

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 52e43a909b03..e63e87fd6cce 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -11,8 +11,6 @@
 #include "rf69_enum.h"
 #include "rf69_registers.h"
 
-/* NOTE: Modifying FREQUENCY value impacts CE certification */
-#define FREQUENCY	433920000	/* Hz */
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
 
-- 
2.34.1

