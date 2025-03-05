Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A20250BE1
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190361; cv=none; b=JCpKIxpYZx0ckUaO8DbO+FvSdCYZUciVZYvmBocR4+6P/h+TZkMPkOvezc90SPvOqvyVzEbaXySekqpVgnmqAd3uXRMNxZRhuRyoVkZeQSywsMh9pkmG9ThZYNIQdHDsilCrmnKhZ4tS+iCVMgyJyuzbwKTx4dvpNIVomcNZEkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190361; c=relaxed/simple;
	bh=mKXMDFy7W/QItIFVlHkupMeSaaEcMfQ0VqQn/kjbiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gq0B/5auy0AtQpGoA9galyl2vkmKt6BYVmkAHlfEcfenSuUbHvojb9/q1uVFWHHofigxCNVr9QJ/3YRnlVxkF+UNvydhR9zEixazqlnCeesmc9dJ0z0DDiLKErt0FhkFWr9dDSeOOaDC3VW1APYObPZwRHE8NVJHW9OxDxy7yoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dx4oayBN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx4oayBN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2234bec7192so129422905ad.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 07:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741190359; x=1741795159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oiLVkJoOmKKWhZybYIihEffKcwMlU/S4KSLeOk4bur0=;
        b=Dx4oayBNhwzBmJAoGWoYqm59X7l2UWPqtzWAiEOgqiCfOgv+jr0aOqBC5JRAu3dajB
         UUjGTxf47CnrVkvRqmWj1T0yXoO7kjgSTJmIaKDRf3TVvZQu9u6PzKNzzw+/XcOYyVpR
         tV0v2OdCPnsTgygBkIpkoyz6JsP6WKu75nSnrPhzE8NFeXNWnC+Si1YO3m/mTjhtXxVe
         fLyC+RI688yy6Ahu0gqXMY3HaR9LY+PEgmO4B0eVjPVBDQjcXB2UOb1VN66F+vV+/mrM
         5NLpn8uapCoAGJEktBBlZwaAm47spDQm68uBbiwlclczJqgBH37UyJN8ZngIL6M+crU/
         hbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190359; x=1741795159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiLVkJoOmKKWhZybYIihEffKcwMlU/S4KSLeOk4bur0=;
        b=gWsKO7NFcJonOXIFNJ45fKtd4oe3A9iULOGxyeaaxfVUCqNxQVheqzxB3E+TJO8UY3
         mhLOnWYWepFUCGOHPneG+ZNtyde2QvVwFsMXIadJnS6EycId0RQ6Vugi3ot5b07P/JvK
         D8tXfsxe+bE6X8e672SrNrXoUbGRX+HgaixblCMLbvCC8Dl6XJ8uVIQxL7iYvsSWn53q
         acOz8vGXMo5KsVnWfYHlZ3yG1Nl41TA3iO8A9H7xdrEi2+aEUxvD1Xuls9RpJdaR70SJ
         mDwolfXk5UgIz4DtK5/qs2Zw1xE38K48RPenPOZMBG5IJDzx1uRK07PnzfEt2Z38FLvV
         ZgZg==
X-Forwarded-Encrypted: i=1; AJvYcCVYHCzlNyPjS25Ei0c4t7rOmoPn97i75W4cjIquxUfzECdaS39HwTZvgEFwsTSY1pbCoWz24rrEGzem/GqK@lists.linux.dev
X-Gm-Message-State: AOJu0YzZF93qnPmmYf41Xy0vuYNgqvM0Kp93UJXa/csAmyjvXQ73gYVM
	oir7AQnUnBJeR5FLQPtGoaI8GOOQqtYR0xS0nB2wQTaApDW92oty
X-Gm-Gg: ASbGncvUnul1EGVIukeB0OPG+nXzyo91F9TYftahxfAEE/GeIwhlHHDkYT8YtcbGj9C
	oqN0Lz9XL0R6BAfRqEfJILqapukBzChcmUT2H/mRrHIhLffyCvGJyy6VtCF1sK7b5w/sAtspFqQ
	pbxmYwa3Q+OkAaRFRpbMtBHbSgMFuZwo8E/YhzR0mR0g1QvxleyI3d8TRiEErpoz5Yf/hdg5QZZ
	7qRs2fIyTUksD0k24OV88dV3w8wkfUeUT9TM8wu8bz6MjAW1JOYj3NMECupiyYhq6aavRTHA+aP
	XLBlQgZjO2JWMzAqSL1SAQHZJcWaM/+8HQUQ9Y5KaVXWDWmtZgaY+zeZTLGjnnnNsLM=
X-Google-Smtp-Source: AGHT+IE5QI2Fa0yoMUE51s3cn5NK1Suq/GDtTYbEyUTc0cC3esYxqKH57yGIYTktDsZr0iSfMPyYSQ==
X-Received: by 2002:a17:902:ea10:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-223f1cf49f5mr55675635ad.37.1741190359134;
        Wed, 05 Mar 2025 07:59:19 -0800 (PST)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9d96sm114914245ad.54.2025.03.05.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:18 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lars@metafoo.d,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH 0/2] iio: accel: adis16203: cleanup and standardization
Date: Wed,  5 Mar 2025 20:59:10 +0530
Message-ID: <20250305155712.49833-2-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the adis16203 driver by using standard unit macros
and removing an unused spi_set_drvdata() call.

Siddharth Menon (2):
  iio: accel: adis16203: Use units.h macros for voltage values
  iio: accel: adis16203: Remove spi_set_drvdata()

 drivers/staging/iio/accel/adis16203.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.48.1

