Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6F3955C4
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337878; cv=none; b=UVPKsFBR7HTpa4Lak4WObKOZGvuQPr8lEyM14pfTIFzZITXU7ZTvSNRJ+PYr7Za9+KAv9iSnuTUy9SMxcnp2fp/l+qsMW+A0wCj8vPuBkenCuKOUhBQgUGsne/GYrKcNcvZNWgPAW64ffGsTl8clSs6mUS5I1nIu8LzaOGJoC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337878; c=relaxed/simple;
	bh=9NUrm+JR+AwAKle6F1upGyUXgd9H6U/Ig9Dkc6DFvyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/mghNhACFZZRYbbYJDLhKpNE/VVTmnGTmHyHXHk7CrQi7n48ABBM3fRIU6lLEipAcO/LqhTmGZzdpN4Q4sncyqOBGDp3ouoWjS39CfV1slfPBJ+A1WvUDQyHQztMOSV2YXYGS5XLu3l2E0gcsE+18fb3ytRMdrAYAsFvKJHxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrT+GMEz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrT+GMEz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so4784615e9.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792337874; x=1792942674; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RynPPvVjqTV4luxl9PBymJrn2D7Dl4oqi1D5yk6iPS4=;
        b=hrT+GMEz4LYbdrhLzPwDd9KnGWpBGD+v6cbWqjKDPTD4Oo7Z6pkDSoJB6rAhiZERr5
         WS931vUMavqi7P1WbID5AllhYA8TesZidj7Ytz3Y16K24qKIZwaC/vrDSNi2huatGNaI
         4DO7BkfFF2SGTTAik8xQbOJDTOXF86+s7BIoNrYKaiEFw7VMpIz+OTfhJmfSr7ENueD/
         5BsRoE5xMsjVlAWpbnifol+ePH9x/YkMkqQ8y9+/UfjWJucAuFVSva8pjrJWOp85WJcW
         922XMENfn++X+ECgJAXUV+YTdQi2LpYt9lgXac6OEQTo+zinv7rhxFXyuT3ZpRc2WDmc
         iGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792337874; x=1792942674;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RynPPvVjqTV4luxl9PBymJrn2D7Dl4oqi1D5yk6iPS4=;
        b=JA6XKQff4JOoVwyY7VFu0ctEZVZQw5pOCFlEGDh5c53hGYuZlpEk/r5SfHDDZ/8sVr
         iGltRedOjGHsyF1f9LVhYtP8c4mllX6DL5tJl3WRcCrevuPZfRvYP98SngzaNqTvtxF4
         YgOkjmOPAEjSA4h+dX/Zfr9BUyWOFG6osi2ZBikITCRyRo1HchMPtxN0BMySeJK1y4Rs
         /QN4MJMonUQKGY2sUbD221gbdt6CV/dZGt5H+cr8GjeAbP+di+vqmr9jYALKmxKO4wdr
         huOF9yuT84ZIFTmSWFNByJcd+XtLTzbvS4/TLbQr6n1wshAvdQ8mCx37iGCTnK/oRl7Y
         nrGA==
X-Forwarded-Encrypted: i=1; AKwUvBzYIUKoEypl4rTqWBpCjFteMKENa8yTfd9Fq/t7k+GJA4V29Xt8ThHl/zskQlyUBVC/KAbUorCsdVGu4ipw@lists.linux.dev
X-Gm-Message-State: AFq9FYKT39/UdpdooKdaTTYNLjsjpv0FPmcl8VP88jLg9Wo0KvV9ErzJ
	pk2MHCgwRNqZ0i4Vk49GNntH8iXqzop6K4Fx7GEI8RKWN2kKnH4urR4X
X-Gm-Gg: AYBFou0IcIBjRFkvvSSMqdhIxJB6UYC7fJJ8yaspoZXkUik/wWwSQf3iLcKqfW0E4ta
	WTudEJjLi+n0K28c9rpAuycLGd66bWISBLVzZt1cE4BI6L65q/DVOsTMwwUBOhS80jk+hKrL/SN
	vDWbje0y2DaWBHrmRm1SffpJ0BfvJSc1n2Jrn7CvwSJkFbS0+s58AS1k8J/q9S88jbANRW5CpOn
	8/OuzCky1DduyTzd5PTKVPwwB+HnH1LqEVVb3E7pVefJts6SdBHOzvgSTxQ4co7aPL7ACF/3sb9
	w/lXQCP7EgtoGWkV41dDjBWkyOsy0D1ka/XEQZvskWLeIPqUCGIBnZpen0/Sium0p7xFIEf9jA5
	7rwm9AeZxaK1rf0OGhu7jempp3KaIXyyJTXH3QiwjnZK4hyC6JZy4SmttXc4TgceBc4ZFe/Q7wt
	BTB8lncnCbsfrwkc+uwSOpCOt5LsMgCgbIjeGxnqIkoH93n/8FlKhVxmvFmnA=
X-Received: by 2002:a05:600c:548d:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a1e250b1c7mr41260495e9.17.1792337874062;
        Sun, 18 Oct 2026 08:37:54 -0700 (PDT)
Received: from ubuntu ([102.91.81.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm17479115f8f.46.2026.10.18.08.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:37:53 -0700 (PDT)
Date: Sun, 18 Oct 2026 16:35:34 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: gregkh@linuxfoundation.org, andy@kernel.org
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] staging: fbtft: remove trailing semicolons from macro
 definitions
Message-ID: <atTnRr-JGIb9eLQR@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove trailing semicolons from macro definitions to allow the
macros to be used where callers provide their own trailing semicolon

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..1ab1658e8321 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -277,7 +277,7 @@ static const struct of_device_id dt_ids[] = {					\
 	{ .compatible = _compatible },						\
 	{},									\
 };										\
-MODULE_DEVICE_TABLE(of, dt_ids);
+MODULE_DEVICE_TABLE(of, dt_ids)
 
 #define FBTFT_SPI_DRIVER(_name, _compatible, _display, _spi_ids)		\
 										\
@@ -301,7 +301,7 @@ static struct spi_driver fbtft_driver_spi_driver = {				\
 	.id_table = _spi_ids,							\
 	.probe = fbtft_driver_probe_spi,					\
 	.remove = fbtft_driver_remove_spi,					\
-};
+}
 
 #define FBTFT_REGISTER_DRIVER(_name, _compatible, _display)                \
 									   \
@@ -350,8 +350,8 @@ static void __exit fbtft_driver_module_exit(void)                          \
 	platform_driver_unregister(&fbtft_driver_platform_driver);         \
 }                                                                          \
 									   \
-module_init(fbtft_driver_module_init);                                     \
-module_exit(fbtft_driver_module_exit);
+module_init(fbtft_driver_module_init)                                     \
+module_exit(fbtft_driver_module_exit)
 
 #define FBTFT_REGISTER_SPI_DRIVER(_name, _comp_vend, _comp_dev, _display)	\
 										\
@@ -361,11 +361,11 @@ static const struct spi_device_id spi_ids[] = {					\
 	{ .name = _comp_dev },							\
 	{},									\
 };										\
-MODULE_DEVICE_TABLE(spi, spi_ids);						\
+MODULE_DEVICE_TABLE(spi, spi_ids)						\
 										\
 FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
 										\
-module_spi_driver(fbtft_driver_spi_driver);
+module_spi_driver(fbtft_driver_spi_driver)
 
 /* Debug macros */
 
-- 
2.53.0

