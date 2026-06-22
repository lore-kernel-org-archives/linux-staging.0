Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680892D8DD6
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128545; cv=none; b=DtcTNjLJZ2WLZ8eGZk2itKA960JowQyFmgUyS1p3XCqCYTdbcrteva58gG8Bl9XrPncyhhqSv7dNquSYvom+De18zu7xE4bjS2Kfq2Zitb2JH7fTD0EOJ+KesjGlSrnf45vbABUmIKF3uVluPkCXLs+TNUA/Y1BUaw4USSTjOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128545; c=relaxed/simple;
	bh=iNiAwTpmUhRVEHGowhEYrdtCTJBScy3M/LbgJyVhEB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr+rC4Z5GvogRsukT4C24UkerdfNDbcIGUWyDvSnWLPDJe3NOROQqd1RerRgRXv/OQ5oj9PlgLoINulhy2CIgfx4yzKFcFiJH0u5l/7WPVhZeEXd8pSp0aMmkkXeLvSWEBWUOMNicvz8ErR1p/vuWEhLmH1Dq2B9uHTr4/uLxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK3QBjgY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK3QBjgY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso46298695e9.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782128542; x=1782733342; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ah+RD1ZpM4wkIEe5im3i4fEJL2JsIgz76ziskXB7jL0=;
        b=ZK3QBjgYwdmQRXiDz5H18T8J5j2JjNuRow+ICnwyouO51TDqRy3r9y+n7sBR3aM1AL
         8NddijOYVc/2NSolnVncNiWIrVc+g9S5Skx2a01d1tGy8NP1SgiDAv3G8rzJgT+XnX6B
         Io2SNfGiosEnaHtwVtJAuaTR/pAi524/yzz3KWSi7s3kYU30FMpBp7jG+zEg+IYWLAZ5
         NBeuK0T+Pzd+h8K1Fu0Pp8ZUEu5NAWbSpD2UINsvNX9vKUiCcKPdjSpB86d8PkpGkivP
         bd11pHjjifjPGB0Gx9mykzAAMUKDGrZr4mmt/mHMmTz4UQMzOb5LXVlBHz3r8Srz3/fH
         o9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128542; x=1782733342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah+RD1ZpM4wkIEe5im3i4fEJL2JsIgz76ziskXB7jL0=;
        b=TgMF3iqStA7yzb/duKoiz0kazHjhsYP6+yUBL5lYLA5ZXh9xY2xEsLQJP7WrA1E3x7
         kVGWk8aDX6eSZrQHeb9GEiiYOCk7ZEuCcU4ZLp07V9yE06LBNBwnhqMpE04Xl1z/8wDA
         byw1jLoddMXvZ74wszlqymSsq6PNaI1sz3ZqYgPsaBI0AWTG/KIqAfU0sAmFAewpzi07
         sY/OzBpJ2lU9+eEckX6pWeFqPIlNM8+OoQW5f9r4l6gUoPF9VGLCBPc2A73X6P3hnBMb
         Rgr/T35K2+nEBPLGrVWDH1+i9bZFZXpCLTl1BhEgo9P1spqX71AAlsi26Gp8BHtCUh+4
         D3HA==
X-Forwarded-Encrypted: i=1; AFNElJ8gZ+hbMZyu91wBTVUGh/HyCuCHU6TUFwv1a97ihXfAV2h1susrhlAZ91GwDJyrrJChRVhqXMrMemqZUvNQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yya19WCxGgWav2gGiLa8xW/zLQ+zv/BrZqUxC2LLHOWKfkCsnho
	eEZ7JnmXOHq6WCKQGwDZLShW0SlmnaHEm/aVXXmWQFlmG7+Mya9JdAQm
X-Gm-Gg: AfdE7cnx4rwMqDPtdS3q2TLnwsca98QQLmE/mhc8P7/ZmAuxElnT7VTqEUYeY9RVciB
	tNUuksvBD4LtRmHIue/1fOibZgFTRn7f/7LwY9TA4aA3aLvc+SOmfAKmcO7ANY/Q1gJtZJbD0e9
	pNmYk/4Fy8lUSoJtDQ2VMOjqfufL89IZ6XijLVf5O8oUo/vEHWhly2xynWYhgRasciwDeEDgfBA
	h3gYAbcFucch1fJDoukBEgby9lbdtvvR8uW9YPCHktRRfhQTunqFGDXauRRgPFcBs5Qq5xkFoBQ
	/MYu6tcfcd/8EvIkyZnnF+EwXb6lYzqr4MK32h5W8T0YPSOt9c0C/MPwIVAxGtFDA92JVofRyy1
	ytRoeWF2HAjEUXdyFvwtYiSMgC3pEgSyYE7utiO60QK6ggysbWsSwcQAe4Gn4iZp0XTZNNvdxWA
	Om3vNH
X-Received: by 2002:a05:600c:1f8c:b0:492:4889:3d18 with SMTP id 5b1f17b1804b1-49248893e53mr141849515e9.9.1782128541360;
        Mon, 22 Jun 2026 04:42:21 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494496cdsm191513945e9.10.2026.06.22.04.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:42:20 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:43:21 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Vladislav Kulikov <vlad.kulikov.c@gmail.com>, 
	Kevin Tung <kevin.tung.openbmc@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	linux@analog.com, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Petre Rodan <petre.rodan@subdimension.ro>, Dan Robertson <dan@dlrobertson.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Dragos Bogdan <dragos.bogdan@analog.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, chuguangqing <chuguangqing@inspur.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Andrew Davis <afd@ti.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Ramona Gradinariu <ramona.gradinariu@analog.com>, Esteban Blanc <eblanc@baylibre.com>, 
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>, Alisa-Dariana Roman <alisa.roman@analog.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Renato Lui Geh <renatogeh@gmail.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>, Marius Cristea <marius.cristea@microchip.com>, 
	Kent Gustavsson <kent@minoris.se>, Kurt Borja <kuurtb@gmail.com>, 
	Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Rodrigo Alencar <rodrigo.alencar@analog.com>, 
	Gustavo Silva <gustavograzs@gmail.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Janani Sunil <janani.sunil@analog.com>, Anshul Dalal <anshulusr@gmail.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Alex Lanzano <lanzano.alex@gmail.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Remi Buisson <remi.buisson@tdk.com>, 
	Herve Codina <herve.codina@bootlin.com>, Andreas Klinger <ak@it-klinger.de>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Andrew Ijano <andrew.ijano@gmail.com>, 
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stepan Ionichev <sozdayvek@gmail.com>, Sam Daly <sam@samdaly.ie>, 
	Colin Ian King <colin.i.king@gmail.com>, David Jander <david@protonic.nl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Gabriel Rondon <grondon@gmail.com>, 
	David Marinovic <david.marinovic@pupin.rs>, Lukas Schmid <lukas.schmid@netcube.li>, 
	Shi Hao <i.shihao.999@gmail.com>, Rahman =?utf-8?Q?Mahmutovi=C4=87?= <mahmutovicrahman5@gmail.com>, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 00/13] iio: Use named initializers for device_id
 structures
Message-ID: <ajkflUnWXSWPRegL@nsa>
References: <cover.1781883685.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1781883685.git.u.kleine-koenig@baylibre.com>

On Fri, Jun 19, 2026 at 05:54:28PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> the first patch is a follow up for making iio's i2c_device_id arrays use
> named initializers. The two drivers adapted in it were missed before
> because they were not yet in the tree I used to prepare the patch. The
> remainder is a similar adaption for spi_device_id. Instead of adapting
> arrays with a single entry and .driver_data, rework these to not use
> .driver_data.
> 
> The ad9523 driver is a bit special here. It can only probe devices that
> have platform data. A device instantiated using dt never has platform
> data, so this driver only works for boards registering the device using
> a spi_board_info struct. There is no such board, and there never was
> one. So an alternative is to just drop this driver?!
> 
> I was unsure if I should post the staging patches in a separate series,
> I hope it's fine to include them here.
> 
> Best regards
> Uwe
> 

Tend to agree with Andy on the squash. Not a big deal to me though.
Hence:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> Uwe Kleine-König (The Capable Hub) (13):
>   iio: Initialize i2c_device_id arrays using member names (part 2)
>   iio: adc: ti-tsc2046: Simplify device abstraction
>   iio: adc: ti-tsc2046: Drop unused member from private data
>   iio: adc: max1241: Simplify device abstraction
>   iio: dac: max5522: Simplify device abstraction
>   iio: frequency: ad9523: Simplify driver a bit
>   iio: imu: adis16550: Simplify device abstraction
>   iio: magnetometer: hmc5843: Simplify device abstraction
>   iio: accel: bmc150: Explicitly set spi .driver_data
>   iio: Drop unused assignment of spi_device_id driver data
>   iio: Initialize spi_device_id arrays using member names
>   staging: iio: Drop unused assignment of spi_device_id driver data
>   staging: iio: Initialize spi_device_id arrays using member names
> 
>  drivers/iio/accel/adxl345_spi.c               |   4 +-
>  drivers/iio/accel/adxl355_spi.c               |   4 +-
>  drivers/iio/accel/adxl367_spi.c               |   2 +-
>  drivers/iio/accel/adxl372_spi.c               |   4 +-
>  drivers/iio/accel/adxl380_spi.c               |   8 +-
>  drivers/iio/accel/bma220_spi.c                |   2 +-
>  drivers/iio/accel/bma400_spi.c                |   2 +-
>  drivers/iio/accel/bmc150-accel-spi.c          |  18 +--
>  drivers/iio/accel/bmi088-accel-spi.c          |   6 +-
>  drivers/iio/accel/fxls8962af-spi.c            |   4 +-
>  drivers/iio/accel/kxsd9-spi.c                 |   2 +-
>  drivers/iio/accel/mma7455_spi.c               |   4 +-
>  drivers/iio/accel/sca3000.c                   |   8 +-
>  drivers/iio/accel/sca3300.c                   |   4 +-
>  drivers/iio/accel/st_accel_spi.c              |  40 +++---
>  drivers/iio/adc/ad4000.c                      |  62 ++++-----
>  drivers/iio/adc/ad4030.c                      |  14 +-
>  drivers/iio/adc/ad4080.c                      |  22 +--
>  drivers/iio/adc/ad4130.c                      |  12 +-
>  drivers/iio/adc/ad4134.c                      |   2 +-
>  drivers/iio/adc/ad4170-4.c                    |   6 +-
>  drivers/iio/adc/ad4851.c                      |  18 +--
>  drivers/iio/adc/ad7091r8.c                    |   6 +-
>  drivers/iio/adc/ad7124.c                      |   4 +-
>  drivers/iio/adc/ad7173.c                      |  26 ++--
>  drivers/iio/adc/ad7191.c                      |   2 +-
>  drivers/iio/adc/ad7192.c                      |  10 +-
>  drivers/iio/adc/ad7266.c                      |   4 +-
>  drivers/iio/adc/ad7280a.c                     |   2 +-
>  drivers/iio/adc/ad7292.c                      |   2 +-
>  drivers/iio/adc/ad7298.c                      |   2 +-
>  drivers/iio/adc/ad7380.c                      |  36 ++---
>  drivers/iio/adc/ad7476.c                      |  60 ++++----
>  drivers/iio/adc/ad7606_spi.c                  |  22 +--
>  drivers/iio/adc/ad7766.c                      |  12 +-
>  drivers/iio/adc/ad7768-1.c                    |   8 +-
>  drivers/iio/adc/ad7780.c                      |   8 +-
>  drivers/iio/adc/ad7791.c                      |  10 +-
>  drivers/iio/adc/ad7793.c                      |  18 +--
>  drivers/iio/adc/ad7887.c                      |   2 +-
>  drivers/iio/adc/ad7923.c                      |  14 +-
>  drivers/iio/adc/ad7944.c                      |   6 +-
>  drivers/iio/adc/ad7949.c                      |   6 +-
>  drivers/iio/adc/ad9467.c                      |  14 +-
>  drivers/iio/adc/ade9000.c                     |   2 +-
>  drivers/iio/adc/hi8435.c                      |   2 +-
>  drivers/iio/adc/max1027.c                     |  12 +-
>  drivers/iio/adc/max1118.c                     |   6 +-
>  drivers/iio/adc/max11205.c                    |   4 +-
>  drivers/iio/adc/max11410.c                    |   2 +-
>  drivers/iio/adc/max1241.c                     |   8 +-
>  drivers/iio/adc/max14001.c                    |   4 +-
>  drivers/iio/adc/mcp320x.c                     |  26 ++--
>  drivers/iio/adc/mcp3564.c                     |  24 ++--
>  drivers/iio/adc/mcp3911.c                     |  14 +-
>  drivers/iio/adc/rohm-bd79112.c                |   2 +-
>  drivers/iio/adc/rtq6056.c                     |   4 +-
>  drivers/iio/adc/ti-adc0832.c                  |   8 +-
>  drivers/iio/adc/ti-adc084s021.c               |   2 +-
>  drivers/iio/adc/ti-adc108s102.c               |   2 +-
>  drivers/iio/adc/ti-adc12138.c                 |   6 +-
>  drivers/iio/adc/ti-adc128s052.c               |  24 ++--
>  drivers/iio/adc/ti-adc161s626.c               |   4 +-
>  drivers/iio/adc/ti-ads1018.c                  |   4 +-
>  drivers/iio/adc/ti-ads124s08.c                |   4 +-
>  drivers/iio/adc/ti-ads1298.c                  |   2 +-
>  drivers/iio/adc/ti-ads131e08.c                |   6 +-
>  drivers/iio/adc/ti-ads131m02.c                |  10 +-
>  drivers/iio/adc/ti-ads7950.c                  |  24 ++--
>  drivers/iio/adc/ti-ads8688.c                  |   4 +-
>  drivers/iio/adc/ti-lmp92064.c                 |   2 +-
>  drivers/iio/adc/ti-tlc4541.c                  |   4 +-
>  drivers/iio/adc/ti-tsc2046.c                  |  12 +-
>  drivers/iio/addac/ad74115.c                   |   2 +-
>  drivers/iio/amplifiers/ad8366.c               |  26 ++--
>  drivers/iio/amplifiers/ada4250.c              |   2 +-
>  drivers/iio/chemical/bme680_spi.c             |   2 +-
>  drivers/iio/chemical/ens160_spi.c             |   2 +-
>  drivers/iio/dac/ad3530r.c                     |   8 +-
>  drivers/iio/dac/ad5064.c                      |  32 ++---
>  drivers/iio/dac/ad5360.c                      |  16 +--
>  drivers/iio/dac/ad5380.c                      |  32 ++---
>  drivers/iio/dac/ad5446-spi.c                  |  62 ++++-----
>  drivers/iio/dac/ad5449.c                      |  14 +-
>  drivers/iio/dac/ad5504.c                      |   4 +-
>  drivers/iio/dac/ad5624r_spi.c                 |  12 +-
>  drivers/iio/dac/ad5706r.c                     |   2 +-
>  drivers/iio/dac/ad5755.c                      |  10 +-
>  drivers/iio/dac/ad5758.c                      |   2 +-
>  drivers/iio/dac/ad5761.c                      |   8 +-
>  drivers/iio/dac/ad5764.c                      |   8 +-
>  drivers/iio/dac/ad5766.c                      |   4 +-
>  drivers/iio/dac/ad5770r.c                     |   2 +-
>  drivers/iio/dac/ad5791.c                      |  10 +-
>  drivers/iio/dac/ad7293.c                      |   2 +-
>  drivers/iio/dac/ad7303.c                      |   2 +-
>  drivers/iio/dac/ad8801.c                      |   4 +-
>  drivers/iio/dac/ad9739a.c                     |   2 +-
>  drivers/iio/dac/ltc1660.c                     |   4 +-
>  drivers/iio/dac/ltc2632.c                     |  44 +++---
>  drivers/iio/dac/ltc2664.c                     |   4 +-
>  drivers/iio/dac/ltc2688.c                     |   2 +-
>  drivers/iio/dac/max22007.c                    |   2 +-
>  drivers/iio/dac/max5522.c                     |  31 +----
>  drivers/iio/dac/mcp4821.c                     |  12 +-
>  drivers/iio/dac/mcp4922.c                     |   8 +-
>  drivers/iio/dac/rohm-bd79703.c                |   8 +-
>  drivers/iio/dac/ti-dac082s085.c               |  12 +-
>  drivers/iio/dac/ti-dac7311.c                  |   6 +-
>  drivers/iio/dac/ti-dac7612.c                  |   2 +-
>  drivers/iio/filter/admv8818.c                 |   2 +-
>  drivers/iio/frequency/ad9523.c                |   3 +-
>  drivers/iio/frequency/adf4350.c               |   4 +-
>  drivers/iio/frequency/adf4371.c               |   4 +-
>  drivers/iio/frequency/adf4377.c               |   4 +-
>  drivers/iio/frequency/admv1013.c              |   2 +-
>  drivers/iio/frequency/admv1014.c              |   2 +-
>  drivers/iio/frequency/adrf6780.c              |   2 +-
>  drivers/iio/gyro/adis16080.c                  |   4 +-
>  drivers/iio/gyro/adis16136.c                  |   8 +-
>  drivers/iio/gyro/adis16260.c                  |  12 +-
>  drivers/iio/gyro/adxrs450.c                   |   4 +-
>  drivers/iio/gyro/bmg160_spi.c                 |   7 +-
>  drivers/iio/gyro/fxas21002c_spi.c             |   2 +-
>  drivers/iio/gyro/st_gyro_spi.c                |  18 +--
>  drivers/iio/health/afe4403.c                  |   2 +-
>  drivers/iio/humidity/hts221_spi.c             |   2 +-
>  drivers/iio/imu/adis16400.c                   |  30 ++--
>  drivers/iio/imu/adis16460.c                   |   2 +-
>  drivers/iio/imu/adis16475.c                   |  54 ++++----
>  drivers/iio/imu/adis16480.c                   |  40 +++---
>  drivers/iio/imu/adis16550.c                   |   9 +-
>  drivers/iio/imu/bmi160/bmi160_spi.c           |   4 +-
>  drivers/iio/imu/bmi270/bmi270_spi.c           |   4 +-
>  drivers/iio/imu/bmi323/bmi323_spi.c           |   2 +-
>  drivers/iio/imu/fxos8700_spi.c                |   2 +-
>  .../iio/imu/inv_icm42600/inv_icm42600_spi.c   |  14 +-
>  .../iio/imu/inv_icm45600/inv_icm45600_spi.c   |  16 +--
>  drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c     |  34 ++---
>  drivers/iio/imu/smi240.c                      |   2 +-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |  48 +++----
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c   |   4 +-
>  drivers/iio/light/st_uvis25_spi.c             |   2 +-
>  drivers/iio/magnetometer/bmc150_magn_spi.c    |   6 +-
>  drivers/iio/magnetometer/hmc5843_spi.c        |   6 +-
>  drivers/iio/magnetometer/mmc5983.c            |   2 +-
>  drivers/iio/magnetometer/st_magn_spi.c        |  12 +-
>  drivers/iio/potentiometer/max5481.c           |   8 +-
>  drivers/iio/potentiometer/max5487.c           |   6 +-
>  drivers/iio/potentiometer/mcp41010.c          |  12 +-
>  drivers/iio/potentiometer/mcp4131.c           | 128 +++++++++---------
>  drivers/iio/potentiometer/x9250.c             |   4 +-
>  drivers/iio/pressure/abp2030pa_spi.c          |   2 +-
>  drivers/iio/pressure/bmp280-spi.c             |  14 +-
>  drivers/iio/pressure/hsc030pa_spi.c           |   2 +-
>  drivers/iio/pressure/mpl115_spi.c             |   2 +-
>  drivers/iio/pressure/mprls0025pa_spi.c        |   2 +-
>  drivers/iio/pressure/ms5611_spi.c             |   4 +-
>  drivers/iio/pressure/st_pressure_spi.c        |  24 ++--
>  drivers/iio/pressure/zpa2326_spi.c            |   2 +-
>  drivers/iio/proximity/as3935.c                |   2 +-
>  drivers/iio/resolver/ad2s1200.c               |   4 +-
>  drivers/iio/resolver/ad2s1210.c               |   2 +-
>  drivers/iio/resolver/ad2s90.c                 |   2 +-
>  drivers/iio/temperature/ltc2983.c             |  10 +-
>  drivers/iio/temperature/max31856.c            |   2 +-
>  drivers/iio/temperature/max31865.c            |   2 +-
>  drivers/iio/temperature/maxim_thermocouple.c  |  18 +--
>  drivers/staging/iio/adc/ad7816.c              |   6 +-
>  drivers/staging/iio/addac/adt7316-spi.c       |  13 +-
>  drivers/staging/iio/frequency/ad9832.c        |   4 +-
>  drivers/staging/iio/frequency/ad9834.c        |   8 +-
>  172 files changed, 886 insertions(+), 927 deletions(-)
> 
> 
> base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
> -- 
> 2.47.3
> 
