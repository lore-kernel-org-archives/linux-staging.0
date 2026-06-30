Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B23D6688
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833760; cv=none; b=iVn8kdklt8U1Dtf6iRCrlOpoPjWUV/yuf/yCAi38oqnK4BL04BX5eMdbXPf2f2dWZitHot7wtdlycakf3ivTgqB1EY9sARDIO1OiOxwI4/fXRn0vj6BH1+1gE8AOSgyfSUbdyzFtYypkrAq5XqE4SdjjSZUCrO8MgDw8R/vuukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833760; c=relaxed/simple;
	bh=C/sNGQgZjtlv/vUcB6cIK+OgH0AF8oNebamKW5FGCHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFkmOI0Jv4qjEH4nSrhSg5ALnN636VE5yav4u6QkTw7y3mxyhuLW+6dk5uuwGJM5dx4ruPglK8PnpFGFdR/Rbgx8iKdXW/0bqsMawJJPVxZOA/TZCA3IPgcvZjZBiFXqxEiITTwY+HbPQwwDzYc3/F7GH4WI/HMLRvGPa5Qa5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Yl1iV4AN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Yl1iV4AN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629051c946so624516f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782833758; x=1783438558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhdJ5BJyC+qdEOENTSdZikP3UFr9Ebf8NVm28SpngNs=;
        b=Yl1iV4ANjlCDz85ygVRiYrhQ5LIKTiS/07xq0weXBpHGb79++bDIua9dIludYu80+Q
         A+5HugP2X4RHteypuiVEZ89VGkjBi21Re6r9G/VUMnShml3DlSV8tX5rI8EUVMfjboxe
         Ny3jgFmg1t4P55iMUBwi6exNtuqjQ3XC+zhwyOrrPq3m31cezKrCGOSBiwBAWHqj/326
         sXho2Csjkt9GQd3ttXZrZOjEp7lfT8g9GJ0J85euOf8X7u9+/sKVWVqgN+PH4Mhyjbzg
         tZXGewWeazYIimO/SySUR96wCcRK6H5Z9VzRFlNHNP1Kxlm87ggPL71TnN08u5rRaZ5V
         Yh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833758; x=1783438558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhdJ5BJyC+qdEOENTSdZikP3UFr9Ebf8NVm28SpngNs=;
        b=T7X/UyvDhvP95QEKzZyK2B2q/nJ0hFMNZNqLnlIR5L0noDTyZuU6dJzBeJk8AoQ6Rv
         lczbaG3GoqP/5ggkuI0F0Ekgusp1MeFhksbDPbP6wQq6bBR79MKUr0DwRDoDvUtV0iI1
         Xrzo2GmuOt5Yqiu+4SpLKj91CAiJZd3P/AraYKEDixqxfxi9PPCIulRQdvsXJE6yosxd
         mHcRooFUYqaa17INnmI0NihL8zYuPfCbQiMxEAJJlYF3kjpk/A+X2rCx8U15fLmF5fcD
         t2W1+AT60ZcYnIYKZ5yzhQ0lN72lixPaT52PO81BJBhjQkLNUfo3smGsTDzLlOSsO4qW
         grpA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1xmmyd2B6nH5q1IQ0DI6l6H7qz5vAkzxg5wg5tH9EX+isLKGhMz2LLz1htm5XBbrHLAO+SGEVOZujTdIT@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ6Msqx+0AzgVcNGoYnqPcMGGgj/+MQkMqePS4091Ybf7H1NCv
	fgbGZDK+NsxVe2YQloJJV9Da0MtC6T+Uhx1A92tdyEyExsGGjWIRp248Ct4csS4DadSStdWEk4M
	vqCYi
X-Gm-Gg: AfdE7cmUYQDahbZ4LkMJAcn3W3NeHLxnLKYfHJJ3asxWbRWCQuX4wI9xwH1DDWE2Joz
	00ek8ZcX4JqOB4d7Cp7wiNahZEvqzRr3wiVTrlp4+1nHOLczXOiaWaulrc47ECAqyJFWgrKgqMG
	XajPOHuE3c20fARePgzRvxuYjU2JIsG0yO8TrQ7Rqj4uzcMbn9JZZ18Rj/FX+pNSkdGFystYRND
	Pa/tHY4B0VDyp35N69cTh1NbIsMG0m3IoYI11sQ9aniPEO8RF6+u+g7N6c673mmTjjZTpV2RUug
	X1pIqUKXMk3MaCTESN2/xolVXbFNUwY1WlfWHftdmWSFbsyG3E1xUwpS89NI1bOZ+ccR4KXSwlj
	PjoaxrAc+Zx5jBVHRCs/ekVp16P1fG5tb/TpGrCnz1amcXMr3QRaCbZyJeMNWr3tlB4vQ/uU88f
	sy+3wFXHxiYYUQfi3c3M6cQioXIbl0qCFvqoGdLzc/3fzSa7bIk6V7LLaeijtNJ0GkxSW2lJ1FN
	du/+D6olD0cjWo=
X-Received: by 2002:a05:6000:18ac:b0:46d:d6b2:395c with SMTP id ffacd0b85a97d-475f71585ddmr3350098f8f.23.1782833757506;
        Tue, 30 Jun 2026 08:35:57 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47563d195b3sm9237775f8f.8.2026.06.30.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:35:56 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: iio: Initialize spi_device_id arrays using member names
Date: Tue, 30 Jun 2026 17:35:36 +0200
Message-ID:  <4c743f86ca4072d34d715333589aa540aed895f2.1782833415.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782833415.git.u.kleine-koenig@baylibre.com>
References: <cover.1782833415.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=C/sNGQgZjtlv/vUcB6cIK+OgH0AF8oNebamKW5FGCHo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ+JOU+qLIJCfU4Vwx5i5RiSDJiEeiFeA9War9 /+1v/rLPUiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakPiTgAKCRCPgPtYfRL+ TjphCACuMBhtAqM3PCg51rm6Tr1HJzsPZ2rI9qodeaRkoToBT/ftnHsXGRHdubRtvlAw5CudGyu vr6t/ebYnX8ReU5PgbQUZVYq/6JDLUybk0dowgBRzmnYQLutzh9C4g9BNsTAeE3KMb+moKJUaTZ fhOGE78MhqqcG1kzPhGabW1i8+6MkfETWmKNwm3qNEqZ4bErCa37bnMtWVwyurQXc3VrepkYIVS Px2THpVkZL6FRYX8vn4x7DgJesNq9oL6AzcljyrtHxu9wrBxFERWC8nly2NUzKXV+/YlfAg1g3j K+qVVOvTQBb57kKLEKVq+2X8rwAVv0o159Xp18ViWGE8Nrz1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Link: https://patch.msgid.link/cac7a68e6a6adb1b58207640ab045e59eec86f53.1781883685.git.u.kleine-koenig@baylibre.com
---
 drivers/staging/iio/adc/ad7816.c       | 6 +++---
 drivers/staging/iio/frequency/ad9834.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..30644d2d7c54 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -426,9 +426,9 @@ static const struct of_device_id ad7816_of_match[] = {
 MODULE_DEVICE_TABLE(of, ad7816_of_match);
 
 static const struct spi_device_id ad7816_id[] = {
-	{ "ad7816", ID_AD7816 },
-	{ "ad7817", ID_AD7817 },
-	{ "ad7818", ID_AD7818 },
+	{ .name = "ad7816", .driver_data = ID_AD7816 },
+	{ .name = "ad7817", .driver_data = ID_AD7817 },
+	{ .name = "ad7818", .driver_data = ID_AD7818 },
 	{ }
 };
 
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 4359b358e0e5..f95c5365cd03 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -465,10 +465,10 @@ static int ad9834_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ad9834_id[] = {
-	{"ad9833", ID_AD9833},
-	{"ad9834", ID_AD9834},
-	{"ad9837", ID_AD9837},
-	{"ad9838", ID_AD9838},
+	{ .name = "ad9833", .driver_data = ID_AD9833 },
+	{ .name = "ad9834", .driver_data = ID_AD9834 },
+	{ .name = "ad9837", .driver_data = ID_AD9837 },
+	{ .name = "ad9838", .driver_data = ID_AD9838 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad9834_id);
-- 
2.47.3

