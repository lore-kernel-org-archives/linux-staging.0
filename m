Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C32BA27
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso1005171f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306155; x=1695910955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9YCZ78k5Zg5KKitr5PpHsZw/Rz0qYyLXQR2L135bIs=;
        b=djDTXq2dhfTQvCJtN6wGtMWQ/p2orx+NQtR4qNoU6tFsa9MmFGHoDeFNmtaMBHnC0c
         Uqcm5s5VAWoU3GRghd3kYHdh2ZoUHV1elG74OL7Tgia8/CqidM+mrELCuz3h+8q+qgdo
         gbsdrMQ5n0okGaUQJS8Q2GFVUsa9DgxCTQKynBahGasdXKhDTjlGwKkMQyjpLDjDZumn
         MaD2QSMneuRpdhLxaanNeByCWoXmAq3wevWtK9tloCCajXcxnO/6rpmxoYO7CzU5KmSV
         lj4n7Cx3M1NNSROsqHz01oKMjpSIjdPckmD8tgBfBFlv3XFlpaCyChFJ0CEvz0B7zQd7
         TT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306155; x=1695910955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9YCZ78k5Zg5KKitr5PpHsZw/Rz0qYyLXQR2L135bIs=;
        b=OzHwvIMcSEM5WSyktmN1SvgqHuqAmDAbkE97w6b6jxPh6hHw2HWT04BV9WVVencemA
         tNVPmFrzF4EwibSfm40TyOxAVYEiK8gxy2efx7OdMUDwgFeGU70HTwU6Qh03XfgeHNNP
         dcuB5/vh4I+GSeIiU4fY51v49zCjs54HQ6AV38yVT/33kwdyPr1dCHotZcfFGdvrsCPp
         B4bD3Xt+sdx2DXLIgRMrxBhsJ3tU5MSHfiRNBaZpaBGV2tbS9cUqmdqtR0xVLJB5NBgt
         GV3SwE/nCgGFqWckxt9OTiWimLfycCXDc42ypTgHHtWsstknNcuX70jn+Q0rMYP8dMQS
         g5IQ==
X-Gm-Message-State: AOJu0YxTEJy4BYUv2FC8PEJE0RVtqGEi1ROzNFLlG10ciydBIKKaUJvo
	cImdOvC9Qz8FgwNq5IRhvkBlJQ==
X-Google-Smtp-Source: AGHT+IFLOeeKjkZXzmrmyjj61SlCO4QtLumxRWkUp/uZ0wPGaqOzHFNXTE+bvD2TXSjNSCu16d/fHw==
X-Received: by 2002:adf:fe8e:0:b0:319:f9d6:a769 with SMTP id l14-20020adffe8e000000b00319f9d6a769mr5207822wrr.45.1695306155398;
        Thu, 21 Sep 2023 07:22:35 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [v2 04/19] staging: iio: resolver: ad2s1210: fix not restoring sample gpio in channel read
Date: Thu, 21 Sep 2023 09:19:32 -0500
Message-Id: <20230921141947.57784-7-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In theory, this code path should not be reachable because of the
previous switch statement. But just in case we should make sure we
are restoring the SAMPLE gpio to its original state before returning
in addition to releasing the mutex lock.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 84743e31261a..0bdd5a30d45d 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -510,8 +510,8 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		ret = IIO_VAL_INT;
 		break;
 	default:
-		mutex_unlock(&st->lock);
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
 
 error_ret:
-- 
2.34.1

