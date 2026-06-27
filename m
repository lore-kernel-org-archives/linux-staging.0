Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74F3A59BC
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565289; cv=none; b=aj18pI4odB0+MCeIcNlfzVPEuv1xd7+GdjUKtzVbErYOumwDRH2P7UumchAbYJwRBpc0xY/3TC0f8JHhS3mPhJn+kdq1CSo9vLAQGeNdloxfzX+2ubJRS+yDDJG/sepRghU9flbsG0s+bL6vJQj7enwE4eOJSVpMHrz0Ks3gkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565289; c=relaxed/simple;
	bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Auce3tb21aot6tiJvszI8IB/VnqUCVqlYbjBOiev4MBoZL1oAsDF9NfCW3P7Kvxw25ebZ2HU3OBUClQcpIRrS3swjVhOpVOoQVzTwVkhvIV+VtthRmv1qhsj5jIw8my2mCsaT/O7xXfMWuXnrW+Tjh9zH9t8IsShqHkEqJtZBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=uYpgXM5Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="uYpgXM5Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so20777415e9.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565286; x=1783170086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
        b=uYpgXM5YTQjAKNibLorDtjYiNLmZkRMkoF4ZLzUVcAToIK6BCnNup0e/X+UTslLLXq
         O9K465uXcEio8hP3ZkLdXm3yTUD0nCkzL8DDrZ5eCyXlf5lDUWWQyO4IA9GkFYY6x7Xl
         OwXjPnq8lCF8CBqDYRzKPs+FYLt6Okp2xrUVVEt/aLJfqQPyHi9bhxbFqSoiYekJo2ni
         dSOqhcLIbtGDfi0dnZpA9mh64HBX7lQyIcMJNXvMJW++/QiGhV6uPOZlKp3MjvHJNdpp
         ICtofsfSw+7qonoM/siKjiV9tvz6RDldX4+SHr44dL+3sThnM/iD7IGJjNhKUg1g4hw9
         KTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565286; x=1783170086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
        b=fK3/X7yxV/UNWJQQAu0aRNLPAq7UlV9hpYWnmmRmb8Ns03ZiJevngWr0xOQVnAofTP
         c3BlYulymPrFIKYKoRJ31YIJkINRhA0eO+Hpo4yO4FUghhwErwG35MWx227u+aZWSsXo
         qFRAYCzq0W7SP08tMEsGwiJoFg6KY4v3HQ2LoCVpadkaDm5BBOL4YivdJhna4QJS8eRd
         ShtUc8Yxlj/m5du1J+wF1sGnd/LcZdgplhrGEbhBr3ZjUW9nUsnzUhhpCIc1TOjChEft
         xb/rp4l30AhM7gH5DacVAbWtSONyshCqd6dAc0H2BSzP8XvHJiBl852VgkYXXTysz11N
         zWWA==
X-Forwarded-Encrypted: i=1; AFNElJ9Con+7W1VUE2/bgxrmRiKtevXMa0wB88d21l0bPykaW+6f2z3Ed8Pf6/maCXXA/i2MT3Mg699nfWGLpinI@lists.linux.dev
X-Gm-Message-State: AOJu0YwSYUQHX8B7uXg3/1A2cXWxHHc7vf4YjcpV8xzoxtzHjy9jWM2z
	foR8tgPzx7M4CbEVKNDAU379QPzldaTCSgo5q8dqbtfdvxnNzD7YWDyQJXbGHWpgZAXq
X-Gm-Gg: AfdE7cl930bYRNPMCg/ZSdS1a0B/G1ZR6mcIdAlLVydn0knmIXZWLDoNinLctglQ9rc
	lwiOBbicsp4OyL/yO08hGGy5ufmDmTR7LNdi4YyfiA1K9nbpBByM+WrvByfn5bbYrK9jBrjGx0h
	2dMdWRb1ZsoxDzvlIo1+9MZ1ccJ+JzcT+j+aW1HjJgh/fUB820E5shtSUzs7w2HPd/RtSPHSPNB
	su9fAc/RkMzGVxkCf/RCnL81tSBFH9hLmeDWrXJnjFZS6dHBxMCa/nFe3YrJdF6jCejn4Zjbz3Y
	tAfIHceUI4rJWBMv3Z9lJF6SyqHf6wf1ks0DJlcebg0TIzlskgZc2yHPYFmPUojSFWBNaY+8cgX
	O9eiKTCFqDnB4U3eN+3ERnwwzAoA6MvsuGTkPyvCxUR18vYlV4kWdJC3cx2BupPeNq7WcEJEBHN
	Vfd9KoDNOT+TttV7IOGSU4PtvJmlZYnD5PrK2VQF5gfsLjFMf8jB8WCOqPAoxCkAUkQxTP9n9Qf
	VbV8VgY8GPnLtlp9aBlFs1CMvHyij6uIb3MQW2AGRG7+w==
X-Received: by 2002:a05:600c:3587:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-4926641b4c3mr124297055e9.10.1782565285994;
        Sat, 27 Jun 2026 06:01:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071c9esm155504645e9.9.2026.06.27.06.01.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 15:01:21 +0200
Message-ID: <20260627130121.78713-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026062709-copy-ensure-cf64@gregkh>
References: <20260627063924.79491-1-doruk@0sec.ai> <2026062709-copy-ensure-cf64@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Done, just sent v3 with the Assisted-by tag, plus the Fixes tags and dropped
the comments per Dan. Thanks both!

Doruk
