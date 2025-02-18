Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97E1E51FE
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905161; cv=none; b=mdElZ+3vpTz7SEEaXjKpa3owLtZXlkC/XdrUvURppFzRA5uVdxsKsh5sY+T0usjm0REBJJ9ZfLmwN0ZJ14Ae+yZ0YlBkaYiX199dMy6NSosP1UD2359QH/PNJeHymRZaxKMxvMHKXImCZyU8z+ECS3bTfZPxgwr2f+STthhVomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905161; c=relaxed/simple;
	bh=Aeag+chLYaQL7zp5R9dHdYB2etdftGzOtxe+UyXNsug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=slbfx5WADiRFHc7351CGGXG3+Bz/U7RThCRarVobhBRpdNDTWlGE6HQBXggMdkJfSjxHAQm2P4b7LzgrO7hjB5za+lT5atGHVEztW2Ol27KMzOa/ybPF6anXD8Ci8PRhwFzp519Zp8VuEDF8xxWJPBTQ3tzs+sUQG0bZDG18/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNhyrmGh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNhyrmGh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c8f38febso109350055ad.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905159; x=1740509959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfIQ73UMIa0oDIpRWuwUrmGQYfAsXCHaqQxm4bBOgQE=;
        b=YNhyrmGhR3CQYfLc5jHAQBsLPKJ+Km12iEMNObXDn25tK8Heu6pxeTQWJmL6Bhl7g0
         w1+0X4hCYkuK1gCK/F4v7yczsL5BcA04eoLLnMf5bv6cC0M413FHLppEMW7xeI4VNbhf
         NHXHjkUcXkbPN0PiCB+kTIZdLT1oFt4wlvYM4aGmiKI/COspa+C9gicg2ca0qZDwYj9R
         zpC3MqGyqFejae3B92Gz5STubBdLOn3Ar1dyA+sl53pd+iL6pC2JPbsWkNlNiH5/m+5e
         gO0Wwth/uzIi8WzoOUjUdgnRQdqfdQPa039FLVmqgata7tGHKx/1lVHsq9YQKMsQC2Q+
         JAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905159; x=1740509959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfIQ73UMIa0oDIpRWuwUrmGQYfAsXCHaqQxm4bBOgQE=;
        b=F/RRwNzJZrbAAghck5WXgBQEvb+BTR/GlOEqcPPaXAZu1gUILvP2H0MCHdvF1kTTHv
         lyAOroqGE/dLgOppT/dDq70q8AGcr9drukDj+NzvkdRD1BGXpZt5vL3K+VlNvDkUwPIk
         Fo6VwFDuS8ON/KuQKXEIqmY7Br+UMIH+c9YWowpMalYnUQGZcxcKObetENyPGqN3CJC3
         /1Rd3/vU+RRtYBY0jgHUht7AfEnrcNIVPDvOzty8ZJvbqaw1nAvX9nyYK4x73ubgofjr
         SsOixjKBAYHpRhzPaU9lCLkBU4OmEJ89PL+6KF8/RGy0AArFVCByo9+jGrsEerm0s1qm
         s4sA==
X-Forwarded-Encrypted: i=1; AJvYcCUQYnoenXRolCSMd0g61XOUEm+1fZPu3j063JAmvXW53LEcMIymGGhczj96S2w0OOMbUVQNIAxhoRPrD0DL@lists.linux.dev
X-Gm-Message-State: AOJu0YwjRh/6LqJN4v8reV7Uqgl1ytTs/qhWqiRb5X5hu0mbPg22I8Pv
	+YXNX7phbwHhY75ofTLv6tuEiq2wrl1aNWeuOSGZt02a88ftqG4w
X-Gm-Gg: ASbGncvuKs3jU9aA4aQkugFhB10sMNySSzrOWEo7S653cXUQ0fh49p2C5NgISyRJFXG
	NoDBFVXUyJ/nUFIfIGbLcL7gxWFjnobhfoMgQLZLaVREILRNlekaKX+Un+xf0D93tgt0Bc3ISJR
	vSLGT2FbL4EErQLaIlyacDJQGNpWZ6jsiIr5biyKPSHP7+LUvUhTGoYoN9dAgbrS63A1DfIn53i
	DxCZLeyjIG82UvCRxlqIxxjBOHXqsKdBLBcQYax68RMqcBdz2nUadmuJZPJvfmT95B3aTJD/Vpe
	ox4FKXNXQekLs35hYKFu0VSouZH1I55S
X-Google-Smtp-Source: AGHT+IFpJc379LGLQcwcKfsxcizKtjfZmOQV3MxzuAoCjiOHXBb7g0F1ZbafhajE2fdvG53aUZ2jsw==
X-Received: by 2002:a05:6a21:6e47:b0:1e0:d1c3:97d1 with SMTP id adf61e73a8af0-1ee8cc03463mr30274362637.29.1739905159059;
        Tue, 18 Feb 2025 10:59:19 -0800 (PST)
Received: from localhost.localdomain ([36.255.84.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73276f20c30sm4903499b3a.21.2025.02.18.10.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:59:18 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: Make g_fbmode truly constant
Date: Wed, 19 Feb 2025 00:27:49 +0530
Message-ID: <20250218185749.22144-4-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218185749.22144-3-madhurkumar004@gmail.com>
References: <20250218185749.22144-3-madhurkumar004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index cab879ab58bd..2cce27effc46 100644
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

