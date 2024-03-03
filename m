Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D159B6D
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709475786; cv=none; b=jUI56/qJyeYhZvATY9VPXJrMY9Skq5AKFv9qhcagC3uk0Zgk22gx89AaimfdEtq/asvnfBfS6tshRQFxNmDoyDgSV2dkEd5sCjiidWqcOn5c/ECIhzF6gSlE0sPQ+LIA5mZvjIomvywbi5fZg40/WDM3bZ/WW6j0Qiql2bYtyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709475786; c=relaxed/simple;
	bh=t5jBL7YflSrKd4hHS9yTmYvU8CNC76z53TMa+27R98M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GWGJK/JtHwE/DZ3n9bJUNM6ORnzv0UyKWZ/+jQ8PNNJLM0se7yw5PZhaLX7QfXvOO35WJ7gsrGnEgO4QWaddNuSUwOj4R7IkCHpX/o0WS371aVwyWEmmHYFF6i5Ezw0HnwMRI8sbDdRa3oNSX+d5R/y2y4cHXQ1d0jT6d7dyY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp4T+kKz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp4T+kKz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d7232dcb3eso26215405ad.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 06:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709475785; x=1710080585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Id6mziPFV2Bo5BUrdfcO2e1rBc0/eRCQTm2X30V/Jlg=;
        b=mp4T+kKznPSVVgmrlMkMkhqYHOjIU8Pkl0ob1aA9PaTKgUBDKlpKFFw/qg/+HqYHvw
         5kq8XcJqUFrPceMygwcaof3nGnn+ho5d0eNL7z0jKpn/6SrvqO4qzWRDf/zGEaDstBJH
         4gYYgikG+fG6WydRBZYYwRrfPaMEeB2aDjCM5ci6p3GvzJItN46Ex8eh9It1/fmGE2xp
         iBXX2R4RcBHtUZ49iTGQ9ZJajQgRTNV/wTI8GPWa67XSSnoWlVvkdcVIi+rp3DWC+DY8
         E73BtLhRZd5tkrz+GAHf1vwMHCuuUg7ub4FYDzZc1wjzepYRncDsMtIkVWTYn93bDQnw
         ZdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709475785; x=1710080585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id6mziPFV2Bo5BUrdfcO2e1rBc0/eRCQTm2X30V/Jlg=;
        b=Qsu7Hh7VkxbA49dnIwoylUi5x7C/fn9sxewTJSTpKiorZVCa3TxxkCUYukzWLJywLP
         6kIVQjuIPYwUwxfsq53HGtLZLpuh3sZiPL6dXxvTO2SonQGJKb7EFoHZ5TUwoUVfZ6Ep
         RxQ/pjm6HteMHeKk306AF1QfN10jawM5J5dPvmg7siNywMjEYpUpFmEJ3xL+GRuehAAY
         yGIhrB5K58Tm4RN+sGgnC+eR2MvWn/9MYVaxgUHIaKgD+8MtOR58jzd1BFRf0ZkO/g/n
         eY8aw64524+DasLG/7ArU+pTG1wN/vodB+CaUZZZyANFG/SsF91JZ8PoAsUNCldoCaQ8
         dypw==
X-Forwarded-Encrypted: i=1; AJvYcCVsVh8eMwc+uVSwbZ+FcLI3PrEXPaLz6r5bm6mgeyDGbzPWXI2gpNzUbeRzxwnuHn5pLsTKFhFrrleX4mGxo/M9cyRLxeK51Sb442QiWQ==
X-Gm-Message-State: AOJu0Yyi9BHCU1otkBC2HttBb2kcJ3lyTpp1jEGNjk4bGEoUlhAlgVmC
	VTI41MmMZ7jv3uzHRmzuFxC+//1EYQ0CWXZesISJ6IN3acrkpIxr
X-Google-Smtp-Source: AGHT+IHF0b3I75HECWEIPvqQ7CoeEGnCAZrJspkLyufByz0tVoA6esIOGEVF7CdXptYj8dXiRWipYg==
X-Received: by 2002:a17:902:d488:b0:1dc:c17d:6edd with SMTP id c8-20020a170902d48800b001dcc17d6eddmr7572433plg.20.1709475784790;
        Sun, 03 Mar 2024 06:23:04 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:98b4:6d91:d5f4:8f27])
        by smtp.gmail.com with ESMTPSA id l1-20020a170903244100b001dc95f56848sm6697305pls.92.2024.03.03.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 06:23:04 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Removed __acc_osys field description to prevent kernel doc warning
Date: Sun,  3 Mar 2024 19:52:58 +0530
Message-Id: <20240303142258.6590-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2778: warning: Excess struct member '__acc_osys' description in 'ipu3_uapi_flags'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index 926fcf84e33c..4aa2797f5e3c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2722,7 +2722,6 @@ struct ipu3_uapi_obgrid_param {
  * @acc_ae: 0 = no update, 1 = update.
  * @acc_af: 0 = no update, 1 = update.
  * @acc_awb: 0 = no update, 1 = update.
- * @__acc_osys: 0 = no update, 1 = update.
  * @reserved3: Not used.
  * @lin_vmem_params: 0 = no update, 1 = update.
  * @tnr3_vmem_params: 0 = no update, 1 = update.
-- 
2.34.1

