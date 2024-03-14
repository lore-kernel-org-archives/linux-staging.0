Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D69A71B3D
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430797; cv=none; b=KJq1vC9PCYPFewEv2tB+DOmu/uKcAOYbGxQeEZPmj4w68ViCIE13ECXPB3Sm6fgGKP8WiueORmrFWeKGLGkJiC9gtCiOFvDmkn/Hi3Od6FDQbBE1WCs62Q83Q1d5ZabhAcAJLLJVYMiMGUyXHsI3lpp420TxYUdNd+AsnB3VGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430797; c=relaxed/simple;
	bh=r4AiZ7P+Qex8YnyEMjzDMz0uOOP8XSxFz9qoHNp1kQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwVdZmnesBjyFSxM5YWoWK7N8B9uEYvFeN0x3KaPDZaktbDudHwuFH5hZdn72E2VYt2GOLsWUwrXrqP5cr208v1JynVzTEdbWOuhlNF0hwkiu2ZkDb4EkRmz/LxZNmNUAAJvDkhLY6NnW3/38IW0p3nKPahS9gScGi6TQYcbIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqo8vx03; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqo8vx03"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e94c12f33so964964f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710430793; x=1711035593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otPRkRAGBW1WEeu7Af6F6p2tDMsDbUa/mOnkm6aEgUk=;
        b=fqo8vx03kfJq4TtcnDJUskv2Iq5ztwg6mIpazx8c8xOjId5tMGJyn2+L7o14JqhHdf
         fL8q7MranUMetTlCLweqAVMeJNPQPCyiqQg0jj1HqJgCQhXmZYmp8dvwP+DVVv2g9bCq
         chKAEaoctxJQTd8b2uhvVgVLMqWrDcr0Wpv05lAj1FFuTmfimWSKSHSrl0x1MF72tXYe
         MvZOlFdg4DmqqXy5OqznsZDaAz0y0HAg1+tAZHkIWo0luCuZIG7v1Uz/D9nOdR6A2iGD
         IiP1qgPF4TD9wU8gXdG16trPybLGGmNhxabIliPLc1G7uFUdJIHimjLYLQfRz6SoUeqR
         yOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430793; x=1711035593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otPRkRAGBW1WEeu7Af6F6p2tDMsDbUa/mOnkm6aEgUk=;
        b=iOlxyFpK9Y8CDoC7a957oyKw3peic4MaYXosg4Bhz+Wpjal6hdvQa73xB5ICjgAdb6
         gMuZB8yBD3MhuoCWhyuh3uHgZ8Sl0eksepE03e8lDCizvulnIHTgqy/qA1JvwnkPeeps
         yknL+1H0631b9/IZr0Xn7eUzeOPpRx2Rnt2O4PNgr6npcP8WrkiVOLk5I06laNcx4xdX
         njMtH7Dl9gTmEBodrVEn1aIbkloudaVvz07Pj/M2g1mFwu/qOYxf5kv0zBA9+a85/m8e
         v+zbVdP8HTK5GMCjgOp/Pr4/Xzvy6FHUEsb7GI0KYc/BJ05WYfP5wbMkLCpikSkaHfuW
         K+sw==
X-Forwarded-Encrypted: i=1; AJvYcCUUSgm+Fx6e2+fbYdxNfupo/Qjw3NrCYYbaVCpVwQf8gnJFgRfzM0qPH6mHwz/U5M2FBCdiqEWuXqKd/zXT2JVIx7wecjO6fPlMa/6t+Q==
X-Gm-Message-State: AOJu0YxasFZE9sQ/56on8fY2O7YcOU5MKGDN/QbhshJoHoaGNbsviz6x
	DMOE/m8MvMRsoyMUpdI2qtx0eWUNbejE65wZnxJ1sd38JVn4ZUz/bOf/02v6aOg=
X-Google-Smtp-Source: AGHT+IGRMeOns2GujgOvWomcjAqCxAmGSPCwHvxzdMl5UTa4KOZ7aAAH1V4uEdiphvel5XZsyRjTBQ==
X-Received: by 2002:a05:6000:1104:b0:33e:cc27:a9b9 with SMTP id z4-20020a056000110400b0033ecc27a9b9mr578358wrw.11.1710430793258;
        Thu, 14 Mar 2024 08:39:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bo16-20020a056000069000b0033ecb111a5csm794552wrb.83.2024.03.14.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:39:53 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:39:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 4/6] staging: vc04_services: vchiq_arm: Drop
 g_cache_line_size
Message-ID: <a96f23eb-d845-4a5a-b113-116475b90959@moroto.mountain>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-5-umang.jain@ideasonboard.com>
 <171042787993.252503.4484493303920768949@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171042787993.252503.4484493303920768949@ping.linuxembedded.co.uk>

On Thu, Mar 14, 2024 at 02:51:19PM +0000, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-14 10:06:05)
> > The cache-line-size is cached in struct vchiq_drvdata.
> > There is no need to cache this again via g_cache_line_size
> > and use it. Instead use the value from vchiq_drvdata directly.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../interface/vchiq_arm/vchiq_arm.c           | 50 +++++++++++--------
> >  1 file changed, 30 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 8c7520dee5f4..282f83b335d4 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -71,6 +71,16 @@ static struct vchiq_device *bcm2835_audio;
> >  static struct vchiq_device *bcm2835_camera;
> >  
> >  static struct vchiq_drvdata bcm2835_drvdata = {
> > +       /* This value is the size of the L2 cache lines as understood by the
> 
> This file has a mix of A)
>  /* bulk multiline
>   * comments like this
>   */
> 
> 
> and B)
>  /*
>   * Bulk multiline
>   * comments like this
>   */
> 
> I'd probably use B) when moving this, but again, no point for a respin
> just for that. Only if there's another revision. Or a patch on top to
> normalise throughout if you felt like it, as this is only a move anyway.

Yeah.  It should be B.   A is only for in networking.  But we can change
it later.

regards,
dan carpenter

