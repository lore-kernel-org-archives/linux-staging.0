Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239166117
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZjpfiBb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507c8316abcso2124753e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697886117; x=1698490917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9Daja05OoueSFXSKgaA2RDObCdOKO/kxeq5hi1gOh8=;
        b=nZjpfiBbetE0k/mErVkO8wwWDz8WpwjnpOIgv9RuC7f//3Tia5aZEtjxRsEYjI/LKY
         zfO1Gbe90iDX5D5fi2PY7Ql1/RNA4oNZbbwWhe2gZXMlVqjkFnL+cpaZpYVc/shSo0ir
         XAwsSJuvsljkk9FmsttgSVDp8YW+vm25NQgepVN6F98Errgxfc2yZytRGrxZE6/U5GVm
         bTGWSMpqI8wO5A7EkAFfJmEI1GN09O1r9ZyriHa0kszkPA6KjHdO04l4Bt5AFRHiRSCx
         r7KCfOoGiXrDXnc6Ua94wV91HcxNJhlNmMJA8FNa2nb1+5HJRrUFn0VodFnIibYr1CNG
         7FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697886117; x=1698490917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9Daja05OoueSFXSKgaA2RDObCdOKO/kxeq5hi1gOh8=;
        b=Tkexmfh9uvRVJX/B6OLYpRvwXjh7Qw8Vz3sluFfYwfnSCcCG9DSxcSZAXdYDMX8JJL
         jjJ46gQq9lMOH57eTgdP7V5m01xN4/nQHkEOSDs67d8WT1YpBTtOEV1bhJOysKILDt25
         xWBEmLeNV/w8iTND1N8Wt6w+VKZx5IjzicDY8ol/yIUyzfg+/Lr0YGHVU6uvShHb1YZv
         lKUZ5c3F2lPgvHtbJtHxTYKQBHCt6gRO4d162Ls5eEPTc71WQicEOHzmQyHn/U3mT6u6
         rThbDT2F1HQLbcc90X4Wm8X3JLaVTmDtw2k5TIm6S6C8D6/rJjduBY7RekoDOMEJWZwZ
         h3AQ==
X-Gm-Message-State: AOJu0YyLdRdMQBiccKIkerRMm7e5AJ2Zjsv+D9WRSfx66jvnF/hY5OMv
	p9Z2A9b8zJK2eyyeKVCZZqk=
X-Google-Smtp-Source: AGHT+IET6GR096PesPzyE5eDNenDTy1DQT520jQB2nzok6qX9/hVkjPzoVQMCDyBq6FyaMqazRXmYw==
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id fc2-20020a056512138200b00507a1dd5a86mr3372712lfb.13.1697886116897;
        Sat, 21 Oct 2023 04:01:56 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id o13-20020ac24bcd000000b00507a622184dsm823093lfq.173.2023.10.21.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 04:01:56 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: hdegoede@redhat.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH RESEND] staging: media: atomisp: Removed duplicate comment and fixed comment format
Date: Sat, 21 Oct 2023 13:00:58 +0200
Message-Id: <20231021110058.85013-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the following issues:
 * Removed a duplicate comment
 * Fixed up minor comment format issue

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/media/atomisp/i2c/gc2235.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 55ea422291ba..ade28950db73 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -74,9 +74,6 @@
 #define GC2235_COARSE_INTG_TIME_MIN 1
 #define GC2235_COARSE_INTG_TIME_MAX_MARGIN 6
 
-/*
- * GC2235 System control registers
- */
 /*
  * GC2235 System control registers
  */
@@ -167,7 +164,7 @@ enum gc2235_tok_type {
 	GC2235_TOK_MASK = 0xfff0
 };
 
-/**
+/*
  * struct gc2235_reg - MI sensor  register format
  * @type: type of the register
  * @reg: 8-bit offset to register
-- 
2.34.1

