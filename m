Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075463BD
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 06:55:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31fe2c8db0dso127227f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694674523; x=1695279323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdJtSip6jueHWIKrIxuq/3ErqyWztQHlLvahC0B+skk=;
        b=DGAGdIWLqsbo7sur8NQGMcfazZFnRQUe7TVYw2+aPAtpbBho4He56rB63D7zssNGaj
         TqwIwRotGZrzJmut7/JwegOO8F3JuzVPqRU6qutqYUC52ca7flTEiDFVELg/QaaJGL2j
         qXWkhFQ4+zfIu8uYbJVQHK14rAbYC3cGEwtREVzJO5hZG3knlbXv9/N19z1+BkOAj+Ph
         ackgfIE9Yk2KjnBPFAH1ZkN0Tqhz+czPAT1u3Fu1kWY7DSWP4WFFT2d61/NhMEff59te
         M1MmieYy8D4J94i96Ewmh9M/LFtYDZDZVdT+NHRJ6bSJsLjBFkU75uYzzag44SOhn4BY
         Ai/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674523; x=1695279323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdJtSip6jueHWIKrIxuq/3ErqyWztQHlLvahC0B+skk=;
        b=ZOSr+EeKioq1KjuJT3ZLA8EjKXYqoQ+e+ynXrHpPcOAMpbjl8WpOUCWEzRDEWReDpn
         L6zmfyfpspN9VcHartCtm2BrQUmrvvbYTKvAzCzeVsHiaDs9qtnt7jcEYgByWiSseYN6
         weBElM1Rw42Gm6Hx9mznIiTUEiRYNE6o58vkHgvQK5CPXmgyeKmd0AUqtcWLqzyCyyoE
         ZqtbE14aWhN+QSeZ1ufTk0bG9XXOBWjlWuTV53rB0fHm3a+e7qsAxunI/cAufJyAiUh/
         LznnWTGmb/r+48g+VPcD37mks1kB38oid4+FlZzGEOln/vMo6BEsh+1nDVHsM+3ztPVU
         3FwA==
X-Gm-Message-State: AOJu0Ywmz2yE6r1a3/KgHH+4o5SS+7BSPSxog5aIRPKyammXdDiYebOL
	U0iLVPixoxqZHFTYv99MC36j4A==
X-Google-Smtp-Source: AGHT+IFOZXhoecDP9qmvD/AMxMEBbJgx3W49iO7bgz4TRdWNNWKhcPAvmDSxEp5Co0lMcqsrM6Wu8Q==
X-Received: by 2002:adf:ed8e:0:b0:319:66b2:6798 with SMTP id c14-20020adfed8e000000b0031966b26798mr4017253wro.43.1694674523195;
        Wed, 13 Sep 2023 23:55:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u25-20020a05600c00d900b003feff926fc5sm1074430wmm.17.2023.09.13.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:55:22 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:55:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 1/5] staging: vc04_services: vchiq_arm: Add new bus
 type and device type
Message-ID: <e815e9d6-450c-4dcf-b562-f302dd9e22e5@kadam.mountain>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
 <20230913195354.835884-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913195354.835884-2-umang.jain@ideasonboard.com>

On Thu, Sep 14, 2023 at 01:23:50AM +0530, Umang Jain wrote:
> +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> +{
> +	if (dev->bus == &vchiq_bus_type &&
> +	    strcmp(dev_name(dev), drv->name) == 0)
> +		return 1;
> +
> +	return 0;
> +}

I was not going to comment on this, because it's unfair to nitpick a
v11 patch...  But since you're going to have to redo it anyway, could
you make this function bool and change it to return true/false.

static bool vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
{
	if (dev->bus == &vchiq_bus_type &&
	    strcmp(dev_name(dev), drv->name) == 0)
		return true;

	return false;
}

> +static int vchiq_bus_probe(struct device *dev)
> +{
> +	struct vchiq_device *device = to_vchiq_device(dev);
> +	struct vchiq_driver *driver = to_vchiq_driver(dev->driver);
> +	int ret;
> +
> +	ret = driver->probe(device);
> +	if (ret == 0)
> +		return 0;
> +
> +	return ret;

Ugh...  I was going to ignore this as well, but later there is a
checkpatch warning so then I decided nitpicking was ok.  Always do
error handling.  if (ret).  Never do success handling.  if (!ret).  But
here it can be done on one line.

	return driver->probe(device);

> +}
> +
> +struct bus_type vchiq_bus_type = {
> +	.name   = "vchiq-bus",
> +	.match  = vchiq_bus_type_match,
> +	.uevent = vchiq_bus_uevent,
> +	.probe  = vchiq_bus_probe,
> +};
> +
> +static void vchiq_device_release(struct device *dev)
> +{
> +	struct vchiq_device *device = to_vchiq_device(dev);
> +
> +	kfree(device);
> +}
> +
> +struct vchiq_device *
> +vchiq_device_register(struct device *parent, const char *name)
> +{
> +	struct vchiq_device *device;
> +	int ret;
> +
> +	device = kzalloc(sizeof(*device), GFP_KERNEL);
> +	if (!device) {
> +		dev_err(parent, "Cannot register %s: Insufficient memory\n",
> +			name);

Run checkpatch.pl -f on your files.

> +		return NULL;
> +	}

Stefan already commented on the other stuff I was going to say.

regards,
dan carpenter

