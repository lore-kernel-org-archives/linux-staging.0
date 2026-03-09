Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796436AB43
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 23:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098123; cv=none; b=ls15XVIl23oukBlIrDHDje1sPlgxR4Gg5DaKlV5Vwlc8YnQHyfeGEPCf//t1NVA87wL9A6t/+KCUHGgQiatuvNYDaAKzWTkl4TwckyvFxel0gILs45aXbTPWvjkgal32ps5faW+YLSS5qTPOfEOqHssesH1mRR6wgy/2cr12eG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098123; c=relaxed/simple;
	bh=WGnaZpd1lHZ0g1/hQlXt3QsP4TP5blxc+JSP/+XOwAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wer2gqULNbh+TnaYZWsEx+XLSBd7qGyNt5wqvGDSDqgjoF8xpo1aoD6besElKLfqjCiSztOjEHwHtV1KqnF5p5cUCZO+zYNhKL9SeRFstIjaKls8Jz1Ri1dDRdkhVKrO5eCNV7raIHuFNyllXuSPVxRO1QriCjZFsyjITYx9GRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLLedczF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLLedczF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so4324029e87.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773098121; x=1773702921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRNtITcVqp4VjMNgr6LnbUQMaO8JD5CEfsNUgSM2t3A=;
        b=mLLedczFYqkskXAmWnmP5Rb6m12XVBRBwg0VIW11mQy+zk2UFINcOToVuWNxHXVAX6
         K6d+r2xd05NEi7BTpD33Rc7axzZU0AT28BFAAVdeW7NkbAjojdsZchwEzc+WQiwfwbPT
         CJTjM6+q3vsaw6Zy6rwq1py6f3lxhSh7opBje3KIc/Xo97nF67rM1yqsjimFAgqhW5aw
         AUExcMWTE+O5O7YtWfzElvzg54hc0c5/i94fpP89Y7swl+fqSW2FFEB7n3CAQzcNI1+W
         Yn55OYygQW+SQTjdSvonPOmdNCMNfz5EZ0Zqr6eiZ5R+/Rj5L8Rpgt+9Dte7vH4kWero
         DGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773098121; x=1773702921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRNtITcVqp4VjMNgr6LnbUQMaO8JD5CEfsNUgSM2t3A=;
        b=Qjh2uKxJJ5xxZYkOGtxiUchPRfhFcnKsNq68mhRHalEaH0vxcUeYvVquSFdG0uzECx
         nnUaOJNsMG+CdBUHr8PPnsQ1Pljqz2vUGZAon/JpMIx04JofTpsRymoFwlA4tNlSGmU8
         T8cfBNJURbgH5mSeXuBsnf7VgGozGkLxHnv69iS4+ez494eu32aXhQ9fH0stzCG9Y9+4
         Ks0pzrd823nK+MYpg9KIccIqlfsXRcclaLcrKj6QIIDWvkL/QTNtWMS3uul/OzpkfdD8
         iWF5apZ33PipnKSV7RzOteOunx050Cr22Qqb8yz/Q4zAdRvB3H/ySFowrGK/YgMhC/Rh
         1WYg==
X-Forwarded-Encrypted: i=1; AJvYcCUZgdfxchGXE88RFIGmYz9Mrkhg1X+oguH1WJGpTiLNVHfVehDOSOoJFhQClvTdnZPS2kkJLXDuh9U9H8Cn@lists.linux.dev
X-Gm-Message-State: AOJu0YyXCyeDhkig/ndAcnkSY4IsVsUR6+tB/I5JJc5PWw+pho0WZSTb
	rtvK2Nb95A5G8TJiWfmfM6sV8nBRhxT8LW/7RnVJts6sONIb1/bqTyAj
X-Gm-Gg: ATEYQzx5JOkEhd+9DezrrfhsrmjuRoQLko4GdDGnVV5Jsahy/DuAFH+jo/c4zqYjUOc
	JXL7o5bA7Sf7nIbVS9yoXvN/fdBNIKZHXTMcCSr+hTY6yJM0veSZLOe52DsNEbMkI3ea0YqOGZm
	cV2O2hVmKZG2y+YP9nkk+vm0CpW9ENiM2H1x/XCLhCRFMpC3TBwY9GwZHEEdvs0k4jEDqupYRkm
	u/OCWvItby7Cu+vRJD2ClorsHnHsT90R48jqW8q2mhVoH2wCj6BIXTYXAW+6BZjHkqAEsCKp+g4
	yqsdaHwjwDQdyWd7bDOb4lZwBfpxr3Hj1F2vWyB9CqlE18MOxD1tGJ7g6V1nczlL76Lu+wajJ1B
	eLXvfjLruVZT2aNHUaersLHZLPbXDvZqdk3cZahrc5WFNWI++E6ZGpO1BD2vsMHsuLEd6orKyPP
	cN6ZRAXNyiOlKLTP47bXS6DA9jomP3oT3iW5nEdH4BT0BMga3TgmQfM11gOE0s3ctNd3rR6maku
	w==
X-Received: by 2002:ac2:5990:0:b0:5a1:3bd8:a068 with SMTP id 2adb3069b0e04-5a13cceecf1mr3252492e87.30.1773098120314;
        Mon, 09 Mar 2026 16:15:20 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cbedsm2456415e87.12.2026.03.09.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:15:19 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: replace msleep with usleep_range in atomisp-gc2235.c
Date: Tue, 10 Mar 2026 00:14:45 +0100
Message-ID: <20260309231445.7000-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(5) with usleep_range(5000, 6000) to avoid sleeping
longer than necessary. msleep() with values less than 20ms may sleep
for up to 20ms due to timer granularity.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.43.0

