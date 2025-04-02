Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12B1EB39
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601810; cv=none; b=NzUhXfxATkd8Z1sr0UlK/bpddJU4s5o4JmZzcb+2jxbzbOKKVlRW8Lly730oCboi7JCvpMd8blElHBpw69RJkMOtMzRPpdT0RBOpKnSnhtIMsSnJPv9HlLwXdP+GwWaJcU4gbn61Ph16SzLZ/ULwWuTCYMostAix/OfMPWU1jQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601810; c=relaxed/simple;
	bh=khdQRjKa1cJsLk+at6y8zDWPs5nydHHfCistC3DVK/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4JG1B+h9e8VqS0MryLjXmeT/C6ibCvwvlfgFVhH4FTrU8u4LicRgKtc9A7SRuOVqC246plCzGGGW9KAMcRyp+y/Hna/HfBGylKxJqw3QnyaBTIO1yfgsFPVbN7jeUvG7cuGqEM7O1N66sccPWO96YBJ+g0beK/hWzp6EDq3LAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5ZoMLfX; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5ZoMLfX"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f94c2698so36680556d6.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601808; x=1744206608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpIRlo9dkfMDRtvBdGX/Xo5MPiwW/uzBzcuJlURA8sM=;
        b=O5ZoMLfX/Tp+dEzwt8hboZ9/R5Y+GCQOicMWaBPEWOiRG7PxtfdaRaatAvYXQRN7YP
         hrSwsaAZ4UQijiyB/TmeqY12uU7aZPbD0GRAMzA1JYzF2u86vYKu9rI2Kv4sDDDGXTvZ
         lTBz6LoW3gwAh/B1GWQvAX+PS01oHg2Xt10E3DRSAPUjEzUDoaAkDebMFHskcKvn6F60
         rVcv5+JNXDIGYunukdWiXTmXpjzqoYZ+cNnuORlKfGiLOJLQdAMoHJrEHzMBtl3IdErn
         3oaxtY4zVY35I8XoLxXJsYDbcafGb+b1nqZXypLusX0wLv51uAWyopdytsJkJTZ2lo5p
         jT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601808; x=1744206608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpIRlo9dkfMDRtvBdGX/Xo5MPiwW/uzBzcuJlURA8sM=;
        b=fusNaY7wbwCQqukCGEmwXOMQk9sbsEKISsNhfoUupFqFwp3HkFSvqeDv8Me1ehcCmi
         GHtjxJVGYUKcCZAhraHNmKRS0Qg0dFQQNU3g4XuaU1iKM1XUS1RHyeJXQUaabgWui84m
         6whkxo3bTTuBRCuwvU10O5f5DC7NiOUiQ4mLR68OBJ/+CPf0K4tiGJ6epkua9v9ZztsU
         b6Tdm2hao9x/ckMiAJB+kU7sXdLS5MlP87JYwf8ZwPDsMPOKW27oVjkHbnet3jRuzd+q
         hrGG5F/TSmayfsDgqNAeNx5nR6JMAwsxIEN+gyqpe5L4kBfZ2C+5esNL81sPlMXRL58b
         NdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcs41Tf2waWAm+XEuELhc+bAoBiPvD1i2ClO2bpSTJlm/xMfu+5YY0tozGB5/FE7xp6+PwuwyMRIxjd3Pr@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt+8NyJFLECSoHdvIYOoPn2xvFXhXW7BgSz5VOMiB6oG+hnnE1
	QCTgVkcdqYumbKb1Yu/li39am4JZ9l7ADBOZDrs82JLGRVOKHsbg
X-Gm-Gg: ASbGncsbF8179SJtOBA8lOJSqkWM2Dx+cFjeeFfby9DHY09pZThfILY3Qfa2ELSDxbV
	Ni9elWSfQSk2oSh4NSdHBmZeULQiSvSnXB5l3spdmyWG8glASweRyFioovjU3fw7T59l58+vixm
	doxWlKx80F+8uRVeSxweiV/lOV9CWjUpJzZzH5uOb8uC9DOLq4Fe0F5QqBs3ocLDglKCynRwiu4
	fbXMKa8Fm/J4oFZBZXeD1gT3XSxGKi1ypBqwO5JXb5G5/40qAucPmRFdbEA0RCNByabzrXhXgNr
	3WX9NBrWKeeOO+PH/fH9Xe8kH7qXNyw/Bitg+Ewvr41NWBxqRXU8cwUEU9wCO/67BWlRTpaq/z9
	pLia/ATR19AwdHzskFitsY1Q=
X-Google-Smtp-Source: AGHT+IGO8ahOi/G3jO/2cQgbGPiOCEtcsk4bHdTRa6rUhoN3n0aVnWghLd31gahPKyxhXN71T2kuCw==
X-Received: by 2002:a05:6214:dab:b0:6e8:f88f:b96b with SMTP id 6a1803df08f44-6eed5f616e6mr292528906d6.9.1743601807617;
        Wed, 02 Apr 2025 06:50:07 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97bc7besm74799826d6.122.2025.04.02.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:50:07 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gshahrouzi@gmail.com
Subject: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
Date: Wed,  2 Apr 2025 09:50:01 -0400
Message-ID: <20250402135001.12475-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with tab to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0

