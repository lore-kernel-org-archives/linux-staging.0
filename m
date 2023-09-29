Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC02658A2
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:50 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57b9231e91dso6636515eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008350; x=1696613150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZs7RCyHEDyjwo9BM8JVP9aWGPKGhSjAg7KPK55tj0w=;
        b=xpUXa24VO9O8wp/jm9yqTbeu6dvjey5AdU8SDiPrfJC6jli2PafUvZ//j4sG/RY2IN
         VaXdQg16DuXhg9OfgemKGAwty3TtnrzKFXtxc/qcEaRrBPVZpRDrxfqNRRJvqHQxL+lt
         cafxqRZw7LZBJseC4od26vPS98HN6RWy/UTsivIz1Gnd0Py/6tPVV1xUC4y7NZg4/V9F
         nQItJB1bWvmMQXTGJMqK3etFO++awV/MhsjeMNiJQNMBxZci6Hcj4PD4Ay1Wb3vIBGZ/
         8WXF+8KiLAyYCKkJdaumkjMYRrAEtbIAIaiq8usm3ipEE1UkKHrnLSFmDFZKXu2Dxr51
         un9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008350; x=1696613150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZs7RCyHEDyjwo9BM8JVP9aWGPKGhSjAg7KPK55tj0w=;
        b=vp/fU2xNbJqL6oONz3dY5v6pfpVQ0+Yb+EH65+THhU53yhavt0id7cLoUfAxFZ8v85
         8vftPyCyMDLqbp+98h0CCQViagQ5hErmkrYHXWz1r+/cLx78ibnhbXEyqfHwvKvaUovz
         mtKYXmrVD0LqhlsN+dViHiAw91K97BaJvHWAxLsllNtZhe5VFPMn3r8zTL+zh3XNN9Rh
         3pqTCcsSqixSnQjv3GHPvM2Ku2mgRSm6bvKk6zj9nkFrhWIKn7pFOsUMwD3D2jMHEngG
         iRvQaJ2E1hCqQ6V8b4MJWGexkgugjJ3CCHUpWbtdvE3ZCXMRsXxss+nHQi/WWnFUckuq
         DuNg==
X-Gm-Message-State: AOJu0YzdfeEuyLQd8AmjH2t5d1Q7bdIUO3IwKNyR9fEGUXhOBXY7MYIb
	CJtpBUcvdrOwp5ICpDEpWpGxtlxfEYj0t3mpQvBhxA==
X-Google-Smtp-Source: AGHT+IEV4b51ilWN++n/0+rU+iGp7VHyBLZBDmjeuTWYmnl26MZ3t8X5p2iE4s9s18GyLz1K/SQJLg==
X-Received: by 2002:a4a:9257:0:b0:57b:63a6:306d with SMTP id g23-20020a4a9257000000b0057b63a6306dmr5249640ooh.6.1696008350202;
        Fri, 29 Sep 2023 10:25:50 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 04/27] staging: iio: resolver: ad2s1210: check return of ad2s1210_initial()
Date: Fri, 29 Sep 2023 12:23:09 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-4-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

This adds a check to the return value of ad2s1210_initial() since it
can fail. The call is also moved before devm_iio_device_register() so
that we don't have to unregister the device if it fails.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* This is a new patch split out from "staging: iio: resolver: ad2s1210:
 fix probe"

 drivers/staging/iio/resolver/ad2s1210.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 8fde08887f7f..b5e071d7c5fd 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -672,6 +672,10 @@ static int ad2s1210_probe(struct spi_device *spi)
 	if (ret < 0)
 		return ret;
 
+	ret = ad2s1210_initial(st);
+	if (ret < 0)
+		return ret;
+
 	indio_dev->info = &ad2s1210_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = ad2s1210_channels;
@@ -683,7 +687,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 		return ret;
 
 	st->fclkin = spi->max_speed_hz;
-	ad2s1210_initial(st);
 
 	return 0;
 }

-- 
2.42.0

