Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823EE4086A
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886468; cv=none; b=pnGaY2O/uvRrnnOng8cEh8xa1FBHAb+wtRVK349ChzTDQtaqK5rs7rI29lrksFyseHicrZjdajjeCtI80qxMZREdInxJYKdllkVU5763kLNIMpBlPz4GnQ9J9VFyKkCt/QAZ8UiWYBGPOWj9bpBMl6d8yz6DMoBeNj7B+Pp0FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886468; c=relaxed/simple;
	bh=BnX504wY/5jbOBLNNdjC1wdvPax3nTDRleB/fm83Flk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYrZ9MBqzC1HEdRPHW8YcfWFq2O+nmw/PMAivicae4KH+UvOaQKYYIH3r3R7YrXBd+36F6DP14WGEKJxY5WUUKXsjDA3GtTugJHQ3KxdB1FTKhh1Ku3pgbrcWHgKKd1MBfrtV1lXT+xKe3xh4TgHpz5b9x2k/IgzbuahAljllHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGpo8Q7E; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGpo8Q7E"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1118758a12.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886467; x=1778491267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fuuo/z2LhU5LQUkwEEphmvYVaLYefqtEf3mo5jJ8+1A=;
        b=IGpo8Q7EII/OKuUT8d+iJFESq2Q3IsXGvIKfLyF2QcYhPaDk/7xBGdH+jlwT8cgyKI
         DNRPuG02J4KjYoJXHlz9MxtxLg3tRvI2KEGsMyAq64gASytYWRWqJenHvGQxRmIC8Gdo
         AHUYvQZftZH8vfIjfo36Fe+L/22+wnAxVGF8TwB0tTiSwyaqdvzuCDS9PKDi2jqSaUO3
         y2yncqUEPSxXGaDwgo7TVUWDbNYzUDA7xKh9Df7pis43Pdsb55bSob+OdBWIxenGn/z8
         5SiAYn+aRMD/Ha073xzv94aqjPQ46uUbGKu7SoBIS/EiBypxwQVu8G2IpVZ/eqgLxxbV
         Kd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886467; x=1778491267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fuuo/z2LhU5LQUkwEEphmvYVaLYefqtEf3mo5jJ8+1A=;
        b=niiwvcBUBRH4JGxy7+TIMDJVfVZ7Aw02C7SCsR7ndTwYCj5amcgpQD3U7uiq/etwMa
         pz/eWjeuCFEMdubpl8KXTfctM6Eh9sTUywWt47siKeExQa8OhbtqGqASPjSV5xbzZXGz
         yeExd/JA0FPmqcwvSGLKQSVTmHxtyzl4SDK7ibuDkDIzxoIDCGdG9OEkiutCK7dA5Vai
         1Mn9dEl0EeyMuMJw7uK2VY095tCQUM8ygWn/Ogc1atRZMk7qtXe4kYdQvO2tz8sA7kZ2
         237DkShwNt4qDVOlYDpunsXE6g8J1TSCcjtQLHMyiPf9JOz9fEGO2RN3cTjolnEbJkaa
         uNMA==
X-Gm-Message-State: AOJu0YxqbVkKQDekUkQiPzcDIwOYXUtt0pL2uTPGCNCk9Wz8ZCnOSpYy
	8aQ+LkMX2Kh4OfWgKflXPMkPYM3A9HoxGRZbGcPok0TIAO23YU0S4zg9
X-Gm-Gg: AeBDies4nKU6wOCajTFyjHwE87UMwIXeS3BSSz7Aw41nrOqrBht6CMd+fRV9fW+iyr8
	p/IIbVRaYWQiEk41RO6Jqf6JVAq3SvgPkhEqg7MkTKobCzJAon1RrLSfEKzhOPD8COYhpWGnt3A
	S8Ajm8viExWLS5ZOWgtjv4JL8X6JNT1Lf663ZygwXGhMZK/cMBLtVXIbbxnESmBRKK2nB6zsyD0
	MxnUjQg5e301kwfghA0SSmIWTREBVQwjDPl6mb/NGxoyLhs5NPo7M7pJ09ZZ7VLE2CB2iyJkUAh
	e+p0e1sk1XsRi8waNbTyCirOntZKZry+/FVIVWaFSiM5OrK9do9hRgQBDV1lvbf3KogPyGVAMTI
	798bSlf2yF6qLLByUk6Oj1DwkPlJS4WHAKKftcXye/GSZILzepMmDwGmEivn9lwq30Hs2hUAx2k
	j4ELy+hrKMwfhijv5lONG5jtSL3N+GaQ==
X-Received: by 2002:a05:6a20:1e62:b0:3a8:9dd:75bb with SMTP id adf61e73a8af0-3a809dde19fmr4369375637.56.1777886466767;
        Mon, 04 May 2026 02:21:06 -0700 (PDT)
Received: from scootaloo ([101.179.98.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c802545908esm4163923a12.27.2026.05.04.02.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:21:06 -0700 (PDT)
From: Angus Gardner <angusg778@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Subject: [PATCH v2 0/3] staging: iio: ad9834: driver cleanup
Date: Mon,  4 May 2026 19:20:56 +1000
Message-ID: <20260504092059.1536094-1-angusg778@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: Split into a series of three patches as suggested by reviewer feedback.
    Also add a missing dev_err_probe() conversion for the SPI init error
    path pointed out by Joshua.

v1: https://lore.kernel.org/linux-staging/20260502021815.3953423-1-angusg778@gmail.com/

Angus Gardner (3):
  staging: iio: ad9834: simplify -ENOMEM return in probe
  staging: iio: ad9834: use dev_err_probe() in probe function
  staging: iio: ad9834: fix chip name typo in comments

 drivers/staging/iio/frequency/ad9834.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

-- 
2.51.0

