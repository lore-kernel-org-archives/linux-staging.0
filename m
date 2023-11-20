Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B05134B9
	for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vt3ZIDfu"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507ad511315so5855412e87.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700476443; x=1701081243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/A67yCsKCYjT4OzekwJL7Zg9Z+4KiWMU478yrnJ6A=;
        b=vt3ZIDfu9Hzo7atDhRXaJH2uftI4xOGPvnxNFsQp8ZVN/cS5c5wgqLUNtLm8M3mu05
         TpgwqPCTe/AiZipTM1RaaQhAN7NbBcZZQslDubKHXY4lFqQbxL2ISXq7dGrxvdk0s1sO
         zZ2hvWlW6KrBccBgOpFvy86SIVQ1OYLSsHUJKHtUt0lx284qSTNwIovAfqnjJMsLtphO
         +wv3FnPCnEca0hcRG6e2RAhUsXbSTo8/WmF/eg+NeJ6zIpcehld/15BTCQhQ1l3fc8Q/
         tbGwIWziuzKnF/Dr2/JjzbHZ5SgUpnACzftgEUZsp90B4E98i7DToJghnN41P21TiGT9
         /cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700476443; x=1701081243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+/A67yCsKCYjT4OzekwJL7Zg9Z+4KiWMU478yrnJ6A=;
        b=RhmsDEA5qEDIv9t9khROjPlkQ7sNgMketNeRIQ0TxiUWOgGqyjz1GAi72OEaoO9LRo
         nsvAY0l/zjJayrfOp5LjiazNud9WIwj43sjgYasjnEpfzut5zXS31gDZd261C+xBtdcf
         2q270BUn7ZULODKsMM8t+aOAfZcdVk9YfSEDWAfcR5swDVdP2lHIPakjjiBcdGysQu29
         s9OtQoOZ7cT6nDtuimYFGxvlDOjgoYw2sbA9tg4RIzvMCmmSLXzF9hRV4yr8Ape0rfzu
         uOYjsuVMaT/YgoM2ZegPNBxcoOUAawCECoNJXXTZ0MwzhG60UgdQyfkyDINA6Et1yDD0
         b20w==
X-Gm-Message-State: AOJu0YwFij7mDjFPncEluoQi8Q+c3eBhMbCRqZHJ8qc2fiKNDkvDRgXP
	TKpoz1SvLOxcVZnvdAJ6Toc0jw==
X-Google-Smtp-Source: AGHT+IGC+q6OhZa2pu5cx3aVWD4t46z49DbuzV37RCxExtAfJLBJFt42IgxDX1xcBMYvlOiJRA17RQ==
X-Received: by 2002:a19:5517:0:b0:503:95b:db0a with SMTP id n23-20020a195517000000b00503095bdb0amr6382815lfe.12.1700476443129;
        Mon, 20 Nov 2023 02:34:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d49c8000000b0031984b370f2sm10768685wrs.47.2023.11.20.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:34:02 -0800 (PST)
Date: Mon, 20 Nov 2023 05:33:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 10/15] staging: vc04_services: bcm2835-isp: Add a more
 complex ISP processing component
Message-ID: <fe7b0a08-941f-4dbc-b89f-d3da0a96ac32@suswa.mountain>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-11-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109210309.638594-11-umang.jain@ideasonboard.com>

On Thu, Nov 09, 2023 at 04:03:02PM -0500, Umang Jain wrote:
> +static int media_controller_register(struct bcm2835_isp_dev *dev)
> +{
> +	char *name;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media controller\n");
> +	dev->mdev.dev = dev->dev;
> +	strscpy(dev->mdev.model, "bcm2835-isp",
> +		sizeof(dev->mdev.model));
> +	strscpy(dev->mdev.bus_info, "platform:bcm2835-isp",
> +		sizeof(dev->mdev.bus_info));
> +	media_device_init(&dev->mdev);
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	v4l2_dbg(2, debug, &dev->v4l2_dev, "Register entity for nodes\n");
> +
> +	name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
> +	if (!name) {
> +		ret = -ENOMEM;
> +		goto done;

Oh crap.  This function doesn't clean up after itself, but instead
returns to a One Magical Cleanup Function...  This style of error
handling is *ALWAYS* buggy.  But in this case I only see a very minor
leak.

These two cleanups are under one ->registered flag but they are
allocated separately.  So if we only complete one action and not the
second then the flag is not set and we don't call media_device_cleanup().
(This is one of many typical problems with One Magical Cleanup Function
Style).

> +	if (dev->media_device_registered) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +		dev->media_device_registered = false;
> +	}

It's just such a headache to review...  (That's why it's so bug prone).

If you wrote it in Free the Last Thing Style then you could get rid
of a bunch of flags like ->media_device_registered and
->media_entity_registered because at that point you would always know
what you had done and hadn't done.

regards,
dan carpenter


> +	}
> +	snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835_isp0");
> +	dev->entity.name = name;
> +	dev->entity.obj_type = MEDIA_ENTITY_TYPE_BASE;
> +	dev->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> +
> +	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
> +		dev->pad[i].flags = node_is_output(&dev->node[i]) ?
> +					MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +	}
> +
> +	ret = media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_NODES,
> +				     dev->pad);
> +	if (ret)
> +		goto done;
> +
> +	ret = media_device_register_entity(&dev->mdev, &dev->entity);
> +	if (ret)
> +		goto done;
> +
> +	dev->media_entity_registered = true;
> +	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
> 		ret = media_controller_register_node(dev, i);
> +		if (ret)
> +			goto done;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (!ret)
> +		dev->media_device_registered = true;
> +done:
> +	return ret;
> +}

