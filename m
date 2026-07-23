Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6F45D182
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820146; cv=none; b=K97gITQy0zmxs9uEtyn6SZJdYL0FtkgS3VFyqXXHU/UPqpcPU+UnYNcG22t9yRidupZhavVkZXzmIi+zqySJTbj524XGkNr8cUjB+XxbIBgjm8HJltYuUF90rfaC7vt89LZbbRyeMu8kTP8MSOYRu3/yt3aOrPAH/wxM+ff6PB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820146; c=relaxed/simple;
	bh=bulsuqfT4elwA0ChnmuElrRF7eFdJcIJCtLvAjuNCcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GBXmEILydGBG7G5NgnxNqpPSnYXe8ArubYCRwu7MJN9WM6M1mt30ZYnJYyrnVL12dpo4xE7dSwNzeQD42olEKXwiLXA2tXUwYnV9PCvgNJfLt9yuxkWWLi0VJHVx2QoXv9amZOr2TMxrYXnC8oBj9zY5YabhXUa2fV8bcxgQqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6RqbY9s; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6RqbY9s"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso247605e0c.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784820135; x=1785424935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhoCJazApu7PhpZQh7Bx1EblplBzJkAncb/FnM2OHyE=;
        b=N6RqbY9swJWgDsH4YrXGXUbg4jiC4UmvGLKkW6Mfw+iHHMwRcPpZGptoHYQynPmQom
         bdepIqDOC4ACzRhExWuJn/4GBTqJULpU0rLVth9Uiz18xOLe/qlmYzMDwa6o6hf29SAR
         PHRAcZQQjb0kf3OD6C4jvl9r5FquJrkfBN4NW5TOsPtvFGlnUzfBFoP0oE6G1D8mxhkw
         2XXEGLlaXEqP+0xbLXkGmjJtlNpt62YseEXqKa9mKuRr9gHn+ZruvOEqHpWFfHc3jLig
         gdqwdTJnc+sdUJMR0xiJepbb71yT8JWpwsYH2SgND4FMowUy8oJHm/1XtgH8gIXzDowM
         VzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820135; x=1785424935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhoCJazApu7PhpZQh7Bx1EblplBzJkAncb/FnM2OHyE=;
        b=NrccQzH7L58ywxw6wBSYdkASJYbXVYihySra0EpvYG+W6JVbnHNrk+LrfGIFA433jV
         MDpTSVZHizpYXmFYIcZxtqlmi8Crqs+QKZsyZy3sLmeZ16+/mtcvdmwgIzX+FaxiDOFw
         /OysDRDhvXZeTQ5S8xBanvoUwzFRzx1LScVxxxfrtduhgCz3qxnx1TaSDcnRRGV+UxoI
         +cp4tkM+cGeo1u27DCLnAeD8GrZZi2dSmnlSF++XhvnQMG+ojMlC+yFWv6/Y0NMkj8g5
         zY2AUbeKE5G+YugffY/UgNPyj4UNTczOGB0bTpUzLRZsR2KPgx/qrVq0xCmeZlwp3oDa
         rfrw==
X-Forwarded-Encrypted: i=1; AHgh+RpfxCV6ImpUT5pB46teRaiPbWzavl7I1iUHNyaSyBjlINXUXiROg2tKCRtTUfETIMNLl+nVi17Nehi9KdVZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl8N61BssYyH/iRXJJHhXmp1RilZdT637s0aaHpSp++0W9PrXi
	H6NhEFcfe0AAi3Rit829tRvmjP5OyjExSPfNzJx5CM2i6sO4EhQKSbqH
X-Gm-Gg: AR+sD10nM7E97PJMg8LEtHi5XIvrrwYytOr09iXRsG7hvNET6h0tLMTuz20l+6SnaNe
	QixB3eetYyge2Pia9+hyRmPk/2klsYddPeOtLNyw4xLTrJ1UhxNkdRbojy06nM8+3rm9KLCgfsS
	acDUPPZBYv8TEu2FrMhD9e6DOt0WH6kFi/5611y15NvbVuzn53xJuitwY88ptyCNwT5hQiwHJCj
	UiPFA+E1c7ezUujJueqxKCxO9nVcykNWqT4Irjy0/moVWM0FUKtgBb8Fw4x0JAregXtGt9f7QH9
	lxxN7ayaYDAhZ5WhYCpFxqLPNbEST2HcdR4X3qyI3lUylaB9vA9OeStv6PdGn7JL9NBNKsH823h
	lvT8KTjv4g4dKOutALfAmh5s0FyofgF8bwO3BEpmPnhOZVc0rewk6KjEBkIjm7Rr7raAeBmOtjS
	/lIuERju5marikxOoactC+Qy949cUbXeHIns8pAzhzE9isYN1K7+1pMDu7rbshGfYcH4deeBCOf
	vpxnJT+bCxGPrXguwpv
X-Received: by 2002:a05:6123:a1:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5c2da0e126bmr1430338e0c.7.1784820135565;
        Thu, 23 Jul 2026 08:22:15 -0700 (PDT)
Received: from user.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c648704dsm6118065e0c.12.2026.07.23.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:22:14 -0700 (PDT)
From: Tomas Chimenti <tach.365@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Tomas Chimenti <tach.365@gmail.com>
Subject: [PATCH] media: atomisp: Remove useless return statement
Date: Thu, 23 Jul 2026 12:21:46 -0300
Message-Id: <20260723152146.86978-1-tach.365@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error 
"WARNING: void function return statements are not generally useful"

Signed-off-by: Tomas Chimenti <tach.365@gmail.com>
---
Hello

This is my first patch, any feedback would be very welcome. Thanks
---
 .../pci/runtime/inputfifo/src/inputfifo.c        | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..f0dcd839e33b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -88,7 +88,6 @@ _sh_css_fifo_snd(unsigned int token)
 	while (!can_event_send_token(STR2MIPI_EVENT_ID))
 		udelay(1);
 	event_send_token(STR2MIPI_EVENT_ID, token);
-	return;
 }
 
 static void inputfifo_send_data_a(
@@ -98,7 +97,6 @@ static void inputfifo_send_data_a(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_A_BIT) |
 			     (data << HIVE_STR_TO_MIPI_DATA_A_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data_b(
@@ -108,7 +106,6 @@ static void inputfifo_send_data_b(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_B_BIT) |
 			     (data << _HIVE_STR_TO_MIPI_DATA_B_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data(
@@ -121,7 +118,6 @@ static void inputfifo_send_data(
 			      (a << HIVE_STR_TO_MIPI_DATA_A_LSB) |
 			      (b << _HIVE_STR_TO_MIPI_DATA_B_LSB));
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sol(void)
@@ -131,7 +127,6 @@ static void inputfifo_send_sol(void)
 				1 << HIVE_STR_TO_MIPI_SOL_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eol(void)
@@ -140,7 +135,6 @@ static void inputfifo_send_eol(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOL_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sof(void)
@@ -150,7 +144,6 @@ static void inputfifo_send_sof(void)
 				1 << HIVE_STR_TO_MIPI_SOF_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eof(void)
@@ -159,7 +152,6 @@ static void inputfifo_send_eof(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOF_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_ch_id_and_fmt_type(
@@ -177,7 +169,6 @@ static void inputfifo_send_ch_id_and_fmt_type(
 	 */
 	token = inputfifo_wrap_marker(0);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_empty_token(void)
@@ -186,7 +177,6 @@ static void inputfifo_send_empty_token(void)
 	hrt_data	token = inputfifo_wrap_marker(0);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_start_frame(
@@ -196,7 +186,6 @@ static void inputfifo_start_frame(
 {
 	inputfifo_send_ch_id_and_fmt_type(ch_id, fmt_type);
 	inputfifo_send_sof();
-	return;
 }
 
 static void inputfifo_end_frame(
@@ -207,7 +196,6 @@ static void inputfifo_end_frame(
 	for (i = 0; i < marker_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eof();
-	return;
 }
 
 static void inputfifo_send_line2(
@@ -297,7 +285,6 @@ static void inputfifo_send_line2(
 	for (i = 0; i < hblank_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eol();
-	return;
 }
 
 static void
@@ -377,7 +364,6 @@ static void inputfifo_send_frame(
 		}
 	}
 	inputfifo_end_frame(marker_cycles);
-	return;
 }
 
 static enum inputfifo_mipi_data_type inputfifo_determine_type(
@@ -453,7 +439,6 @@ void ia_css_inputfifo_start_frame(
 	s2mi->streaming = true;
 
 	inputfifo_start_frame(ch_id, s2mi->fmt_type);
-	return;
 }
 
 void ia_css_inputfifo_send_line(
@@ -516,5 +501,4 @@ void ia_css_inputfifo_end_frame(
 	inputfifo_end_frame(s2mi->marker_cycles);
 
 	s2mi->streaming = false;
-	return;
 }
-- 
2.39.5

