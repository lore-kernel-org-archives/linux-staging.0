Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348A2F5324
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586717; cv=none; b=avOpiX5P5aDS2PM6po4ck/FLSdumkUsaSH1+TY578p3AvG1AoKin4aEuQYCHFXOlvErnB5u7u/R4M0nfI2qtL5CFkeWedxY6ZilhzvxWrFJVAwvh7duViI9oefMLk1LMtK3lEks5OQTkfFSWmAP1poHpJOr6wzo/1w8Sqgf/mSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586717; c=relaxed/simple;
	bh=P6XmHm2jopIDLZ9wxmblpOwGhl1pJ8yFIf0eHnPLem8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3TaEhYQ8arxVoSzZszYtlHvdo651qVVDOlI2HHfIFh84YrncGT2RjF+lulIXjR0Ons1VYYcVdIzZaK6XHqArvLHD/QNMzxcp6raBXNe4PlNwTG4CoFk54Tg38GyyjB0YLI1JQyVCGa9Iqs7tI19YtF2WjEfCBfHL8Ng+26yZo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdNvwJmg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdNvwJmg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1495727b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 19:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786586715; x=1787191515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjzN8/VwxxZireiAC7MXwxj44kEI7Qao20/qhkEuwV8=;
        b=mdNvwJmgsQ3+b4KSX1BNimazspZi+qvBU3PkmwTd7DcwGcnBbgG4X1ZALFsa15Ffts
         eTBpNfIlzIWIcmjfCTchS2FoYuCTHdpkS+gNv9Tq1m5JoVbhoTyk3L5Sw6S50YPgFlmY
         20kE6eK9L+3JQsCmZcM3FzzsLyPwerZti7uoOxrfjqFJUesqzO0rqF0yA/fGchbqqHJk
         IFeq2Pot+N+tmIpYEVGl79qmrqOTnARue1HX6Dtcab2VcAQegq9Twp9M9HyvUAiodpoD
         Gm99jNn5HjYLB+QolX7N/2B8Z/RSSO8pEagAeD9HBMipi4ohWVkAQQp1b+rqT1iqjwpx
         kqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786586715; x=1787191515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjzN8/VwxxZireiAC7MXwxj44kEI7Qao20/qhkEuwV8=;
        b=VIzA1O7jG8QyGzOgY6wTyXttbLbBtVTefgU6SveVTFGutvrUme29mFVT9YfNioRbK+
         jZDCvtIdq8qXZmzYv6LmanazLD+oTn6p9FsPD6o8gD2Dubj80JuJgwdECMC7/KJrvK00
         TiOjx16AZNFlqWXLDr27GphP7qMrfuDct15xMlKMMDX/O7giEfDWMv6TkgziQo2UAVSo
         Yg5MQRmXs+uRtKcV+O3P/qFCJdHztWC9J0Zr7h1ypODsvn76pXjg7eUSVCQLKf5Za1dR
         GmRXFWMDD+XYFUWqw/u9iw15APfUixXaXjatJ3B8bBfoDj+tqODVuzuTovBB1ADqJ3Fs
         b0Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Tei1oj3X4+eqCWkoY9mTiWgMWoBW0FpZ1CCQjZZd1kNmLr52AhFKT2LIEdR53D84kBSvnC1NW29Dnbvn@lists.linux.dev
X-Gm-Message-State: AOJu0YwBEneLviVpi5Bn5qqN8VTfqGJ9fm1aOCREGrb4TLgO/4JKOoio
	W6IWtqAO7QJR2JYKtc9ka2IIPSwmCgxag6BZs5fjDfVoVYtPNJujKfAm
X-Gm-Gg: AR+sD11POFCKIy2SwIJ3astfCm8UgL08LRee00tpUk0acVlxgnlrTWBYHhcJuZF86s/
	ogfE+FMTZ61Nltx7SrLlXyOLuO2TPtKQbZhJY0DfwdUKi57kdaexNdhlA8F7ACfmQH4buIEe7Ea
	xe5WQclekt9dmdCzvQCK7t75XXzAhjH/sc0yZzC4vLMnncxsNWZvYhTl3v5QxuCFdN/oaN2wfNT
	Ha5W9SyVun8yEu9rUcOY1reK7oYRPdfE4m0z+mYGq7NmXDXZ0sJYglh+k/UXQ6X9dhDvwCPsZNA
	agBJK9bYJyJucim480xmAvY7X+LdyRCHqUNOzlsg/0Z9YT05YXGe3TRTxUDHitcj0cHY2bK7ruy
	KkOyuaWNfyu58v3BRsKlvx7BXlcBkhE8aFE5yhyXWGT0EBefVA8G1IcOK7flLIxINqCy2h1VL6A
	QCvwE9rTQLmBIkl04sHq/dSPe+mli2QzwI3kpOGU6nvFNLga0IMPa7fr5zD6XJx1y4Aare7sHaA
	lwKL9V+8yrCmNpP7IukDB7WuFgPL8dQPbKhzzJIFXco
X-Received: by 2002:a05:6a20:c90d:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3cc550ccbaamr3685375637.7.1786586715265;
        Wed, 12 Aug 2026 19:05:15 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm1993497eec.3.2026.08.12.19.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:05:14 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Thu, 13 Aug 2026 02:03:54 +0000
Message-ID: <20260813020354.152120-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up loop bound calculation by replacing sizeof(bds_factors) /
sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
to improve readability and maintainability.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..83519dd8a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2160,7 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
+	for (i = 0; i < ARRAY_SIZE(bds_factors);
 	     i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
-- 
2.43.0

