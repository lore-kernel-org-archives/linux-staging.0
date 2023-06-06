Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B2611C
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 07:49:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so50388435e9.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Jun 2023 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686037790; x=1688629790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdnARbpSMnIKjKaz7o17pETc41XDZgv7jLp4vCxZWMM=;
        b=iQMzHM91jZ6EQEd85UtIC+PIqxX8uOiLYQsLzele3723o6QghElTicEcFkxfGzFl81
         poqHXjhdDO7fQo4ew/IZw8xrMtWlC9hfEgaBVezk2thKqLs/wavReptwr92STkdPkakr
         iLf3bulomGoEE6JijhsNa5UpavJKJKthy4urKC5o837Gi7eGePm45F6/RoHUcUqcwMT6
         miLZjAHtql6dNsZtaT6SFsKlG6U32zhaNrmQC1bESK6X03uoScjvfos/1t26BcODL3E3
         DnF74gWyNaHDjxsKDGA0QhGDI3l83vdxbmHZCST7OZUo5+PNeu9B4Do5NDV2CSdQ9etE
         +lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686037790; x=1688629790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdnARbpSMnIKjKaz7o17pETc41XDZgv7jLp4vCxZWMM=;
        b=fvYKWDwwKEh4uwuqvqh864VAL3y3eTgfe0zEKftEDxDQ7i84DVp++i0e8EL51gDT+e
         3z01qYmbnfufqpqCDFAUtJLGb6+G0M14tdQlJyo7hUhG4GODo0Xad+d4ZTK6YcN4Ogrq
         n3ZoTeD863jr7vy8P9xdi9FPitXjxhtlvnqucPH1NaU9oklGfzawgjUClFwJWeRvKd97
         czmDnAyxLZ+XLa+scQT4ggJI2hNpRyO5dpOua6MEm/i/AwUEGmOfQuL6h1E5RDOzuU6Z
         X/wz+a63eoiDoFmcDJL6Vd2mP+7x2qUPCEtsiYXN2JftyaLsECRI9k6hXheHBxoB+4mu
         dgYw==
X-Gm-Message-State: AC+VfDxK/49mRjE/iUBONcG9QJWFJiS1Bto75dwK3iRll6UvZMLBKfvD
	2B+Rb7JSJn7sQU9SEjmpj7T49A==
X-Google-Smtp-Source: ACHHUZ4BJXr8V8GVSW3hICfz/jMnwcJodzJVntBa29QZ6A4+2e9hUSGnUX4JIzOOkfqycd6u19m5VQ==
X-Received: by 2002:a05:600c:2947:b0:3f7:371a:ec8d with SMTP id n7-20020a05600c294700b003f7371aec8dmr1187094wmd.26.1686037790238;
        Tue, 06 Jun 2023 00:49:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c22cd00b003f709a7e46bsm16621255wmg.46.2023.06.06.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 00:49:49 -0700 (PDT)
Date: Tue, 6 Jun 2023 10:49:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"javierm@redhat.com" <javierm@redhat.com>,
	"sam@ravnborg.org" <sam@ravnborg.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"lee@kernel.org" <lee@kernel.org>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	Rich Felker <dalias@libc.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Message-ID: <9ed217b1-3a05-4daf-9e6f-52453a8b5f3e@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>

On Tue, Jun 06, 2023 at 09:24:48AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.06.23 um 22:19 schrieb Ruhl, Michael J:
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > > Thomas Zimmermann
> > > Sent: Monday, June 5, 2023 10:48 AM
> > > To: daniel@ffwll.ch; javierm@redhat.com; sam@ravnborg.org;
> > > deller@gmx.de; geert+renesas@glider.be; lee@kernel.org;
> > > daniel.thompson@linaro.org; jingoohan1@gmail.com
> > > Cc: linux-fbdev@vger.kernel.org; Rich Felker <dalias@libc.org>; linux-
> > > sh@vger.kernel.org; linux-staging@lists.linux.dev; dri-
> > > devel@lists.freedesktop.org; Thomas Zimmermann
> > > <tzimmermann@suse.de>; John Paul Adrian Glaubitz <glaubitz@physik.fu-
> > > berlin.de>; linux-omap@vger.kernel.org
> > > Subject: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
> > > fb_info.device
> > > 
> > > Struct gpio_backlight_platform_data refers to a platform device within
> > > the Linux device hierarchy. The test in gpio_backlight_check_fb()
> > > compares it against the fbdev device in struct fb_info.dev, which
> > > is different. Fix the test by comparing to struct fb_info.device.
> > > 
> > > Fixes a bug in the backlight driver and prepares fbdev for making
> > > struct fb_info.dev optional.
> > 
> > I only see a rename from fbdev  to dev...
> > 
> > Is there missing code?
> 
> As Sam said, the compare operation used the wrong device from fb_info.
> 
> I also changed the naming of a few fields in these backlight drivers. I
> could move these renames into a separate patch if that makes things easier
> for reviewers.
> 
> > 
> > Would  a fixes: be useful?
> 
> That would be commit 8b770e3c9824 ("backlight: Add GPIO-based backlight
> driver") from 2013. Maybe a bit old already, but I can surely add it.

Don't add the Fixes tag to this one because it doesn't fix anything, it
just renames stuff.  The real fix is later?  To be honest, it was kind
of difficult to see where the actual fix was.

Fixes tags for old code is fine...  I like to know why bugs are
introduced.  Was it adding a feature or part of fix for something else
or a cleanup?

regards,
dan carpenter

