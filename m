Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6421C84BD
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752810563; cv=none; b=tKb3kzAEtsydeRtDcm9HyHH4tsJ490wCmycATLsnS3ia+Pzvgtyt2yGX/+eqbqpZuvIqGpbBahm9ZIck4faER5h2W/xdgSHuwCQ/yxkpoYkT8YXp3fII+I0RkC5lFBMcx2UqIx+JU4iFwjLOPPMEU7IOW9JDBGT9/bPD92fO5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752810563; c=relaxed/simple;
	bh=TUYntXoe7RxxZnZMgxLkh3iZOefyIpODGMo4hHDC1ec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=AQSYr6aeMPOS6voch44Eur90C0+kisw9S8hG7gO56yJjXM7j2Xe+HHUKxRM3ZsITq9x/cUS0XZHtrvD0IaH1vgLozeAg07wl8/FMR21zBa9jPA/89ixqx93D8iGApzoAIf3Z8M0z8jufR2HqNYVXEsZ0b7HU8cSuNRp2t7lO9GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoIhEdyc; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoIhEdyc"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e182e4171bso177289885a.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752810561; x=1753415361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ahzSbzOVkCgO0V1iipUMnKt+g1BWb60GhxM8vm63ng=;
        b=YoIhEdycpsBOoAUpKHZNrMHD4+aKs1jWpGhpEWLBtHs4Bi+yzy5D9+NcmazwlLcH//
         awiGAtF+Ftk/22qaqQu/0F2C22/zuF1DMYtMgkRY3fstNtOaAUL3GSgcM9XOuqdk51+V
         DpOcVuQ8alqW+lCRghs+k/KJ79oYyevH8sUuV2wETyuCBpEBGe7Vmj45jPJBPV7bNEEH
         dmrsuUL1Y9LHX566svnM5hHKzaRz1W5fQSsv7srVsFuJI1nYX4+pX8NZ8ps+eBR3ob9s
         f3VLcTd22uRF8LO55I5+ocvQRzfFMx88GcIp6oc/mVpwcJbPhSSds5JnOFtd8bQ+9VZu
         sFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752810561; x=1753415361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ahzSbzOVkCgO0V1iipUMnKt+g1BWb60GhxM8vm63ng=;
        b=ocpVYF2tWCD6Tc/qS8l3NF0H/Od5GbjF7q4Ko1zbXaFyG0fN55CWOvhaSUB9AIS3R4
         DshBlBgDwumTWGE/XQs2QsE6hCrR4bw+PReutkAWRMDjyVAzNvjdu75CMCQb3HnOzy2R
         5v7D7ZbvKJyB53Zub+Ae5FIKxWyA5haBNp4HoPA1GM8jDXjqtuWyeplyPgZRNbjMDLbS
         /D8+uP7H71hVLt/h6obpLoMCkOGiA8zWtV/Twm3A+M6PNyay/41DY9RogkTef23y0yoJ
         GZXX2TfUvBkJhQnEyEGj9gG8uYhXSnz0utbNIOU+1RTpQGd88TPihFHhS/LRxsaPQtVh
         AaYw==
X-Gm-Message-State: AOJu0Yw74R6jpqb1C5PXMNiM4V8UbTBIZLwn1lURFgxCUFfwbJcMDA2+
	y5W4U25T8hN8acydeW/7QEHJXK89MCbeQY6VOkZEo44QhTTpwVYcqQHM
X-Gm-Gg: ASbGncsXDgNTWREw+/sJacFv9DF+Tovn6r5Xpg53WbdNtizpmRM3CGuetKU4kPVWvVV
	9c2BlMBUoubNbnpk1IRLLXOANmqAV7+O8QV1p4RMb5BXKQ3cTT/kfcC4bnaBKe+okPOFbHALQZr
	D1dc1p8OkRgFbG8hhutTzmDVgCamoghgv6VUdBwzw6vpX2FRFxVZURsi9fVN/Bb8b2Mjv38kc6z
	AUU9D9d8bfyTbMzO3PK6n3lGrxEYmjuMRA3Ry01N+RFcg15lKM6ES3Yqd1n76YWxZqkc/RdBwm9
	ffnAaod9qxfpvlmhTbrZvP2DIyHl4HjxQUdMUF11ZyI4d+Iaa28/VqYIrH39kQdJ4+jmAZiYOkq
	c9sGJNgi389dXUXM7ZFCUAd2Om7OZ2/3fuVmLy9fwpXpHIFMqt3pX
X-Google-Smtp-Source: AGHT+IHwz2ZQ9UVQsUrHY6uima8WLEW793ry54aYseMx0tESu7LoYKDH8an0Vh/LM1hsaavk7gb6eQ==
X-Received: by 2002:a05:620a:4726:b0:7db:e87:918b with SMTP id af79cd13be357-7e3435ead7dmr1235595585a.33.1752810560690;
        Thu, 17 Jul 2025 20:49:20 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356b47f8esm41183885a.33.2025.07.17.20.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 20:49:20 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: make const arrays static const char * const
Date: Thu, 17 Jul 2025 23:49:13 -0400
Message-Id: <20250718034913.49300-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch warning:
"WARNING: static const char * array should probably be
 static const char * const"

This makes both the array and its contents immutable, which is the
intended behavior for these constant string arrays:
- g_fbmode: array of framebuffer mode strings
- fixId: array of framebuffer device names

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..82e01f114 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -731,7 +731,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.39.5 (Apple Git-154)

