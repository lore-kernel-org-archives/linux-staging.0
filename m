Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5E3594E
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637089; cv=none; b=DYNJ3REHUFbSJmh2g80OeBJotc4lCTPJg0yg7HvMbCYVsOQgMkN/wKZqVIJpX+Uyw1YKMSiAX6rvfOwyYGBcyC5PXPFgtIvx7GHb2wj80T8Opre8D7e7gzRJFfPoLmOzuDZXbsloqqXd57mIbJ0agl6pi1t2mDXEli2dA0OHEug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637089; c=relaxed/simple;
	bh=+FniijdGolTRpZ5tcmQ7r/3Xic0q+dOZ3BWLQ9qmRBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TzHuUAEMQ12cfHgnd3GEVeobvY3XPbUMYtPt3lbHCgYZ4YtKYtiRwzQrI5FTYrO5gJEC6eucoigQ/1QEFzChZTdSYS8wZNaSZ7p1r5Zw60lm3rPdIVVskO6HMQPB6naDRBa6BOhnuBJmO04ml967wKAVoi/3JTM3v74vmbztiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeWNpXHD; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeWNpXHD"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2eff5d1c7efso3897466fac.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752637087; x=1753241887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntZePFMmfycEIZ9kKC9D9juc8cWq8Pnx1EdDdBe+348=;
        b=WeWNpXHDnW577bd33tDy5n3ljshR5sDcXoWr2irUNYk2N43I2Q0u7Z5gqmev1zpZrZ
         ttxrbxHJg6QUkQUXQhLEtMyClDmM7SIy5F37VijEEmVTsplULGkLuFOhl7WPZxVkPsq2
         /F9cD3awjG0wl+/RiWe+b8HDOIhB+L+KeBb43rZ7+78aAuivOwdoYQTbgZFqTbjLAPcG
         +c4RA6/uAHijm//aCeOynZXDcX7fGMvzowNdtctWhuZ9oOxo4wy2tRaXGXPntdW8lqE/
         G/0AQwBevemYa2X7iaIkW7s9ZIiM4AlA0s8IPOaFyVr0kdn5hOIxuzXQdqYlGiguqiqZ
         dw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637087; x=1753241887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntZePFMmfycEIZ9kKC9D9juc8cWq8Pnx1EdDdBe+348=;
        b=tW5MyXz1kLkPaIVyBCxoJY1tAPbkbueQB0rWB7I5s6S8V3Li6ImWeRzL9OZhfE69nU
         Yn4+13hxWRpQUDODWj+Ick+YN9C+pqW+NQcYOPC2KeHerfMRkAMW5Z/UxDR0SiuApmWe
         rN6JltbnEGJNEOFMwTSAE7Uomb6QApA2dijzrNbe9j5vh4i2Sx8D4xU3l9/ohsDUqRFp
         Ri/hmPmUME6e6KTHPgjTW3At2RPip55DqgGOKvaH5tsF1l2KHXv8SNdZtXZhl58osguV
         dz/HaHAL3wUQKsiw9bxCP8puv1w1UQd7jg7xSC5YqEWsLRZDbdwhM1GzSqzC9gSjbbDy
         xUgw==
X-Gm-Message-State: AOJu0YzCXG1EvrUm5DwERPNaXtKoR+ZvccFaclsm+Dc6hzwGA/Vz6Oo8
	ghnrGVMeMu0uhV7NuRKtcbbQrXlj4c5UUPpEbYQ/+E955Kper+2yptbWMT2YSnTX
X-Gm-Gg: ASbGncva3Jk86GBQcAeyYUXOe7HVAr7yfEfd8iW2FBGGqJQX020ATyDDd9i5ULjmWEy
	GsPLh8qRBT4TCVZwZwl+Zqo3RBG1sCg05Wpi8HWY+thh0DWhRKSmR8xmjJFC078b7+/4rown2j9
	3NgZ5BvR+qhp39ZkTUUSPv6bbqOs6kFCazHus7csthewXBoqf2zgx0BweXKQi5cNLPTgPS9qW7m
	T7GmV5JljQGtu9c79eNWkFclEeN9QjjT7lX/PSB1Kh5CofKVulrGWpcMUNuBOqKm8jALupvuESm
	bq7cBUA1hMYP+oeTYfF/UTu+gEuMxV1SmjOY89Nt2Gz2c84LfPZB0Hp/EA5hhGVfzZU29sSIsvI
	i7v9pKLG7MlumVpZtyOHqnzOADUwLDJAAHcr67WZLxhq43pwGfPE+
X-Google-Smtp-Source: AGHT+IFoytJfvWvzcNOgoGowJg3xnSsJh6cfYIbKbpf+p6E+SdtGYl4YQM5aoodeCH7BzoE5xfF7vg==
X-Received: by 2002:a05:6871:890d:b0:2d6:72a4:4c24 with SMTP id 586e51a60fabf-2ffb24b1392mr1085689fac.32.1752637087613;
        Tue, 15 Jul 2025 20:38:07 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d22easm3140980fac.33.2025.07.15.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 20:38:07 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: sm750fb: Fix checkpatch warnings
Date: Tue, 15 Jul 2025 23:38:01 -0400
Message-Id: <20250716033804.59650-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Split single patch into 3 separate patches as requested by Dan Carpenter
 - Each patch now addresses a single type of warning
 - Ensured patches compile independently

This patch series fixes checkpatch warnings in sm750fb driver.

The patches address:
1. const declaration for g_fbmode array
2. function parameter alignment
3. CamelCase variable naming

Ignacio Peña (3):
  staging: sm750fb: Fix const declaration for g_fbmode array
  staging: sm750fb: Fix function parameter alignment  
  staging: sm750fb: Fix CamelCase variable naming

 drivers/staging/sm750fb/sm750.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

-- 
2.39.5 (Apple Git-154)
