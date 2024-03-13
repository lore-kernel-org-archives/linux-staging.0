Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2C3FE5B
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330838; cv=none; b=QFvg9FN202atc2rkRrLuZ/6zWqLXJta3Qci9bxooUeX0ngQBZZUXlbKrzNnKc7sX+ciFAZhPd7jilcPTa4AxYWwpPzmUPo9EBrHevnz3dhD3Ht1p3j6CV7kUGuXePtcFFivXy8U86QB+dbGxzOnwAYbi2qqezCa21s3xCQKx4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330838; c=relaxed/simple;
	bh=xIq1Cxt6Ky1vqIZb7f65O3yalptD2xDs8qqjYFp1+30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCGJZeXUXaJzbJgvJ5v53Ha4+vf+KEeAuwKiSgTf3pLzNeY9X3cSGE0HznxId0GUV0hWxUtSaOZEwwV1kCNWemgPTQNQIfGz1yGDDxAhoVo/Ju33w7rr46tZt0DyX1rN8F+Bf+yIsJXLAbmyevhu+kbytMEb2DLhzUU1KYMoCFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvLwzKrP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvLwzKrP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56878bb1abdso1986874a12.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710330835; x=1710935635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewxFmA1gMurqYMDR124wjxE1wehEAqBleVZNQFFIZcc=;
        b=AvLwzKrPT5JQzuJDDT69QG4i21iy2g9KQxn/IvYOK3xkCxzqjsSWgMI54+LOJ14h3I
         ugl2lwV6RMDP/dT0vHNCxHE1LAMF4C8gwolRus26x1i2AW7jt5/Wge3AKE48VLDfrtTt
         pxYj1qjiop+/d040GvJGCTYOckcQC2I6IPlBFlmkOu1Ay8Qd7na7v1QaABbD/D6IpBtO
         0fOoXCyMTum8ZA764P1o641gZBWuM8gNl83sj3dcbfL4gIcDdNFhocY+1t60NmBZcHbn
         Rm5aOmb0FT+mIA4VOzat4xAo96aPhvtooB5r26HB3BvvraocJQuJtWoEaRcid5X93OgN
         WtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710330835; x=1710935635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewxFmA1gMurqYMDR124wjxE1wehEAqBleVZNQFFIZcc=;
        b=IorQDq8sbOydXYNDm+qhtFk4AzeIARNRtC2/Wvgexj2v4EXfIN0ybZMoJGpqi/kmof
         8Rn62VLGvHvpL9GLAv3WMYkQu4Z38njN2h/iIUZOBh9dPSjI65xpY8ZFsGazSNpagsil
         YM4rD2L0L194Ko9LdFxCaiZ43uxvK8dEWy0yLB6MyA8Tl28V5vRI5dUvnlIcrZUhUCLB
         7NKxJmygdksqUiR3yL2OEZ3fFCMIWXKtg7dXdAY9JlgCfwou4nBQSZr5GPgGe2eViv5s
         egZh/N+OOIXDHV2U26alw5Is7jA0tRYyo/00YA4xVHlSGhGQaiEc67YwX9+3z6D5aIgn
         V9hg==
X-Forwarded-Encrypted: i=1; AJvYcCWYCVaDUPYkauxHzEj0knfTuI0PbymRkGhFcMQGL4OS0y01PEjmOtH+Ux84VH0HoSmU2pl1ANnNN9hzleTr+VbgPhNmMDpC1YIWE1nBkg==
X-Gm-Message-State: AOJu0Yw5GE+H8oUVbRGNR7kdwhxFvzV2atR7vgUXFf8Zh7nzZviNutul
	AokJx3zqwN7bdtqPIdlQ7Tdh3uU/eRUJL46PzKOldk6wuoiPBKn/DpgcWC3uYfU=
X-Google-Smtp-Source: AGHT+IEdOvbULeMh/tQVIie//HKNMWTJgx+FlUNx1CBPgE6UX1FJSdyGoL/SrVaj+FRhjtvqrCJm6g==
X-Received: by 2002:a50:9e48:0:b0:566:ab45:e6c5 with SMTP id z66-20020a509e48000000b00566ab45e6c5mr3240410ede.28.1710330831292;
        Wed, 13 Mar 2024 04:53:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fg3-20020a056402548300b0056889f3cedfsm393582edb.55.2024.03.13.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 04:53:51 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:53:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prasad Pandit <ppandit@redhat.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
	rjui@broadcom.com, sbranden@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH v2] staging: bcm2835-audio: add terminating new line to
 Kconifg
Message-ID: <3fcb3702-5af2-4b9f-a362-4f08ee626b14@moroto.mountain>
References: <20240313091259.1413854-1-ppandit@redhat.com>
 <0a1aa580-50b2-4657-8308-94bffb194aea@moroto.mountain>
 <CAE8KmOzcD+__7xdC7tegbHO9HEP48s7=reA4j-tvqVDwzHr+8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE8KmOzcD+__7xdC7tegbHO9HEP48s7=reA4j-tvqVDwzHr+8Q@mail.gmail.com>

On Wed, Mar 13, 2024 at 04:44:09PM +0530, Prasad Pandit wrote:
> Hi,
> 
> On Wed, 13 Mar 2024 at 15:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Why does this make a difference?  Is it just because it's annoying to
> > cat a file that doesn't have a newline at the end?
> 
> * It's not just #PetPeeve. I'm trying to fix parsing errors reported
> by the config-kernel tool[1], so that users can view all CONFIG
> attributes without errors.

Huh.  The seems like a very nice program.  I've wanted a way to enable
config items from command line for a long time.  I wasn't able to get it
enable the CONFIG_NO_HZ_FULL.

~/config-kernel/configk -e NO_HZ_FULL  -c .config  .

I'm going Ack your patch because adding a newline is the correct thing
but you should probably also change configk to handle that.

> 
> > I checked, and it's not a checkpatch warning.  Perhaps it should be though.
> > KTODO: make checkpatch.pl warn about files that don't end in a newline
> 
> * I'll take a look at checkpatch.pl.

It's not required.  The KTODO is just a shared todo list and anyone can
add stuff to todo list or do it, but it's not mandatory at all.

regards,
dan carpenter

