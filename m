Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577531D732
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532504; cv=none; b=mSuTwclfT323XnZoJjOdqg5kjahKDCd7e9QSqrDSHTtCLxK7N9sHg1v+muWELnBEyMv3YbgGfFoe+IF/Sz9pJsdWKf8TRX8NLf+JFr1nLBP570h+SSE55P67KYN3Bko81S+B+q8O3dq4S3lKh/SktJSjoXA+SUdRWzxfWzAAbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532504; c=relaxed/simple;
	bh=qzu6yA0Js7dKOahoqaoPJOCsZlRF+2aYKxKeGelRDRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBq3Z54enO9a/lKKJpdYvDmqyDa6cibHv/GfwyyIrIh9gtSpOQ9XXQ+Jjn0WtKxaLQn11GBhnyd1SnmgtxQ44svuEt8ApX9T9QnWLz9Q8HeAdiMfrmzXTynq/LnlgB2IPX2dGuxhsJev20uWntDFCm2f4mXLMnk6+P+FP/RDeNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBj147SG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBj147SG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee974e230so52136745e9.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532501; x=1770137301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmZPPM+qyWg8gnBCO9LKeFoAk7uKkIfzcZM+Y4Ivu8U=;
        b=QBj147SG0aCIEQY6U/3GsdWQ/PFezFNsfTCeVTgra4wyLguoqnWDc8QbGThbnn28LK
         sFuJ4fyyNTK6IRIHoVs7G0o113ApMJrC3TFvd3MFmQVNrIftmrLI+sYpkl6joFgJmfeI
         TWGPrN6DlQg4qGiswzVBO0CMwzeVdXdyzRfzZ6DErrvg7A/uV3P/7G1fiB4BsxMK8fG3
         82YhhDHjKgUw+b0ivkYBNyroH+FvWnOC6dbQg03WftyndIB4eMlhubI6rAQpSzKxjlO7
         TmZ7cJh0IvhVgNqr0L7rUuSLorY5yAQH1YAdq/cEfP+lRm+yN1f0ojlo3mV6FpSlylFd
         OMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532501; x=1770137301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmZPPM+qyWg8gnBCO9LKeFoAk7uKkIfzcZM+Y4Ivu8U=;
        b=kBZwDc4zwQoTbuB4y/qBuAkBMD/d4FlSpehryNaluRqopn+PTP1AvzxTvp2BhUxOWW
         xhek+SwEEW2VCTX88QZV4aQmpO7uNJkHdNaQm4jMwLjScqPVhebN2U6J8JX+miIwa2ib
         N1iK7erEkyYskNKFJDtxdz5OKMgNTemj+nBayY7Nrm7NGMrdceKj69Biy7qIIRfm4fRF
         wG/UTSVlKJtdJ53AufLRfBmfifPacIf3cmvVaIsaKg/Gmy+Slvj7QRQFedXFKw/qKTdP
         CJ123vRAXuDNvWfNN5UigrYfqpGk1Pq4dn3YVthB/DsftjeNl4bdJsq9+mnw9IncHDVs
         wQzQ==
X-Gm-Message-State: AOJu0YyMHjwxGabYuksP7T5QoCmDQ7TZVxaDaCkW5A4e2nSz603GHELF
	6R/p92X7M5aUY/y5lR4Bx+EASj1OxOdFBBKICD5tZoqpWrpLaaGOk7yA
X-Gm-Gg: AZuq6aLden6UdWK0LQXiLid7zSmNTXsbFgJrjKOasF1ryLfWlUwzG9MJHOv2EUtKoNr
	ygB63cB/WxZ9O74NzIeRrRKazJtZUtUChH2QwShF2QjxBKWLtjoMoiATBk/bvo2UAt2M/cKiDJf
	tM3OTm6sO9CLTqgunPUmkHm8CKmZKC6748qKytZyZab1dwIHsDlZVFxI2tzYL38lkp3T2osmGqp
	jCRxV4awSnvNF4DJAjRB/aMTMr0bxqte9qi6oqEmqTqaKk1FAjoBgElVkTP+e1rs+DBu3EfxBNC
	3dQvXw2GCE1UJLgMrsTtWKhTMoEhqrECXubyC9J5RRqixi4lZiVSmc24LjGZXcRSfupQeky3NWO
	HkHa6wG9Z5AA3bnYs7VGY0Rvlc7qihmh82LuVm38GTOjj68w68UWJ5cG4zwu3DeUWnn9jw9CMLM
	sxkjDTmhbOjmLctVVmJnE=
X-Received: by 2002:a05:600c:8b6b:b0:47e:e946:3a59 with SMTP id 5b1f17b1804b1-48069c92effmr31306825e9.34.1769532500847;
        Tue, 27 Jan 2026 08:48:20 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm3887455e9.8.2026.01.27.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:48:20 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH v2] staging: sm750fb: make fix_id array fully const
Date: Tue, 27 Jan 2026 16:48:15 +0000
Message-ID: <20260127164816.91481-1-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix_id array contains constant string literals, but the array itself
is currently mutable. Make the array const so that the compiler can
place it in the .rodata section.

This fixes the checkpatch warning:
static const char * array should probably be static const char * const

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d100b9e1d3d5..092cfbadada4 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.43.0

