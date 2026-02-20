Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0643203B4
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598778; cv=none; b=VKYRCbiUUyF08THAwOqNuaKcyNuWLkLDm5+vaOEdKMqIRZQva6vmAY+izLKItQGUJTOSI7Spf2veAFJwCyobr6wmn/RQnVVkMgD8CSihEU0n5r4X1h/wu7KgpD2FE8/CXoCwayk2y2B/ed1Pn/2/Uo90lt04HjmhuBMb1VOhQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598778; c=relaxed/simple;
	bh=km0qtDT0mO0Cy9oF1ZTYF0Q4SUEb6IYBeOCM3PozPGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAiAhzDMWf5tf71O6RFwb+wMEp8JMAdLxkuv5TaO9hPmiIvHiFp36ouxZ/MQ3TcAw7LlLGmIVsbgxKkCdobHBSSKavLexnokR4TNN5HLCqKt/tFgT0Gl2AIzxVa2jpbq3JkLjjcdN/9eKskQLrAXXsDk22Igl1lgVc7OC+ru4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqkscJXI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqkscJXI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso2174995e9.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 06:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771598775; x=1772203575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzVFEPuzSB+SYu+hyydxbDvrmGOvb2m8I9LyfgwgIF4=;
        b=gqkscJXIfgbYWoS+TC0F1+77mEZ9Q1ALE2KxxGpOoNtwGUqXOl9QrWcvLjTvMh0gt4
         Dj3VHI3a/Oq7s9S0XxSjftbAhZSWuXOTC9Hqv6iSDGw6q4wHK04jhHEPqvSZN/ssd5Wx
         7bDQSYl4HDzVg1sC7BNNa1/KkdAL9UjKvC49la5iAQZc8EVpb13YPgznNNPwjF1OefCh
         sQkEUjLncd2fc417DEQUz8Eq+2v+636pkPSoWzTRK4PMLpGViqeIu40ad8RHwzfSf0D+
         S3hLWTgE8QQyHckgaeoHs0jx39UBglHD++hRsRPOkrm3a934FZfKNwThg7wZdM1tS7Bm
         bO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771598775; x=1772203575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzVFEPuzSB+SYu+hyydxbDvrmGOvb2m8I9LyfgwgIF4=;
        b=RXq+9CsN0ptTrH/WcJt0hwTuH6kBkPuTBUuD0E9TR9Hj33w81GyDnheYmjNbfX++Vp
         eLDhuIh7IyvEZDvGXdVw2vXJm8zmPPxxg7znvFAB8NH68wySPnWc2fSrKrfHZ4KGE4aH
         RY1KCrPipu0tD500+m+HeBmwYD9P+MciTu4FSAWuC1DkQd8F4hB3exQq23xz/4m+JGLW
         V3iBDFipw5MVsfwVdGsCUMLrkPV5n+7hrW/cOyVFZdVG3MHvwf1773vAxrhqayr6rktO
         HW1ZQNFSanYjRo1+zrOeA9V9grqez5S1bpbG5Qn2fY2UodbnfiBNqytGcKuH/SIZFRcw
         degw==
X-Forwarded-Encrypted: i=1; AJvYcCUG9p7yU/4gv75oHh+3suqSEheFapm1fEhxNopDSj1Bzc/GDPBqLFN8bX8lRRX+/AjdLN9gV22bnrIj9d1W@lists.linux.dev
X-Gm-Message-State: AOJu0YylHw/J5VL+E9G2U/b5XD0fMPc6mrjUUqDdPunZvbUrdzyWIPAL
	93BPTkH1syhXU818f6yu8rSB7uAhS6ui4b5Z6Z4TYwMY/kiJ6PSgCpTL
X-Gm-Gg: AZuq6aLmWzzoxJ2UuwHtkhKmCJaPrv0U9Ij8nQKtTnPFv3/OLlDg4DyvVOrdxEPHqYz
	5ZPjC0nm7mKkytYdljP64o0w5IMxKnxNhSjpDlaW+2FyWVx0SeZHl6Vxcr2LA7hT2cfqqlZuAo4
	PTa7MonbA3g7FAA9N/fQEaPVnIlcl2bxj4IayvUXmNXx47d3d5dc8BF9Jpmd0ZYZJ4WBkuhM4jk
	1fiKqDDJ1QY5BZ7D/wwx30mOard20az6zokreEF07qoH0r9Btkt0XXJaJPBa1A4JAJDSQuo7D9B
	+PmTfvXMI5WiLjg4iyw8etZVteAbgxD7B/JeR4p29Da/lLU8LZooADrhh77ACr+hopK5jZL51U5
	HKBoSWdfSlaKYNPGcQCvwsVUYgSF+UBWYhVFrhQz2ol0+xaKe7z1yFLv08FDv4tmHqlrgKtvJvS
	++7wLuph5kMHbEc+mrh/DtoJvXkU2WQvtTyIs8H7s3DOys9ayIBoLwesRLeMghmPaHSJ71mm+Ca
	xBVb/spwbPti3VZsMlmkj0yBcuXcKTnPH7nHc97OiXz/rKQsQjJ
X-Received: by 2002:a05:600c:4746:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483710519e6mr271693175e9.8.1771598775175;
        Fri, 20 Feb 2026 06:46:15 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3ddd3c8sm29340505e9.2.2026.02.20.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:46:14 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: use str_on_off() helper
Date: Fri, 20 Feb 2026 18:45:43 +0400
Message-ID: <20260220144542.199772-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ternary operator with str_on_off() for printing
"on"/"off" strings. This improves readability and follows the
kernel's preferred style. Also add the required header
<linux/string_choices.h> to provide the helper.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..d573eab05e1c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 #include <linux/pm_qos.h>
 #include <linux/timer.h>
 #include <linux/delay.h>
@@ -527,7 +528,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -569,7 +570,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
-- 
2.52.0

