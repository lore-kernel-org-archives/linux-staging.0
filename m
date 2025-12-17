Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD33557E6
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987208; cv=none; b=bcie5Byp9h4ISWX3mGkz1jklI9cT5VywT+G7+XWu/fZmUcwSwG+wl98ILtD8sWkfO733tV+PPbY1FmGeAENBadWV99LXfQT5UPM4+p7x4eNCcfQDntdIp1rgxu5O7lw8pLb8ExwRw7Ev0H05LjZ11GaE5b0s6pqKKanL8cak/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987208; c=relaxed/simple;
	bh=ljQDyrTpa0ZmvOyC7TmjxufAnyYQc9/vbLoWTvBj7js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1IPTw9egZsiOtPiQ2L/+TYUtoTHc2fQyvD03XZ7SnRcxFYQ9X7hFSk3I/wtybYRzvsq7KULZUHsqb04Hz3tNpQWvfvZgDNQrETG0l8uBF7FMrKcwdSNPeofVs94iTc8hk6+P2QGJUq5ILQ/Lb6GFuNGH63WiJbwrxxB0+DVYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKg2d5Vq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKg2d5Vq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso449932b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765987205; x=1766592005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW13KAFj4cAi5N45G6nU4ZVoIe0FU0YxEp8fJx1BwxE=;
        b=dKg2d5Vqrl+KYGa3kjG0a+ZgsK43N0HaTvQtyWaLRmtucj1wI1ZaENSDvxMv/tsThE
         Hurrz8G3+xTubwa3qXnf8S0zGW/neBd4iHNGzjBT7vK2LmFCS9jODxUADvqf+2g0VFyU
         FyfHsAd1/j+3BD2Fs5W3s6prIjZD/jgTJlM4R8zsYYWXpIdbYyKnZdnq3Bw0qCmIormU
         elPEks2n0eGOiRTaEOFNGNVJCzRLYif5muXwtas0uX4fOJXjxe8zd+Td+JPznhyTRp1D
         WQ3w2IU7LVJ89pfZlW7g9bH24O/0xLfjhCjIqX2cR+DWA552qnAvhIv2hP2pt22kS+lC
         dlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987205; x=1766592005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW13KAFj4cAi5N45G6nU4ZVoIe0FU0YxEp8fJx1BwxE=;
        b=t7RRjTJ3MwYOADZZLZRyDRtpzRvTf5dfywW3aytJ5uECFWhFZ322X5V+2wkW/2Of4J
         v7BwTpIJbKqT7iCf2P/VP6UeHuzltfQHGBUhJkcOdUHPs5YU2J/gL9bT1riipy2eewAK
         s6Nmr4Vm/sRcLOuLufzTD+VdeNbFCL27uT1or9VJvq60kaC8DTWhEjJoUAtYIujDZgRo
         5bxGlYXjH4UOFxFjWw+FlfQnkW+9GHXS0gfWntUOhiCuanRLiAZQkgkjhcOSo2K0/p8z
         mk33G5sxn1mXC1Us4ISDkFVHotQ4qm7gXgWYlShzgMeQYyhscp1V1/k/OpZtEK91/eVi
         T9rQ==
X-Gm-Message-State: AOJu0YzPFBJrwz3/rPkuIr6UMqQNuqL6FsQWarPikYsYWaRx2bUwqoXQ
	YnArpVYkZsdo7MfZpvMRvt0AiUcXZt6zqQP/z29RyB8CSfEsV7v4dvS0
X-Gm-Gg: AY/fxX7um3WHNH8rPKaDngKnaGAOkNMc/gigsk4m2cJ64VwrcN4VMxRptT5i7vUHBfm
	OwZ99xW2/8gZmHTNIR4/mtHT41+h2tq06dTusD2DqazDx1KyljStuTi56PYwh5yMvVjh/Y/uu51
	MEOXa/0dcGvkSEgKE5PF/1yPbWHTPtG7IN3AmCr5ozbx7EKoP4GnndyRoN7Bvh2y7lCDn6hT7jE
	WiL6+ff05QnDJOnjD6VccTTLzG8e8no86WgRai8Afg1Zngek9VnyTlmnxze6mUlVgkKBYBMok0e
	Cu4A6GZtLv2zJzspB/s+iXh7Zy2cLedcs0tCxGkLBdPY/SQO6aaX3Hms1ye33YCm/cCKXxfMWuo
	YB/ICe/B+jSQ06GkYamCvXZwHGOOpZZTxnhybph5ZochLK8Vf8dpxqKa30rSZbXxDPDOf3mK9Z3
	RWKID4PFeV
X-Google-Smtp-Source: AGHT+IH93QBYx8vliy8BWSIyKwJ7ry39Q8eZhzChdrTb4WCxTY9HvTxw9isXpGf47NSzZwNuNkjhag==
X-Received: by 2002:a05:6a20:7486:b0:35e:521b:f4a1 with SMTP id adf61e73a8af0-368594b7bcbmr22513675637.30.1765987204972;
        Wed, 17 Dec 2025 08:00:04 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5663dsm19493289a12.17.2025.12.17.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:00:03 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: coding style cleanup
Date: Wed, 17 Dec 2025 15:59:42 +0000
Message-ID: <20251217155944.9000-1-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces and else block in odm_CfoTracking.c

Changes in v4:
  - Include missing changelog

Changes in v3:
  - Clean up commit message

Changes in v2
  - Split the previous patch into two patches

Sanghyeon Lee (2):
  staging: rtl8723bs: remove unnecessary braces
  staging: rtl8723bs: remove unnecessary else block

 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.0

