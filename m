Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C913BC3F
	for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740255343; cv=none; b=PZAnZxK1lMopkM1/GN+aIXXWT1Z2Fo9KecpUmd9tDIHw+xLW6BU77UFHoSgI16kkpuB0rtbF042KEDbhHJvF2lxsRqHj+ASrzCxoew2DEOZLhe1LKwDK1J9dtk3SR6uPcKJIRkYtYG8q0DoHSxHtwGB//6PTqNh48ZNCm198XWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740255343; c=relaxed/simple;
	bh=e9Zy8BkzBcuQBUPJbx9biU7FYNTy1hMCEWFyhs9Nh8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9nRXwHyyvnbSTHINFr1rX3SK+fqRpKFfNeB1mGnPDjUHiilnE3Zc4n1aouXSnZQ/OJprmDXjkK+Iy+k4lwm6Poz3jaZxehkr2A8lXy51bmQZHIM+HfPXEBZ3orjtN3iNvYs+Zpu0rio3VPImbmdL2vPKiwDPMgxzgbG+R5mogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVZ5DGvF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVZ5DGvF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fc6272259cso5237517a91.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 12:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740255340; x=1740860140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzPFAwTq8Xyfo7fDkHC2dxzwSB9waPNiWa9hehCRfqc=;
        b=HVZ5DGvF3z+pOKL6BUPqUTCqgItrUasv2POoTSY2WqfGgnhMqQgJXC3lJL1TI8Sohz
         /CRrdJa2GsSg8OIWUusBM9oZWVmkD4hligKbV4wIDRa6fHJdY2/4lkEFPIGKgNo2cAqz
         UlP/hi7E7uAPVcGmQPamRh7uHdZC25ot33B3GrNoA63ZuE1HIkxDj1Lryu9SRLi5afYc
         RCoZLMzxSEh0XXoBBcVNjSquQhefLsuUNBO9fGjCVvb48hQkLZnep27Q0H8ho3f9g2Sb
         93GtVBwiDAC2Gw7YWiui9qAzDiFOpwqa/tS/R7N//lZfNP1XohH8U+j2cv3laLqNL0JC
         9+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740255340; x=1740860140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzPFAwTq8Xyfo7fDkHC2dxzwSB9waPNiWa9hehCRfqc=;
        b=ozF2WaYPCuAB3Z2GWFtpBoGtGq8y+Bi/+7Ul0Mckbo+K9frJYezlRIYi5RW1aM3CWA
         1xNYdvo4+dLBjdgkFbSlp+neaXdd0DbiJIYVM9GZDgI9Se2bsC+7S5S2dEMzFl3IbLNN
         jwZFenL7fzi73VoBCy5wqAVwzKsUF9J8WlfGq6nnOFND+s01QVYd2lPX3ZCG2w1MWQbb
         VzchEENLT0buQHlVI17KOKScykUv8x9k1sTEzKVBPjJt+herP26NIFxI00lXNPPBzvzA
         DPT0V7jIA4wFC3HUYCkG6hV8UlJ+XpsFcFLnznOG4bt4LtzI3WBUUgovNmtC4X5uJoaN
         0InA==
X-Forwarded-Encrypted: i=1; AJvYcCXN2we11f5mtBHnb+7EZOIlrBn5xD+Shc0gNOZofXZ5vu027B5ZPFBuM896iVPbcjtBYD5weIz3qiJho/mR@lists.linux.dev
X-Gm-Message-State: AOJu0YzUwjo5Lif77MgDtsR46HTCV6nsUqTUgInO2Ch3woDLcqRMnOmK
	BaPDTqM36XoBPo+UahdIjMjSOCbjpfr1U2ZVI131g3FARXORkAbA
X-Gm-Gg: ASbGncu2pIf6mI2dXpCsPNR1jbGIWrf11JhvBdZSAjJ2BvBt2VWnetU/kN3QevIBWa4
	iFIXqGf2VIK8W6Zgk+bAWoFTgqm+odjsMlTVin9oW021EA/TpIT3cfP6XmwOhdbYvPDPZHUIyC0
	qX2TodBgMfp+9DkDEIrCnpm6FUWr+nV1VgjgJN0Au2rjSSl0p9a7jtX5OvMSvMWj41q5Pfk/tsP
	nMZdOlZCLO3F2Sxz2n5w+Eu0/CA6PIOVJ+yeKMgBWCoHb+OkcDTafntP1c2OZkLdOzuKK5RvFRx
	4faiNrXR1Alh0LCLXPYozWKeAUwCdcUQ8TmIlQjrJaM=
X-Google-Smtp-Source: AGHT+IEQ53UYyrtVg7Uxaj9UGmPpVi8BT70TjxI+xlbx+kZZpGjX5XGY3L/XsYrqjV4Q2OIrQ7R5ZQ==
X-Received: by 2002:a17:90b:17c4:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2fce7b44472mr14352996a91.33.1740255340404;
        Sat, 22 Feb 2025 12:15:40 -0800 (PST)
Received: from localhost.localdomain ([36.255.84.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb05f715sm3572997a91.24.2025.02.22.12.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 12:15:40 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhur Kumar <madhurkumar004@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] [PATCH v2] staging: sm750fb: Make g_fbmode truly constant
Date: Sun, 23 Feb 2025 01:45:14 +0530
Message-ID: <20250222201514.15730-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare g_fbmode as a pointer to constant data. This ensures that both
array and its element are immutable.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
Changes in v2:
- Added commit message
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a2..aa154032f 100644
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
2.48.1

