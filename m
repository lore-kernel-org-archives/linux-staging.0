Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49F21B1AB
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796994; cv=none; b=OBHHfjKotUhhoRShejzmG6pBSLz3OPXhmZCdug3ZptwT/qC89JYCgAyuEizr894WMlpV1ue9l+fHI7YGOhJrqBfjGgYTRyAW7kx7U4gzgcTtSBOLJ4sLfyG7Y5cOkiLmxu/Qf5BloaXa3qhJXd3hfzpbjdEpJ1FlnTIJSgCTdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796994; c=relaxed/simple;
	bh=0Lsx/C4UCcCrKw05NcJnCPZjnOR7o1gKd5NLSlEnz4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIVRRZ3xGdLARRpQcS/l47R4O/40Lq7oOVWrnYXPuGk6SwpDgf+7RYuKjZe6esCO3bvwaU4Ks6TSWqe45l63+dyhHcKQfsiIqjVi/2izE8m3HFunDXVdMT5A0ipg6VavKlSluGpIql6D1gv6EwJuJv6CFYG3Lrh88AJLFw4CrjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTyMKNvI; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTyMKNvI"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-219f8263ae0so75935885ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 04:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739796992; x=1740401792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DhXYHMceaATkeZwBak3g2eCtVGrZxSSMr61b+pgDgh4=;
        b=VTyMKNvIbXJ4JZmwRmg2chA0piczNJdwEmuaPrwxoGaGRD+WWKRaIAOWcFuvlE/1wl
         HKzgf//zsmqK64P5NkUuFWN6UotmOL5LYvEw3Eiri/KSaWnKgsuNHR37FOYtCsHU9d9Z
         QhQhU9Y0nniWDe98F0PLGd5zBgcNkTpwF8jEpZ5tUCqJxuy8zZZ2l9hMduc+SE6xHwlx
         iGRJw4/f6+2Z4F84f0+bt/A4+CHUQdELqfHHpv81FoFDfgV0kCKqpt0Bu2CnP2E/EnCy
         81e7Buh5WTsPUBdPiAS57yO7JKPgkZuIHs2XD2hpRHS0rrD35/Iyf/x+AAVPCw7ernNL
         NT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796992; x=1740401792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhXYHMceaATkeZwBak3g2eCtVGrZxSSMr61b+pgDgh4=;
        b=pnBtguC+jAZg4SLkGZNSxer/t6HWT/VdYOB2wWD2aAPfrcNzo0gSjE4LABW9P4CNU6
         6vOW6JrnzRZKjIseJDss+IaiApKayNGTO0pcbJUOtou++u6OlClO7ZRovaADVna8vFEs
         bvy/31xFFwA1komu2ku+b9Ja4FN5XxVLJjQgiY+/wSHVfSC7QEwKHsWKHrbQUPTfUIv9
         jW2zGWmfAOAN3bk0ncBzBSc6Micrppf1sEAV49+0CXCLA8Eg3GvSddAPtBfQzfUtfpKP
         xRsOMijfVIpLd9rObEKD3mKAsdcqehgJ4nEyI4DVS+l0P5gPiiDdOMwaeFT1I3xiHbwc
         x8eg==
X-Forwarded-Encrypted: i=1; AJvYcCXijXLmB+6ndytom47klw7jsc/zJPgg/C/BY4hMUKHhNDD2CwY05cwP/MWXcER5euxl169HAe4Zfsf1u/Eh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp1A8pEEYED8+jWf1asRy2/6ROqLiZiYTErF1dUyloxQtTrqYj
	Z2Qhw3MqmRcvJn5DGq8r5gCn3ZUwxnHk7lSNlxhswz9AgnK8UZ8e
X-Gm-Gg: ASbGncvGZKHlO/FNYjckfVtntaRB6dVieXNCqTdJ7dx8tJolcBo6vgx6ch676+wkW+Y
	JyQZY74SGHzH91bLXUUXevVCiLVRTmcPIq2uuW9xKSuxb/VXB8osVWmTYGsRVzd7wFfOraSy4CI
	QGEz/M2GEU16/N12YqHZFcmjpVGdwF2uIa23HcIPR3c2Rj8HUsAg7boVH4CWX4NhLTRFmxWnCZA
	aHlVrhCwa31RETG/Fkd2tjh/KkZ4I3SoaPCuk7qW/sSjEXgcMLCEwaKx8BonruHJE4p0bOcYe7U
	i5OMP+NjKBMvURWkG9rC
X-Google-Smtp-Source: AGHT+IH4mg/5JQuKZpcZB/tPTXHHc/VOc8GskFvFYoZ+313+CE9jE/meeMS0IG9GKD66TlKAQgifng==
X-Received: by 2002:a05:6a20:734c:b0:1ee:7ea6:8e0c with SMTP id adf61e73a8af0-1ee8cac55c9mr20369896637.8.1739796990719;
        Mon, 17 Feb 2025 04:56:30 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-adcd481d902sm4706160a12.21.2025.02.17.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 04:56:30 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	kuba@kernel.org,
	rmk+kernel@armlinux.org.uk,
	broonie@kernel.org
Cc: arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 0/2] staging:gpib: Fix error message formatting and adjust memory allocation style
Date: Mon, 17 Feb 2025 18:26:15 +0530
Message-ID: <cover.1739794938.git.kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

This patch series includes two minor improvements:
1. Updates the error message format for invalid base I/O addresses to use hexadecimal notation.
2. Changes the memory allocation style for `private_data` to use pointer dereference rather than hardcoding the struct type.
   which is perfered by checkpatch.

Ravi Kumar Kairi (2):
  staging:gpib:hp_82335: Fix error message format for invalid base IO
    address
  staging:glib:hp_82335: Refactor kzalloc size calculation to use
    pointer dereference

 drivers/staging/gpib/hp_82335/hp82335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

