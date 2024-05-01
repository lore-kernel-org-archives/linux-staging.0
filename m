Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9412FF86
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580795; cv=none; b=hzM/uhVJoDGH5WQ1G28STE+etoP0JRmMZHEuv5gAn8JFVHzeYiEvDMiEDA74r0BdkyDgC+PkJf7fhIGjafn6QvZkJ7jZQq7zCPcr92a411MrHq49Ghd0soTZ+iuu0ljZ0XMu5OcBrNwBQlcedh7RZrqzoszl27WgUmdsB6CasPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580795; c=relaxed/simple;
	bh=F9XWlYsdcvjUY25fJrjVOG6I20rFQt/83OfE3Wn2Lek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L+WYmCmkxz6kvxICK26D86xwfI5zrkVx40xiy6Q/WN8S0oJLNfoFS11Ossz2gxIKUD6Qf0DWL08gCrcPeEHfvmS7NwuuHFTPQjC0572dF5+rry5VLT7XgRVebtrffTG9pY4jF5PsZElwKYJGGFSdZqwVwqpPa68SOEflwDbNh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7JVaRPn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7JVaRPn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so6025334b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 01 May 2024 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714580793; x=1715185593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnUqkuMHAwnSWqNQgVi5Ycko5vgJVVqK0L4U2r54t4=;
        b=h7JVaRPnv/lvj4RaHyGMVr35TcIQWAZqYpkizh4USmhvhuqNUaOTeo9m7eId8fjAry
         8tVxzEgc5dVfu4PAtgwKRkkPR8fqBGC0TsNU2Z0P105iKVTHmcFLan+Sl9FQ+UagNitf
         lghMLr94icrYyHuKLMnRwOEvyuIMrPiXWyX30TB2JUgbV7cMRFtChf/cn5v/KIJPD6ik
         6Xv73boWRw0iKPgcpqgci4myo1IJVY+o+yU0PchssAJ2VOTsAHQu8oNu8cLBj18ijbXZ
         ZyMiJBQ6jF99N1aXt8K+sRvsB6AmQ1WriY87fj35QFi0AXudnGZ9IsKoCmmhX4PQkGy9
         DcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580793; x=1715185593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOnUqkuMHAwnSWqNQgVi5Ycko5vgJVVqK0L4U2r54t4=;
        b=rVDYq7u6m3Md5hkjZr1haj3Mo9E5e4HNma9F2Q0wnQEVBKUZaJqQtXDE2B8TIiIKdX
         Ad2Lnb9p7jT23BtlklrRxJLXWG3IJwRsy2twAIZjp9CbmcaVthPWzACTOHJaCUhj7ezk
         oriikIM5z9xagJZ4+9r6RVBQ6a9dL/957TaYZAVou3i/EqrD04j68TsMNtCIAlfBhhvB
         mF913CjPoEHh7lQzfw0GwDGecOw2JOT8pD3ULBaWxQ4FEnroBcDn30nMD/1kG3q9eWHD
         hCf+JkYDfNOZYOzZmHqxlxpGlChhUIIvcm9XcEoaL+ziZ9iakWW50xCcmD0OaaBx3x3A
         CQwg==
X-Forwarded-Encrypted: i=1; AJvYcCWCqjI5DsqopBAoAx6FmHA3CS6tN3hbirXzGhhmmBY+UKN187wF78ejeUn2cgKA3rGmJSGBu9FXbkKDWuPPfXDLiuQOpaNti6U6s6yLoQ==
X-Gm-Message-State: AOJu0Yyuhc0R+6tNIIhBKUdEqYvUdsWAsAGXB/I7TalZutBiIddKwfB5
	ZtjzptyGfMnRTyE5w9HNhx2fcDxgE0vByGRD6wdsfaOCgyVeZZBX
X-Google-Smtp-Source: AGHT+IHwKDw622ZbV1L1HorkBmhkCKboNerHmQ/mlSSn9JUfoO5O+Fa9naEaEBEeVTWaH+p4jTI4Wg==
X-Received: by 2002:a05:6a00:23d5:b0:6ed:4288:650a with SMTP id g21-20020a056a0023d500b006ed4288650amr2783147pfc.19.1714580793180;
        Wed, 01 May 2024 09:26:33 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id l26-20020a65681a000000b00606506a95bbsm11117806pgt.13.2024.05.01.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:26:32 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in sh_css_internal.h
Date: Wed,  1 May 2024 22:11:20 +0545
Message-Id: <20240501162620.86865-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled words still and member.
This patch fixes misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 2349eb4d3767..5395be1ed26b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -509,7 +509,7 @@ struct sh_css_sp_pipeline {
  * of the associated pipe. Dynamic means that the data address can
  * change with every (frame) iteration of the associated pipe
  *
- * s3a and dis are now also dynamic but (stil) handled separately
+ * s3a and dis are now also dynamic but (still) handled separately
  */
 #define SH_CSS_NUM_DYNAMIC_FRAME_IDS (3)
 
@@ -597,7 +597,7 @@ struct sh_css_sp_stage {
 
 /*
  * Time: 2012-07-19, 17:40.
- * Note: Add a new data memeber "debug" in "sh_css_sp_group". This
+ * Note: Add a new data member "debug" in "sh_css_sp_group". This
  * data member is used to pass the debugging command from the
  * Host to the SP.
  *
-- 
2.34.1

