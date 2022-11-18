Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274428E3
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 09:01:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r126-20020a1c4484000000b003cffd336e24so2348985wma.4
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 01:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6hK8A2rAN4d24KDK5ABoo0V031IyWeiGrh9El3YUPY=;
        b=WMSkKPKVgzPshxJZXoPqCgykFa2Q6jLIDq9gctLfPDbYW+zXN5wTHSIOyT1Eqpzyqy
         /Oa6/hyYWTWoxAgyQ5e54+GfGzjsC6e7lzw0KFQUOy/KhcOef3ixOCdXPvzhKZ1lnY4v
         URbbGTQ+S5yFATOWflB8AcCgi1tBqLVboO42SF/ZJ31z45/vWC4Ul3tJnKZ2HayJSeVT
         +/s4y5x8cNP10J5PiZhhqsDB5LGh/BXwIECwjIm34lqTwr7Lk6d0J3Fu1ouImD0g8LKJ
         3Phczu2ipekrMIa8aVYmFGgO1bN2tCRJ/3YTw2xZwUWvwS4L/DAJkXWcKeTON9p6dRyh
         d1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6hK8A2rAN4d24KDK5ABoo0V031IyWeiGrh9El3YUPY=;
        b=IRsdgS57/2yY99A5BMPZTCC8uzUzzIHcrR+52LvUtX8lRzH6YIRy0oC84EfXZcmur+
         ob2oXNci33lbVbkdt+/FoZDIYOzET7PATpUkQfWhf3ptqKjNiNF+PV2MZXrebc5g3qXt
         2yCuAKff47pOwJLsshsTzPYRWjkUpe5O4d2m/96JvwC8M+2a/u8mJFsFvpW/Gv509xmw
         0eeuuGYvibUNrk5vywA2gsLI1/AzY1QhUCT5ggTBXjaa29RygRtYS0DbLuVEZitWn7RE
         eVwPIcT4iyat2XgzQgPqml397DGwaEFntoTqaRETeEJlMBK0wBak17xDDxilOx8HxeL0
         kk+g==
X-Gm-Message-State: ANoB5pkqZEkCyH4edDIdi+L5cDjyTgVVjlDbI27SHkfWY8ivOMEhpsC0
	BiNvFMfQZVae3gYihwm8UU4=
X-Google-Smtp-Source: AA0mqf69UydmZ4WVQnY3pESaLTvOyJU7cFdL5tejY53onzOZSvxdUOc1AtYvBrSboRJgr+axBmvemQ==
X-Received: by 2002:a05:600c:35cf:b0:3cf:aa11:93a8 with SMTP id r15-20020a05600c35cf00b003cfaa1193a8mr7851714wmq.31.1668762097604;
        Fri, 18 Nov 2022 01:01:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c229700b003cf75213bb9sm7980034wmf.8.2022.11.18.01.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:01:37 -0800 (PST)
Date: Fri, 18 Nov 2022 12:01:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/3] vc04_services: mmal-vchiq: Use bool for
 vchiq_mmal_component.in_use
Message-ID: <Y3dJ7mETwKNVH7dU@kadam>
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
 <20221117160015.344528-3-umang.jain@ideasonboard.com>
 <Y3bQiDw11t4pRokP@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3bQiDw11t4pRokP@lunn.ch>

On Fri, Nov 18, 2022 at 01:23:36AM +0100, Andrew Lunn wrote:
> >  struct vchiq_mmal_component {
> > -	u32 in_use:1;
> > +	bool in_use:1;
> >  	bool enabled:1;
> 
> The patch you referenced says:
> 
> +If a structure has many true/false values, consider consolidating them into a
> +bitfield with 1 bit members, or using an appropriate fixed width type, such as
> +u8.
> 
> The code did exactly this, using two bits fields, in one u32. A bool
> probably takes up 4 bytes, maybe 8 bytes, so this change probably
> doubles the storage size for these two fields.

In GCC and Clang bools take a byte, but the C language is vague and
other compilers are free to do it differently.

> Are these fields on the
> hot path, where an extra AND instruction would make a difference?

This patch takes the first u32 for "in_use" and squeezes it into the
same byte as "enabled" so it makes the struct four bytes smaller.  There
is still a 3 byte struct hole between "enabled" and "handle" so we could
add more 62 bool bitfields if we wanted.

In the v2 patch these become:

	bool in_use;
	bool enabled;

One byte each and there is a two byte gap before "handle".

regards,
dan carpenter

