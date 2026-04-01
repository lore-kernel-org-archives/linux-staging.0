Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676947CC7E
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063715; cv=none; b=Mp8Buh7XbpV3AzrwljfCnaAxIgdmZl0Rte755P1d4y3LQnTATDth4VhKWTBhW07DIByY4kWzS8o+sSbQFAs/vrKpqUq6e8QffBNofzmb+QJn2gx76wTJHwpfaJHkPGd5DTE2eMPmUeN1iwSnwig0oO2b4+44RrycWdwN3+g9dDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063715; c=relaxed/simple;
	bh=LqK+F2Ypb2KsB2A32FqA6hBr8TMRaI5NPIP89Pl7v08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoJH3vA8dSpF1MMkeDg3NopjKTvh6Ijb0mC+aExxD0V12Boxa7f+35Yv6LZFpSLlKrz0X9YXjdwQQkOwI0fFZPaX/2H1xe+OdygUPkG6M+jmZl4uGOnH7E8xN5xWcl3Cxa2zZ/qVLmRtYLB6rSo1VB4Q++jHlIum3cYyLD3VPF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=ivxIWNAv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="ivxIWNAv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b23f90f53aso47016575ad.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775063713; x=1775668513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqK+F2Ypb2KsB2A32FqA6hBr8TMRaI5NPIP89Pl7v08=;
        b=ivxIWNAvHvSIz8zDjiZrCFdmpc6e2igXlPx5rJ9qLsgFG1YMoKYUyMxopuCz4cmubX
         5XZ05tPH6iOY/amvQZVtrC3bvRn3qr7dTlB0dJjL18AWNfwetVWLx0I23kAENqqrJ4bE
         xfdKdivBH3tKzmU/jdQh1qInwcCVqdNSRbnzoUBkPYbaxkb1GivJyH+0iRznF8x0jNEr
         Yex0xDaLq7GI2zPl2NgYNfIRyPOhTXlYBo2Y2SlD3in3OyZlwKFoJHvJYlfDgW+B51cn
         LFUL+K3LER2j5mAG6It4GR6D0CvmGcgk7lxjEEulg/kSYnfMpRh0rl9eC5LZvk8uuSdP
         pU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775063713; x=1775668513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LqK+F2Ypb2KsB2A32FqA6hBr8TMRaI5NPIP89Pl7v08=;
        b=n82q3XpJJmkTppWePeSi8kR6Rqt5PEJe4TXqNflW+7X6DkhQlwRQNMtsb8AqsF0gtj
         mDAnWMRnurxETTP7Qq8d4dpOzTHrcC+yLXmzkiovCO73DqyiPqlh01cE7eUaWS93Kb//
         fUixx3aqFOl1WE6Xk26DnJMfvx2IYgr0ulLeaJFOubBSYHFQoA9OnffSK16KuOFJWzK9
         3qGZTw+PcgGSqZh8daqak92oSs1d14ps9Lm2etnhjFBqUa4WlKkK/UlBnfeMSrwiapAo
         TqGbgZKbxY4UVwacD4//qjaCayB6xfjV4sT9gePirzWImEoQ3Q6ZZ3zq8+EZat3aEW9P
         GZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn2840hiSVJLAeyNoaufcn9o2piNlZkxkxdAYRBjX1LoLo7AsseTVvpSUluo9QkdB9iHdtztTJCH/xT3dH@lists.linux.dev
X-Gm-Message-State: AOJu0YwSefiW5Ti9FJfcVre1QkpPzQcfFGaKVUachTjgNuXAk8anKnef
	d9jUUhPmu51Uu4mi+J6b42qpOjTerDxbT9gBcxF6mpukseCAt5J0v0rU1lSMYeN5Vk1XD14QUEW
	MxP2EopClEx8=
X-Gm-Gg: ATEYQzxuDvCxG6g6l6Tguvn1nnegR4yqk1b/LM8hoBnSdJ1FOLhKRUOOJO00hiaF4go
	Lly7n/s+0E528QbGCOolxcQ+quGOIyRqwkmcSlIt4uooyYxe3GBBsqG6P+ffAUfPe6MSm7n8ZLK
	GjBtB8uJ8qNFbObTKSBW224E4t5qEPu9rYcs7umhvkqStJFZ36tFN0yua53ZMFiM0zsR9+8UTeR
	T0lf4oBN31+68TJ0IOuIiVC9E0f3XfY1ZQvddKG2MpmtaN/V4/rMbDSgLMlwsg69c2oStnsw6Sr
	UCSje32UIf3c2Ll0Xeggvyqk0V6jAGdSlnR2/grPbp15YcOcmXR2gtHuI0yLP+pDyPI8YVUKO7x
	ixWt7NTbHFI15qj413PTL5HBJ0BEx/XxeSLIW6PDTwdLl7f+rPbXplv6Rrp2k41zNDWZL9eSOSG
	cPTDdJ/a/byJ5cq0o4JD9akl5XpvgTH2OLmqibhiYeKdtWHkQNIv0THEG6wnDMMgtBO9vba82ua
	pZcrTSxttnht9OSXitwBstu/mS1maz1DWkiCsMNpQ==
X-Received: by 2002:a17:903:4310:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b269c8490bmr30058745ad.22.1775063713302;
        Wed, 01 Apr 2026 10:15:13 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm3578525ad.69.2026.04.01.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:15:12 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: Re: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
Date: Wed,  1 Apr 2026 17:14:25 +0000
Message-ID: <20260401171425.89186-1-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonathan,

I noticed the existing Fixme comment on the Y-axis channel and
Gabriel's earlier attempt to fix the single-axis representation
(v2, April 2025). That patch was not merged.

Should I address the Fixme as an additional patch in this series
before the move, or is it fine to fix separately after moving out
of staging?

Also, if I should fix it, would it be appropriate to pick up
Gabriel's patch with credit, or should I write a fresh fix?

Thanks,
Sheng Kun
