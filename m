Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8324F253F1D
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500788; cv=none; b=KIObIXKMq67Trh7k0OcTLJN8HEuHnisn9Reifk5Goy430RG52YgmfLO0maoIJ4wgB0Pz38iVy9e5X/uPGY/E37nPqhLVScn6Qb1eGYoD9i0M33zyi4YIOqt0f4Y52FcptElLRzoeFiXGayxbQMRHBEZPCWMTwhWGKy3Vnsuegq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500788; c=relaxed/simple;
	bh=UWzSca5u9tiBU+W9UUwhaW3+bszaRw65dQ+DZ4fHHbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFog1m2B1FKnsfRC9VUxbJTwkyVLMTiGwB3NcrslmMZoGKwsPyieRnxAQkvkwzD3+nSdqY7sTMss7y8Q+W1y7ZDD/09rPdqIPQ9hT/W3z9t4+5CsGErEJfBQs9/1o2E22FtqAMwQtr7Uzi9Mm9XyyaWE2j20MO7kYoqOdi5V214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giLcHyAE; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giLcHyAE"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-717a2ef8943so42273757b3.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752500785; x=1753105585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r6Hbz92/x9FL+FBlPeBNmgTh+QKbNYeF+ROETx2CnRA=;
        b=giLcHyAEJC/WhSTOnHWnUXPEd3+4xiHrgzpR/GJeTOF9FaNj3JXmsHK5wcxyXHLyWa
         gy50WJyHkFKETH8RXLBNJeyrVGdHAdS7igzUdsJhgDkmrXrgdlDKgu+l4KmitmzAP3Lk
         I9L7oF5jOgbGhaqzxCpbsSDaudGBqfT7S0fcslVi+lrsk0Ri4Rg62uWR98ysRy27VxPq
         Urc+06rKvluQKEKDspBBML/aqPCyRo3xpDR16YOv9jGwZZ22lg5yH5mkHB+oPrveLFfV
         2Ja5PH5JHdyYQr97bIVIf8Hf12i4XcZBF5/gSNQnlAk9VaD1JbwVz+EzejoRclrQw5YL
         EpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500785; x=1753105585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6Hbz92/x9FL+FBlPeBNmgTh+QKbNYeF+ROETx2CnRA=;
        b=PVYLCTK6QruPzpCZ2U7w/wo9a5eBWFvqOG/79dSXY1ZubmZjGTTu7K64tWhZLOn7Iv
         NICsl7xR20Me03fO5wLRaz4K8f197cNgBJMjCSnxofttwAM7hNA2QV3mj7MkF1RAJsBm
         yFuQbdydf8J2FTpsZSIY047xv6E80ZFQDEP5UQUvES3cV5voKaTL3H0PaPnAhYPdF0I7
         qSWaR0aCUEbQgVOWStcmkXczPfd8Mu1JpucY0cMCUX7a8b5aO9uAVukPJpxKP6X855tz
         m/zCynWPpm4NI6TZmlkBsfGcL7MpeA9RAkvNP4taYVW3CWTgrU/gqDWxI56+0F/4TCO+
         +IYQ==
X-Gm-Message-State: AOJu0YwOY1xiVr9Zdh0GqazLBH/lzWVvZyXCfQ9CbNJbAuVPh1+AQFGK
	ed0SdDg/0Q4B1uD42LjxRvM4LgQlWDbWCIjwclh7Yh/RpAiM4qdkauS4hH3DoFaHBgA=
X-Gm-Gg: ASbGncsX+KL9nhrWQzPyM1QzoINR57yRxgviVXObtJMiBPAqZFFT2gIOBOalAGH6hm2
	UkYyhudG60iG74NMXdYm/nf8uzZQoBa4cM3i+Fl7VaEZS68gy66vQLfe+irL4BQ2tsWTgkD1hyh
	9URvd7KafCLg8gGPoBUhPGpLtmbkeYEwEky3SzqUkwDm9Ko6KWiWLx2UPDkaQN4b8Obfcsgji0r
	+2pRjWCHxbpyREYIitqE5Psi45Zuwj6ggEm2xe41xyheRx6R3Mccb7m4Hl9DgpuqgiDUuDXEUR6
	ERC0tx+cgaOLSz/kfqFs15zlRwPIPSrkTpAruWijWioRDVNur9y51XZmnXSdlj2PXvyFD5dDWRr
	FqP/Rbd6bnpauc1fKzYlmwj3N9jy3tYtMys81TAh5N983mZVuXBg=
X-Google-Smtp-Source: AGHT+IEjFQnYc3dX2wC/TJw+1x2lmoR80MZ9iengzJu2U4aQJIm7eVy+DcNW7hsQ+5G1kVVNvKQ+2A==
X-Received: by 2002:a05:690c:c09:b0:716:69e0:bb85 with SMTP id 00721157ae682-717d5dab701mr219868997b3.18.1752500785259;
        Mon, 14 Jul 2025 06:46:25 -0700 (PDT)
Received: from elitebook.4.local ([2a00:5881:3041:2700:8626:7146:3329:ad67])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d891fesm19722487b3.52.2025.07.14.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:46:24 -0700 (PDT)
From: Andrei Zeucianu <benjaminpotron@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Andrei Zeucianu <benjaminpotron@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: remove blank line before close brace
Date: Mon, 14 Jul 2025 15:46:11 +0200
Message-ID: <20250714134611.119442-1-benjaminpotron@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "CHECK: Blank lines aren't necessary
before a close brace '}' in odm_DIG.c:374.

Signed-off-by: Andrei Zeucianu <benjaminpotron@gmail.com>

---

Hi, this is my first commit/patch in the Linux kernel, I would
appreciate any feedback! Thanks!
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 1e2946a23beb..f10427abd849 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -370,7 +370,6 @@ void odm_DIGInit(void *pDM_VOID)
 
 	pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
 	pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
-
 }
 
 
-- 
2.47.2

