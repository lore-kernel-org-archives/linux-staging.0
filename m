Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782800;
	b=WzjQh3Iu+gwlTT9Y2M+r1ftFV1aiWn/0Sq49S7w+J4wxMMm7vRgWD6pCxXttDR2FeccS
	 jYykCST0kFb3eYK6aMfudelcxkxzW3PbYbub5GSAoPVwU9Y5AEbpLgYURdw6qRezaKPsZ
	 DDAaFqghEgkGQRa5cSz5Gz/ZSXbdxBI1QbLgmq0qpP/VWA53r/SSDNs2L/CItiLqbDDzn
	 G6mlydmQXlUxm6dDgzfhtJ1Qg6/MGMe5yvA1+VLxXkB486wQ3Hxtn/YtfxiNHE1Hft7b3
	 4msUg10s0/Ap7CjE9OYokqKZJCBUEYVrF3xOUNl8zLK8r7FcXi9vBvYX9R6cldCX+cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PMxsfU1o3NhAxu7Ye8pNPHcg1ClzXw9Cf5wvYHFfgpw=;
	b=zJ4X9dDijE3MXKE7sabHWY7TRJboDchVuMxsdnQnntabMfOjrTozarLiYm0aKNGonOXM
	 uKyJfAGg4xtQurgoE8ZrkVOkPgxCc1dP9j3ZeKU2mZCWPqFuYCIgTzBt5OPQAD2Z3j3Va
	 oRJVNKEh69Awom6iIMxlfiYAT18pHKJP45igV8x8RF03ZU3I2/UFEGHCogxrfATnHuHSN
	 wOVNdmAQg7U02OCFliw886AHz/Yx0Ll0E3yMrMMIUHUvNdGYyjSCkmt6I3hnWD2us1un2
	 FOzpmhDQBv0H16rFJ2TeYFaW1GZGVGKys4aEiylRoAIzkgMkLmgvWIPh1roaeQDyGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQ4282UO;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A69606A323
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 12:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A69606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQ4282UO
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b904d10882so3358270b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782799; x=1796387599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMxsfU1o3NhAxu7Ye8pNPHcg1ClzXw9Cf5wvYHFfgpw=;
        b=KQ4282UOT/pAdQipKHQ7MTTRfBHw9VcJY16EEE0Cuikq6GJQtXueBp4X/O1hj8nP7W
         5xU+/UbIEWxk9HfQ3rq+L7FwW6qVTta8p6FvOXx7m2OLhUkrT1YZ9ETxK+B19U6A4zDC
         y954M+rESEp1jxfoJNArLTMAoGB4y+WahDdq5WarvN0358A2pZvuyoeWnniqvV38B6U+
         OcrY9/KfqM/0JZ2yYBRWUfe0LhzmRp0Tl7zSwR8EfuL6a7DmlwYSvG158ZaW+ZvGZNfQ
         VfjO90PcBRflRP5wDLf2MGJ8LZOryEb07hBX+hsKp2ZKzgDWo1PHDtixkR76m4lXmsJy
         5ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782799; x=1796387599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMxsfU1o3NhAxu7Ye8pNPHcg1ClzXw9Cf5wvYHFfgpw=;
        b=B+3deM86PZCNjqIxzYwV/H8/+k6R1MZZrHTzXzp3XL5+CDi3XiLE1KZGs1XYlcNkr5
         ESugvOQiCuHBwktVWy+RKVHZGkbMOO2hch6Hl3Z7L+NKvF5zyAZ2QoQguviPuRfgiObR
         rxHKos5YgaxhwBJkJ4aEZ0dbYsebT7XSvkZigY3MydE21AxIApYKH1rPZDcwSqehgF5G
         Vj6kNaFKjgLun392zkn3nglYkTlbwH1X2NosgJsKtrtEVBzRX29GYiia70hHMibp6ija
         F40f3CCswKriwlrLxAx3q/s3XprYN2iW4X8Zk4yWfx3LbscLf/KVKG7bi9oHEuc5FjPj
         zd7g==
X-Forwarded-Encrypted: i=1; AL+hErGH3JqvY8zlmfooq23buedVAQJeG6kh4A6gXjXSTp42uMPuvryNzr5F1q1DLlTDspFURlqrWI+OVKTJBcrP@lists.linux.dev
X-Gm-Message-State: APuU4Z/rxJAwtH/S0Xd96SslGxt5HRZ8LtL9qjvAYFMiI+duwyorG+WC
	eZX8rySDX5AdJFUppFb+fsZ4kXrFN7ocEbR8ITwDlUXZ0k+uvckc8UPX
X-Gm-Gg: AZFdTZdhhV6hYUpYPXTihW9LZcqXHs0PTwbtF7UZJmomMO7qjqBn8sVxB1cXxFzFQ6W
	V4qa1R5x6LR0fCrCR+isbBih2Ixzk2qDuTayppNNoiWzMeZhYbiotJZSn3vs8+KaMjjDR26jVD7
	CEa4EBafo3XzFBaPklLYoeVHFr7RvJbrLu6THA8D0qeuLRCamR56JRoBPROnrf0JIom8ecw9yTW
	VfO97/uzY5xtofrb94c1q/lXE3eJsHBCaXRrGoLMh7PviHzhDrWDW0nMF87tJO3tNkMvn8uSLNZ
	WgEMnZEUTgZ+iqDMlLESrHY/x7iLW38m0GRExG4l4kBfiK15wXlq8UZyPxVotQBW+ioHw56xvz2
	ptVnHQcKN78QYHdqEHkK4dIKSvMWav93Ov292mwZTTCholWq3z7wCmnZ9jVR8svlUgeueYA4mtb
	cQyF9mAM3l0Yd2oDg6p4cw9yvVLR2UQ3oFy6yAU2lAt+uvVIybFuN5nSR3tGLoCwJgyH3FwSnSn
	ZH9OHR3wonJkTo6ioGAIaV4d6KEERJbAY3nVpjNm7OhDyxfMM+dvUGabvwfgnTW5Iz48QEfrvz1
	ylOhPVTZEM13sqo5Nvtfpw5AHx0C9hkD6HnM/FizCNKB4l1vF8GakmBWri9g5vDB1X59JxhY
X-Received: by 2002:a05:6a00:4fcf:b0:8a0:5d6f:8a5b with SMTP id d2e1a72fcca58-8c87d70b055mr23096959b3a.50.1795782799462;
        Fri, 27 Nov 2026 04:33:19 -0800 (PST)
Received: from localhost ([2401:4900:1c2a:12da:3176:e694:92eb:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12568899b3a.2.2026.11.27.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:33:19 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH 0/4] staging: iio: impedance-analyzer: ad5933: buffer and sysfs fixes
Date: Fri, 27 Nov 2026 18:02:59 +0530
Message-ID: <20261127123303.144052-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Four bug fixes for ad5933.

Patch 1 fixes buffer data when only one of the real and imag channels
is enabled. The driver reads the wrong register, so you get the other
value and no error. This has been broken since 2011, so patch 1 is
tagged for stable.

Patches 2 to 4 fix sysfs attributes that don't match the chip. Patch 2
rejects frequencies that overflow the 24-bit frequency registers. That
only happens with an external MCLK of 3.2 MHz or less. Patch 3 makes
out_altvoltage0_settling_cycles report the count the chip uses. Patch 4
keeps the old value when a write to the chip fails. These change what
userspace sees, so they are not tagged for stable.

I don't have AD5933 hardware. I tested in a virtme-ng VM with i2c-stub,
KASAN and lockdep. The stub can't run a real sweep or give real ADC
data, so the tests cover register values and the sysfs and buffer
paths. Each patch shows its test results after the --- line.

Every patch builds with W=1 and no new warnings on x86_64 (gcc and
clang) and on i386. sparse, smatch, coccicheck and checkpatch --strict
are clean.

I used Opus 5.5 assistant to help find these bugs and write the
fixes, and I reviewed every patch before sending.

Punnay Sharma (4):
  staging: iio: impedance-analyzer: ad5933: fix swapped real and imag
    data
  staging: iio: impedance-analyzer: ad5933: reject frequency code
    overflow
  staging: iio: impedance-analyzer: ad5933: fix settling cycles readback
  staging: iio: impedance-analyzer: ad5933: keep old values on failed
    writes

 .../staging/iio/impedance-analyzer/ad5933.c   | 35 ++++++++++++++++---
 1 file changed, 30 insertions(+), 5 deletions(-)


base-commit: 39508411b82d4dc29dd245bb471ec9ecc1111c9d
-- 
2.56.0

