Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D31426C
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025668; cv=none; b=YwXs7PKxIOktzjmL41nvzBIiXZ6/hsMaY85t0K2cmv/zgUNM1XM643C4KUPELdwjrj06VVlU4b9+e397Xy+RLvE8hbJiztjZn9FqVzsj9kH2XlMZToWZyO7/C7fWMBHXeNP3u+Q5dAkISumQ3DyoIaBb/GYGFFcj1eC0hagXQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025668; c=relaxed/simple;
	bh=HED7TObOaBI4Cq6qyQlU9S497POTJIEue/pYCTCdRIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F33tgjc4NTV/5W5wogSU8Do3C5Rvmvq3WKQHApZkk8u6oN4NSeGh5e6HcY4vkbbpahOmdjuTWv77e7tJ1rDOOgWCPSmwupApIlMcxVKVHBEoFMZMByI8wyfBC4GDWZg9FmieTGMwhikAP7mVDtDO86R5/iAOZ78RBKrANI7cjoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkd9+Jtw; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkd9+Jtw"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d853e31de8so507207b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jul 2024 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720025665; x=1720630465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R49G0XtubtrbL8GrDK9HBm7pI2JPkFQucpCxqj7AGsM=;
        b=tkd9+JtwFsV0cuX9e3Qxl39nGJBos31Fwjsu4K43pGUW6BPU7ImVk8GNqQL92yPnzp
         +YFj3rvpf8W+bxw4sVm2T034+L16/lRco2yjK/hQxtzobSMLCYjJuHPPFk250ueD0A1m
         sgcaj/oOIXPQD/aEaTQf337Wc45ihq2KQE5TU+GAnpK+P2CLW4pbl/JoaMcK1xZWuZP4
         Rn+FLkjuDnpVQUms/X8KIIeQt3lnqNpQ6D6LSOjWaMckdLRaDZSNfdttWu2JzCDe9OZI
         XJhDcbnUYp26msebmOHr3Xe2wGaBRpzcgD+T5D2fa7Ko3xvLpJRTcC5RXghZ4e+pk3P/
         DIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720025665; x=1720630465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R49G0XtubtrbL8GrDK9HBm7pI2JPkFQucpCxqj7AGsM=;
        b=a0lMqf6jVQHhuFsGgJkGSl/OstsvTpTeJ55jE7E1axdvbK8ILIXLzztgTVGqM5chKp
         3/NrSnDMXiYvI3ygLPK4VNjMyD9Cl9Bq3rfYPoI28Es8/SR86ePn8bsLwQMPZvUk6Mo6
         LWmpmE+LqZPiRFrHnMB/ERRoC5Md9k1G0pQwNH1UloRLCTy8FavPf8MciGI87HUWPdd8
         nw6m9euwow6P11vIanGdqj4LuYxHIzCOp8kbY7O1uywgPrEPQ8Y1R/iBQ2lOIjDfj16X
         Oq86og01/g3OYozY9QHt+auhhYQ/V+k94bcM2zPWqiq/DJzB7Yuv2SMM4fAmMqpflFOS
         qXjw==
X-Forwarded-Encrypted: i=1; AJvYcCWN52UIUR7bbByjnXCM4pXoGDX2NWFwb/PD3nBNIzTZzmi5qtHGymVyH6xuwZlqlSUuwvNaq3W195fdkUUMqaxphI0NI6KB0OMxFH+91w==
X-Gm-Message-State: AOJu0YyfiBh8/Wd8ydGqiG5b2sdmIDRuNTooZk9Om1MPV59pr9/6V5ia
	94oF4uE36OF5Tbt6UtGDZL7OlfjVTLitpWCUsa0WizeYudJeFZXPHFRxf+v1dVix+CqIsDJK+OH
	h
X-Google-Smtp-Source: AGHT+IHPPddfbmBOaG/G2CqNG46AIQzXsUH106aeWtcQPQqZ+KwnCaj5rwkCcfN6hmqW758xDhzcUw==
X-Received: by 2002:a05:6808:1284:b0:3d6:8fc:5266 with SMTP id 5614622812f47-3d6b30f4679mr17451245b6e.11.1720025663228;
        Wed, 03 Jul 2024 09:54:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f98c:6a49:dd6f:a36d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fa39eeasm2156401b6e.40.2024.07.03.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:54:22 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:54:18 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] staging: vchiq_core: Bubble up
 wait_event_interruptible() return value
Message-ID: <485a350b-2016-4ebc-ab07-a2a13e817526@suswa.mountain>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
 <20240703131052.597443-2-umang.jain@ideasonboard.com>
 <2a5c162e-0036-4f3e-b946-bce549e08c54@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a5c162e-0036-4f3e-b946-bce549e08c54@gmx.net>

On Wed, Jul 03, 2024 at 06:18:19PM +0200, Stefan Wahren wrote:
> > + *
> > + * Returns: 0 on success, a negative error code on failure

Probably not even worth adding this comment.  It's assumed.

> >    */
> >   static inline int
> >   remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
> >   {
> > +	int ret = 0;
> > +
> >   	if (!event->fired) {
> >   		event->armed = 1;
> >   		dsb(sy);
> > -		if (wait_event_interruptible(*wq, event->fired)) {
> > +		ret = wait_event_interruptible(*wq, event->fired);
> > +		if (ret) {
> >   			event->armed = 0;
> > -			return 0;
> > +			return ret;
> >   		}
> >   		event->armed = 0;
> >   		/* Ensure that the peer sees that we are not waiting (armed == 0). */
> > @@ -518,7 +523,7 @@ remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
> >   	}
> > 
> >   	event->fired = 0;
> > -	return 1;
> > +	return ret;
> in general this patch looks good to me. But maybe we better return 0
> directly and reduce the scope of ret.

Heh.  If I could have found some more things to complain about then I
was going to ask that this be changed to "return 0;" as well.  But I
always feel like "ret" should be function scope.  Otherwise you can get
multiple ret declarations in a function and it leads to not setting the
correct error code.

regards,
dan carpenter

