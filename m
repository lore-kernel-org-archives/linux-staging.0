Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C61CEE90
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742641; cv=none; b=oi4fvBWrU7Qr4FP+3Bk6kdlwssQBii2BIkhOAtSDatIZYEubK4eIMCFjq2as8z3hVV6U2prn3GahB6Zd0v+zR4nXI+XsmU7zVi5XSTt0KCP503fTJKX5d31Yd+JyUXwkMQWCL9g1DQA55PqEIWmnD+cKCgNHnYN4wRs3xPMBkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742641; c=relaxed/simple;
	bh=23ngUTksLpTkGw0aoSlNw3ryYZyvaCsuu0KwcDUyKbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPlH6z9hl9N0hPiRJKSBM1aqdgygeaIZsRpqLxySEC7GKjYcBml3v4qcOYrfL1D0KA0IGJkzzQPL2/vt/tMm8MJk5PDNC9j6DCSUOupKmLhmq/dgdvBWZG6lyKGokUXX+zjQEvNDrCaJp9F+jfWE8w/agVMC0KI5kfayaWMKZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYHLJ1wL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYHLJ1wL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d41894a32so2551650f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742637; x=1731347437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bZW2vMqumbONmM6bkNUy1UefcqeQAO43C3ir03Pf+8=;
        b=iYHLJ1wLMne5U5+Y1nEYHgdIWTlxZ/iKHzuLqMUs81lAxY+M1Z534lsQstFzkBSXaW
         i3NuVjV1T6Hz6hX8QUX0IowIj6cVoGYr+tmKXz4TxPgcW8olx+7y39ctIfUZUkd7UNhW
         80eEHxAbGj2yHb8Ox+vOli/soHQmsseUmkUE8ih57ZvGJOhRkogt52RMciUszBLzZPT/
         v7kUUzyuWnhIoOxgRlPfeEY5PmiK5jjcbHvzAJOAGwfqG33Vei9uUzxMvD6gy30uIo2n
         dBHJnagu09b9/1Nz1TVEdFKCJRmW6mrUAq7aUcIeYW6YnBLBpC5Kmr3kFx1fTqjAZbpK
         bp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742637; x=1731347437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bZW2vMqumbONmM6bkNUy1UefcqeQAO43C3ir03Pf+8=;
        b=CsGOCvEzad4b/Mb6k6Te8/oZXjaDmYR0/VO/ZuIQjWIUQtTYLNeK/6MOiphLnLS/Ft
         c1Z85S3+dubWta5eghm230VGb86vloIgE2uyueT9n+kM3vKGUIve1uvR+Tx8ZIaTHWJn
         1zDTN0ktNlfUGal/P3Z1K6AZzRyjlVdzvpox+glY9p2sXqZkPwajTGDa2ZlO0L3j7kDN
         sPv/tFXoNv5vZwWRjVRQw3a3gPorU4SyxkvBMVtWuT85SiBjAbucbc7AliKL/svp04V9
         raXxZd5mxCOSzYnFWbkVf8ELEDwiFvAOhzkPtKI+kKTXjm5CZGMlxXpLQoFtDisbFU/K
         3Cyw==
X-Forwarded-Encrypted: i=1; AJvYcCVa3d+ea8nUhaDOqyx8rDUjDcr88NmQuiuLLeBDBt0OlXvmpjxAEkf9iu4uOG+qyr9Gb4TjUDXHcUk0hB+J@lists.linux.dev
X-Gm-Message-State: AOJu0YzbhbvKBbjBrT0T863+7JNrctN1cckSSrke1jo4PDWLGSx5vPLg
	SZh3Exle4re3+kZFW3mhKI6OlK6R/NXoKu4W+jl654pWJcOQy0DJ
X-Google-Smtp-Source: AGHT+IED9koMHdtoigV1IUNLC0Lf8hQjcXzlL4YR2SQSl38kHBY6wovIRGamZetZgT8dKXARQicxow==
X-Received: by 2002:a05:6000:178b:b0:37c:c9bc:1be6 with SMTP id ffacd0b85a97d-381c79bb817mr9913699f8f.16.1730742637254;
        Mon, 04 Nov 2024 09:50:37 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:36 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 11/12] staging: gpib: Re-order the lookup tables
Date: Mon,  4 Nov 2024 18:50:12 +0100
Message-ID: <20241104175014.12317-12-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-order the tables so that the bcm27xx table is used first
as these devices are more popular and numerous than the older ones.
This is slightly more efficient for the later pi3 and subsequent models
but should not be noticable in practice for all users.

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

