Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187E3207
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045494; cv=none; b=B7KkkayhpMLV6K6JmASuWZ2LqxfTSGEfARWZQ8n46pZkA1XiDAD7dFG7XwCpYzkt8UctYfsczgoAzox7xpSEHFQsopawgoZc0A1dl9WeWuCnehbEwtWEQP2taIit4jAtx1LDU9bpSmXdHWrvvKILv+dynmamitkRx3YNIMH6D7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045494; c=relaxed/simple;
	bh=JkQJjF0Qec5T4iobN1AOTeyQ5w/nJDrM5+viPyB3/E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBA2lPKciR8nhCh/6zT6ZzodAHplTR5hIyl0ucbBgp0xJjlu9BpECdNiEjS9TiiLbuCePz9CIpbMabtCAni1Ek6CvVMIP/16QfUcQ5+8dLYFoc+xL4BPrEYKIYROX2O3bDuvUDgMAg63vW97pBiNlHRMyf9KqX/UjlRvfHpdwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL4J5lR2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL4J5lR2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748ece799bdso94221b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 10:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751045490; x=1751650290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTfVgFtzOFOfg6vIGvu1wxSN1SyeGW/viyLGmJ6OnNo=;
        b=CL4J5lR2DLr/lYTyRvy7jfpkZlGVbsvcOFM/WCzIYibP+vuq10NiVxZnUBITJuQ9bx
         mF4h25GXVL9LKNGdsuLLwFN6JOKgJmccZTSD8QCD+NDFkZQwSl+1kx9bUE/afzj9Okht
         5IAy5nPUSwcbkuzshVPKB8MJWBz8RV5W7YR4V8qJ2CBwotblxI2+rXacbOmQ8SfIu8m+
         LgmSQtkDfUUfNoBEx/SPsfK+esG7RcAGu2DiC/hceBuFLLpzoh3k+mIgPkBtBgn7vlld
         TFC4TkExM0EKsej8gtvr54bwP/dczbRs3Go0xq+uI0G6+xxIR+2iBPo5bzAtTiksmYXe
         WWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751045490; x=1751650290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTfVgFtzOFOfg6vIGvu1wxSN1SyeGW/viyLGmJ6OnNo=;
        b=sJ1B8pRl2LpgjT8RHIPzb9WktDpa9a6DtrGemXdrzLio8gbqdcmkl2GypHXEcw9eMT
         HdByfTOOioSX4H0HHDa0bEZis4NE2Z8PtUQlZdRGQrAsLZwXgq5Opm1/paxzGzmGndh/
         CeWYI3Q9UuzxCVMChKqQ4aQ/zeMvT43SiVhmpPnA4MScLcUBBj6d+St6Owwfs1jnjcQi
         KbeP4CPt5tBRLzUcThgHB+VwRPe6NNKl5c2xf+m2CQd0FPgoE+6bDw5WeH42f0iFxMp4
         XRhG7wiQgiFuZoRzui2cnXPqqUKQxHhHLIKL3NAUje6z1gLMARvnBcjtjtZSJAY8E5u4
         1G+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLXvSU8rHelT1VQGBqGwVl5sfycbR8hljeKr21FeZFGia7OZDG7AkS8z8vExZ5LlboyewjYmMIkurX+al6@lists.linux.dev
X-Gm-Message-State: AOJu0YxE7Uwja3M3kcBJVFWmzIqB2NPXiUOpLR8x8vd256UnMl14NwIO
	7D7AUKqJmoJwasE7dsHYfDS57JNo1KBsWcIIF+CnTUnY6K7W412R6b+J
X-Gm-Gg: ASbGncslN/K+hMHZteKczarvuUiKlaZDDs74ooj85sym2nbhf7usgJxky2fZi9cAMPj
	J0l/gKPlfedcVXp10y/z90RngCR7ek300HJ6GjHmAV4iwT33UZhImrVV9vlUfvWw9EVXGAsUcFw
	aAUr8v0tUFsYVuWhkb4OTfXs7SGLOD10Sc2435h9zUpyLOrJ4VIcXgIk/wNXhkasfnnJOlg7Pry
	LKK4zkTdwRiGmQYNLUL86Kt/wXdsyrrHmbzetI8l1RDTon4EihvqNL+ccDuT2XWXTEFTOU3JjVa
	KiBIqcxv8Grto6RYGaFa+EaKHAadqI4xq2jsdsJqAPRFpF4P5xSp5fqv1bTXk1k=
X-Google-Smtp-Source: AGHT+IEhIMepfK9nCZUOQR8wWahLBJNCF+QFm2OXbbyiVTTKrfuS1lKZ88tt5z5/UNXFlfl4cLUdMQ==
X-Received: by 2002:a05:6a00:9094:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-74af6e61c70mr5347132b3a.9.1751045490378;
        Fri, 27 Jun 2025 10:31:30 -0700 (PDT)
Received: from muxbit.. ([2401:4900:1cb8:b350:f061:66f3:baf1:5b2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557440fsm2907764b3a.74.2025.06.27.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:31:30 -0700 (PDT)
From: Manish Kumar <manish1588@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Manish Kumar <manish1588@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode[] a read-only pointer array
Date: Fri, 27 Jun 2025 23:01:20 +0530
Message-ID: <20250627173120.7639-1-manish1588@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a checkpatch warning by changing the declaration of g_fbmode[]
from 'static const char *' to 'static const char * const', making both the
string contents and the array elements read-only.

Signed-off-by: Manish Kumar <manish1588@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca399c..e77ad73f0db1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.43.0

