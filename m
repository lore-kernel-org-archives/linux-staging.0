Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B62E11B9
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554485; cv=none; b=p3xffixdlm51a2tlxjwB3M8FCQIiTVA5iFKQIgd6BiOXa/1jUa7fw4ylZFlHmjsazS/IjSS8IBDhSoMuuGW221JE+B627sZYKEMPygsPcdhkzSdi1oxxtVyJdpWn9nz4xyhqmxm+Rtl3EdsIoo/sV+i1ZNzcGa5+rIPY7aIgDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554485; c=relaxed/simple;
	bh=Q4X26gF3FIeE0mfr+42yvWJhIHihRbHHkVhGLJSduTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oit5+t63VQ8Alwv6Vj8j0NNRI4UBSOjzx0CPQa7fAX0xobsaBN9gvEoaI7MMR3RbFezUQ8qHyZ27A0PGsRR+gfBn8VotZro4kP8qpjlesBjcI7ja94LkKUZ3wAy5iP5hBCyg36ICJgu2wyUiwYIdgyUCBgb1JXzZbxdXm39T81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=fdrgbzfi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="fdrgbzfi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493a432c84eso36215e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554482; x=1783159282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKfMtYxIYBX1BeW4TAoukGmm+MSMDeiJBTDybJOUas=;
        b=fdrgbzfiUU2FZbpgHmoMU6y4223ybCr2+2bAGKEzmIp+Et1CO40GvQeZdV4Sjuf3Dr
         w3ADgj9HZ9712308pAga59frENEcUsUGN2YwkQ7xWtPvBqlLD7nZraYE5eGcX1/XR5kN
         gCatIb7szL8zu6BQjHZBLYUrL4XCVZRNijuny6LSmNJLeBJMcOVRUlW/trvCpIRlb+aI
         23K9W1rbut3hQOik5wDvux1FQrFzlRlLb/rkVSn21lJCt7aRIj83iS1nuzCoQ38rP8NJ
         vgxQyFUFP6mdF28COi3r4tNCqpnhctLp5+LYUBZSFEHpxjAB46CQxxA0J13CgAtla2aF
         lK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554482; x=1783159282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPKfMtYxIYBX1BeW4TAoukGmm+MSMDeiJBTDybJOUas=;
        b=i4TQJLB58XOJe3bZq57W+guF+Sdo3DU0TYQR8Ew4nDXvLq2VbM1GMm0EvOTrRtzZz2
         1DH2QfrdMVHIIkT5FLurE8oom3WgzFj2lQbcFkq/1wh92VmTHcm9hsayJcVuzwVkfr/2
         jKBsn/iWWUhRPljE9qMrB1/C9vCpBtdb292Q6+liMhykszWeW22XqWmTmqBQaEKZ3NYP
         uS+patPRH40LutngFui+MQVzFSlD/ZwRLfXJt/d1yCWrxG+pzv+ncnKZ5k1wrB58bf78
         1nTScsd5ZZgQY1zV2yWlamj32AK3FE+t8vkmiyg2BwNcpCrzjXTpBif/jnoIjmUWP+ma
         Uj6w==
X-Forwarded-Encrypted: i=1; AFNElJ+Q+LbSUuty+mlHyMwpv3V6tWJBsbfgudqgIAFD90kGpaRLD5TclIB60dzdaw3Dagf34YlPxD7WfXQAzr4K@lists.linux.dev
X-Gm-Message-State: AOJu0YwQE1yWpq+AZIywcuE7XFeMB6XywIZMMxkChajCx9dtH+fW8vpk
	uBwh4rB5+vLaUquMxrj6EU60tdCyettx7ysB9/3dUp2k5c6HI9I2p/UlMfs5gZCdL5IF
X-Gm-Gg: AfdE7clZf2Z5l2oVSwB8s4QRxhM5xfqVugw00vcG5lox+S10F0FeMb9RQ2bqmiG3+NU
	uUNsWr0V+EB9vhHFvepcnjmn6RrX2F803j/ePpbWPed/JUzPqLHkNqQz3dCmJp/ftoUxTT64vFH
	7sSqS4eX0yPOs9cECX756nA7IDQPNyRbqk8NKUQImAc5zGuMIyOtgQLEpEUBLga4lDgod70hJmM
	uskXlYOKJwWjze7PerN001BtoT0halgL5oIbpOyJDfz/m7lDRbWkC/fZTxWQgvIZodIFKjuf2vN
	inNZYXQPy/2g1UhKAylXMqCRZjo9K6jUOkrZx8DH1TAnYyuWyvU+fYYIYeNMYCgUzhPgktxvCcw
	mnjVdbUrNU5vGg9YekIjw/tolu8yW2UthHtGEA1nMvHpQrn/Mr91C/WW4fJLDicbBmYHjTJj5ia
	6MFI8kp6AfMGLiUrW97/MpIpYfJDpHAk7F6KEBhkdqdbwoLIFRMZjHLa/aMWTeuJu5eVZID/60t
	jhJrNhPZ51agQvHm8V/oMQw77CZ9dX83IU=
X-Received: by 2002:a05:600c:a49:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4926686b4aamr139558135e9.1.1782554481807;
        Sat, 27 Jun 2026 03:01:21 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:21 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 12:01:17 +0200
Message-ID: <20260627100119.97650-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two ioctl paths in the Intel AtomISP staging driver share the same
defect class: one user-controlled field sizes the destination buffer
while a separate user-controlled field sizes the copy/store, with no
cross-validation between them, so the store can overflow the allocation
with attacker-controlled length (and contents).

Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
arg->fmt.sizeimage to the frame allocated from width/height/format.

Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
width/height dimensions to the stream-grid-sized destination config in
both the ISP2401 and ISP2400 branches.

Reachability caveat: both paths are private ioctls, and private ioctls
are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
-EINVAL for any non-zero cmd before the dispatch switch -- so neither is
reachable from userspace today. These are hardening of the
disabled-but-revivable private-ioctl paths rather than a live overflow.

Both were found by 0sec's autonomous vulnerability analysis
(https://0sec.ai) via static analysis; neither is runtime-reproduced
(Intel Baytrail/Cherrytrail ISP hardware required).

v3:
 - add Assisted-by: tag (Greg KH)
 - drop the explanatory comments; the rationale is in the commit
   messages (Dan Carpenter)
 - note the private-ioctl gate in each commit message and here
v2:
 - add Fixes: tags (Dan Carpenter)

Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.53.0

