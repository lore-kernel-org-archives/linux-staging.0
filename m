Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA255F555
	for <linux-staging@lists.linux.dev>; Sat, 10 Feb 2024 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707603329; cv=none; b=Y7ZbTiRtlKLZ9Sg0z89AC3iXz7auwDPZKL4EqdSjDG+jLUcxygdT98EdEm5l/Zq080SmvF9n7JZ6xh2DeGKHXZVbGWQqGFj653PJc7IMTWFXPBbPTd/BaJe/wcySAfWw1JNMB3d33muwruUOor0I4XBVOn+2ubLA5j/iC71a2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707603329; c=relaxed/simple;
	bh=BRBXjjTaaIg/lDsxVQno90HBFLswvVpFxmbOQLTe0Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVTCAZUB2gKiDPbCzCjtwwwStxC2pb6aioGeH/iN4fEDFc7SthzHQ2FjpKJrZkPV+RicHDo3mY9SyN1S+NwMJzorsFdKYu+RKD8jCXTQtPBuwUVI9D0jtafTUrKDG5VR47rpIHaXGs7x0XiCYikmw50Pi7/UbmXWpiRpwKufdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqKi1QSz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqKi1QSz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b2960ff60so1727482f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Feb 2024 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707603325; x=1708208125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3rm1Ms90qHIEjQmaGDGejHMu8DwmDql6WBGu2dQWVI=;
        b=YqKi1QSzjiu6eABMOM5YhoHCKhLHHt59Z26fuIZj2tnBwoipmmMw0QVpQEAvqZpkwv
         u5L5Lz+MKB+tPb5E2KZN5fHDKLFj/115/OO27bxtSd1don5RhwZou59m8lZhGitbRRos
         A9tsbBnQCZZzTPuSa0rG9PHgyCyVcVZWUkuV82qQXcfBtw7yeUevU5mLDSV0k5Ysy0hC
         ianByGwprdk7vdddDppO6fn/jnTKx7i75CPjQHrwgSunrXSbE7TgsPY3i+Po4hAtIoAs
         5DzH8D/sVA7yvRudBjru9KSX8Q/MEil9QNoHPrBH73HByqlRQSgEhQ2jKNAGwMDBQ8MF
         DsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707603325; x=1708208125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3rm1Ms90qHIEjQmaGDGejHMu8DwmDql6WBGu2dQWVI=;
        b=YC7V4hcZYKHqJ5STO2vp5YcK1zMfqMb9UHR/XjKIUQUdT15SlM2tDdV7oz9nuhblEm
         G5l3vPZ59JAgfMWAoehvAk7Bdcuvix3F0nk8ROq6m17glQVqw0DIR1ZhTxE89Xk2e+Uc
         3uDSgjLeDmuB1T0QYLdv+MhmYyAyUkoyVTGhhZDADX/snnRmPlJQmMw7UNY7mZRtxVYA
         zx0egPlubofm6gJ/QDBn2Eiw/WrQlpABhZ3uXKe02Ie+hCbLtxUDa8RyKpENqu9loYh1
         tlPgXq0vTu8jOxRZmreIOf5OsZ0KEmQufmnngULDlq2Wnew0sY9fy04YNuaGSZ2dylqQ
         23mw==
X-Gm-Message-State: AOJu0YwQq4VYhLE2JcmsuoWogXfoMjJHQQfs4h/W6myhD3ar1TZCQwQy
	4SouLyZ3FENGnIao4qRgHGpllyrQ6xlgt2P/g9arxcq0cY539NaT
X-Google-Smtp-Source: AGHT+IE0y+UCG4EdFJdQie7+RKChfwLRw3RuexFy6HM/rsWFm9N6XtTqLivyWTYUC7gXTGSRVK+0Sg==
X-Received: by 2002:a5d:54c5:0:b0:33b:6cf0:e33f with SMTP id x5-20020a5d54c5000000b0033b6cf0e33fmr2406246wrv.7.1707603325409;
        Sat, 10 Feb 2024 14:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAwifN8+ycN566trEq3a6K9iz8dhjkjXHR4SH46LU6vsERvjPqq/72+WrhyoNBvYThpNo46kNZ8WfAizqqVrOF58Li3XYA/gnbu5jWtVI0Nzr9DRlJScSsvAGydFqJ6FohMSc5MsQvKIOVLJx27jUBAozY9NpK/ojPJClZLYXm9ymSryVRlMfM8iLQ1xmxEHX8HSBMklNyzg7o3VOQ8N+zTKv7dodE1GL19O+sSNDvFDCekbqLGCgl6lhbCKJ4HHrZ3LbGZD5JOXZuQpC9/cBzKoOTo3CjBlOErvYgnCCNaPiSSzKqjxtrXGRrRCo4UOmFMvM9sj550xjH5vx6NjcibQ==
Received: from localhost.localdomain (cpc142640-benw12-2-0-cust620.16-2.cable.virginm.net. [82.0.14.109])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b0040fdb17e66csm4448843wms.4.2024.02.10.14.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 14:15:25 -0800 (PST)
From: Youssef Quaisse <yquaisse@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org
Cc: Youssef Quaisse <yquaisse@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] Fix three warnings when running `make htmldocs`
Date: Sat, 10 Feb 2024 22:14:38 +0000
Message-ID: <20240210221451.27769-1-yquaisse@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running `make htmldocs` generates warnings for file
drivers/staging/media/ipu3/include/uapi/intel-ipu3.h.

Fix was to remove the "excess" definitions.

Warnings in question:

```
./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2522: warning: Excess struct member 'reserved1' description in 'ipu3_uapi_acc_param'
./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2522: warning: Excess struct member 'reserved2' description in 'ipu3_uapi_acc_param'
./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2778: warning: Excess struct member '__acc_osys' description in 'ipu3_uapi_flags'
```

Signed-off-by: Youssef Quaisse <yquaisse@gmail.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..4aa2797f5e3c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
@@ -2724,7 +2722,6 @@ struct ipu3_uapi_obgrid_param {
  * @acc_ae: 0 = no update, 1 = update.
  * @acc_af: 0 = no update, 1 = update.
  * @acc_awb: 0 = no update, 1 = update.
- * @__acc_osys: 0 = no update, 1 = update.
  * @reserved3: Not used.
  * @lin_vmem_params: 0 = no update, 1 = update.
  * @tnr3_vmem_params: 0 = no update, 1 = update.
-- 
2.43.0

