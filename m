Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43D3A257C
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548102; cv=none; b=pQSlDcqkaKq2t3ScZ7e+TUW7K1irpxX9P1fPL7gKiz473C6naaeEPgFlfygd40Lfe1A2fsFqaMUyULyFYpA31aiyIHmVthLBpiS7RXwghEnUzM1HSlXmnyuML2Tz1xNq7obI6Q7D2GEmnGssl+xpXnKJxaoj5HLNeAiSebk57Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548102; c=relaxed/simple;
	bh=SwbZZZ1xSxNg4oKvTI7d37r7D7/JAHZDzMxhs2PpqL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcMG3FzJqJnmyaRO8KoI13yxDV13q8facLOTSzyfvefDdOcX4eB+FAzVOqQGk0zZGr91zxIRHM4eCJlCeio8+m14WOji9JdpQP4jceq79abXGhAAT5oFsUtm+FPiv7vRb3f2Y5fiqp7Bxka7t8Z+8JQZ1DpQRo4t/poeHs/hQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXeYoQVP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXeYoQVP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso3528483b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775548100; x=1776152900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqeOhTHdWAUDurkfzU8G9NdSfZd1cydaJmMmKO+4GYM=;
        b=eXeYoQVPWB2p6UOsU8iwYxDUjyJZQscdjbAekW/3A28AJfEdEIcbm0hp/EVXjf6cbM
         aaI/7KmkPh5LyYEX8U54iPnRgkm6UBX3ND/eIEDJYiz40ETxI7LigdXyZyzcU6YJYF+x
         NKVtWVPSRyxdorHeYCLgLKVNChD+YEEMjsCdN9+XS/E54pQc9XB1p1Ii5Rm0/kilg7M/
         kkVa8ZHvcZYx6kSzKGOCBqFytbCb1K0t9dVRIXBQEX5rBnjvFsCKhCT8ENZ5oabJSayD
         8M5EVgVN4+85e8ewaUY6wrmDaeTqoQO8mRBoTglP4MeoxUeS3q1dXa6XS74qcsi+KZff
         3FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548100; x=1776152900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqeOhTHdWAUDurkfzU8G9NdSfZd1cydaJmMmKO+4GYM=;
        b=ft+Oj01/2A+pgkk2L9LYc1v7IFSaOuuCtNxcswqsYn+gwGltGF/narP8ZBiuFl3cwH
         yxc1Er22uREihzNQfhuyGk7PgNZgg9wmVJLxwwKz8lxJ18NU8ilh7MmEW5DPj9qkUPy3
         iV0RHf7wqTtk1RN/0HlJPd/xNNr2+40Envf/Z8iDJ0vKlZK9bYuLCJ49Ep2Xz04lPnGX
         ijLQCWKGeVIWDCd+ogZL2OhHaMSrOGkAloCh1RxawxW5VOkKURjDmtCL9JUOAfkE9UuJ
         JvzUv0SxZYmpfNkpBw8yT0L7dpamyoR4Nt7WJzMXYQmbTFhzUhc6heWqKveNP2jeow5B
         O1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs3dKEUTE+Yfo0aZ/3FWQT3yujVtP8vu54Pki4lGNpjcw5NeGg+w7eE6Vbe/UbIPfYk7wnmcaKmFHfNds1@lists.linux.dev
X-Gm-Message-State: AOJu0YzCbObNy/b0ZuHnfFXgn7E7KMmnLu+5aQtoUaxLZD4LZqB3JdhO
	9v2covZoC6QAqKtp2Zx9uofyGxErk5KGIC0YVGqT7RGPrWSZc1Q2mOrM
X-Gm-Gg: AeBDievtq7wpRu5wYR90qA7Hdb4+U6yC8m1wi435JoDlN63dHJ5GjV1nndAnSzozHdL
	StR94HrCpKGo4wX9XE71Zs+A0oM51PTgsMS3tRQkkPF+xkA13VO6Xn+lkmr16il9+4vUSS7MWJf
	JB9wDckiwwN2LljMF/TIu9iEnC/rqRfYhpl4X+pg7yIcloT/kIiqx18kOAhMP5B3eZPJwty8r0m
	wS10vCkFGSjcgGHO7luucTeZaq4gN75W9z5Akpk9arHySA0npI53aExqHXkCR9YXDcKVqzW74/G
	GOO/uhvA+TNa47xy1KGdBTEeB0wj4yNZOndH5/I/y5vxr50PR7+BQQVpeG51q/8OZsOFgZP1fLt
	CWfNe5aqfMXBRWF0JYcEbZvCD1n46yPIvyK5nvuN7NNYMWJ5BN2LZhrL9a5MzjCqcRfUgrRkG7u
	9IKwBitJD5AjNRxZRxPolucnqWWp8SvighJgs=
X-Received: by 2002:a05:6a00:6c94:b0:829:9a7b:db84 with SMTP id d2e1a72fcca58-82d0dba35d7mr15634327b3a.49.1775548099671;
        Tue, 07 Apr 2026 00:48:19 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm22093716b3a.51.2026.04.07.00.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:48:18 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 0/3] staging: sm750fb: Rename CamelCase identifiers
Date: Tue,  7 Apr 2026 13:18:02 +0530
Message-ID: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series renames a few remaining CamelCase-style identifiers in
drivers/staging/sm750fb to match kernel coding style.

Changes in v3:
- Fix patch 1/3 commit message to say "upper case" instead of "snake_case"


Shubham Chakraborty (3):
  staging: sm750fb: Rename sm750_pnltype enum values to upper case
  staging: sm750fb: Rename init_status members to snake_case
  staging: sm750fb: Rename sm750_dev members to snake_case

 drivers/staging/sm750fb/sm750.c    | 34 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 16 +++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 26 +++++++++++------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.53.0

