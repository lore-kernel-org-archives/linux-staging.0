Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1161FA5
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 06:53:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3177163aa97so2358555f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691218417; x=1691823217;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+LYFfCHiYUj/1ZiC56FaiBDJ/SRdM9J5pvgGpfX2c=;
        b=VXTTokOB4KxAUdHpMUn2YlateQftqj27ZsjzrtDk2T16y9cmXaHyN7UsPKCR+anBnf
         G7Bnv0YIMGdGC0jjpz3/3wL7CyG18t6qiKj3bw+N7QOOHJFNAfWJEoZzLZDmnWglpWRw
         8infLY+bZmQJLrrybf6yUtQ+JKppZ0CIxdarUl2oR6nmGLsJAF1GeXphx5qHJa3PmwLL
         n61besyQ7QULbTvsY+Rdg9Z2U2G6MHIbypafpnyxU8VK6JlPbC+kZhiifEBFEDuJluEs
         dacec1W4wEp1iAWaFiaHU8mlD8ci1k0F5ppELUZ3vr2pzXtauaQCMi6jJqH/ji7KLACg
         8HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691218417; x=1691823217;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+LYFfCHiYUj/1ZiC56FaiBDJ/SRdM9J5pvgGpfX2c=;
        b=U7yC/vx0zHz/dDQUnm/r+6BKPTn+l7xby7pDNnJvCarFlIUVeFemwCuYyoagOuWL7c
         OSBmvY3naji1zlQ4R5gHCQ7MwcCAlUhhxl5p3VmCmghiGrSisYCC//+7v77c8yqM35h1
         dmX7h/RAuxq+DayXE6RSxnTJP64d1D4U2DN/akJJZ3WlgKXBdy4F699GccAjNHXGJUsU
         ElB5eZlLEpqeYdwxOIinBgzBzBGt+hAJo6KFM1nLzxrAYE/dVB7U+PnJkr3ZDBOpGUOY
         eGsZ/6XEOgv9NdTJlu83mhwXRinjBbvwB0enJKXCw8uQQsfVNJL/ph97c5A8qFdUku7K
         7ZMw==
X-Gm-Message-State: AOJu0YxN3+j24kshwf0LVYXUoC5PBoRbZU2p+wHLvz8uAmHKi4C59Qi6
	0NSUEWO8zz8Z/68dG0lX4JTa8w==
X-Google-Smtp-Source: AGHT+IF+9RXWcwNkyjwN686javCYpMC7EW6x2zR6vdp/vwRab72ojLtpmuNDVltocAtktvnB3qpYnw==
X-Received: by 2002:adf:dd4a:0:b0:317:60f2:c08b with SMTP id u10-20020adfdd4a000000b0031760f2c08bmr2651966wrm.31.1691218416697;
        Fri, 04 Aug 2023 23:53:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d6e06000000b0031435731dfasm4345492wrz.35.2023.08.04.23.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 23:53:36 -0700 (PDT)
Date: Sat, 5 Aug 2023 09:53:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: csi2-bridge: check for negative port values
Message-ID: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The atomisp_csi2_get_port() function reads an integer value from the
firmware.  We check for invalid positive values but we should also
check for negatives.

Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 46d9f31986c9..0f0ec5d7e49d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -626,7 +626,7 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
 			goto err_put_adev;
 
 		sensor->port = atomisp_csi2_get_port(adev, clock_num);
-		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
+		if (sensor->port < 0 || sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
 			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
 			ret = -EINVAL;
 			goto err_put_adev;
-- 
2.39.2

