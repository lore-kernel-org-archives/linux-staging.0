Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0C7481
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 14:25:46 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n7so2039357wrx.5
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjsZya+QHJjprUyI8l0iTCJWloAUubwO/7pn5KMVxco=;
        b=ar8Y5jds9GnCb1bu9DJlG8T+9M+euQ3P5Pu6wNsuF9/BaX1fRYVPzQ7B2JdXHWJ3dx
         jJBVGU0BUXV4y8nCmJF+RLL7OyT+kIJjeC8aN2Y8OIjJoVZMxnvnOUeSzAyL4uGFWUbC
         eHLU+nygimgKouEHjd6736nsBkRFYhWSTAgCfuX4PxBBulOya7uXBLma/0Xld25w7bh0
         +1ymYyPEV15P4mapiPWA6b17HdvXzp6qG0dqm18xTcFLjKIHl0rYU0S05H+AXxnPupeZ
         mZ9EzJniQwpnEisWTjPN3ei4BseZCp1PV1/ui9dRQUPC6HbG9XHtlLvDWaFJDhjtRhSh
         5mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjsZya+QHJjprUyI8l0iTCJWloAUubwO/7pn5KMVxco=;
        b=gY/ivd813wCp9Nk/TpnXShFiQnHZuLQI17y/hYKnx84YDqfhq6rvnS5z3tgby79Vdu
         qzlLR0w8jR483e/ivW9aT36xotS8TS32WvWebQ115D9VZ6Ye/VkpvQTHBE6n/VOwIY3D
         eilgDd9ZIxJ49ZQNopYb/RxgY1Lyun5b6qfAKlkNznGHzStt0dGWNl1G7sxzizOD+2tT
         Hcj0cIqYBRe9GRvS4a27Y7yrl5Ebgl9r8zXKABtBKyoqnd1HEt+BrJVLEXFn9PWQuILD
         FLHw8uaMlPZE0qhF7GdcSMgRiIWNt/huLTzNd0wR7Q2XzaP9fL4pt6uFZPDHm8ZV+C5z
         +L5Q==
X-Gm-Message-State: AFqh2koJ0By5tmK9WyhwsBxSGEmZGAmn+/Ut9AOOP9AKv3wFgWyISno/
	ozn/cy4NAApKPPvt4D+llqp/tqoNbdpQvw==
X-Google-Smtp-Source: AMrXdXtDiP7c/DabjOn7bKOH7ivh1JfCmDp+cs2iDNvgeWytgRdBmlEkHJc7fFHINSKci4IxJ/rbnA==
X-Received: by 2002:a5d:5e85:0:b0:2b6:2eb3:82a1 with SMTP id ck5-20020a5d5e85000000b002b62eb382a1mr6224673wrb.67.1674138344975;
        Thu, 19 Jan 2023 06:25:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d65c1000000b002be15ee1377sm7953480wrw.22.2023.01.19.06.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:25:44 -0800 (PST)
Date: Thu, 19 Jan 2023 17:25:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y8lS5eBliYw5EHBb@kadam>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
 <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com>
 <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>

On Thu, Jan 19, 2023 at 01:47:44PM +0000, Phil Elwell wrote:
> > > I understand the desire to remove the custom logging. I don't welcome
> > > the loss of flexibility that comes with such a strategy
> >
> > What "loss of flexibility"?  You now have access to the full dynamic
> > debugging facilities that all of the rest of the kernel has.  What is
> > lacking?
> 
> Perhaps I've missed something, either in this patch set or the kernel
> as a whole, but how is one supposed to set different logging levels on
> different facilities within a driver/module, or even for the module as
> a whole?

Yeah.  You will be still able to do that and more besides after the
transition.  Cleaning this up makes the code better in every way.

Documentation/admin-guide/dynamic-debug-howto.rst

regards,
dan carpenter

