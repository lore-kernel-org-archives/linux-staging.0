Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3FD17A586
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726681417; cv=none; b=iVD1npCq111REMkPfBUybGIEwh7CFOGzXddSPjAvniWo72dpiGgke3ZTR+5xAu61f81ntpiF4pUFDQxetv5m3eG1NXBCHY7w5JoffEFe9E/dPrcwWcfW9X1N+7X7YR2xUYU/22ThDeDvpX1nsTswQKfCI8Z7vwqUo3Twyn2n1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726681417; c=relaxed/simple;
	bh=HZWIUGqAdp5opNvUgcJZvRCFDfEnKj8ueoB3pKFPLrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBavdWrVtcz2hbA1/y8eV9lPqmBSoViw82L7Lt4b684EiVFTn/FO2VFnXQk4dNtpQFKgszfHlKo5Fv2/00Xa6+bywTn/68PGx0wDxBc3F3IiTEZqkjVGl92IZO+Ah4jVYupg8iP67mJ6GACLO77mUnYU7w9QP0mYgaLs2L73it4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHlsqGTl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHlsqGTl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so5249481a12.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 10:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726681415; x=1727286215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NewsmfFD9SNzAw5qXDFX6JZyu6pAwHI8ruQIxxu5ZnI=;
        b=UHlsqGTlfquRwKK3vVtWiK6Spj9P923BXddaPfVNqUPiplnUp329haXXmrdGp7KNZi
         ARRq2OmwldAS1K+DER7+I5Esrax04Tjgz2kQPlewgzgkTEzCx4SO593nsO9Khf6mpcBt
         ELHsz5gn3dp9nUb8OK3QAaaB+OWrzo9687ptuS7cMbWZRz2wAF21Xpm7w4KuesLeiFGy
         Kk4f/cHWHv188PGTpIyrSkUuMzra2D57s/EhQcGw4O6LjaO8FSoHiQz0Kxa0tMEa3v4W
         pyKJKKE9rbvONPvPNEJ0P3+YhC05koARiLDm6+YZGjv2yPoQAr9Gw6J9IbeVduQyFJGC
         ttHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726681415; x=1727286215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NewsmfFD9SNzAw5qXDFX6JZyu6pAwHI8ruQIxxu5ZnI=;
        b=H9AsNKF3Sq7TyuBpZ4TlU6Kg9YJCsmBnvxr1jcLY13EBiJG80Ut4oMLZqhYhYBDzt5
         6TQCeW10Fc2u0WLK3E8quVpbx2WHD4oHc5meo4Vk5Q8IfWjznLQfU4Dl45TuAt7s/PC5
         YcOYN+FFe9zYFysO5gi8Eao9icCXJbWqn58z+iOQSP/hMt5tU1ntgO/qo0svdN35cimt
         tIpCclnH1M3Y+dvwVjjKDUXWJvhy3Xa2C0Mx2FoT0Sp5JEPhOPAglhTPzKmbHY14gv71
         yxQsM5BRmBfT7D/GrZLaSRHca6AaA5E3jri1NoPHFw0hTPQ2fg1NnNhN5pLL6MAgthRA
         wtLw==
X-Forwarded-Encrypted: i=1; AJvYcCXa8ZcvK/Nlqrs4NfeMB6aSk6HlHl5QG4zfZlVmFGlmfZV8gc0yq7y2vLXzuteeglNZtkoFvPUvQX+N1lIX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs2M7jKLHD5MxzGKsXvsAMFrnm1F7KvQP5eqJvXb207+D6nk7L
	tW6LqiVCrPU8lRwQjVjEatNAG4393dIghz1iPbhIoqtl/eHcn/Jk
X-Google-Smtp-Source: AGHT+IECRx7460qtzCoGfGmJhASYc+z4HYaeEbdspR9sv/W2BaLtyUS1Y5CgEfGw8H9Agg+4qLz95g==
X-Received: by 2002:a05:6a21:3a85:b0:1cf:2a35:6d21 with SMTP id adf61e73a8af0-1cf764ae838mr36572984637.45.1726681414691;
        Wed, 18 Sep 2024 10:43:34 -0700 (PDT)
Received: from Hridesh-ArchLinux.domain.name ([59.92.195.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4fc846a4sm6286178a12.39.2024.09.18.10.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 10:43:34 -0700 (PDT)
From: Hridesh MG <hridesh699@gmail.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: iio: Fix alignment warning
Date: Wed, 18 Sep 2024 23:13:19 +0530
Message-ID: <20240918174320.614642-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 4ae1a7039418..d5544fc2fe98 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -628,9 +628,9 @@ static void ad5933_work(struct work_struct *work)
 		int scan_count = bitmap_weight(indio_dev->active_scan_mask,
 					       iio_get_masklength(indio_dev));
 		ret = ad5933_i2c_read(st->client,
-				test_bit(1, indio_dev->active_scan_mask) ?
-				AD5933_REG_REAL_DATA : AD5933_REG_IMAG_DATA,
-				scan_count * 2, (u8 *)buf);
+				      test_bit(1, indio_dev->active_scan_mask) ?
+				      AD5933_REG_REAL_DATA : AD5933_REG_IMAG_DATA,
+				      scan_count * 2, (u8 *)buf);
 		if (ret)
 			return;
 
-- 
2.46.0

