Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17961FCE
	for <linux-staging@lists.linux.dev>; Sat,  3 Aug 2024 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722659328; cv=none; b=Nqz6YResehj2kBfZxoBwrcqp+uDRIpCc9QJ8q4Roc7TLy27+r+Nw4jgJVne0cY5SagNLr3dsOphWQwvK2mC0sCjiqkBbaMUAmXa9jBzr+NaZYoKi6oK27h8cEBQCkh1/BiiM7hoI0oOx0X12/PO2mGRl48Beunu4qeQBJteH4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722659328; c=relaxed/simple;
	bh=A0FigfRcdI5TmtnLIowXNHNmseW9E6VQpT3GSq9/Ec4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHRxGHrxGJF8A75xhuB4Ujm3Tt4AApqwKaazWm1H/GMoYlvdghLwxyLQwaxnCu53kNVJkr6yQJz7WZpvlaNxirx8E6Hlx/xmPeyhQ0KMHq8S64vkiptsfOUT5B1NU83VOG+rUv3IcpLx/91547LqMAMQXJfjI9w0kdIkyu+ydjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUus+uU6; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUus+uU6"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3db1e21b0e4so5868197b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Aug 2024 21:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722659326; x=1723264126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzn92C1AHPPlWzjTKcidqRR6Rxvggoz6sIIwczUKFlg=;
        b=OUus+uU6iCiXWbiern1qt+oXaYS0WFqxyrfSaHuee9mXoLnl6f9ay4FKA85F7PwYsj
         pxujWfuLIrcbNBDtDnaupbNOv+33zAIAz8ys7p9FwtySlO7GR3doBCAhGZnMyu9ASq8S
         BLIWc+WIfrAXQjRdq0IXeHSIzuA3lFKMh8B3ux/Xs03IPStSNJvGOhgEgEI/6Vn8P6lA
         NVLunfgTDmdUzl6CuvRmjfszrfXe72cB+BBQuGNr6e0PQMldnwvRHTHItnF6cxAIegSq
         ldFCI3ZFpF5iwRvRD/YKnvl5PWDiEGeIRvn4PZdsBOcKPyskjIsXbMseFrXPOkf+H0ER
         NcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722659326; x=1723264126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzn92C1AHPPlWzjTKcidqRR6Rxvggoz6sIIwczUKFlg=;
        b=aKv201mcjyqb3RvOVsuN15mOLtgjD8gqYiaC/Sh0wMFia2CNNanOAJ+Oh0Eri3PUha
         /7cyA+vhh9O7qlRS6yWIoYp8jLewV1fynYtiQUBc4aIdAeWiL+BYGf/gRZSpjLFw4ZuA
         gZ2eolOQXVX3CYNVv3LCWBcik5RC0QQA+LZ66nYa+hZnrNpQXb9MeeIGo/AbiCVEzv3v
         o/QZk8Ca8ZXlZml/VQIajlhWSI9jVgFQAV4d8N+H2nVIYIWnYDRs914j5DLOjFL9n+zD
         0uUwrorEdSXuVh2LBeok1hNfPTDvVi/bs6Mu/H8pxi9nqsQIbx5KVsrPOGyIQY7Cvx0F
         7m5g==
X-Forwarded-Encrypted: i=1; AJvYcCUE6sLGIv8aRWDYmfk2HX5asd9f6IQrcMijF0ICNVyj3UHe4F93ttKqxlZ0TGnzn+KDDYBr9TwcG59/0NIajC2eI0y+WOchsIQVuP1WvA==
X-Gm-Message-State: AOJu0YwxwID/JIpE0EUypzqA6XeNeBogyi7b6Q+5zBJ+1VfeLgCaHUWP
	on3hDqd8ViNYZ0zDdvcScuf5nBVDagVMysJlT26ftZ1fYXHu1IQEIOmMKymbMOc=
X-Google-Smtp-Source: AGHT+IHxWS3iNqvAAzqLqQWuBAFRbxKqLawxiRW8lxpchWWctf2N+xj8WDxTH2k/CshLA+HBc83npQ==
X-Received: by 2002:a05:6870:3314:b0:260:f054:7774 with SMTP id 586e51a60fabf-26891d3cb1dmr7021954fac.13.1722659325803;
        Fri, 02 Aug 2024 21:28:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2689a2a826asm790540fac.8.2024.08.02.21.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 21:28:45 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:28:43 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <8d383b9d-d029-4706-91c5-9623fddf5df3@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
 <2024073020-reload-vanquish-f937@gregkh>
 <87v80i475p.fsf@melete.silentflame.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v80i475p.fsf@melete.silentflame.com>

On Sat, Aug 03, 2024 at 11:28:02AM +0800, Sean Whitton wrote:
> Hello,
> 
> On Tue 30 Jul 2024 at 08:38am +02, Greg Kroah-Hartman wrote:
> 
> > This isn't a "complex values", and really should just be removed
> > entirely and use the correct "static inline" properly.
> 
> I found that there are several headers in
> atomisp/pci/hive_isp_css_include which have this pattern of defining an
> _INLINE_*_ preprocessor constant, and using it to choose between
> 'extern' and 'static inline' in each file where the header is included.
> 
> I don't know what the author's intention was.  Are you saying that you
> think this preprocessor mechanism should just be replaced with
> hardcoding 'extern' or 'static inline' in each file which includes one
> of these headers?

*You* need to figure out what the proper thing is.  Not us.  That's the
difficult part of writing a patch.  Once you know what the correct thing
is, then the rest is just typing.

That business of defining STORAGE_CLASS_SP_C is weird.  Figure out the
authors intention and find a better way to do it.

Figure out why your code compiled as well because putting parentheses
around (static inline) is a syntax error.

regards,
dan carpenter

