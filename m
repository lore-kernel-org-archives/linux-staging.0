Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A1658A6
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:51 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57bb6b1f764so5820956eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008351; x=1696613151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7PDmHSczFeqgAzbimbZilruGj50u/2gIL6ZrFf0Suo=;
        b=gFon4jYoLrDHPa2feXeenz6skHwf+yyivozTqmMru5IpZXxDTTq10quO2oLAov+2n6
         Mp6I7PCqS7dk2cGVbbQE2rlCQuoJeyuJo3mOMuKXDbhcoPi6329HIMMYnxBuG/ljljo3
         DcduDnIXBg4WR/uo+Ifx/hhvoWUqvDLNNsvDBuJgLsOsMasL3HcRA3sTHztDT9NB43qH
         KTNZMda5Amp7gu344u+zyi9EjUytb9jMMOKJV6wm1ql/4BcrM7igYPlHBl1PMfq5Ruzv
         FKg69roGCSzrQpnToob13qo9NMnWnsvkUif+FmRbspFhgSvVEyY5sSeJBaZBUiYFlR9G
         dBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008351; x=1696613151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7PDmHSczFeqgAzbimbZilruGj50u/2gIL6ZrFf0Suo=;
        b=H84SKatD8rzLbt4X7+w8OSzOudCzpExmXteSbbe+D81bUJBGHKuXUTURZ/vuU9pHXV
         zWp1kVhy37K2WrLAIy/N6yZ+I35L/YDGkGPAc6gNdVwcCmDlPwjAhEguLpA2Slogj4ID
         csx+/ij1hHaWN2k6n26/XWPBYgpAuWEsKi78jorHIUAxIAFk3h9IgvjLvjexi3nFYp+O
         00+wkm+/MMOcRvqkEvt3QzRKJotXzlNyzNb35fORoFzOzBOr8e2G8pSu0F9FtfOGx+Fv
         fnPbihnQeNhQd1g37Z3zLhfnLfhGD2juq8e0xA8sC6R6rUwRJrZVXf2j8Y0GolhTy2hH
         2rbA==
X-Gm-Message-State: AOJu0YzsDYpsIgYRKg4eiLh3FELb3nOc4H3wuSwRD7WJkt5V2Lv0fyRF
	D1CEvkT1kiD+VHoaUzoLZoHhzA==
X-Google-Smtp-Source: AGHT+IHxogutDZ1XLOIzr9/nOTx5KhbYFs+7hKsrWe7PtJOi6WwkLjfxiyyCL5MSgpTSmN6+IIr3og==
X-Received: by 2002:a4a:7319:0:b0:57b:3a07:181c with SMTP id s25-20020a4a7319000000b0057b3a07181cmr4656794ooc.9.1696008351082;
        Fri, 29 Sep 2023 10:25:51 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:50 -0700 (PDT)
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
Subject: [PATCH v3 05/27] staging: iio: resolver: ad2s1210: remove spi_set_drvdata()
Date: Fri, 29 Sep 2023 12:23:10 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-5-fa4364281745@baylibre.com>
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

Since we never call spi_get_drvdata(), we can remove spi_set_drvdata().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* This is a new patch split out from "staging: iio: resolver: ad2s1210:
 fix probe"

 drivers/staging/iio/resolver/ad2s1210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index b5e071d7c5fd..28015322f562 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -659,8 +659,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
 
-	spi_set_drvdata(spi, indio_dev);
-
 	mutex_init(&st->lock);
 	st->sdev = spi;
 	st->hysteresis = true;

-- 
2.42.0

