Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E78C1925BC
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669206; cv=none; b=HSgcokbxne4TP5eqzf/zK+JaXKSAT7nRSUXBZoOqH72DSG9THOaVQC7RKeumAwhFH0a01qwJVSWnTWAYcf/Zd6F2x/J0KUwFBK3HkovvHkvqBjZU01t6oFsShQvJQl5OZZssb0bWNqXIPNF6NDze/9vAopULt+WMy0pC07lQErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669206; c=relaxed/simple;
	bh=V4P0B2EgUQLw86NKiUCzY+oZ2ZLOhwnaId7lph2qPcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlWwkXWgQBc7c2ZrIkfYnurzFwLXwIzOOmnC+jkTC3OQO0HsIOkeDWkVzu2UCm4loQVeoginFlayS1jOunpqIokfDJhTOVmQPMU3b/Jzg98AU+P1/9NPNrNkWg9e/26QtD4dqcs2vURhyemBV1QzHnhvWCybNHJ987Jlnsw6iAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNYqG6vy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNYqG6vy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso29374835e9.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669203; x=1731274003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHXAdcTsvT4B5g/S/kETasZjOIWl5qfipOtLsGqLhtk=;
        b=cNYqG6vyvawrWejv0RPoulINEWLqNFVJqI1Vp7kw6dDLVGNp2G7lipEBLSoXOjBVdI
         kUHjaoMRDF2uXZWIlkWqleliDV+guzzT/EpfLfUkHW4FxOB8q8enZubPMqL15WCijA5A
         EIhU0NuUjqGBmFQv4T3a53w8BDFutdVatPHWMdM8QBNznAJqFeuKotr3uB54eX9f3DnJ
         hyPhjKOF8oLLu//NprGdXcflwmlerimExZo/fx1Ej/FE3q7gSiMEzi78VWHqjgqsOnG3
         ybl8dX2xrf6ME1SUvFF4/DZ9He21WP4QhLpQ6wowS7e9N+ex380rO/jLhg/WrDrTBUPg
         sh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669203; x=1731274003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHXAdcTsvT4B5g/S/kETasZjOIWl5qfipOtLsGqLhtk=;
        b=eXMDfICnNvvoUD0jquENruSZoG1szWuzsrYgDKBuUkNBWnzELO5Qrbrc24Dy+uBHGO
         ZwjwNPuZXNyVWnsbcSCxz/OFU+w3eDROE2TMgiYhPNNx3pJgF8i1S3PS9caQdvk+eSO9
         jTnpig8nSoS23SOZQd2HijKB5iPnF1HWYxnDMkuApu2Tb2HqMchzk2Fz2UebWvCkMOM3
         SZHVOTPYF5WEOO6hSYyv/QSgbEO+0QXIOaRu/WIcO9UODiGMvEgDn4rOm1xFmSzH/f6Q
         jZt+lwMhR1xodaTprZ6WXbEDVpWwL6Gmt8xBrn53xnIFyiKFOwRW/4ApTyoo/KcJW32S
         p9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNngMkQ5d6H3DqVGY91AirhQMVF+Uqqc/USFsNVx83vU9V/axWPyIzc5LlPMHBRL8oAa021TchNneg8+45@lists.linux.dev
X-Gm-Message-State: AOJu0YwaljfVvaqpDfjcR5SQcQKO0wTppqSC0j1LyRBIh/kynXLm2ey0
	r9/qbSJOZXu7/Y8bNusX6J116KxZcxjOgPSN2baEFAQQ7JSRvlof
X-Google-Smtp-Source: AGHT+IFMGDx9DOAYBdrUFd8VOS4PJJ1EbDKfLHz3JNBUH9jucFE0Ec58+yoNuW2fUZV+sMk/RYEniA==
X-Received: by 2002:a05:600c:3c8c:b0:431:4fa0:2e0b with SMTP id 5b1f17b1804b1-4319ad146b1mr241501305e9.28.1730669203384;
        Sun, 03 Nov 2024 13:26:43 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:42 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 10/11] staging: gpib: Re-order the lookup tables
Date: Sun,  3 Nov 2024 22:26:16 +0100
Message-ID: <20241103212617.13076-11-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-order the tables so that the bcm27xx table is used first
as these devices are more popular and numerous than the older ones.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 78032af5061c..a2d562cbd65b 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -202,7 +202,7 @@ int gpios_vector[] = {
 
 /* Lookup table for general GPIOs */
 
-static struct gpiod_lookup_table gpib_gpio_table_0 = {
+static struct gpiod_lookup_table gpib_gpio_table_1 = {
 	// for bcm2835/6
 	.dev_id = "",	 // device id of board device
 	.table = {
@@ -232,7 +232,7 @@ static struct gpiod_lookup_table gpib_gpio_table_0 = {
 	},
 };
 
-static struct gpiod_lookup_table gpib_gpio_table_2 = {
+static struct gpiod_lookup_table gpib_gpio_table_0 = {
 	.dev_id = "",	 // device id of board device
 	.table = {
 		// for bcm27xx based pis (b b+ 2b 3b 3b+ 4 5)
@@ -264,7 +264,7 @@ static struct gpiod_lookup_table gpib_gpio_table_2 = {
 
 static struct gpiod_lookup_table *lookup_tables[] = {
 	&gpib_gpio_table_0,
-	&gpib_gpio_table_2,
+	&gpib_gpio_table_1,
 	0
 };
 
-- 
2.46.2

