Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9B15ADAD
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993291; cv=none; b=HR+4eCMVIdt17S+uLMEajYFO456gMmyuCBIyvWoznZnn9d16E7p/a4Ze6iTqbJFAM5VmCYvu1rBPdCHLmXSFVOsIQBZKtPwBsG8sXXGwpd1LpFuyi7J4Xvoaq7iDh5hditapc55kwIZy2WtbS0Jv3J0oBupRzcxzQq9wOnhAqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993291; c=relaxed/simple;
	bh=k7aaJ0aPxRXPQFxTOi8dMi8Z12jZrKn8v3x0yJrtjGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fALtaYSBjcwmPuHGjF7S/YvOMazN8vkCIuBmvWOuM3MxPTZv7lZDTM5lcKewULkq++XvRIXh17rtnIEVh4FDdHOlilTyWeWm5RrvMC37EVnum0wN8zptvenLg7Jo7sHwTOt5QR3cVLD1g/tcs7YN3qK/jc/oTi0zMwiv1/48UW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHNAqdiD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHNAqdiD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b79447c58so531624e87.1
        for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993288; x=1717598088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
        b=DHNAqdiD+7IGOs4SzChLisSUvAkL8zSre5LB/vP9kOUcGmCd3UMba6O69cuJuep0no
         FzgILMlAPBArzefnlklHYNa3tOPKpoAvTVDSio9X3CVdjSAUtCXHbMv0w3nFgLSXqDno
         XhAtqvnjvH/4oJRgRpgADljPw+tT0Jbe5Vm/8VYjXvQ1AEeEJN6qn41gTpRHubApKgMv
         HeAvgopdG7s9Lqfdi0AAHVCljDcL/m7TsVk12YAhQvKfkJlsteFdjBonRpIb8bBj1fk5
         nOzzDK/GIWH7fmvacSI48BS/Vt9rJBXYPmffF3a7DOZ/Xm25MNe0+aERZquCtwdPlM27
         kUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993288; x=1717598088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
        b=FdkH+4GPMpHMw6EIMUWB4JUkmGiUnyUNxXdCIiYoKJzq6jzVIgq9MTU9ERzuJCaJfJ
         4ga6KE4W5v+VVFdzQwVQC4r1kbzzg3P/hI1G74MGPZ9g/XDJAUW/CnsatrIZvZVZBBwc
         3EJzLP0xeQCHw5VKjA7r7zRwpWa4bidtVm5jwjuTFxVEG7/4Y/b5ef1m5aSOdTesJkJ/
         +/pcqonSR2G1uHVuOqXrcSTYYgVS1SaCCOOHeaYoxFfZR8GeAicHcgmmSDk5F16DaMlr
         aUJ6wEu9hmIuHdS9xqeRgbpO3LOrpOa63rWqjAxopWPgdnpNGsdF5ApvdmChZ2XAX/o9
         KdxA==
X-Forwarded-Encrypted: i=1; AJvYcCVd5rR/RRg+LFuryNax3fUcQ610OjXDPAHGiszY2qGX5I2hIFd6q2hhE3/7Dl7l/Be2jXo0fUkW7RNv5ytr6+/POkyJ5d9TPxAov/6s8w==
X-Gm-Message-State: AOJu0YwIIqXH0ybXSSh/1invefhsBtDiXYuWY7XBtj3GL0fJC37GnIoS
	69Xhsn8t9LOTOlx3z0K4yK8kCTIa5LWQNwxE0KmSD08wNnSI1I2IXYIvdPhnb+k=
X-Google-Smtp-Source: AGHT+IG3K+ljsCGYaD/stGYSzU8eiALGsrunqkKd/2A+qzz3MjkiDrfMI9pSxgVRd/o4UWSEa9q4pQ==
X-Received: by 2002:a05:6512:527:b0:529:b691:e37e with SMTP id 2adb3069b0e04-529b691e9d2mr5105087e87.40.1716993287614;
        Wed, 29 May 2024 07:34:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a64a03e574dsm74882966b.14.2024.05.29.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:34:46 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529004047.GB1436@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> >  	}
> >  
> >  	/* Iterate through each output port to discover topology */
> > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > +	for_each_endpoint_of_node(parent, ep) {
> >  		/*
> >  		 * Legacy binding mixes input/output ports under the
> >  		 * same parent. So, skip the input ports if we are dealing
> 
> I think there's a bug below. The loop contains
> 
> 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> 		if (ret)
> 			return ret;
> 
> which leaks the reference to ep. This is not introduced by this patch,

Someone should create for_each_endpoint_of_node_scoped().

#define for_each_endpoint_of_node_scoped(parent, child) \
        for (struct device_node *child __free(device_node) =           \
             of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
             child = of_graph_get_next_endpoint(parent, child))

regards,
dan carpenter

