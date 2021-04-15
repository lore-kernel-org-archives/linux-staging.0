Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06956D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 16:54:37 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id f19so8192935qka.8
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sKPscdnN4p036oGIIGdcJly3t0X9xL0TlPcjGDANiX4=;
        b=kX+aT+xJYRNY3gF53LIK1HUQZ5f+r2tQ37dfCn9Nmm7Wsps7RHfZ/21lgEFLKEyXJ3
         cjI6FT2RSfxH4Y5nsPgDzHbDffzZMkgGqm8y+JUEpEOej7GXpT/gvj+QlsCY26fRurjV
         JZHCHxYO3oh4fZ3T08NbzCAcxb0K0/W4rZIdXe5696aj8gj1JLu0MDeRotPyvFMPrZZT
         WFBeZ4CIushvjcm6q0sNNqpu5ca3v/duaKWV966+i0oIdALHcPQOstbYQcAtMAkBYYqn
         c1PG43pMh3QPUSKuzTODwF6QzkOHdPtY3HC4uHa94LExzE08IzkjdaPaP5XSSVwqYlBz
         xLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sKPscdnN4p036oGIIGdcJly3t0X9xL0TlPcjGDANiX4=;
        b=Fx8+Fur0q8xUDA8wLnPaKMK0I2y3DAwXGxnrcypjg5VpEOdTZZOW2jdr1rYfsty0Ld
         NEgBaTxyyAMccpNKnoDFe1O2zRGRuoqEpJ/etwkvvN+r90/53Kd7d/01ikeTE+lUD5cr
         zgvWedYP906LmzmorNTspUzKRFKkdx8TRmy/hgmq9ujyDlCvHU6nY6+/x/cpAyO87PMF
         CIGNbNxKZvGyb3YhyWaI9iiN/P+ozTsp1P900gnn76ogrbnw/SZFx6aAAqMUhyY4UwM5
         5ohq7TA9oYvhalC2hGHR+qNdMKHq8ZisuGz/wckF4nQUPTcEtgnvcV3QvJ2hnVy4SSoP
         wwBQ==
X-Gm-Message-State: AOAM530qNCdsXl6ft3ldxdM2dxdWJkx8g3l5Ij5omHKvmSZzhEkkRwts
	5yBZC1WhNKP7aJf0TJjlU/A=
X-Google-Smtp-Source: ABdhPJwswCLrM97/QTIaaO99478ipWzTiiBnhPB0l8ODUefpA7hDJcP3iTIBG0WNzrgNPN5xkKEMvQ==
X-Received: by 2002:a37:b103:: with SMTP id a3mr4561489qkf.261.1618505676976;
        Thu, 15 Apr 2021 09:54:36 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id s12sm2085022qtn.69.2021.04.15.09.54.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:36 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:54:34 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 3/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_subdev.c
Message-ID: <b07b5e819c0b262ee0bc3c775de7bebb71b648fa.1618505476.git.alinesantanacordeiro@gmail.com>
References: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Balance braces around conditional statements.
Issue detected by checkpatch.pl.
It happens in if-else statements where one of the commands
uses braces around a block of code and the other command
does not since it has just a single line of code.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 2ef5f44..aeabd07 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -472,9 +472,9 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			 * when dvs is disabled.
 			 */
 			dvs_w = dvs_h = 12;
-		} else
+		} else {
 			dvs_w = dvs_h = 0;
-
+		}
 		atomisp_css_video_set_dis_envelope(isp_sd, dvs_w, dvs_h);
 		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
 			crop[pad]->width, crop[pad]->height);
-- 
2.7.4

