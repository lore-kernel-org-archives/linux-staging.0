Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9C7B;
	Sat, 11 Mar 2023 14:06:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l25so7540053wrb.3;
        Sat, 11 Mar 2023 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxlq8/uTJgYMEbjtCGelYIUCNqfehue+4g7FgiD0hVY=;
        b=VUi3TsHSKJk/dBQ56YS4I8QSPOtNfTHud3Jgr+GSBFzLYIs/OQU96xnPGSQEzk2ONy
         sQS4StLl0uxIrZTPr1zjHT4dH/VWNuMdATbUbRcO5ydDNkQh04DPe5DX+noDalPl6VVk
         1PS3YDgqH7U3u9Qda9o7Fhucd5NZQVH/7NfrkaHFPsDEwfclBAuvLn9y/gCxHuKqKdCf
         OwwobKfMzwgez1R6W+jY2diQYIBNNuhxe2QDgEjxxE4+Ln8GQCmBsOFiiZr8z8tBsnIT
         UfV1nO5FYOsRkqPJ9jB6DlNoePqPrmkKYQfGZLb/Fyk0gfBfQk+Hq8pV4T+JeWv21uz6
         D1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxlq8/uTJgYMEbjtCGelYIUCNqfehue+4g7FgiD0hVY=;
        b=Zgrgqn9p3fDpO5ib/vZ98JGrzImDvjR2AomAsra2SOAlTE6uPYWd3sjtdYj0KI+zb7
         olwmARQTQKaHhP9iNGB+TK2oGVG7l+9EcOoIurzwSqQtQKO6P1pOTA0gORqi0x/CpZfY
         AXRVOcUFZsHgzoC3CIapMDzJHm3OFbDc6PxQ3hxVaSvOMXq9yc0yn9W2MKwCxta6MUri
         1o/EEsu+n/zxCcW08soPAfwjPqbpL8pcntHUPpUwObServKsRsFSuUbEBv7qFZYWgRvq
         4ym/QFw5pDLM8JHf4o/DQETVnApRTe2wrAf6xkAz8F/Cq0+L8iXf7/mpjB9kpPrdfwm/
         hGPw==
X-Gm-Message-State: AO0yUKVYDjrv3cIBzB0nJv6dw9Cs/JogRAoDTSlRbMvcevXV8QwVE9WY
	mkQd4GcZdkixjFqyVgFku+0=
X-Google-Smtp-Source: AK7set+niR6ndaQ9lj9k0Qtm+UsNN96ToRd2biC72KZoJl9ovhVyeySqVSCqIKU2nFKzshlCcPloOg==
X-Received: by 2002:a05:6000:d0:b0:2ce:a46f:bbc5 with SMTP id q16-20020a05600000d000b002cea46fbbc5mr1167439wrx.34.1678543583210;
        Sat, 11 Mar 2023 06:06:23 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b002c55551e6e9sm2547829wrt.108.2023.03.11.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:06:22 -0800 (PST)
Date: Sat, 11 Mar 2023 17:06:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: eclose macro in a do - while loop
Message-ID: <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>

On Sat, Mar 11, 2023 at 03:59:19PM +0200, Menna Mahmoud wrote:
> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
> 
> Reported by checkpath.
> 
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
> 
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---

This breaks the build.  You need to compile the code before sending a
patch.

regards,
dan carpenter

