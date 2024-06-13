Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38977139CEE
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309787; cv=none; b=rq4tV2BSza6tCiv4QEyH0jBOsMFulofchpcPTL0x5gH4p9wHKcHEYKo3S+IIhnNb1SEie/62BbZeXUAlERJowD8w9EHYlTCgYYk+y1QTopFhnl9/8ViQxS+PLaP+1BlpcfyXASyJf8YrLqTXJsTS2m0qGMt4mgijMggG4tttz94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309787; c=relaxed/simple;
	bh=gvuzmi1k/XSHJhqfXtsgoGFtVRXKq1oA2+kiC54G6do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oAJ5FzTSjnJ9yNyZly+L1OTacnSg5EVIJaLmCyLynKBye6ckYLGRk5trgocH6PJlCSlIvFtcMFoAyb8Ya/wveZ3oGDoAM8XnTmIHqETTZQor/pSPRGry8DM6R0IJiLZf79AfMTELs5TrXzdEF113Kut2Zoo3xwmYa8l0HhqfVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2Kge1W/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2Kge1W/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217d451f69so12616095e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309784; x=1718914584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UINjgp/D2gC+Ch7EiW9poorIgokpZPzbo7zad3HlYkA=;
        b=K2Kge1W/9OWOV3+TXM1wEQh4efro/XjNvbPp1dLySAA0kf9d784hRtEWbJKyq4J3Vm
         oGvVpHcPHWdVbH/YwJ362DjGYRAQUUYecejf7hJUovilGVeblmyPHuZUw3z7zXSF+zu0
         hJOLsp91fx8+yGtbkPnDEK2jrdWegBkTH+yIA2R4Gmfz+kFeCkIOMkRYi4t3aot/vt+I
         LHTSACWIpRDYepJCvRBCcQfGsf1/8tuLp45G0VKnO4voctGVVvx4pUV6ef3kI+A1pjkU
         JAQRbHqLT7z/7+xra+/tHLNkReyLagQnLiNKf72P78WDAhqcXVEURcDLAo8TXruuN72l
         2LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309784; x=1718914584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UINjgp/D2gC+Ch7EiW9poorIgokpZPzbo7zad3HlYkA=;
        b=XqA98Oblrx/jSZd/APR8LMC6hB0S44Ng0zSQYKjsMpriFBPZLNRcFdFFxR2qhDD1Tm
         tYkQrUuYIAt0SB/AIXMBLtsxRUEJJxhnjNj8lM9QuhFlKX//8XTWCpvG09l5+07sq1vW
         WOlslQvqMBZONZdaKqKspXwuGbJrHhZcOp5HjXc1UkTCyUN0M1qpW5CXzbwfwRv7adzi
         0U0wv2ClDoH9+L5oGwyFQ/EX4K3huH25dBLc9NVt7JCOJnCgNu06FNZHYKyfPqMrp4Hy
         ODKK/u6WeLqwrxUWvy86ijWsYxQ6Rtpmw/Zj6kOSERPjJkj+bJben27Wj8cq7lhS3tiI
         a2cA==
X-Forwarded-Encrypted: i=1; AJvYcCX/B9LroHKz9MNIfz/MwbvUI6lmrCsLSYho0VUDqSFqI8TcGBcY88CctTSBlhqI14rih+kh4N1plC0xm0tu3/dL9LNVHgtH5FsWIKq6Sg==
X-Gm-Message-State: AOJu0YyERf4dVcEmb64N/TBtVWnkW1+SpPb4SDMvrlElNaa9LJsh6bYx
	xaOVHZCIDwXtigm4Ow1VnXWw3Ekxm5i8jF8nzUYoePmkrx1z7u7N
X-Google-Smtp-Source: AGHT+IHtqZdNg7gArhrDE/I0mRMBS89kqy0mJs/WggrkUzfiolcB0zaG/GcvLiy3wAJTKMbZFow4dw==
X-Received: by 2002:a05:600c:1d29:b0:421:79dc:56e4 with SMTP id 5b1f17b1804b1-42304862690mr6394605e9.41.1718309784509;
        Thu, 13 Jun 2024 13:16:24 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:23 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 1/5] staging: rtl8192e: Remove unused constants
Date: Thu, 13 Jun 2024 21:15:07 +0100
Message-Id: <0ff436b8aa199829728ee11d0ed302e3fa6fd2ac.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
References: <cover.1718309120.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused constants: IC_VersionCut_C, IC_VersionCut_E, WA_IOT_TH_VAL

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>

---
v2: Combine unused constants patches
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 8c85f1c866d3..486397d7db84 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -88,9 +88,7 @@ enum version_8190_loopback {
 	VERSION_8190_BE
 };
 
-#define IC_VersionCut_C	0x2
 #define IC_VersionCut_D	0x3
-#define IC_VersionCut_E	0x4
 
 enum rf_optype {
 	RF_OP_By_SW_3wire = 0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 84e673452be4..863af8ef9f94 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -33,8 +33,6 @@
 #define		RATE_ADAPTIVE_TH_LOW_40M		10
 #define		VERY_LOW_RSSI				15
 
-#define		WA_IOT_TH_VAL				25
-
 #define		E_FOR_TX_POWER_TRACK	       300
 #define		TX_POWER_NEAR_FIELD_THRESH_HIGH		68
 #define		TX_POWER_NEAR_FIELD_THRESH_LOW		62
-- 
2.39.2

