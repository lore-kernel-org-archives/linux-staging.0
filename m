Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96A83B5310
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421011; cv=none; b=FrlLmF9zxEddcGUIl/CKpXN+SHNIFalCb0xFGzo5zHkRNkcplyVlPkoYScAQwc4xzfaiBKVuoGCI/T0s55GCysSBcyZyQRbaQ9mHGaXBVZbINWRvlm3Tz81OFcRFdGDtvRuKiBMg1e407auI/JH+j6oGwLknXgnycgv85GVXbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421011; c=relaxed/simple;
	bh=x3q2K6rFVuDHnvRRFG1SEzl1f16pub+k3/xWTnkG7uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E28ShuiaoCiAHRlu3hmfL3YyzXLyP+uvnNGp9cBjbeasYadwk6G45gszAotJOiKU6DpRISoIpo8V5MmgVOoXq0mS3oZ6+g4lX8STDmRH5yZqBb8OtWIM9FUOUVKxQfO82xulTGMlzgGCOzjQ4svLUvFfIAM6e6wFETZMaRgJp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYIW7/mc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYIW7/mc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671fe205535so967083a12.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421007; x=1777025807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlBwsGyamHM/um7fXumZZuvnYtFUYtBDit6QKB0s+qE=;
        b=fYIW7/mcdvfEMmFuBFOGm8DAB/VHbDE8Le5wldu8HJPCiPr3zy2TwJtVM3qJOTvQU3
         dMjMmSKsr8iT7gl6V9AmDiAz5zyWM5p1/sBSynZ4x2WWBYJFli2Bl776DfNW5X9MIg2e
         0LZ1+3+ebpM7RPnAppnQRERnmH8rC/DZ57cbsKidRv1SVNKEDTf5Oj1mKXGdAIjRkXlZ
         NCD79+yXhNa5is56qgmSmoPNsv98oCTCBC/Fyvve9s0cX9tiHNIaKGzulTq1kpuabIgj
         qsvXg4qqs9YrQqqjYBohvWYnPP9Z89m6CxJCLwQ90teKxlgo2n4TzfTlJ4jAIolVhWmz
         X79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421007; x=1777025807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlBwsGyamHM/um7fXumZZuvnYtFUYtBDit6QKB0s+qE=;
        b=GOnR03/S9aKE67ig39KPK3J0aXdNLsgBK9qKThP4H0Mjki24/WsxS1V9dsVRilIi3U
         blM+pOAjPtbj/TMRw5a5tLxAxlIER5CI3PzfAoUdwN+MpXriNHKbW+CsV1yv1JXsX/ln
         DRilj3Wq8VI0u8ALyCqn5tg/qePrzw6oer9yd4k39UK0tZWfGhK4EMGBpH5xj4smiwD5
         1aAtjJz7/4f2oFwnspv3H9ekKKu308tzv7GWsyLcpc/iMO9ZZO93S3vwJv8S72Sbf48m
         uRLrenySPHuXbnVLNEPOGs9r+j4Bc0kjuio2wCkLiYoBlpgtPrAFto63VJKMLSs2stlc
         a8PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8gVPur+Ji2IfPA7be6L91vrAFw/n3zytDID3imtu+i2dfqezyUL0OFdLsjE8lVYPOORem7VsX9To+YkH2@lists.linux.dev
X-Gm-Message-State: AOJu0YwwLxJyLHeOJBIgf9ibOynFv2apfj7gfzbEUljrS7PcixYqpaom
	PdONG/73EmDyilAR/26zvOhMYPiiaw/gnJ3pNO1mMz3uYJx97kiJMLny
X-Gm-Gg: AeBDietRVUAdQIkQ/jAe9X73/xCLmw+/5FZLBIkZ9vdp8DX86Ul1J0GCF7n3x6YCXag
	VVtLWeoohqxzaoB4Bg7xOikBSwvCQFd8rPYwjCV6MVs+NacdcO+B4CK17+2SMOTsfvAAnZsytEq
	4NWYTewpIb+jzmo8/25IrPUytTNHSTzz1G4iXQYdUXVDyO1dzlWmQiFGVdmK9EJ3r8KvF6cEFVG
	RDwVgrw3dthg5R5D03H+/DfqINf1rqoQn3wj3nrabiGuW/GtiEmoCqT4abgFE7nnaZ0Vg4Fjvgp
	AFdvquF4v4sZEev5jXe0FdHTk12JnEYyZ85bCY5+eMRo1kDudFuYuWj8kXrDUJ2HbMdvfpPbc5X
	yuPJoawvMM8Ql6kAUB9nhsVaUWPNv4iEDRCtMmQFcBknV0xNtkYYzQsxdNXISggWiyrDYqRLuBI
	NKPyPQhRc4Y3MLeBA+hPxFFr1ol6tAj/zX7gQO728ZNDcdNwYsZ+M1dEJBjjIBUfLmSYfBScnBL
	OlrlxQU1F99bx6Ewv0AzgINyn945FgX8UVVvTXdJpFQuxw2BfxET265QB9VJsEXbnrr524Uemob
	BKGa9Wj/iw3LlP4VtcQ/da2XJs12i4IVIfEHp+ym/ALYXZuFLQa2rjNZdjkRKKJ/X0jHsoSwpoI
	0IVQE1rQV9TXipueo8yQdlT1JYtl8QSyOpGWvX8iGxIFbKv8IZz+/mKzmhZxu2IquRRJ4Pan9nL
	rTsXqaRgs=
X-Received: by 2002:a17:907:97ca:b0:b9f:9e7a:bcd2 with SMTP id a640c23a62f3a-ba41a632e8cmr119328966b.38.1776421006917;
        Fri, 17 Apr 2026 03:16:46 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (125.133.90.34.bc.googleusercontent.com. [34.90.133.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm38937066b.63.2026.04.17.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:16:46 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v6 0/2] iio: frequency: ad9832: cleanups
Date: Fri, 17 Apr 2026 10:16:21 +0000
Message-ID: <20260417101623.1281-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver, including proxy
header removal and bit math simplification.

v2:
 - PATCH 1: removed redundant bits.h include as it is implied in
   bitops.h
 - PATCH 2: changed ull to u64 type
v3:
 - PATCH 2: remove rogue vim typo
v4:
 - PATCH 1: removed slab.h based on IWYU recommendation, header
   reordering
v5:
 - PATCH 1: commit message stylistic changes
v6:
 - PATCH 1: add additional headers per kernel.h removal, commit message
   edit
 - PATCH 2: commit message edit

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.47.3

