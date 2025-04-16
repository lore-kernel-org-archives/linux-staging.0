Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C822248876
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836137; cv=none; b=sWTr4kbQCO8QrwmOJt4zCXaAfq5DZWyYTiYRe0UNOIzAwFjJ6h+OhUBwNxrdanUDTm3OhqV5Vn99obvk8ACkeaDg1IRD4izrR5f+0U1ZyvfRz1rGLuHJy6gbhh8fKdWNup+3ul2Dh21HCv/KFih+sC6lUZQ64BJvsHdhaHLdDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836137; c=relaxed/simple;
	bh=NquVVOzUvVHc51NXGJbazouN1NI1DYful7g9CbAi9qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idNvjqXydUBJGbzTwm4zj4Vqe2vBL+9V8iuQ+WbiQyGNg1mhmgUV+tCisg/6sBzVyvxL7DFfHV2Czmtn66VNzU51QP5QYWkGMGwpRgm/wexJP97cqStau5YAX6rXHRzaYS5AwrNjhR8cTe3XkB19e4tZsshnToaVq+fNGy+wOEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=a81qLaZh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="a81qLaZh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so32789b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836136; x=1745440936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVKJYjCi6cfX5sAdrJ/2R7IvJcF8PtgZtR8+tQIsnkA=;
        b=a81qLaZhWddBXWgv7mF1FHMTijyIYYrfrjVc0+RX6f/ELq+Pw6aEIb7aIbePx+6zRO
         rfKuzSd7gnEHwlWEJIZLiqW5Y61pYxjrrLAjtBKO6XdYXfkDgaJkuFwlN/9+n4vcqpkE
         TdUz4yENdq0r2wbpK1Tg/0ZrV6lu/JuqKYNhrr1/ZHCcNFcfC3uKBPtkfVSgk7wRNnSA
         gnxgCoWVoZq1webMTElWRKRncaTGYVxmZD/+4pD6Np//37tnfi+Bov0EY3MDuHhyL6Je
         niZxlyw1TDrphDrZE9JRP7hp39X7H8Ic6d2OM08otaTfGBPuk/61gEfvp3E2y80e4qCA
         KoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836136; x=1745440936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVKJYjCi6cfX5sAdrJ/2R7IvJcF8PtgZtR8+tQIsnkA=;
        b=cYqH6lhIa3eBsPswCDZKXc9z+sgrjKyY+h4Vs8zKhOBH+L24VHDq3wq/UtW44Ve+VB
         P77gwzY7JPVdD3So2zVM1Y9+N9RVVuB7E0SzzMgro+LsDAdO9irDWEKItW/ebqNl3Pil
         KwZ3YyKAIK2EBH1UZZkiIa9IbbXgldazY8P6Hor7ckWoSvZl+g5cw9ELPd+tfxBSqfRe
         Uac8YfrMUM+tlKtUW1deQH+44bvRdgXQ4quW5SePkocUoSrMpof7TP8VOM0ll/N0XSoc
         uLIg6TvLd6xbrfUvqKdbAoB2UJcWub2lTokqfxM1+4/fTLLkGzlTO8l0FWgMW2vznEQV
         +Qdg==
X-Gm-Message-State: AOJu0YxcfI8Lvj84sGadJFDgjOH60GeIwDrC5qrtsBUfj1L1nMZtqYBt
	H+kDACOyzNb7Bjp/q4Hmk2JD8sFklYTw05BsNsY0r+jHLrImUydhLU9cM1KpSxNRxUV08eGF+p4
	=
X-Gm-Gg: ASbGncsIAvHzOcRvxZaoBnn6Oq269jivKLb/QCi21s9cpcRPEnfPlAR8jos/piBlHBk
	f5MPxGfEQYeMTYJmP4KSKiaLyRKzYU6X+ifTgaJ4VZ4GRKKXKIB14ebZjJ710Y9l67duQVSKU+G
	hO1zcqKRyheUb35znkBtcjvIL4gPWaSBiHXfzeijZRQnIbdmG83dfB6wW66yreAwMU95zfSiu0k
	JJWkdLBoMfcOk9xgv4X5XV+ARWlzxaA0ohoBF0F2sp3x9EJsEaS4B+Uznkc16S+8lwr6VWCc9Sn
	Wbwsh6bZzbt7ymAAs0KzffVikd/xrNaPlqKRDpz3ezY7i9UWB/7coZUU2S4u63iYeUK2E1qQFfp
	VBNCgnQ==
X-Google-Smtp-Source: AGHT+IHSetnTFl57LONs/SJ5/0CznpYL8ILM+j90Q/9oEZtSLp0hQIylnIjaySAUtnyXjyoLO1PT1w==
X-Received: by 2002:a05:6a00:2e24:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73c267ee1bbmr5002832b3a.22.1744836135750;
        Wed, 16 Apr 2025 13:42:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da87sm10880220b3a.127.2025.04.16.13.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 07/18] staging: gpib: fluke: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:53 +0000
Message-ID: <20250416204204.8009-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 396524901f12..f6a84200e3a1 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -712,7 +712,7 @@ static int fluke_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -748,7 +748,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -775,7 +775,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

