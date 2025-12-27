Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E69265CA4
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870878; cv=none; b=F5ps855+s52IXVPzx3vgG/NxXmT7ccnZo/lX1NBX4e7qWfsAbB8ghn2S5ASNUM3J9Gz80GIzulXonZdfiAbxyarnsqscGOCLoQLmTRwqIpc10EYJDQwKcOXsTcTmDjE5Ig8r/h4KQBjZkWt3uJIvjqt77gU7htb1SVn2crzwOCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870878; c=relaxed/simple;
	bh=f9H9MC4xcxzuQGw8zLQvyrMc693okhvy19sqr+MLcsQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ek7TlqrTkQueXiiN+rigQtIoDk6fhxSW5GqWuKvk0RZRNqUbdaP7pUzDlgW0ueFoZXCOxG8ZXRdGJz9zq7WXJq5pJOvGMoA7xl96mrb7pxXK/lRoCz2DEC8s4c9c8/qg7u9/6nMaqUNswbcUccOxdxtEQ2y7cAyt6ynHml3c3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXX4lzmd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXX4lzmd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so63715475e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870875; x=1767475675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJwXMf8JVHL3Mkcm6/VThdKIeuH3OE2JjGMxqxLBU7I=;
        b=PXX4lzmdF8uCLyGuemv5mcF4NQJcbPEzQw3rhpX+OrAXpqvdkB9t3FObpKPGtHk/Xs
         DzjpAzUX2/7Qlg60ZWglesThjpwAHtYqHBk0W5A5cyKTKRCe30h957DqZk01qepYh6Gj
         4g41ujnIGDXrcmpiG3fRDPt5OeFKm9KxRoavbL/oS1vJyWu31I9Fr1mg1m7A1KGer9mk
         GAnsz9ZtvvhrLYo+HvVKuqumCRjgIgcZVB6n+Y9rjXmVzB0Kdv9XRE5iJFDi24zQMPdj
         juiqCtFDlI5mfjhOrE3RP2GrAvXKu5matpNAoPTfzwxFvQUN2BUax2M2Edgq0QY7TJNo
         z54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870875; x=1767475675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJwXMf8JVHL3Mkcm6/VThdKIeuH3OE2JjGMxqxLBU7I=;
        b=I2bUf0hmqvrE/qBO0eUcAdzPBqAMRNFdAdi6aOZNQD7NcUIfzDMHg8r3k3gyBNfBXB
         z842avwIGR0aMBPVQnw4/PhRXsrGE+5bIq/BTR17YmmpE8SCIcHQ6P5NFGTg40W50YYC
         0Bzy9XFcb4cB1PweglInk3beaNFD4fIydnNtBRNg91/VNCTCrY4iizUuB5drH5SEizwy
         oAV0BIPsAHUTEbt97mIIcjX50PjtA1DHG2ZlEHsvfWTsaqTjRv8cHZYNtZqxrmNa75Hh
         VDMJT3foZko6wIgaoHslFv2CghaHaTHXe4hP3Q2BS7sJwSJEax8HkWsZofYtWnNvZZn+
         VMsg==
X-Forwarded-Encrypted: i=1; AJvYcCVrapwwni6Qe4HV0J8Xw30rceeBbFAZrHIWvgXjaNgM1UeDWjBy1nsTKgmqTT1EvURGQwsmqAqou37Mu1G0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2sOnP6XtRSEAiHfwrRVVw20jKeq1U/9w8492hgyKTkLkNBN2Q
	RUq4DlDlqI+jCfG7uC0aeI3xf6VI6s7yXiXdQKIKn2BE05uKtLDm7OwX
X-Gm-Gg: AY/fxX7diZmGnbNLtwdyFkNq+77fl4s2Q80/6Gl6XIpXDllyUv7tXP0UYqWBZyl2E+E
	tQyyRlYfagGjPsBL6ylg6St/eTKk+K2RvljxVSUjtRES3LmSrs9oRbpDbVgsUwFaKjUNhjUGkS+
	9j3J8Nd3C6KjGDwqGdqhxrDfyy6T4+dsrYxCMxwgMt1keSjlnikrkdQ4w0Bzm5e/2XfyO1yqKd3
	kEvh2xRxssIvlfpKqQmo1hI3AMWAolXwGNVeFiBc0mrdzbiNFY3dLrTLVIVru2B7Ls44sBoJaej
	7Kczy8f1uYWUqGbhKENdMw4Ga8TPQ11wX+FBKVmQ4nxUC+1Ueng1dL4TsOTpUGR0pTvMJwRn2P3
	UwyMjcbSMo2fp+cv9FqhW79UciG/zBVZqYY7Auk5tXRSy0GG0s6OpRZliRTDQFeHwAKHUWua6Pc
	yB6ig9IwptNc1On78ximoC
X-Google-Smtp-Source: AGHT+IH9NoG6yql6SSNv44coLGTtBeIFhre9pISuVcL9OD6r1+dy/ZrdkBDFdUTgznLf8eI5mrnHjA==
X-Received: by 2002:a05:600c:470e:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-47d1958a640mr311229455e9.18.1766870874919;
        Sat, 27 Dec 2025 13:27:54 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:54 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/9] staging: axis-fifo: Remove unnecessary casts from file->private_data
Date: Sat, 27 Dec 2025 23:26:36 +0200
Message-ID: <20251227212640.3321310-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop explicit casts when accessing file->private_data in the read() and
write() paths, as they are not needed.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 4071060419ba..bf610e71253e 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -157,7 +157,7 @@ static void reset_ip_core(struct axis_fifo *fifo)
 static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 			      size_t len, loff_t *off)
 {
-	struct axis_fifo *fifo = (struct axis_fifo *)f->private_data;
+	struct axis_fifo *fifo = f->private_data;
 	size_t bytes_available;
 	unsigned int words_available;
 	unsigned int copied;
@@ -268,7 +268,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			       size_t len, loff_t *off)
 {
-	struct axis_fifo *fifo = (struct axis_fifo *)f->private_data;
+	struct axis_fifo *fifo = f->private_data;
 	unsigned int words_to_write;
 	u32 *txbuf;
 	int ret;
-- 
2.51.0

