Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143F1C3C08
	for <linux-staging@lists.linux.dev>; Sun, 21 Dec 2025 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331088; cv=none; b=sahaZpQb3uutlUOezWkufN2ClK2D9hjE33BfVEH94suz2pJQLFXkEwzx5y+iUD17i9WemtxLuBREzkYB87YHt3EZqLA95cKSX2OAF2IWMlgCw6TktgZXj+Pqxkj2F93kNIpGI5iX5WYaZtWRiz9Vq6PXj7O4ANyqMDO/wKLKrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331088; c=relaxed/simple;
	bh=GkXEKImhZDeltY1IKY52xL/hPVVMAkBaQ+g+36vcwzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tH+MwOL+DM4ZQdNVJ0pMrmQxfSgMxXfeGCnozLPJ3U7dSeknk8oXPmK+gf+xrTvqV25r3mkJ8jMDrQKdetBMLx1X4Jld/kK2gD2q6HbYso9exYNEsOlyjaY+cZeHKauJeQ36h+HPDWPXXYcqzPy4EpKHzRB0b5cSyXEPsAYvT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKfJnM1F; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKfJnM1F"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7cee045187so583138166b.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Dec 2025 07:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766331085; x=1766935885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31JTYOJ68zQU7Ygr6vWGrJQgZrlwNQc62R8gkC5DC6I=;
        b=LKfJnM1FMtCAE6d1am1BR+54DfdGLAxS9zI+CVnMcym9rvPZBAF/dbB9GKUkCCRZD1
         iWDJdw1XZrvjGw4G/WDx8PQfBuw7kV7MxJtbn8XNgt7UJpAMgxfD8mPau0MTjVihXU7t
         EEXLx4PuC2QEcGGzOqpght2LexDNdfEianNulknhHdfB/bmbdNL8d1/RP9vQju1hjwLY
         frmHjERkCLDqxN3f9mfVcHJ/ahslmYPvRI1Jw06p2aMREM4OGjVy/pisonWVnowa5Gr0
         65BiG73wvM00B4nZjtsgLs+LSiVcavYvwC5OEHXWgmyvCqfnyst1+epqBtIQNwQ/RhrJ
         87tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766331085; x=1766935885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31JTYOJ68zQU7Ygr6vWGrJQgZrlwNQc62R8gkC5DC6I=;
        b=ltsuFj3cxzQWc3OS96S078ixoaM5PdGmtCZUHg1b8FjnQhMDCSQkudQnLJtxqxhcuK
         kVgp4PEVK8Ib71UebniHdmYof7IKrxHmXrTg880JcEvYuD2qq3KaUG01VKj73jqRzzV1
         plvBWReGraRr/IL1/K5naMRIBt5sOa4SsizSMztwghYXihh2F46IgFRpSfy+/ZAzq8zX
         FmMvhVZtbS4iR5Nhlgx/dbhShPpNDJ4jyzfWaEabzNDPl9l4ha5f/y+M+Hc0pAASvgJh
         0+fxN77rygbByOHR0E+jQXSkzdnMpGAM9eiUrsBtCcSi2LxLv4y5PxppjTr7DJ1ItO2S
         ayJg==
X-Forwarded-Encrypted: i=1; AJvYcCVc3/oMkUF3LtfzgEQOovADs1YY2m+V2E5nK0s+f0AbVzC2rsxd/PB/B0ggoDZjiBnclklPoXV7TSsYrgMu@lists.linux.dev
X-Gm-Message-State: AOJu0YzOsvsxINrnCniJY7Et2w1woI3F9c5Xzp2+YBmV8GyMKX0Olndo
	0LNGYeAp1SNV3JmkRdJfrIr0DS9XZSJpSPRJHf4cqKP+x4e7WAIGqR4d
X-Gm-Gg: AY/fxX7vi3nBcFt5F2+LarnDLhR5cI6PDnJ1Ca1K9vV3LSlHcPNAz4bN+MDZWK5mxGr
	dqsGD2s41JT7JrWakkXpo+FLZPgS7YrFx40mMASNrMFjjnGLcVAKaDxyeT2SFKAfrhO3P1x0yTR
	WKPAZmO55VktWjyWUFu0Np0ZiOGnZuTWiCebkIJ4+jyPrLsuza28UgUrUpZrI4/13MLxa0L18r3
	y6HZ0jTMAyQ+hPLHHH6G8ELAOj/53vqeHitxkzwdxqd4vQR3KCyIdrviZ91ZWvQGReU7rSPKL9Y
	vKH7+13+PMhz4uF+e+WwIjoVu/9K/ZC9qW8lUfHddAfz1RHgbV6b7nh6xOECyAGzN7A5ORtVwl3
	Lf6MWhEJmOFXh4owpwRF8TKr7eM3Nu47Qx0OEhXshhDQ7TCW2cGerx6DFKNOlEQyNpTkpp3JNs5
	K/w07ro4QOXDWvPh48j6N+G+7F7RbJFZvFWAIBYX4TqsEkHxTdyiNLNWjfOwjNR3AJ
X-Google-Smtp-Source: AGHT+IEWQw6scbu4XBuN0qhvATX1MA/714hTCuzyU3fnZ6I3hM6XzvuN+URTkBVTkVQKVp95ua7aPQ==
X-Received: by 2002:a17:907:3e12:b0:b7d:27dd:9a54 with SMTP id a640c23a62f3a-b8020634a93mr1332188166b.31.1766331084895;
        Sun, 21 Dec 2025 07:31:24 -0800 (PST)
Received: from localhost (2a02-a44a-2a80-0-8c2a-39d0-7ce1-2682.fixed6.kpn.net. [2a02:a44a:2a80:0:8c2a:39d0:7ce1:2682])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51144sm801623066b.69.2025.12.21.07.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:31:24 -0800 (PST)
From: Tim Wassink <timwassink.dev@gmail.com>
To: timwassink.dev@gmail.com
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: sm750fb: Rename CamelCase variable fixId to fix_id
Date: Sun, 21 Dec 2025 16:30:45 +0100
Message-ID: <20251221153102.38178-1-timwassink.dev@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable fixId violates the kernel coding style, which prefers
snake_case for variable names. Rename it to fix_id to match the
standard style.

This is a coding style change only.

Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e615..d100b9e1d3d5 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
-- 
2.52.0

