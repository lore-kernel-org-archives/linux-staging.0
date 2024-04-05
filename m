Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA213C816
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302816; cv=none; b=fbTKYLcE4lwM5e9VF57j05qrM4v0OYZZL2GIx0oSxYJi+93W2zimyRRsiziFnnIAVFNrkB70C8evSBZMTaH0L5ENkCGX818K++VBb1GfrapAAn0dU0yN8a+bzndPg3I5HP/XYHLiU72WtbdWXtYWaGPNHy8AMXsqMS9JfBpP0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302816; c=relaxed/simple;
	bh=jK+AFaPuB4QJkOlQSpapYzjziTfiCfCCfo7UWLC+ajY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=se7XvGCY854zT/fXf/tomr7bFNfcfsxtnfC6zOcYcLK9Fp/Yb8hPVITrIKaS8vnqoXzU177OrywTVY1qIUqvl4rsU8Lk4f5WekHyPE6NBMND5tsrYRfM79cLGsjJv0q+IylkkAvY5ZMd0uPP8fKZSBpWLpHZs9rgLO9Mpo3V/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPzUmHME; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPzUmHME"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4162f7ea50cso2518105e9.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302813; x=1712907613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=EPzUmHMEfrFjVuNhZkxYRu/0KFC86bWIFVxMdUGkcor7jUS220xQt10sWdvgmXMd50
         wexy3u+SMybowhhmkDDpAfi5uIyn9scUGSCIx2BfiZrzRlhYdcWlsHvx6gZMXtyIr3QO
         NUcXJxt+K+qOKNyOaej11Q455JPFK+w/2Moit50cuBrAbChz+B5Fs8FZ2QsIxNU7AHRu
         rm+PfiHPT4Ao6YVDs8Yw3CSqdbRT/0BlwM8rSgNtODXwTV2NQnN+g1lasPRo4NOdJ5EX
         BSQuMMKjjZCciQuMKF0PGePBriHHP+Pl3cr0coeSykTDmQYRvpk+GwxR43e1YuSmAJec
         QNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302813; x=1712907613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=AQgoYl/GNu9OAtfsDz/zDCK6IjEif5b8or0VEjMrR/NJwXmxYJgJUVmv3B0Fy+LU/T
         u440h5GQO3p+SOquIat3GcBRgQ8bkg9T7Q/dGZta4uREn/HVyq4gjLYA7tvZM0o1bdFE
         VCXkh9IoIx9SHK1SfgjLeXkWqQ2UHbgV5ABc+lBmeBj6pSZlqbzAaJm8kjyODRn4TfIR
         tDoHSTuCdaRLWXAer/DZmMIG4kcrFz9hy1SemZUwuScL0mEQ8G1aKq7GpwdAz0fHacWo
         s7zIbenAoLruSCavF4WRlAWFIfKDUfhTX9i2cm39Lqy7tWMWqgbPXu/CHIeInMp9FIMS
         K4Jg==
X-Gm-Message-State: AOJu0Yxi1jKqUIPiH3HOf3J3coad6bWOwkEJq0rLnLpXIHzwtsPJ+AIn
	a6mhScJ1nmN+rkRg7z3ZpowJZFq6/AmxmEpPh6ts+CLLNcgNBn3R
X-Google-Smtp-Source: AGHT+IGA6WB5h1Vgmp1Wazyi22zgCR/Dq8OWifgDgcuzQPoRI0/Ng2ajPekvSxYAfohaQEbeAsQE9w==
X-Received: by 2002:a5d:4684:0:b0:343:b252:2222 with SMTP id u4-20020a5d4684000000b00343b2522222mr472681wrq.6.1712302813154;
        Fri, 05 Apr 2024 00:40:13 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:12 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] staging: pi433: Replace pi433_receive param void type to struct pi433_device.
Date: Fri,  5 Apr 2024 10:39:56 +0300
Message-Id: <20240405074000.3481217-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405074000.3481217-1-ikobh7@gmail.com>
References: <20240405074000.3481217-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pi433_receive is only called once.
It immediately assigns the data param to a struct pi433_device.
Rename param name to pi433.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 7efe6b8501e3..208c0c6d3649 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -409,9 +409,8 @@ static int pi433_start_rx(struct pi433_device *pi433)
 
 /*-------------------------------------------------------------------------*/
 
-static int pi433_receive(void *data)
+static int pi433_receive(struct pi433_device *pi433)
 {
-	struct pi433_device *pi433 = data;
 	struct spi_device *spi = pi433->spi;
 	int bytes_to_read, bytes_total;
 	int retval;
-- 
2.34.1

