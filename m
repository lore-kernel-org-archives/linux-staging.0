Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502582;
	b=37/lI/ZqdM479kdzvNKjTMw3udI0hSxonikLkA3xDg+ePBN3wG+ijR2FHIBzTg+NWo9y
	 8EKjlrsKRf5yDjdQFDCABmyAg4QxWwz6O9+W5E25GIEvda59w+onxbFRy37JtJf5f8L9u
	 gaShh+TaCYLYpy/ptJPSXbC0TnaXSB9hQEHmepceKYWBAV/QaXwZsRsGS0EWnbKR1jeKa
	 WRJcVZ719ZpJeDsgvhvCaQEm9t4DV4yQtUNfNGisyl4tbKZpUSnkOlXWl1NKy/xtK7ea4
	 Y8CAR0lyTA1dhPUGzRcDstYERU080SeEG3nGFrWPjh1cEAYcDSZHDovIlwdOlF9eGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
	b=UZT6TsnNEQERkQmBdn+iEMnOWl3U3Q5BPv494WkB2KSb4oqUbWFb1FNfl6cwdalKWmOZ
	 HBZVKmp3nd6rhbMBZxg2Fxe+sHdkbgzOWIDjVmnHiRocbYfyQ+d/9WNpNetZrQHeO+nD+
	 8Se/1kJjaROvCGygBsMtbijMIetk/EtabKjzj/8fn2t7Bt0blwmB7uEZjbL1G3iqGCFF7
	 iBI0R7jCX80/Y98Ig9lJ41Q8cBJx3UJbhgYV4O35XImGFd0ANHapHs1hscJdvh1S3cj//
	 mJwtqZtrT/rRvfANjdJbuhFQ4qXWkzqogOyewMvpdikashY8t8bPPio+8dheo89s6xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnEpHCrD;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901B606A31E
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 13:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E901B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnEpHCrD
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2798705f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502580; x=1793107380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=ZnEpHCrDk5i7APTany4FvyTcIIdapwzgvh72wP4wePRPyedlq3Wp6v2kppocSkbTLo
         yWMWCZALbxeQSM3DRxN1fHY5jzOhEYdQUpVl8DWI0aCJK75IdBT8VEDNvIsLZtLC4EvS
         yEfVHW0qDrK6RVFOdg2px40uhLHreFHLlaLGEN2RfOA1EQq8tDzzW1M36Mz9iXQmhg7H
         ZMljT7wT8YZbndDT64gNbFiTtSNIxJbhN54Hkv9yrVaSH3t5QEKWurEqUIXu3nRJADIp
         1RbJg7fxFGX8WWWjU/Z9YLoL2YRUOD0LHp+KXSGpC+y19klFFpTPedLi3ynqX+VF8c4N
         iAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502580; x=1793107380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=T9tTWZjw4hnW6fWDGIaVYDgSJDG3prHkf7whlBJYoZHmY/tBSqYj2tqQLYBEl6zonS
         9qZihnOWI+jL9+Tg1nZ5K/DoEJU1rh2Sz2s404+y/1uLdGInqvn6hbH8SwedL4+WFXYm
         xlzKDoNQ8XODtaDg9kDParxc6/ipRB+UHNqGTXZKNJDtGQPgqa9ixvDDS4naMLD0OPYL
         DXRSBXwoB2iGyyeeTItfXAoz65nsRpFQINflwglt6jH8u2H671wqghe0VlkVry80ms1Z
         RanvlKM7UiL3/oDt1zh9ejUcg8Qgsnegk0+ttP4+FiTxfoUKMICzxYScrNPull8GvEr4
         DuIw==
X-Forwarded-Encrypted: i=1; AKwUvBz3k92jG6cvSjrkOXzwHzsbtnkd3IbRP1esRNCQZDgEiVWKWK9aZb8Phu1/2R4ZGn6oFKKw1y1VRHlEzhyc@lists.linux.dev
X-Gm-Message-State: AFq9FYJNRI5igtGK1xg4Ee91bnuooCs/AIBYd0OqQGSKP/9Rg3KtnrnN
	IZFUrQNekulQVnp1qxhcXn0oKGGFpvuQSdaFJ0z5WwFc4YT+EpLTPzO+
X-Gm-Gg: AYBFou3x6GbEKmPO7eOeC3oubvLRkx0F/yvFLu4yPgXMVYkX/XpZTniLKAfoKjtTAxd
	TrYGsSyPX9qIB/9OOi6QzsZTPU1JsuZf07CQNap6O5bhzuY8A/RR/D8Hd5BuwyqiFYIkHE8VJwq
	gEStDNp8g2s3YG1jQ95Kyu4N5ilH1WjgMw9rREJHQG6vBpMROPoH60+Tzleh3OkXgrYqdii00v1
	CTdhmaUbGT4OEGUy0CwCc6ZcpoTJ813fH+ZhmKKAzUcq1Kr8893bk3N7gtA1c2mXV3O8HWSmMfp
	1b6j+T05ZnYHGxHxuxmiwYs3evm8i9S2axS+O3g47Klq910pzYhXvH13Z5EA1BDD4JPaD/sJ/Vr
	4jBWqCgMQ3HVfitFiROWOpmun1orC9ZWwS3Egdn7AuSzOJ8rdROBNe+kyNKjPDieY70cSTelAs4
	SwgI6GfN3jE3s+2NFClQ1kck/vpR42+ZIzNFA2yuZQ/zz1I+ibN0TCF6meS7frLPs+pxPKWMRyg
	Q646CZmHZMdTisifd1jxi+wsi3IRxxJlrTf
X-Received: by 2002:a05:600c:1da1:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1d7614e61mr244276965e9.17.1792502579898;
        Tue, 20 Oct 2026 06:22:59 -0700 (PDT)
Received: from Ubuntu-vm ([154.192.10.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fafdsm6352877f8f.9.2026.10.20.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:22:59 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH 1/1] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 13:19:13 +0000
Message-ID: <20261020131913.5171-1-haasham93@gmail.com>
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

