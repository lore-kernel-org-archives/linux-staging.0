Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA0337692
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030755; cv=none; b=fmh4R21D3T5lyXiKTh5v/vDMSS/8I3LA6h9WK6J3QHKmSf/t9AOLnDE2Ra0SGK9dVw8vXEVONtUD3TPjFCcxMhek/baS56tna2fJXGYdFNdVNm+/uWzNUmYvUrrz/QBo6isAarEcxU9dLPJsmg7YycFNVR2uknfoNLonm3xZSXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030755; c=relaxed/simple;
	bh=8lQxcKvouaei16FqYGY0RR8AerBRZPOQndfjxzjaGZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nL9zeIPrXL/xgxd73sq/2FLePVOTotyajySy/uFtVjGpJHYYorlokph/Wa2B+M0tm1BsDRi2qdd40sQm+9ixsEI8aAqVHWRElIVkT8BL9T8umB4y2nrIIiwT+7oG+f9xGwRa4WV+AEspG30FfjM3niJ5MWC0M+spfPn7n5xS0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic8A4RZF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic8A4RZF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso5718115e9.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030751; x=1763635551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=Ic8A4RZF3vrlXSQ9dnpB9KCkvx+UvvltfayH+jQW6u/8Q/C4HnV2MfyS3SDhpPLmhU
         WD/UjksryptTinaFlJU8lbpnLdXHMKn+n2WmP/DNEihjRE3bp3fakZ2xf69MJUpG5c3A
         uXLt8fvsbq6VyZHnktzH4b+8hXCqdxfdaO4/LIgySbdRa8xZdUXTsadLRZzjPp55/rTM
         QnoZrQV7OCUE9elwDQExFbwP/7PHelltZxhdrAGmW0sJvkA3MEYpkJblB46yG8Na4FyR
         CIiATARUc3fI6TVaMZDKPFUCwX6gbeU9J4I9auUzYzw30HQRz50JIiHcBgImloaK3lUV
         GCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030751; x=1763635551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=d1KQxtXiBtRIuZCRLRTQPcRU63aI4PV5K2EAaRcsLPLSdaGVfT70hgg60soAqD6Cyn
         CvwqCx3Im4sPXEbLOO65iTvDY1iJKsPuDU8Gc0UR8OIptBDu6bbGB2B3oRO3RHA9OF92
         KvkOAsTT0HcgME0kC9S2pW0Fp2/C8rP9Wv4Y7LpYf2wJc1TJn2XZl1QLeOoCx8WFG/vM
         BTfyrN1j+y54Vyk9dSNwi03qlmMtHu8GiZjlS1R60JImgToLAZCZ6SnGfQN6eh33s+Z1
         9EylFG+ZM1RdH2y9hnGvUu1BTjSjNxlyaTwDmtEtBiz+hHPde47340LGJhJvkz15rL9v
         to3A==
X-Forwarded-Encrypted: i=1; AJvYcCXLjxqNGJiq22HgJtRSBMNk31wTbRt2F9OLKdUeaLhzIbBiDeMFT7mHVrlR86ApONpfsFnAf8eVCcyyjQi1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdf6bN3VgFQdu7vnSztEN/3bgTPUSasvOsidIZmSM5/ZfldCGP
	PxeD46bKITYQvX3o1Vs86tPR3MbF2EKNXq/lA80i6bVb3Qax2H4VHxyl
X-Gm-Gg: ASbGncsKRQ8dRaqLvakdqbKKxp+lkh76e3JHrUfcz5/8jc6LE56EyCGa6fnwAKLfplp
	3qs5cVW1KwPFU7j3UWS9pVJbYJ1uN+HzxewWDgiiYuJ+qi+ycmIXTjUZOM3hww4MSJQNvSx20u9
	dDj3D9IlwS8QEI3Rcsoa/CshKk3z98hJJOvXlkOsXAv3JUHahAcv7Fqu0PiF75iYc4s7FOz+ZIb
	Eu+xFyfeJUqFGD7yB2w0A5+bf5+6NUSwuVhzU3TB7AuXeQkYo1zUzvNmFtKQDbcAhWT+pqsK8yX
	sFXVW67fxsjnFNoYbwvAa7SpwuFO6MUYZa9x+70LXlnzlhHzcA88uPVwS+vCEXZ6GYW9Vp4GCHz
	r8UFpqnak501qE7R81LK6BD8Xcr0feJUwBhLMx+/xQhb6w9Y9adG7oP6A+yiLo3xZCTSMA3YMho
	4p3pZk6VBmGA6mm00x
X-Google-Smtp-Source: AGHT+IGR+NeWuRHz8KF2f/Pbo2I9m3KapID91wtHUJiDDYJNtpR/ZDvaLzC91wpETSji+kdJy4ZHUg==
X-Received: by 2002:a05:600c:1c2a:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-4778704da9dmr58822485e9.15.1763030751240;
        Thu, 13 Nov 2025 02:45:51 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:50 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 4/6] staging: gpib: Update TODO file
Date: Thu, 13 Nov 2025 11:45:41 +0100
Message-ID: <20251113104543.5875-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments have now been fixed so remove the item about
comments from the TODO file.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/TODO | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
index ab41a7f9ca5b..ac07dd90b4ef 100644
--- a/drivers/staging/gpib/TODO
+++ b/drivers/staging/gpib/TODO
@@ -4,20 +4,6 @@ TODO:
     CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*board->private_data)...) over kmalloc(sizeof(struct xxx_priv)...)
     ./gpio/gpib_bitbang.c:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parenthese
   This warning will be addressed later:  WARNING:UNDOCUMENTED_DT_STRING: DT compatible string
-- tidy-up comments:
-  - there are some "//comments" and "// comments" scattered around
-  - sometimes they are misaligned
-  - sometimes "// comments" are interleaved with "/* comments */"
-  - multiline comments should start with initial almost-blank line:
-    /*
-     * Good
-     * multiline
-     * comment
-     */
-    /* Bad
-     * multiline
-     * comment
-     */
 - resolve XXX notes where possible
 - fix FIXME notes
 - clean-up commented-out code
-- 
2.51.2

