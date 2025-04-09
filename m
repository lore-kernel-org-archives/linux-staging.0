Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A127CB28
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222221; cv=none; b=MJZcmQiaFTF3Q7PMujiHK2fjoDNcXXqGC/KQkKwv97ISbt+jeUhYgrZNkidMGKcdek3WxiYzxY5IIfZ2gqMTj07vzsjU4tzUQa2xdSIaSEHEKEdOimCAOY5n6XYpzDET8tS0TUMVMmmrdP0w3Dv68OB1BmQir/gNCOKYbk+Cz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222221; c=relaxed/simple;
	bh=naX7kj5CGDv66WljYbqaEwF3sguVoJYmEOAQsEO4f90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At2Qb3Fkfjtm1Ggue8CQFLoio5V77HznXy7NEPAW7sdEh8CUrpBR9mfbnWrpX9m3MlqT6BTcP5OlRxwj8sFH0ySKrIWxN5vZqKag6xM7VHIQ9LG7PUK5hBWe28hvZBGZo1p0LHvc+5Hd74/zbA/678B+V+AtfgPInBt5Rnyfs+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Xm9Ologs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Xm9Ologs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224019ad9edso92850835ad.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222218; x=1744827018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otuu0KVcsZF1FCQM7Wb8tH7tQ3lPKh9p+2insEufIqA=;
        b=Xm9OlogsM926kv+en6soLh51db9dg58nkbVvvoAp7ub8lzhrCsDfANbhY9XaercbXs
         Fa1rXEO9L91P9pzlKKN/j+mmwkSD8sm161s1eYP7Fyvi2sPBTKXmvrh9+CkoBmZ8CaCy
         QSiYiQta5wagGSNGiHBYO7tKeVp2z95BUyeEdUQyiWRVnNijOF8oJMnRKTwnCL0mdzHm
         j1DOKy0cp+dLbAZmDbm8nnS945sVGIXMMyGo5WfNJxVz9PufAwcsbkfXFmJv5IMpuCU6
         OoenqW7E3yyjk7GNl5yKw0PakfG0VCfikwOUtjkFoPyc7yCGOHjgfoUSe/RCOjTerSeu
         sGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222218; x=1744827018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otuu0KVcsZF1FCQM7Wb8tH7tQ3lPKh9p+2insEufIqA=;
        b=JKlSzwoHq5Kqw4SDmd0Pxj0p+/SJ1cGwA4/KuMHPlzXSBYix03R+O+k/w4dB7BB+BW
         /xtStogK2X2m7Y9YvaB4lN/rjJoFZHwFCcq/aiTQudvBYS1UoAl07qj6H+9rEA0w5y6E
         PrqwhjyVZYgoS5K5X0tGxYTosSSA4CqeCLnBaszadX6kFe6zJ9aouHT0zm1JeeFmFxcA
         MCsfdWx8/1qazs5rYEVT6fZKDnswsl2fGNygxyn/0Di6qiGsb1aeeUr3bAD393wLlsNP
         OCAvVKeS8WOTLjOGvDmRRdEg/fxP4BYAxZYlBhdqYbmwsw7CNdYSMol7Uz3sX/qwxLyI
         Sinw==
X-Gm-Message-State: AOJu0YzqHndBCyNRJ5X98n8wTZ1FTIk43yKhpVL3HkyyJoMQZNQwrNv9
	EcSMA435Y4/EghLsWPMTTsD2reXUvIGNkRUoPoWd7Hp/6GK49XTsmQLNNTAJ+g==
X-Gm-Gg: ASbGncuMyy1D1eXTi/VeXMS/SvfB41KsDhyRyh9A4gw+MiNfO3fJpluJTxJrSzLOhx3
	cdq6nNQ/DgAp4Y3EMI5OaarlUw+H3mb1EsuK01JlOYUD6NdmIWSGcnGxV497kCfO24eaFwMMVXC
	yYGWA3RoYubWqlPxRle+Za6m/QqmXyrI+KsnhCJaoxOtIYBHcveLcnGW/PzIhC6l6kYgq2mX1VV
	/de2hT6wwKzUT/fthFjHbRJVVGAAY02iAIgzA07FDg6v1g730ToYFs8Sdb6u5VrMqi0smqTT8BZ
	C915HLfubDOn9FdcetL3RhvTz6ety9i1sZgI8RQtTfMOaGeP18dymmLwnafIJ2egCiOC6VJnjNV
	m30+A1A==
X-Google-Smtp-Source: AGHT+IE4U7zIV+8dG8B9BPiDBEiOry/0q32rrNWZgASxDz+m6sM7fex6MFO2thwxTkL/N91e3ykndw==
X-Received: by 2002:a17:903:138a:b0:223:6455:8752 with SMTP id d9443c01a7336-22ac2c26682mr62169015ad.43.1744222218559;
        Wed, 09 Apr 2025 11:10:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b29esm15253935ad.81.2025.04.09.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 19/23] staging: gpib: lpvo_usb_gpib: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:49 +0000
Message-ID: <20250409180953.398686-20-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index fa185171cc69..4bb2cd31fce5 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -705,7 +705,7 @@ static int usb_gpib_line_status(const struct gpib_board *board)
 
 /* parallel_poll */
 
-static int usb_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int usb_gpib_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	/* request parallel poll asserting ATN | EOI;
 	 * we suppose ATN already asserted
@@ -997,7 +997,7 @@ static int usb_gpib_write(struct gpib_board *board,
 /* parallel_poll configure */
 
 static void usb_gpib_parallel_poll_configure(struct gpib_board *board,
-					     uint8_t configuration)
+					     u8 configuration)
 {
 }
 
@@ -1031,13 +1031,13 @@ static int usb_gpib_secondary_address(struct gpib_board *board,
 
 /* serial_poll_response */
 
-static void usb_gpib_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void usb_gpib_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
 /* serial_poll_status */
 
-static uint8_t usb_gpib_serial_poll_status(struct gpib_board *board)
+static u8 usb_gpib_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

