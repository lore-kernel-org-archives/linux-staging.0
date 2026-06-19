Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A02BDC32
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884521; cv=none; b=lNuUSqVWOqRlFYeH/EV2lakUpYWI6HUvQSRo2693CEVu8JYG3Yb40IhmW+qlB83VSzmeZ6f1xajBNg4B9B/qtFGq3ugjq7Y7hIIazJv6AQ1XoE5f0So5ubG3MsxNIhDBkU+n0PO5e1p6CqoauunhmkkUVGYB1eqDE8fvTYzfRCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884521; c=relaxed/simple;
	bh=rzyItKitX1xfdqxIj4i5MGbTVUb24C8vStiJf51sFK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bkb0NrnK1ENuhMYQb2Bjw/DBNQyGzRrcw/ZHrzQi4FQonGa84Feb/lxGjGfskJErkwvWBGdMCOQiZnjbIgreV4a6y8gd2AEoX5m/E5XVdqIIe/DFf3QsjjVxR4Sx9a3A4gv0RJ/+eVsWAJOuUV04bJJDv1c2Xk1l7UGOeq0BcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YjZkbOle; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YjZkbOle"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso17171425e9.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781884511; x=1782489311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWrlTknTS3aWmoT0Y0dSpEuXznmrIxwbC2fvomDiC3A=;
        b=YjZkbOlew2iWfPrbF4smEfuBlw890172L6VXiPzC5dMsg+ZZfh5IRD1NcYntpsUMg2
         ZcdvN1xNwEA83kDgej6/ni5OxO0nkE3nsMG27Ib/qV6M36xF+VnB2Cu3A4MzLuzR5hAF
         HRsJyA/Goj90OSkZPv/0eKaaiTUQEuZOXWmoV4dUhyNwcsY5OXxkMfMRV1eFk5W/csra
         QcIXTJxMdtNMJGJtYO3EWKbf7kpLfzP2rBSOjTSLMlvxuIrEGOGMoYXyxPZFGCH4HphN
         +/pHJ3SN2svv2kWlBtmeSvbu9/mK1VJrgd11QYJSqcdH4q2b2gUVSM4yRKfMftUCMOSs
         nPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781884511; x=1782489311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWrlTknTS3aWmoT0Y0dSpEuXznmrIxwbC2fvomDiC3A=;
        b=hnd4YWZGr3UwvvAjci4d/ESk5wMM9kmUoKFvjZwPHRcupuKWzPa81mGbTJSkJtpSjq
         /E65osrgRSGRlOZ+oVlyaIEXv6dxOheGfCUWYS9iYH7ObvdZTPKQxDUrBcYWoXl5WlPx
         BfTX2CbEOz9JIEf1KZWjB8U0p0RvZwnqapy5ejZPzkifNyonvFXqmfX1TNhSD9GtDQSH
         u+yrbO3qEqivbwJ6iOryGN45yP122HoNIqTIpEycBO+clPqbq2lqEuBdEJgBEv3G9A7C
         bBtrNzNijzIVn+cjcFdo7/nVFPD97hM246w5oFWFfDHXtj2G3NjdH+5Y5PgDGP5fWtv1
         Oo1w==
X-Forwarded-Encrypted: i=1; AFNElJ8Nihfdv8jWV03ZuYd1zYvn8w12JBOFIkhtImRg6GnULTvzTMwKDQ2bpUFAWV2xclq/CufRPQbPeW1FdAMs@lists.linux.dev
X-Gm-Message-State: AOJu0YwxVKvkmn5b4vNS8Exk/hndEVPj+0wUkyqF/4eGHdkw16Kzaj9Z
	y0ucPeS12o9WH3k39EO0CXBsijHbMzVFaBuEQVL8PBn7XTNpw8Sm1/GTJL1wYe8fw7U=
X-Gm-Gg: AfdE7cl8263ijlXOa7J7YNOOy0p4tT30W7jKm8YhATqTIt2L0ZvSMQmD5Xf6RxYTVby
	75sZHOqDLWW7hPlfGY80AyNabOHA/L9ss0mMtLmCpt0Z4QCFz0QwhZ2r9pr3YVgIJxqAgNXDyP0
	5Nci9nOh6WKAopQY/Y0pYThbET1vpnpoegn+Lxe55QA2DnndvkQ4mDutUxJlwf3BgMqQwKhO2eY
	MJoGb3BQ+PXEi0Xj5aRfS1WrbtxJUYse9k77eqIMy2ZtlVoLzMsH9AzFEjyQT568KUna7G31EUL
	gIB19AbMUqnOsX+C5k25OmodEjjZPaNVMaiucInPsT0cxZNw7qleR9piQPPxKfeO19etobPtBVt
	FbZIuzfMYo7PcrjeKddqHPtyzergHBtr9VPyi17CuIruDKLifUPOv0Kj8aoVrALQwUVGZvOF3h2
	QmPBgLoE50MiBvQO+5mOPm32Z1xR9lwRUPmvShr19QAnNepz2kqX1brkdUCHh49ugt4zM1l7LxZ
	t0=
X-Received: by 2002:a05:600c:4fd6:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-49240a44a04mr56924665e9.14.1781884511454;
        Fri, 19 Jun 2026 08:55:11 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fce9590sm79979625e9.4.2026.06.19.08.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 08:55:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>,
	Kevin Tung <kevin.tung.openbmc@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux@analog.com,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Dan Robertson <dan@dlrobertson.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	chuguangqing <chuguangqing@inspur.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
	Alisa-Dariana Roman <alisa.roman@analog.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Renato Lui Geh <renatogeh@gmail.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	Marius Cristea <marius.cristea@microchip.com>,
	Kent Gustavsson <kent@minoris.se>,
	Kurt Borja <kuurtb@gmail.com>,
	=?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Rodrigo Alencar <rodrigo.alencar@analog.com>,
	Gustavo Silva <gustavograzs@gmail.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Anshul Dalal <anshulusr@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Ijano <andrew.ijano@gmail.com>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	Colin Ian King <colin.i.king@gmail.com>,
	David Jander <david@protonic.nl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Gabriel Rondon <grondon@gmail.com>,
	David Marinovic <david.marinovic@pupin.rs>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Shi Hao <i.shihao.999@gmail.com>,
	=?utf-8?q?Rahman_Mahmutovi=C4=87?= <mahmutovicrahman5@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/13] iio: Use named initializers for device_id structures
Date: Fri, 19 Jun 2026 17:54:28 +0200
Message-ID: <cover.1781883685.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11695; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rzyItKitX1xfdqxIj4i5MGbTVUb24C8vStiJf51sFK4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqNWY077mz+IneYUxYuaLpYax6i5fkl0MlbjCq/ twUo8BMy+eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajVmNAAKCRCPgPtYfRL+ Tr2LCACm/YMyB8WhTFr6LRRdNciD+nrrFtcRo9T3TDmpK5UYOkk5HB6A0pFYp94gVfx45pAEsE8 bvIH8R2YT694urLQDuUp9OI1/XT2zQ7w1TBLeR88+7+zRh9BY0NZhrqUALEoK15Cky4MOC0isEP 6mVdmL/pgZBTZgbzGbTiBWnMIUfoJQWDTgvaZDhp9yQQxyuUfo61HzV4ZK8+fcn5m0PopH42m/t ckkXQcpdQB0QQCsmkCGXqHISYf5U99ZdseIINwkpyjxsDozWUYVyYWa4VC8qMY2B9WCbI8lnJwK wF8SrfUH11cXKZ4o6yp+ZK8NXpkuF3UZ8c1TCFTRyU5C/CFz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the first patch is a follow up for making iio's i2c_device_id arrays use
named initializers. The two drivers adapted in it were missed before
because they were not yet in the tree I used to prepare the patch. The
remainder is a similar adaption for spi_device_id. Instead of adapting
arrays with a single entry and .driver_data, rework these to not use
.driver_data.

The ad9523 driver is a bit special here. It can only probe devices that
have platform data. A device instantiated using dt never has platform
data, so this driver only works for boards registering the device using
a spi_board_info struct. There is no such board, and there never was
one. So an alternative is to just drop this driver?!

I was unsure if I should post the staging patches in a separate series,
I hope it's fine to include them here.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (13):
  iio: Initialize i2c_device_id arrays using member names (part 2)
  iio: adc: ti-tsc2046: Simplify device abstraction
  iio: adc: ti-tsc2046: Drop unused member from private data
  iio: adc: max1241: Simplify device abstraction
  iio: dac: max5522: Simplify device abstraction
  iio: frequency: ad9523: Simplify driver a bit
  iio: imu: adis16550: Simplify device abstraction
  iio: magnetometer: hmc5843: Simplify device abstraction
  iio: accel: bmc150: Explicitly set spi .driver_data
  iio: Drop unused assignment of spi_device_id driver data
  iio: Initialize spi_device_id arrays using member names
  staging: iio: Drop unused assignment of spi_device_id driver data
  staging: iio: Initialize spi_device_id arrays using member names

 drivers/iio/accel/adxl345_spi.c               |   4 +-
 drivers/iio/accel/adxl355_spi.c               |   4 +-
 drivers/iio/accel/adxl367_spi.c               |   2 +-
 drivers/iio/accel/adxl372_spi.c               |   4 +-
 drivers/iio/accel/adxl380_spi.c               |   8 +-
 drivers/iio/accel/bma220_spi.c                |   2 +-
 drivers/iio/accel/bma400_spi.c                |   2 +-
 drivers/iio/accel/bmc150-accel-spi.c          |  18 +--
 drivers/iio/accel/bmi088-accel-spi.c          |   6 +-
 drivers/iio/accel/fxls8962af-spi.c            |   4 +-
 drivers/iio/accel/kxsd9-spi.c                 |   2 +-
 drivers/iio/accel/mma7455_spi.c               |   4 +-
 drivers/iio/accel/sca3000.c                   |   8 +-
 drivers/iio/accel/sca3300.c                   |   4 +-
 drivers/iio/accel/st_accel_spi.c              |  40 +++---
 drivers/iio/adc/ad4000.c                      |  62 ++++-----
 drivers/iio/adc/ad4030.c                      |  14 +-
 drivers/iio/adc/ad4080.c                      |  22 +--
 drivers/iio/adc/ad4130.c                      |  12 +-
 drivers/iio/adc/ad4134.c                      |   2 +-
 drivers/iio/adc/ad4170-4.c                    |   6 +-
 drivers/iio/adc/ad4851.c                      |  18 +--
 drivers/iio/adc/ad7091r8.c                    |   6 +-
 drivers/iio/adc/ad7124.c                      |   4 +-
 drivers/iio/adc/ad7173.c                      |  26 ++--
 drivers/iio/adc/ad7191.c                      |   2 +-
 drivers/iio/adc/ad7192.c                      |  10 +-
 drivers/iio/adc/ad7266.c                      |   4 +-
 drivers/iio/adc/ad7280a.c                     |   2 +-
 drivers/iio/adc/ad7292.c                      |   2 +-
 drivers/iio/adc/ad7298.c                      |   2 +-
 drivers/iio/adc/ad7380.c                      |  36 ++---
 drivers/iio/adc/ad7476.c                      |  60 ++++----
 drivers/iio/adc/ad7606_spi.c                  |  22 +--
 drivers/iio/adc/ad7766.c                      |  12 +-
 drivers/iio/adc/ad7768-1.c                    |   8 +-
 drivers/iio/adc/ad7780.c                      |   8 +-
 drivers/iio/adc/ad7791.c                      |  10 +-
 drivers/iio/adc/ad7793.c                      |  18 +--
 drivers/iio/adc/ad7887.c                      |   2 +-
 drivers/iio/adc/ad7923.c                      |  14 +-
 drivers/iio/adc/ad7944.c                      |   6 +-
 drivers/iio/adc/ad7949.c                      |   6 +-
 drivers/iio/adc/ad9467.c                      |  14 +-
 drivers/iio/adc/ade9000.c                     |   2 +-
 drivers/iio/adc/hi8435.c                      |   2 +-
 drivers/iio/adc/max1027.c                     |  12 +-
 drivers/iio/adc/max1118.c                     |   6 +-
 drivers/iio/adc/max11205.c                    |   4 +-
 drivers/iio/adc/max11410.c                    |   2 +-
 drivers/iio/adc/max1241.c                     |   8 +-
 drivers/iio/adc/max14001.c                    |   4 +-
 drivers/iio/adc/mcp320x.c                     |  26 ++--
 drivers/iio/adc/mcp3564.c                     |  24 ++--
 drivers/iio/adc/mcp3911.c                     |  14 +-
 drivers/iio/adc/rohm-bd79112.c                |   2 +-
 drivers/iio/adc/rtq6056.c                     |   4 +-
 drivers/iio/adc/ti-adc0832.c                  |   8 +-
 drivers/iio/adc/ti-adc084s021.c               |   2 +-
 drivers/iio/adc/ti-adc108s102.c               |   2 +-
 drivers/iio/adc/ti-adc12138.c                 |   6 +-
 drivers/iio/adc/ti-adc128s052.c               |  24 ++--
 drivers/iio/adc/ti-adc161s626.c               |   4 +-
 drivers/iio/adc/ti-ads1018.c                  |   4 +-
 drivers/iio/adc/ti-ads124s08.c                |   4 +-
 drivers/iio/adc/ti-ads1298.c                  |   2 +-
 drivers/iio/adc/ti-ads131e08.c                |   6 +-
 drivers/iio/adc/ti-ads131m02.c                |  10 +-
 drivers/iio/adc/ti-ads7950.c                  |  24 ++--
 drivers/iio/adc/ti-ads8688.c                  |   4 +-
 drivers/iio/adc/ti-lmp92064.c                 |   2 +-
 drivers/iio/adc/ti-tlc4541.c                  |   4 +-
 drivers/iio/adc/ti-tsc2046.c                  |  12 +-
 drivers/iio/addac/ad74115.c                   |   2 +-
 drivers/iio/amplifiers/ad8366.c               |  26 ++--
 drivers/iio/amplifiers/ada4250.c              |   2 +-
 drivers/iio/chemical/bme680_spi.c             |   2 +-
 drivers/iio/chemical/ens160_spi.c             |   2 +-
 drivers/iio/dac/ad3530r.c                     |   8 +-
 drivers/iio/dac/ad5064.c                      |  32 ++---
 drivers/iio/dac/ad5360.c                      |  16 +--
 drivers/iio/dac/ad5380.c                      |  32 ++---
 drivers/iio/dac/ad5446-spi.c                  |  62 ++++-----
 drivers/iio/dac/ad5449.c                      |  14 +-
 drivers/iio/dac/ad5504.c                      |   4 +-
 drivers/iio/dac/ad5624r_spi.c                 |  12 +-
 drivers/iio/dac/ad5706r.c                     |   2 +-
 drivers/iio/dac/ad5755.c                      |  10 +-
 drivers/iio/dac/ad5758.c                      |   2 +-
 drivers/iio/dac/ad5761.c                      |   8 +-
 drivers/iio/dac/ad5764.c                      |   8 +-
 drivers/iio/dac/ad5766.c                      |   4 +-
 drivers/iio/dac/ad5770r.c                     |   2 +-
 drivers/iio/dac/ad5791.c                      |  10 +-
 drivers/iio/dac/ad7293.c                      |   2 +-
 drivers/iio/dac/ad7303.c                      |   2 +-
 drivers/iio/dac/ad8801.c                      |   4 +-
 drivers/iio/dac/ad9739a.c                     |   2 +-
 drivers/iio/dac/ltc1660.c                     |   4 +-
 drivers/iio/dac/ltc2632.c                     |  44 +++---
 drivers/iio/dac/ltc2664.c                     |   4 +-
 drivers/iio/dac/ltc2688.c                     |   2 +-
 drivers/iio/dac/max22007.c                    |   2 +-
 drivers/iio/dac/max5522.c                     |  31 +----
 drivers/iio/dac/mcp4821.c                     |  12 +-
 drivers/iio/dac/mcp4922.c                     |   8 +-
 drivers/iio/dac/rohm-bd79703.c                |   8 +-
 drivers/iio/dac/ti-dac082s085.c               |  12 +-
 drivers/iio/dac/ti-dac7311.c                  |   6 +-
 drivers/iio/dac/ti-dac7612.c                  |   2 +-
 drivers/iio/filter/admv8818.c                 |   2 +-
 drivers/iio/frequency/ad9523.c                |   3 +-
 drivers/iio/frequency/adf4350.c               |   4 +-
 drivers/iio/frequency/adf4371.c               |   4 +-
 drivers/iio/frequency/adf4377.c               |   4 +-
 drivers/iio/frequency/admv1013.c              |   2 +-
 drivers/iio/frequency/admv1014.c              |   2 +-
 drivers/iio/frequency/adrf6780.c              |   2 +-
 drivers/iio/gyro/adis16080.c                  |   4 +-
 drivers/iio/gyro/adis16136.c                  |   8 +-
 drivers/iio/gyro/adis16260.c                  |  12 +-
 drivers/iio/gyro/adxrs450.c                   |   4 +-
 drivers/iio/gyro/bmg160_spi.c                 |   7 +-
 drivers/iio/gyro/fxas21002c_spi.c             |   2 +-
 drivers/iio/gyro/st_gyro_spi.c                |  18 +--
 drivers/iio/health/afe4403.c                  |   2 +-
 drivers/iio/humidity/hts221_spi.c             |   2 +-
 drivers/iio/imu/adis16400.c                   |  30 ++--
 drivers/iio/imu/adis16460.c                   |   2 +-
 drivers/iio/imu/adis16475.c                   |  54 ++++----
 drivers/iio/imu/adis16480.c                   |  40 +++---
 drivers/iio/imu/adis16550.c                   |   9 +-
 drivers/iio/imu/bmi160/bmi160_spi.c           |   4 +-
 drivers/iio/imu/bmi270/bmi270_spi.c           |   4 +-
 drivers/iio/imu/bmi323/bmi323_spi.c           |   2 +-
 drivers/iio/imu/fxos8700_spi.c                |   2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_spi.c   |  14 +-
 .../iio/imu/inv_icm45600/inv_icm45600_spi.c   |  16 +--
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c     |  34 ++---
 drivers/iio/imu/smi240.c                      |   2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |  48 +++----
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c   |   4 +-
 drivers/iio/light/st_uvis25_spi.c             |   2 +-
 drivers/iio/magnetometer/bmc150_magn_spi.c    |   6 +-
 drivers/iio/magnetometer/hmc5843_spi.c        |   6 +-
 drivers/iio/magnetometer/mmc5983.c            |   2 +-
 drivers/iio/magnetometer/st_magn_spi.c        |  12 +-
 drivers/iio/potentiometer/max5481.c           |   8 +-
 drivers/iio/potentiometer/max5487.c           |   6 +-
 drivers/iio/potentiometer/mcp41010.c          |  12 +-
 drivers/iio/potentiometer/mcp4131.c           | 128 +++++++++---------
 drivers/iio/potentiometer/x9250.c             |   4 +-
 drivers/iio/pressure/abp2030pa_spi.c          |   2 +-
 drivers/iio/pressure/bmp280-spi.c             |  14 +-
 drivers/iio/pressure/hsc030pa_spi.c           |   2 +-
 drivers/iio/pressure/mpl115_spi.c             |   2 +-
 drivers/iio/pressure/mprls0025pa_spi.c        |   2 +-
 drivers/iio/pressure/ms5611_spi.c             |   4 +-
 drivers/iio/pressure/st_pressure_spi.c        |  24 ++--
 drivers/iio/pressure/zpa2326_spi.c            |   2 +-
 drivers/iio/proximity/as3935.c                |   2 +-
 drivers/iio/resolver/ad2s1200.c               |   4 +-
 drivers/iio/resolver/ad2s1210.c               |   2 +-
 drivers/iio/resolver/ad2s90.c                 |   2 +-
 drivers/iio/temperature/ltc2983.c             |  10 +-
 drivers/iio/temperature/max31856.c            |   2 +-
 drivers/iio/temperature/max31865.c            |   2 +-
 drivers/iio/temperature/maxim_thermocouple.c  |  18 +--
 drivers/staging/iio/adc/ad7816.c              |   6 +-
 drivers/staging/iio/addac/adt7316-spi.c       |  13 +-
 drivers/staging/iio/frequency/ad9832.c        |   4 +-
 drivers/staging/iio/frequency/ad9834.c        |   8 +-
 172 files changed, 886 insertions(+), 927 deletions(-)


base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
-- 
2.47.3

