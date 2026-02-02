Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A73EBF06
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 02:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769998733; cv=none; b=Rppc7C2LV8BijDLo4gRMPAybW8ss8UWMaooHU9G4uMzvnawJoNZu08v6JH4LPiMboYV2bAfq4glsZ6jnWs0QZLQH2ehTakesLa3fBDS7EA3hmYsP9F61Tt2Vi3UjaoG9y3eQOh84FtYYb78zkUWNINFuF1CB14zrS7DWFEbKjVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769998733; c=relaxed/simple;
	bh=GdbtsrIXLyYIqsvtW8A8ilL84UYktRBTcqqh9f08cGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p1RtQoQQJ8+MJWDpb3/3xlVmVlrJSGM9lIG3pX2me3XkicGLmkyPpaq6z1ZC61Jfv2CRl0y1F/9ikQnZTjwoss6rM6TA9BSl+HZwLI4yqLphyb7eHIawVi2Ki543rpWFUZABlif7YVrQetY7zt4dOo6QwoOzTowFk36m6LNYMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiMU689I; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiMU689I"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-482f454be5bso5621175e9.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 18:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769998730; x=1770603530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGdiZjFSIglAOn+Jsuf5k9AXWIb77cZIo8LpmA0E9X8=;
        b=KiMU689I8O4Cm3zwVEaTncsrdkW65JxjgJkFtOa8XetjHvO3iEWghBg7vpAqDtib7Y
         fz1/HjuInrGfFoY35YlseCv+xaKa+q38hWFyxTcxlPi1jOF+IVtMIInxGSrtCJzvvkn6
         2ET+YrkBcCb8KX7iXJ5GG+LYFFp9cUnF3nempSc2UVVG6Srq5T1yJwuQp2j+7dMXLcrw
         s35TPE0ZnVIjlCxNVjHsbVm+DuTmGTlDopWaL9x/PjaLS6y7w9COQdMzy6asS2Q+yKov
         uzXFKUm96fRecOK+QVqM35qwZveeZj1QAouvtZ8VwBQFk//aOtg/e/PG6TJxsaTaGCoY
         p55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769998730; x=1770603530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGdiZjFSIglAOn+Jsuf5k9AXWIb77cZIo8LpmA0E9X8=;
        b=aJuAU3DQFvEqeIbRonLgziQbTqHQTmLQPrK2A7BPsxoI2kPsBGWGNzXABuwCMP2HU0
         PEat7m+1K9zz2bnmL/+6TIs47nlIt10ssskDrUJ7c1WjaBP7G+SWp3/D771HleuZs+DK
         Z+vTqVSWTnEk2KqiyQqK4eoZ6+MHpr2Mc1IbFobYeVc3R2OFYkXWOfCc4Gs8BKNpnyUu
         dtfIWzn31aybSjov/0brQ7H+RKrvFHdSNc5mnm37LcoKtrC9xH3ldYf+FgVMGd2YH8rn
         JovHfgTj+aFH4UzZV2T9gPaAMO5KseYQJlqFwcls2b5uU2IQlpAlBc8+lZIda22FuqWi
         mQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxcwiqky8buo+6GS34bqzE5icdbcvZM7XTXVFTEQb3MNNDXsqIp454gZKr/rd23qf8mz+8JYWFpJxrWH+E@lists.linux.dev
X-Gm-Message-State: AOJu0YzWsdHpJ8Z5eYv/U78GM/d1DPWYr/nNN4sgVXjfqEeyLi073lRj
	R52tFRFB+c/xxmfjgAxbXCLwh0VaJNG28wbVwRhBn7sTUMfh9xDQVlcn
X-Gm-Gg: AZuq6aI9hqRzVOb+6TF3JEL6T1kQZZkX74o0ecjUT5jcrPoD5vkwVRPYVbqdm8f9csY
	DPAG3Mi9/hhmIPgaZHTlN5XcLVnLZ6+HH5/I6oRihTTl7tjTYeORqdH6pL863++qfCw3cxrbEn3
	bxLKeadiZTuXO/IbCMB1DUrv0HOMxk7Zcku7ue14pSyDmrBT90Ji1jPQiKvRPzbh8G9+sb9QUU8
	d6GiTUa8Iiih50lNUAlYWA1bLwT74SZHk/SkjUeLa8ruEqEInGwRUUrBbswo1mgsbSL1SV8Rsb3
	fIYz6HeAV68EeZ5LweNGDvN6A1PEvYFNnJLYsN/xHdrSOZr1geU2jcsXv5jyuJ9zOouBCbmAnkI
	yadgYaNV3HS3qgNKNV8DYAUy/CmTjAlXHv/gb3whjK0s1hZDg8HZ2o+27ob9BfEso7vILWeOXYB
	VRST1y4kIzmKe6eaS1acCz7d3fZRmxUsJkUfslKQJrRDHeKIRn+8Y4BtqF5YhWmJj/Tm9Wo+6Il
	zWBZpu6f5r3z14KQGOE7MWDJOg=
X-Received: by 2002:a05:600c:3e07:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-482db25935fmr133945355e9.1.1769998730128;
        Sun, 01 Feb 2026 18:18:50 -0800 (PST)
Received: from shitbox.speedport.ip (p200300f05f4a5ae58461e95fde9ae56a.dip0.t-ipconnect.de. [2003:f0:5f4a:5ae5:8461:e95f:de9a:e56a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354d43sm43939559f8f.43.2026.02.01.18.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 18:18:49 -0800 (PST)
From: "=?UTF-8?q?=C3=96=2E=20Efe=20D=2E?=" <skylinesytbe@gmail.com>
X-Google-Original-From: =?UTF-8?q?=C3=96=2E=20Efe=20D=2E?= <skyline@noreply.codeberg.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?=C3=96=2E=20Efe=20D=2E?= <skyline@noreply.codeberg.org>,
	=?UTF-8?q?=C3=96ner=20Efe=20Dasg=C3=BCney?= <efedasguney@protonmail.com>
Subject: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Date: Mon,  2 Feb 2026 03:18:45 +0100
Message-ID: <20260202021845.265051-1-skyline@noreply.codeberg.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to fix checkpatch warnings:
"please, no space before tabs"

Signed-off-by: Öner Efe Dasgüney <efedasguney@protonmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..10c34228a595 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -362,8 +362,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
-		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	0,	1,	0,	1,	0,	0,	0,	0,	0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
@@ -379,8 +379,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
-		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	1,	1,	0,	0,	0,	0,	0,	0,	0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
@@ -403,8 +403,8 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
-		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	1,	2,	1,	0,	0,	0,	0,	0,	0	}; */
 		/* 0:H, 1:N, 2:L */
 
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
@@ -420,8 +420,8 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
-		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	2,	2,	1,	0,	0,	0,	0,	0,	0	}; */
 		/* 0:H, 1:N, 2:L */
 
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-- 
2.52.0

