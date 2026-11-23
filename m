Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430444;
	b=y7KBhcMLXkd2qS+EvLCagq3pJaXgbpcUJmnp0S9gQS+TrG0DIwPy1YKL17ouUlhtPLQ3
	 nEsFpiH+sdOyalaDM4/nXX/i3ayujpheaqB0Pe3FmRodRjnVeogH8zBNNe0KHN6Yi/mMZ
	 LvBUEywYA0E+MzNHGaJXaQlauSPyH9dr+HxszJ/bV7MLQwRntuZNv0+R1D+hfs+O64o3d
	 bp/ucMKwSoyIusJtk1yWo2XLJcPu2KGTqMj5er+KLTzLgLWqfpYxfEKuXMVSbQn4DXAWL
	 uqHsc2PA15fyjuG1P0nC4jGqaM6VKxyEzmtab0q/15rrpT5SZmpFLx2HJb7GJXCBTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=KsWvzghFdTV16CF1Pw1mL8KQoPiLa7EOjJgMQlOAJK0=;
	b=u8IFI3Zp8d6iqxI8LgHu9Ia1U8FDkShnEftmuu0MuZmyzSpI8omIFZeJn3zol52QxzJt
	 X10zpWBqU7EYkjLSNRWzcJrnIGwkfc/BupPGk8sl1qnzEzE6JNHA+8UYVSO1S0359X3DX
	 x1YRFB5CWZP7Djt4VcA+C7wKy1G0gEX0YdDB707sFwxdWPLgQmTOsBSLwj+f6ehz5zt9H
	 VqrbRXEmoLy6+UeqpYCpSyR9PSd3O4Zfq/dPJAahRvI/Sok8DEXr4o3CjsAMcMIUwnsCD
	 2ICFWsuUZ7k3ZTMk5YhucZMePTIqXmd7Dw/P/Er0AtvSQ1ERNvxGnCt3uZhnEBy1NMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWLurAA2;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE606A31F
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 10:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBBE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWLurAA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795430443; x=1826966443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TXCH4QjpVUhZWcPK+9Sf7cfpjX9RBJworCcemuU5itY=;
  b=lWLurAA2LK33xL/bCql614I+YaHuRgtYQqlrFOANgXK9k5UMrdnQdzI3
   /VvJBO9PbkQewEXY/J3I36IJ039IUoLeURpWlN9DhGWBt4yWQENyRKXYW
   MEvKSkotf+F3ve7SCkS5hWNRFO7sHKbfKgP3HrmsR0W6JE0hD+qob/xva
   Av2rrxkGFJv76BBvcEptQ83TCUY7KcheHDLFJqTGbqqeVfoDLzD4vTOq7
   jMuluvWXqqG2a/nyM+2UhwZc6BbyFyP97Pe/AMT9RRBfILqWOnN/s+lj3
   OBCuWlCZqHUTRXHsmyJInRxHZ7CbdDRrvf6nipcfgj8FJbvoUzESjEDqS
   Q==;
X-CSE-ConnectionGUID: Fu65AdGMSNCq3Icpto75ZQ==
X-CSE-MsgGUID: JfZp2dPnR/yKnjexavVFUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4117746"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4117746"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:40:43 -0800
X-CSE-ConnectionGUID: L2E53vBQTXul6IsWACMEFw==
X-CSE-MsgGUID: MFxnjMNATRekU4FDFhYUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11820219"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:40:39 -0800
Date: Mon, 23 Nov 2026 12:40:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 13/14] media: i2c: Add WV517S lens actuator driver
Message-ID: <awQYJXHwHZn-x93g@ashevche-desk.local>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
 <2de582af71f93147e034bea2dddd0718b4f3a308.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de582af71f93147e034bea2dddd0718b4f3a308.1795267528.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 02:31:43PM +0100, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 rear camera has a WV517S voice-coil
> actuator. Add a V4L2 lens subdevice with a standard 10-bit
> FOCUS_ABSOLUTE control. Set the ringing-control mode internally.
> 
> Defer register I/O until open or a focus request so runtime PM can
> use the IPU bridge sensor link to power the actuator. Use regmap
> and restore the last successfully written focus position on resume.
> With PM disabled, initialize the device on first use.
> 
> Hold a reference for each V4L2 registration until final subdevice
> release. Remove access to the hardware and balance the open runtime
> PM reference before unregistering the device. This depends on
> David Heidelberg's V4L2 core fix, which clears the devnode pointer
> before invoking the subdevice release callback.

> Retain the Intel copyright notice for the register addresses and
> drive-mode value from the vendor WV517 driver.

> Sashiko identified the runtime PM and lifetime issues. Codex drafted the follow-up.

This line should be in the cover letter, no need to poison the commit message.

> Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
> Link: https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/
> Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/

Do not add unreferred Link tags.

If you need a one, add it in a form of Link: $URL [1] and refer via [1] in
the commit message.

...

> +config VIDEO_WV517S
> +	tristate "WV517S lens voice coil support"

Make this...

> +	select REGMAP_I2C
> +	help
> +	  This is a driver for the WV517S camera lens voice coil. The driver
> +	  supports 10-bit focus control and exposes the actuator through the
> +	  standard V4L2 lens sub-device interface.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called wv517s.

> +/*
> + * WV517S voice-coil motor driver

...this...


> + * Copyright (c) 2014 Intel Corporation.
> + * Copyright (C) 2026 Maurizio Casciano <mauriziocasciano7@gmail.com>
> + */

...and this one

> +MODULE_DESCRIPTION("WV517S VCM driver");

to share the same or quite similar text.


> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/kref.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

...

> +struct wv517s_device {
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_subdev sd;
> +	struct regmap *regmap;
> +	struct kref ref;
> +	/* Serialize hardware access and open/close against driver removal. */
> +	struct mutex lock;
> +	enum wv517s_registration registration;
> +	unsigned int users;
> +	u16 focus;

> +	bool initialized;
> +	bool removed;

If they are protected by the same lock, you can make them bitfields

	bool XXX:1;

> +};

...

> +static const struct regmap_config wv517s_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = WV517S_REG_DRIVE_MODE,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,

No cache? Why?

> +};

...

> +static int wv517s_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct wv517s_device *wv517s = to_wv517s(sd);

	struct regmap *map = wv517s->regmap;

> +	int ret;
> +
> +	ret = regmap_write(wv517s->regmap, WV517S_REG_DRIVE_MODE,
> +			   WV517S_DRIVE_MODE_12_6_MS);

	ret = regmap_write(map, WV517S_REG_DRIVE_MODE, WV517S_DRIVE_MODE_12_6_MS);

(I believe it's fine to have 83 characters in this case.)

> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Every update of focus holds a runtime PM reference. Do not acquire
> +	 * the driver's mutex here: the caller may hold it while resuming.
> +	 */
> +	return regmap_write(wv517s->regmap, WV517S_REG_FOCUS,
> +			    READ_ONCE(wv517s->focus));

	return regmap_write(map, WV517S_REG_FOCUS, READ_ONCE(wv517s->focus));

> +}

You may use the same trick (temporary variable for regmap) elsewhere.

...

> +static int wv517s_power_get(struct wv517s_device *wv517s)
> +{
> +	struct device *dev = wv517s->sd.dev;
> +	int ret;
> +
> +	if (IS_ENABLED(CONFIG_PM))
> +		return pm_runtime_resume_and_get(dev);
> +
> +	if (wv517s->initialized)
> +		return 0;

> +	ret = wv517s_resume(dev);
> +	if (!ret)
> +		wv517s->initialized = true;
> +
> +	return ret;

Standard pattern is

	if (ret)
		return ret;

	wv517s->initialized = true;
	return 0;

> +}

...

> +static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct wv517s_device *wv517s =
> +		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);
> +	int ret;
> +
> +	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE)
> +		return -EINVAL;
> +
> +	guard(mutex)(&wv517s->lock);

Add a blank line here, so it will be visible that guard()() is used.
Do the same elsewhere.

> +	if (wv517s->removed)
> +		return -ENODEV;
> +
> +	ret = wv517s_power_get(wv517s);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS, ctrl->val);
> +	if (!ret)
> +		WRITE_ONCE(wv517s->focus, ctrl->val);
> +
> +	pm_runtime_put(wv517s->sd.dev);
> +	return ret;
> +}

...

> +static int wv517s_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct wv517s_device *wv517s;
> +	int ret;
> +
> +	wv517s = kzalloc_obj(*wv517s);
> +	if (!wv517s)
> +		return -ENOMEM;
> +
> +	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
> +	if (IS_ERR(wv517s->regmap)) {
> +		ret = dev_err_probe(dev, PTR_ERR(wv517s->regmap),
> +				    "failed to initialize regmap\n");
> +		kfree(wv517s);

Huh?! This  a mess with devm. Use devm_kzalloc_obj() instead.

> +		return ret;
> +	}
> +
> +	kref_init(&wv517s->ref);

Move it after mutex, because it's not managed.

> +	mutex_init(&wv517s->lock);

devm_mutex_init()

> +	wv517s->focus = WV517S_DEFAULT_FOCUS_POSITION;
> +	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
> +	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	wv517s->sd.internal_ops = &wv517s_internal_ops;
> +	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
> +	v4l2_ctrl_new_std(&wv517s->ctrl_handler, &wv517s_ctrl_ops,
> +			  V4L2_CID_FOCUS_ABSOLUTE, 0,
> +			  WV517S_MAX_FOCUS_POSITION, 1,
> +			  WV517S_DEFAULT_FOCUS_POSITION);
> +	if (wv517s->ctrl_handler.error) {
> +		ret = wv517s->ctrl_handler.error;

> +		goto err_free_ctrl_handler;

No goto should come after devm_*() call (there are some rare exceptions
possible, but they should be understood and commented).

> +	}
> +	wv517s->sd.ctrl_handler = &wv517s->ctrl_handler;
> +
> +	ret = media_entity_pads_init(&wv517s->sd.entity, 0, NULL);
> +	if (ret)
> +		goto err_free_ctrl_handler;
> +
> +	/* Leave the actuator suspended until a consumer requests focus. */
> +	pm_runtime_enable(dev);
> +
> +	ret = v4l2_async_register_subdev(&wv517s->sd);
> +	if (ret) {
> +		wv517s_stop(wv517s);
> +		kref_put(&wv517s->ref, wv517s_free);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_free_ctrl_handler:
> +	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);

> +	mutex_destroy(&wv517s->lock);
> +	kfree(wv517s);
> +	return ret;
> +}
> +
> +static void wv517s_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct wv517s_device *wv517s = to_wv517s(sd);
> +
> +	wv517s_stop(wv517s);
> +	v4l2_async_unregister_subdev(sd);
> +	kref_put(&wv517s->ref, wv517s_free);
> +}

I don't know where you got the idea with kref, but not so many media drivers use it.
And actually none of the existing voice-coil ones. I believe all this mess comes from
AI and misunderstanding of how it should be done.

-- 
With Best Regards,
Andy Shevchenko


