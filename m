Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC036291E
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVdc4wFt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-692c02adeefso1736662b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697977090; x=1698581890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PE4+6mfVrbVPnjzZCicIAFyglp4nXFWxs8H1/H4u0+Y=;
        b=VVdc4wFt8ICHP7URvQelpqhsYYOx/7w8Trg1g+2NZ+pY48eQeIfQfMhz6VVjd2npnw
         CnLaoL2mS5zvdim6lApD1yJvA2MhCKTQVcHL/mJH3nTUZsbEkWJejvVJGL4y5yPzyldF
         nOJdYZOoGQvnEhdxLBI8D0P3N73DIwEa2CJk7ou9ZFc3uPV+qhX6psgXbFMuOXJDNwYW
         b2mNC1QaOMhHFDIOqaZOXLBvbPCuG38v6OyduWKi1JQodGEE/daxj5lRlbc/oYYKXpsN
         lzaWkTaG+wwM01FvhjacuIdCQIEDo2kG/5NnsmdF3E+Znzu0q0Xjz+jlrVAh+APB0lQB
         VSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697977090; x=1698581890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE4+6mfVrbVPnjzZCicIAFyglp4nXFWxs8H1/H4u0+Y=;
        b=cEX3E4dNCpbb5K1QQMz3FI1AOFLKR3kVfaC2bjNNscxJrL4LxZolydYYmSWaAnf0VN
         ZMedl1zu6BJOF4uvSKGiy21L7pH1HWYAQPjLzcgrrLzKwbEykq2c0AJfLoy6R3pTrRdI
         fhKKVDfXdIjSGgRegi7e8A7TL9wEY6Q05ARQa9EukRdK+8V4pIBdKwji5dqrVeGZO2Yt
         AKfYkQqNYYEEfe17AXBD5aywSyaVj7drA0RfAvFPkPjfaOagF2TPrHTJvAjW3gyQsqsC
         qv4IdUyl7ZgC1vxPZN5cQ46jC+GIIdb+/xtAXeTC32E5KwlorMe8BYBxaSH6yzHOWMZ2
         xNEA==
X-Gm-Message-State: AOJu0YySzaA0PJi8bFg/W9og3AmdtEBExfHT3nhjGawNtxaVvYb715G7
	tU7yLR3VlyEg881xTR5vQ/G2PGBpBB8=
X-Google-Smtp-Source: AGHT+IE8H30sWK+Ba1pN9DY8WJX2lDbNtDqXWBEsdV+UbFfQ0u9AgPoZsSFH8lJmSevKs6+8uTVHPQ==
X-Received: by 2002:a05:6a00:9398:b0:68b:a137:3739 with SMTP id ka24-20020a056a00939800b0068ba1373739mr5872707pfb.4.1697977090042;
        Sun, 22 Oct 2023 05:18:10 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t3-20020a6564c3000000b005ac384b71cbsm3599506pgv.60.2023.10.22.05.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:18:09 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:18:01 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 2/3] staging: greybus: camera: Modify lines end with a '('
Message-ID: <5f63b332c83f5f0e95f59e673b0292c27fecb411.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 6516e7efaab9..40d3b8aca8f0 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(
-		struct gb_camera *gcam,
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
 		struct gb_camera_configure_streams_response *resp,
 		unsigned int nstreams)
 {
-- 
2.25.1

