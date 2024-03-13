Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A21514A8C
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 05:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710307904; cv=none; b=shr2tXfUFlUcyLJk7o9gXOUmbcKu4fgTZCergKH40xTfhMc07JS8apfxqMmBDg55WZXXAYH/GKlxmsdoq572Cy9Qlh5XiwlsHUoP5PNuSrLLMEkQQDFj8mFFANwCQSPgomKGpuZmLl+bAGLsmMsH6uhFH4npHV6wwe8wB0A+dXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710307904; c=relaxed/simple;
	bh=98pr1Hpf44592metRLxndNXD3E1DuVLYst9ZrBxFXrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKh2csvJgB5s/qbdcbVtir2BjqJV3j4T4wBxB5M5+wEziQthjvLDjyBBzoUAIgwu1bgE4H9wUwQo4o7oB9D1LklJeRQqGWHgRT6/kAHJlouWpSprzRdpHBLPxjcEkd0dM/kWGNZWGuHByb3d+LuqGlfaSOjaRBRlesMMbywFAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNOMdTK+; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNOMdTK+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso6243453a12.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 22:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710307901; x=1710912701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIj0/u5E+oGfSCmtDq3eH4DxwMciq6Lgs6F+SLCaAOg=;
        b=VNOMdTK+rTxhUEEbfAesdAEPHkFHX+oLbsNXG97IZw/rVsNCXKMxX5fsVRf6NUxP8w
         o2/9Sx5ZavROlc8aCj9G15DsBe/jxhiAZx2qrsaelcFzpiVzVWZrl65zQ1ZM05xCORxu
         3a6r0b8wL4qsJrWvbwA2YKvI/1TR9KY2lMUNNfAOAzbR8MyfbsMI8DvkJAObQNaW0uFt
         wmj+zmdiGWmrx8QmV46VludXBgPtXpvrnWGwLj00L7/G8HXFe8IlYwj6P4A8pyoIjSiG
         2mHgjNaMdW3gDUNitc0gMgpMt7pbo6bjULWVTX6Ln8OuRY9yHA8EeEbzW2sAaB7eBTD+
         T+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710307901; x=1710912701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIj0/u5E+oGfSCmtDq3eH4DxwMciq6Lgs6F+SLCaAOg=;
        b=ua497gHP4ibdRR2tW7dVe44WaE4EgBBG0KZ+zW1NMmr/DJVtP2gSz5OU0CzN3tef4o
         k3E45/tUjRQuChplgs9k9fIdAldr8aQeqBkhg2wZEDawzE0yehC9vw5ZdY080KkyKM0X
         73sIg/C+IunVrqwB0PZiuO2VTozYiYmUKdeHfU3F4ln8VHnaJqN3bRO5f2ppCQJQYlff
         2vhAf+UwbqhSosEwPyUWbJjL2LLtBlsHKyHZpI/yw2ChpYAs7w6gRkMyg0vJEmWpm8jT
         mGtdsAWsfFjFn00hpnppSVavifDZEpScGTnauQZ0q77Fwk3dsXkbO1IJTrK71WXZpwG5
         dXpA==
X-Gm-Message-State: AOJu0Yywdgz2TnSX1gIEvnZZ5lGshCcve4DsryhdlrECFtsJ/2NDpyJ+
	ppY5w+3XineSgw5uGo4FxSxI6VR2MdKnwUh99JWcZZJBo47VDbEfjfYPYe/6yK9leb1g7hQ3hD/
	Q
X-Google-Smtp-Source: AGHT+IHtLhZXb4OjCdQdy/kEyC9G/vMQH43oO8tc5F0mhsMUXShzqWiqsAAO5FXtqGwlIHfeH+bZRg==
X-Received: by 2002:a50:d593:0:b0:565:ebf2:a257 with SMTP id v19-20020a50d593000000b00565ebf2a257mr7373006edi.19.1710307900657;
        Tue, 12 Mar 2024 22:31:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y18-20020a056402359200b005648d0eebdbsm4580549edc.96.2024.03.12.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 22:31:40 -0700 (PDT)
Date: Wed, 13 Mar 2024 08:31:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 3/3] staging: vc04_services: Drop global members for
 tracking connections
Message-ID: <9e4ef491-e5aa-4e3a-a9cf-bb688b24c2b7@moroto.mountain>
References: <20240311231607.124491-1-umang.jain@ideasonboard.com>
 <20240311231607.124491-4-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311231607.124491-4-umang.jain@ideasonboard.com>

On Tue, Mar 12, 2024 at 04:46:07AM +0530, Umang Jain wrote:
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> index 3cad13f09e37..4b79fccaa95e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -6,19 +6,13 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> -#define  MAX_CALLBACKS  10
> -
> -static   int                        g_connected;
> -static   int                        g_num_deferred_callbacks;
> -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> -static   int                        g_once_init;
>  static   DEFINE_MUTEX(g_connected_mutex);
>  
>  /* Function to initialize our lock */
> -static void connected_init(void)
> +static void connected_init(struct vchiq_connected *drv_connected)
>  {
> -	if (!g_once_init)
> -		g_once_init = 1;
> +	if (!drv_connected->once_init)
> +		drv_connected->once_init = 1;


This is a nonsense function...  once_init is never used.  Could you
delete this function in a separate patch at the start?

>  }
>  

Otherwise, I think it looks okay.  How are you testing this, btw?

regards,
dan carpenter

