Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73934D939
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093806; cv=none; b=tJrY/JopjHXUFEwcxxuwEedJ2cV+iymJcXffiejx3ANQhN7+zW9f8xAZt+FIHNss/FVN98xnGSQLXSyJub3S/2Pflwc2NIZqd4ZNcFA2zRcCa+ZggH5cedyomVOEDWMDAM5dUvAIaqAtxQRNhZn38hiMzuvGZOwfmx2XyIY87Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093806; c=relaxed/simple;
	bh=YcwchRL3dmquMNXp0MXiCoLQ/zmWnbBjTfaHSzYtjL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sy83LOGXD2PphdlIHqVXLyAjg+QleBH4i+6z4cg53NtV811tChDjie7iSVgVdpkShaYcUR25A6o54Pfz0GHR9NTn+YnU0LPkYtm6s+MzvbN1aa5mjFZmDpcSLofSQEzBbfdwhBfmKcHsb2r5q6rR+4OAW6+FRVzoIkEDPNRWjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNb8TRAX; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNb8TRAX"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82311f4070cso147280b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 06:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769093804; x=1769698604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP4Md871BpNzoliM2Q93M6GSwYNDmOpzKTl/uPt8x+I=;
        b=FNb8TRAX7mDOeb0wQJ+qEnZleKo49de/p5FvFcKEQEjNV49TXNkpfx1Ash5NwHcgJu
         B9wCQjrUZ01tYrTkMSn/lmuQ+ZlbnXHrAAFTUCXzyjcGATLwifnQjZ87yrem7vY/d3XO
         jNtau5hNaQ7QvC1bgPP9uTQ5iVR701gJ0MrfGzqQzgaUl7NHBzpnSct8f1DuNLlzC5nY
         JK724VrEbeiGAX81bVKaz0Cr+kyIHkFpjV+D5rar1r5Lb51cpyyzcmYeYtfMsAK5M1TY
         I3SEA4FoUPAxqL4yTzmvNQlmZEcjPUp3iUF37JzRvgQJWLfNnekM4pxOMJk4fEjBpX+4
         xDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093804; x=1769698604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP4Md871BpNzoliM2Q93M6GSwYNDmOpzKTl/uPt8x+I=;
        b=ctRHGkkD8jY8I7SSJv52SFz1p3WH0wURwz+nL/RRwTSjZdCBN/Pmw+ly6xS9fbh5yk
         LtWCDN24VuMDP3fEQJAbutXy/adUstpW4UFE4SfvI81YS14803RBhlCrCXclOPW72Mh1
         zo8dEja/LOV0ypPIryiqKsxsvGhyRWgkp6Jkph/XM/CZxM1I3nly7DydZPb1h5j2e5qn
         VmAlATikPnfOdsktnxl3s20ulWI1PngK5JiERHR2gzEN4SMWLk+z+ZQCbSej3JcGdgPM
         p867Qtn+UeHuyQv/DeMEovRh1Zy0oRasVp/fZ6Pxv3KV9mvCbVZlYp+nEFR56vq06t6W
         6xZA==
X-Forwarded-Encrypted: i=1; AJvYcCXbOH1jpPoC/AyRBCp158l1oIqySV4pl843Aa478zkJT8wOmkHohAAJgGccsB1ZlF+NZgOBv6HMo+G5UNVP@lists.linux.dev
X-Gm-Message-State: AOJu0YxkGNmWX5pQQW6rgalwBjICQbBryPNC0WSArVhJSPneIPLaBAJz
	mQIWIgFKij4oV2Aksyuf+5xx+e4Aet6RhK5TshGpnu1t2nDmAzrcIyHi
X-Gm-Gg: AZuq6aIWMlimERCRRCvMxsZrIKtAKhrFcy8RynEaaNSfP73Jpr8Tw8SN9CHojDyOCGj
	/RNlOpl/dEZBEIcPkOubeQ23KMs9LEPsGcoYPr1fTr5DiY3ov5Dl5ZR37qE/2KjNdeN2y8qTW0Q
	+2uATwnivBZRb6oOu6BBOvKXJ4Sg6nkiRGXEw96zNGVstT4UDnTPHtXOOjsUVIHiw5z+dIwVwzR
	nJ5O1OClxCBIxgLCtVcyODBsnH/e7f/uVAR8bES/zghtP5jjSIqm5QatQHh+rgrmjQjMcvdh526
	NTaORq0L6iryabHNNxXeYeo1O1mnA8uBZIdi6aiGPjUW3hix4T5EUAMcjGyQlgGBwZF8KzKcYMw
	EQ8NteaeXRynseKQTlNrQmk+0o/Lk0RIzYj6entogVSkvUFKJzP/tIloKzeAFUSSo4QsZ5M7/d9
	WQJL2owEnKVjn1/iVQhKD7ItCw3IbZ
X-Received: by 2002:a05:6a00:84f:b0:7e8:3fcb:9b09 with SMTP id d2e1a72fcca58-821a7b4b364mr2805889b3a.31.1769093803845;
        Thu, 22 Jan 2026 06:56:43 -0800 (PST)
Received: from debian.ari ([152.58.182.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277966sm18318780b3a.31.2026.01.22.06.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 06:56:43 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: gregkh@linuxfoundation.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul() instead of do_div()
Date: Thu, 22 Jan 2026 20:26:33 +0530
Message-Id: <20260122145633.14938-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace do_div() with div64_ul() since the remainder is not used.
div64_ul() is the preferred API for 64-bit by 32-bit division when
only the quotient is needed, as it returns the result directly rather
than modifying the dividend in-place.

Issue identified by coccicheck using do_div.cocci.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a4223295cd..772267f6f093 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -194,8 +194,8 @@ static int ad5933_set_freq(struct ad5933_state *st,
 		u8 d8[4];
 	} dat;
 
-	freqreg = (u64)freq * (u64)(1 << 27);
-	do_div(freqreg, st->mclk_hz / 4);
+	freqreg = div64_ul((u64)freq * (u64)(1 << 27),
+			   st->mclk_hz / 4);
 
 	switch (reg) {
 	case AD5933_REG_FREQ_START:
-- 
2.39.5

