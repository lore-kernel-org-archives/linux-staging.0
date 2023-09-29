Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA1658A0
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:50 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-57b5ef5b947so7902194eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008349; x=1696613149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdyEj3wikWRAcNOtcWjzMUp/VXe76XnGqEiNgzZP6WM=;
        b=2EoqE7PlwnMWq+YAO/8lQQzedUUHy8KOVAy8AuIFisPNf/8H6LH8sCwF+PT6OaVNCr
         OWSV6nJbp47nA2vmY0d5QYlI47ugkGGSmpNyC72V+2UgX6XyomeHJdaO7VLoCpYUtFqE
         NobZCadwwfiW+bJL8fFrQask4lzJrx5oUHB9q0gXNwVaSrBtItAAPBft8JoL65VxhBDZ
         JetsApIrJJk2Or2mwzq1wOU4qCU0wQGOicjaMtLjnm6GRwEeEjTn1hRRBcBq3F23cHti
         9+P0OZFXBe41+5Kpn1srRv1Hqq+exNM9iXSgN6ZCYaym0p86ZplnLE6ZvUW4dheUcZ2m
         uZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008349; x=1696613149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdyEj3wikWRAcNOtcWjzMUp/VXe76XnGqEiNgzZP6WM=;
        b=kyK3oMVm0rJ/q5M5g1Ki1tVGVI9xfV0pPAEaPJcPw3LhfaTAfM2w+UwWLRcnFMbrvm
         NaLH7TB+sjRfnXmKe2txIbkqdUjszeRehQE7VXZy56OYFYfdIvfdcP0r+JMsjG3hJSEo
         8rBVi45NLp9+1ZXNEU9CK/s7f10hy/FFwIWBOmu3ZLVsY7n6/r/FUTwWFDagajyvWK03
         2dfrM3BkN2pucj7HTR0hNLTrmDPGDjzNLihR0aondDCzzrKpEiXTmHIdsIf5/AcMyoQ4
         EoW/fHq+7VER2KRx1yrKE1LWg2h01DEDnybaKbllz/5XqoPLpio3w/6F1rNeGn5+ewHb
         fe+g==
X-Gm-Message-State: AOJu0YxiH5hdzlOu/xdhQfGy46xN25cJGUG20nfQiQgP5DjhSmdNAQ9H
	rTw0uHq1CLbcQ0+m9Te6wBqS5A==
X-Google-Smtp-Source: AGHT+IEdsrADh4nu4YW1a/z3YRqrcmH2BqYxTLsP/81uaD4TcborXfHuhbM/eSAh86i/ThqzYbreAw==
X-Received: by 2002:a4a:9c4d:0:b0:571:1fad:ebdb with SMTP id c13-20020a4a9c4d000000b005711fadebdbmr4938892ook.3.1696008349364;
        Fri, 29 Sep 2023 10:25:49 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:48 -0700 (PDT)
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
Subject: [PATCH v3 03/27] staging: iio: resolver: ad2s1210: remove call to spi_setup()
Date: Fri, 29 Sep 2023 12:23:08 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-3-fa4364281745@baylibre.com>
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

This removes the call to spi_setup() in the ad2s1210 driver.

Setting MODE_3 was incorrect. It should be MODE_1 but we can let the
device tree select this and avoid the need to call spi_setup().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* This is a new patch split out from "staging: iio: resolver: ad2s1210:
 fix probe"

 drivers/staging/iio/resolver/ad2s1210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 3f08b59f4e19..8fde08887f7f 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -683,8 +683,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 		return ret;
 
 	st->fclkin = spi->max_speed_hz;
-	spi->mode = SPI_MODE_3;
-	spi_setup(spi);
 	ad2s1210_initial(st);
 
 	return 0;

-- 
2.42.0

