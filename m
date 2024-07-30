Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672C38B
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323904; cv=none; b=XV4ddcRkJDXz+ZDII0YmtN28k+g7VAqNpURSJZdNMRjOl/1FA+AQaDhybja4vQ46VMk3gZUXa8uOd2TbMEmm8x+zxvV2DSL17ic7NmD9nltoUP5p3WktGmZ3kNH3YujNpphupQocaEioKyLnAGJBsYqP9ApodGPSMVPc41eHRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323904; c=relaxed/simple;
	bh=Ah3ly8T85JxSSei9ejujSo5WDUEt8TJpdcnUKYD7Ek4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KHbY9kOS4cEBBhqYZqaZyZIc/YoFG54/DkrdrSDueECt5AaiT0bpdU+og1O/Z9IIL9xQn3KveKWqRBAw3KIvVo1DWw9/sHyLZaHbAgwtSL6/9hyHRTreKhVfxdZYKXg0JEtdJ0D065AmxxpO/tmnoEpOMsuiee/bq8Xg+K7ZQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTiThTwY; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTiThTwY"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db1cd07753so2568231b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 00:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722323902; x=1722928702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk6LUBEjtLHTIduKacIJh9oql79dyF9GO+WNx7nf4wE=;
        b=FTiThTwYI8iYIaoOZ+9HxV2ajm/NiU5p4qrvaipzuLfpWfU78rBLVDD1aqmxGJuovS
         AYCiQREzg2cVXfg6cv1zjXdAJ3KkyLkfjzrQKs/DrFs7eCqb6ZssppLsLeZW7lR6E5We
         OOGcAZ5zNY6imQAGYYpycHSgp+VEBUacBCUbdUUYSWocbr6DRuqI7N3GtH+epXgUPDAU
         fGwmEhEFa8nKO3UF5Az8Wn+daFAthVndIyWLW5a9EtVntic3PSFrbu6Ry4Rk54qYH0mo
         /w2A6szmUrs/ReIi6/gGqQWnsn7qiWOMOVppF7janBA0MREthLUjRAcMOUlY4h9MV6OV
         s3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722323902; x=1722928702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk6LUBEjtLHTIduKacIJh9oql79dyF9GO+WNx7nf4wE=;
        b=vNE0nAgWFM7Gt/nxw5DoWc/eytOXK5sv0cpLXsL5DhnYtaInbIC/z5/vmte67tBpMg
         aRrlSM/6oApAYkaDyT/Hh2awNNFoUZ+eEIbiQPnHH7uZtyt9lt3cSyoLL/Nkr10rsjBx
         JbzWpvApfl5pI6D/AGWe1FIhY2140GDmBBgInOiuoz+/d0izbjdufmHb6b+HA3ND89rv
         Y3Ea17rYlVMYkqtVG1Obv1Onryg3w7rjyVtIpF93IkCXGCiWSjYEXuedIlgbOuqrR2Do
         tWTJ5e2NsvdJ4tEU5hGHyntyqHt6ZXTM2o3V2R4VmBDrGvrk/2b7bcWEefKk6dr5q6Ll
         SmoA==
X-Forwarded-Encrypted: i=1; AJvYcCUNF/Z3ZiZMgcRt809Y1ASwonXjlITp6vPkW8TB8eLxxB6qSUTf43mqLbGvwCOj3h3rhPE4BUDbeoxInbcKGAZGTZ0LHL4aO4cE1tCoYQ==
X-Gm-Message-State: AOJu0Yzxv1rZhUVOxLcxQT4ZJDne5JKDPE+hUmV6ZnK3inAMIMgeGvAo
	deoFKOvSrP9TP19qBq3ggZxJj4hxg2m/IwKZkqNvqQF8ByPwOc0e
X-Google-Smtp-Source: AGHT+IGmGRJKTI7i09idErMvGq6qRxMX69ng5CF0tGr/n/LAIqITHHgS+LvAQsIoWl8XEC+eqfHmYw==
X-Received: by 2002:a05:6808:bca:b0:3d5:600c:682 with SMTP id 5614622812f47-3db23a67592mr11868389b6e.13.1722323902089;
        Tue, 30 Jul 2024 00:18:22 -0700 (PDT)
Received: from 3a25d514abef.debconf24.debconf.org ([116.89.172.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9fa6987dasm7103703a12.86.2024.07.30.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:18:21 -0700 (PDT)
From: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: media: atomisp: remove trailing statement
Date: Tue, 30 Jul 2024 07:18:08 +0000
Message-Id: <20240730071808.35591-1-sskartheekadivi@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the following checkpatch.pl error..
ERROR: trailing statements should be on next line
#48: FILE: drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c:48:
+	if (!anr) return;

Signed-off-by: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
---
Just started contributing to the kernel. please help me understand my
mistakes if any.

 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 3f079c954..73364a65f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -45,7 +45,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.20.1

