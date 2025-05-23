Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C24223DC6
	for <linux-staging@lists.linux.dev>; Fri, 23 May 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995475; cv=none; b=reV3Jgz32Nu+V3Hwlx7mtCdS1iqHU0IxvtGbL7iuo1tFPtp8yg5qgizg/1jCoNh3byb1LykAhVnCk7AX9r5W0tvjXXUfMalSfKK7XAnlA+LBgSBuSaw/WGptVdN6txUP6hsXaU2hEIFL5LtBmRJhXluLO8HbroFq7lgraaTJiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995475; c=relaxed/simple;
	bh=WS5Em/6Rn7/RETr7HbwL/7SvuWdK27Vl0KXmMThSYJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QiRnlmlM3LNHV0VBiXhwN7XIqFLmKTsK44cJzAyln+iQyvW2xxYLteWbr6VlrxPrw/6INMlBuWOdJWLtpqdBVFc1GCbCZjcQQ4X2+2iCI0wOK0IedJP2E2kvmQiDKGuwghQLekfqhp/MnJkU0gYk/uTxiqNy1k7Wqgf6EEPhgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kn1ZOJgt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kn1ZOJgt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so74313015e9.1
        for <linux-staging@lists.linux.dev>; Fri, 23 May 2025 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747995471; x=1748600271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JQxHOavWRYTHCuVw/pPJKDeceEg1P8xmDfVg3kuIMY=;
        b=kn1ZOJgtKPvyINKWu4+fPeZfnDwncSpwbjejq9k0gWx7wGDPtYcdZgaRrmarr0VJB/
         ijKwzRCKB7MAIc8Q4ncuqeJNKyetxdE3/WAmZmdzi08LWjBRSRjAAidsWnXZgXwgQ9S6
         ii0WF5Pju1QzbEK5QTPr6zfUUy2xSyp4gqXnM2bnPdH8KMk3VqZ9qw5za9Evo8VqmcqS
         0RWhcyCrBx6QNsSmh1aocEMkSR1pELndcUFAZxyVpA0OF2I68yaUFD3AZF4muPnALp4x
         O1nczVWRYpFjxWVeQzUJPaMltGxlNx8gZwI+rH7+/RuCAgbsypBXfOSZLwgx9c5y+67a
         o+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995471; x=1748600271;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JQxHOavWRYTHCuVw/pPJKDeceEg1P8xmDfVg3kuIMY=;
        b=qy8nS4aa/kI5Yc5Yb7whEFy67Ar4u2e8j8KNpd/kaWx6xu6hKvxCX+zew/SzC8bF+i
         5M6W1Ka1RlGgZuP1sY799gVYxjA5SluolciIfb7Zc2c2AiMaEbrd3Y9O+wVu3tl4p27T
         ryIPbNoKN40lJhE+hsah8Lep+PWTYvhU7dOWPFBSoLLmhFO/aAjQXqwlioVyAw0HMDJX
         VLp697p99i1tV6h37gnm4MXW+Q1s4gV/lqveIpaS0To6r6vNrJbgdOgm8++yE51UT+zO
         ZRc8SnNer/3mS5H6edq6ThIKINixsmZ1gvg3ebg99mO40P2x7x9mp8zKfW3M3qjb1yq4
         J25w==
X-Forwarded-Encrypted: i=1; AJvYcCXKOuFIhtjYDE+aDIHQ8XO6Ru5DNYC2tXLxyZD6taz88HCGhVTDk6MD4kNKxloHdouOlfXfH506eRukxfWi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5SoGu/rqy3aZogELcogvo1Fbp3PqUMVNkFBMwNh6JEOA6lr7K
	AO2n9e7Shxs+yZ4hawctrps3kQ1YZ+rMv0C9/YlH+tF1xzGHlYin48fhVeZ9unIQhL4=
X-Gm-Gg: ASbGncuD0I74qWNqje9+8n0Jhq7tZE1fMUaODGru/jWlaYoH13j/shwV0cqnFWvsrGx
	+r4lefToEJMIi2G+JNjzA5WEw7Je4lMNA6ERhXJutwDyHXbOFKB+za2ymOKNaChhWWAyzAJRLQe
	31awONVDOBmXdrLy9a/KNLIR6sP5vm7dj+msuY7fB+RsDQ4CQtTt6sIn71/k+Tw6R7d2awdL6xT
	34WqU5YmuVoN20btV0pzNkGp9hXr+JJ1OVE4fQrF6zLpXcW9b60cneXDZl9DPleD58sGN5ByL6B
	0b7mF8wrCXLN9JQqH0wVFVAoCdX/6VPd6AkMD3YVDM4nKh27DA8MSjF6sSGGwpfv7bw=
X-Google-Smtp-Source: AGHT+IGBPED3AngN7Xq3k3f1GUZA+Fjf2Y44vIfBT9gi3tMob0OPV6QaRRNpu0BKQtoz7ZkErrF2Tg==
X-Received: by 2002:a05:6000:230a:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4c23512f6mr1969678f8f.51.1747995470929;
        Fri, 23 May 2025 03:17:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d204sm26364129f8f.10.2025.05.23.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:17:50 -0700 (PDT)
Date: Fri, 23 May 2025 13:17:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
Message-ID: <202505220651.U5WqBCdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-24-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-gc0310-Rename-dev-function-variable-to-sensor/20250517-194501
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250517114106.43494-24-hdegoede%40redhat.com
patch subject: [PATCH 23/23] media: Move gc0310 sensor drivers to drivers/media/i2c/
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220651.U5WqBCdF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505220651.U5WqBCdF-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/gc0310.c:462 gc0310_enable_streams() warn: pm_runtime_get_sync() also returns 1 on success

vim +462 drivers/media/i2c/gc0310.c

167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  453  static int gc0310_enable_streams(struct v4l2_subdev *sd,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  454  				 struct v4l2_subdev_state *state,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  455  				 u32 pad, u64 streams_mask)
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  456  {
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  457  	struct gc0310_device *sensor = to_gc0310_sensor(sd);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  458  	struct i2c_client *client = v4l2_get_subdevdata(sd);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  459  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  460  
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  461  	ret = pm_runtime_get_sync(&client->dev);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17 @462  	if (ret)

pm_runtime_get_sync() can return 1.  Use pm_runtime_resume_and_get()
instead.

2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  463  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  464  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  465  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  466  				     gc0310_reset_register,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  467  				     ARRAY_SIZE(gc0310_reset_register));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  468  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  469  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  470  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  471  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  472  				     gc0310_VGA_30fps,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  473  				     ARRAY_SIZE(gc0310_VGA_30fps));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  474  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  475  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  476  
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  477  	/* restore value of all ctrls */
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  478  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  479  
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  480  	/* enable per frame MIPI and sensor ctrl reset  */
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  481  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  482  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  483  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  484  		  GC0310_REGISTER_PAGE_3, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  485  	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  486  		  GC0310_START_STREAMING, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  487  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  488  		  GC0310_REGISTER_PAGE_0, &ret);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  489  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  490  error_power_down:
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  491  	if (ret)
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  492  		pm_runtime_put(&client->dev);
2b2297b11bb506 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  493  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  494  	return ret;
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  495  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

