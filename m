Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB33F361952
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345840; cv=none; b=ecWMerm79S73z1Z1oFY7QJ4qVOStUqBGhI/3syZ8iyhl5tmbBlMD8QW4e5SsiGvAcqTTdlvt3jG3WuR11vh4KZ3PUzv+pVgrv/4RRlIV/onWoHnL7Qab0KZwhFHxM8lhZvy7Mu67OANCUFdeJsz/77NeUfCgJPymENuatrWH4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345840; c=relaxed/simple;
	bh=GDtfl2HGmpniyM65dSeoeUzS6m9aT0IQ/soOxMzJCqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNtwYFSIwAZH1dYFoBJYw1Hyf7pdsna6ujoFJgX4hmF7+NEUvLGO4avdlTf3BZiNd2ZMaAFHvjugfF7VwXiMOi1d5V7tsfR6Wd2qllk7P8/H0RwPYjXvS/CTbdPIG14thyxchGuW+egBOa4WXX2GKZ4dkXbwGWbXnMLCI6jO5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYATQfie; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYATQfie"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso14811825e9.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345837; x=1792950637; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOuTmv61Tfcjl1ZoA7Fh17PttCqQQo4Ja/Cvpk6+cDo=;
        b=OYATQfieri0NdvX7sSqroCH1IjKsUfT+hXHhinSksPDpOaZ5BUrPaUp6dRQPYZBEG9
         pDGNL+Q5bcy4826rEqpXjbto4Sb84XVhGCw60BonADlq8g113LPTtix5LMUWoXrDyy4g
         jQekveyM9121z2tFRu08DMBUnrCJjF8Hmj2nBc2YbW163UmvVmkOxUksXDX+WWf2q1Ga
         Ors0mw34PsjzzGMMbfbeuficCbYW5y1PNYQk1VCC5IsWZOF2HtzmF7MKh/oNQdcfQUd1
         6Es3QxqPsVX0RFuXhVjz288DujlPz3hRx1zX8wl9iLUVyz+4DYRwsN7ZnFBvAsc/QKCV
         A8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345837; x=1792950637;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOuTmv61Tfcjl1ZoA7Fh17PttCqQQo4Ja/Cvpk6+cDo=;
        b=KzFCLfvNHQiHES9a2mHQh1uquv/3IoIuUz651BLBZ5nHRm1Y5Ioek3qFk3I0oGKQ6z
         1dafgb0uV6ErzqrUhp4B3Sm+zUUQ1Qj+oBELdi6RjRttLcg3oGsCn7D5Cgs/fr0c4u4B
         a4iBNg4dpe3S1anf3tc2hfid8Rfe0mwSBcIWWp39qC3xUAik+M+6+HOmXYnFJIRcjWyG
         dKNvlqd3Q8Usoh5zoaT+WYPp7YtSgk5uQsL/pbimSzVy+PeiHseUbewhvB+ZOXX9MjbY
         8259zq97ZWDZTC1xCXUxk1+bR8tHMqjM6wzaN8rk82lOHgp3ihqt9SC6qhIwnAg4uEMu
         DRzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSANELqs3kCtgoh/Rrrv6Add5aDlo4dkM9bFj5TArrCHamWHB0HWbI2KBpJLVVYquxh2XQtEZNoooh3Edf@lists.linux.dev
X-Gm-Message-State: AFq9FYJcfdpnEieuyn9p18AX3nmYHRKQzqUW6aYt4A+4nDoKyYQ6Im43
	x6gXPQKPqn/1DSI6vU5clipb7pqJEF7HHYxarDEm8mwpWOPptpl5sTCP
X-Gm-Gg: AYBFou3345KMiTZU0vtD+Cvu8Pg/6Wp0qrzI+P1LI388VhgnqCyEVoPIvdgLwc0igNt
	Bvzo/qB2BXgL1thRatD4J0NsbDR3aJCRUrM/D2gOl9hEbnm2DJLx0Oyg1cOaIZkpFOUc4N+sGOu
	sYqIB6KY3bryVrNivz8KT3LWEFm2FLQfSLqQPR5KOwfAhPPm2m9VG5I4LsOB01Pr2C6z/YBnZ8Y
	k/9XWXdwpiUU66S1TvZ06mxzeSk6p4b3c+d5KjJohvON53AVm667gQAfqKPS6FtKBBJzbz6vGPe
	n4zgFWkICTL/anITj8OvYKMhqs/I74+LgA8JxTzQI1/WBaxnF0hETHyEnoRawvNCauo9tezG+H/
	ONZqNqBkT0SUDK0aWEpcS3fA2eJ7vHgjLbxJDtxWccJVXDYlvxLt9AYnsuJjbMyn0lf+sBDKeqz
	QTjQSF0+xdzgSmkgAJxh0Tk9FYH+H91YWnyf4T6A0xnKwCJPk9zG/Q1kCIsnzufx6f
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr139445015e9.4.1792345836539;
        Sun, 18 Oct 2026 10:50:36 -0700 (PDT)
Received: from ubuntu ([2c0f:f5c0:570:10ef:ebdb:1ad:9af2:42a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bb9sm64505955e9.0.2026.10.18.10.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:50:36 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:50:28 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: gregkh@linuxfoundation.org, andy@kernel.org
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org, Julia.Lawall@inria.fr
Subject: [PATCH v2] staging: fbtft: remove trailing semicolons from macro
 definitionsandy@kernel.org
Message-ID: <atUG5LbCbePRNn5M@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove trailing semicolons from macro definitions to allow the
macros to be used where callers provide their own trailing semicolon.
Also confirmed that all current uses of these macros already include
their own semicolons.

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
Changes in v2:
  - Confirmed that all current uses of these macros already include their own semicolons

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

