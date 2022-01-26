Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D72C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 10:31:57 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id bb37so36628218oib.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 02:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PARYSeIeXIRXwXqFcnW3Wz91jHJIg+/6lKoOo1XNXrI=;
        b=I3kUr8qfahBfszwo6LNqD5ZWF9kbC+G+AIHcoBCRezvQYE3SqIfzljpjCVjfIeUbKL
         /hb68PKQhFaCjgZOyHw+gYJ/ei9uM4swYOiN4djukilmM5j6y7WPe4l6XWAgd0gufDNh
         xhsFCpIAtqhF8Nluu4DTHaEsI1zgLKLsFCHtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PARYSeIeXIRXwXqFcnW3Wz91jHJIg+/6lKoOo1XNXrI=;
        b=Ex5xNqJAoJ0WXKEPU9hml/GSJAbEkaNnOIvDconS8WWMjSh7ElL1coVTcO663iMZ3w
         wJI7kjWuEmEtky0rx3Zp3FbeF+WrdpBJmDwUcia8D8x3Xrn1bSlScmmko5DITDvIAoU1
         iigcC/Nvz1HV/ljo842ZqDy/Oj8p0lS5JOvhFJuzhS/F9aNdQwV0BIHRQoimV4DISCDa
         RWxZ5TtvpZAFTnqS1IRLl+X2tcDjlvkdjBna6K7atVx1V3FbzPasrNeBy9OYnniUrmjy
         drV76FHq7FyXJU2IeirB3p7f+kq0FjsdOZSjEWmqmGfguOevec8y6dfThJuGnIeqIWDr
         gtYA==
X-Gm-Message-State: AOAM533svT30iVkzbCHVc0s/j+2ePH1ee+LG8u0bZdMqwJrsnB7O1nwV
	jpQT+FyBoNX1ftGkoXP1IrrNHpdgXylGX3QFbEfTpQ==
X-Google-Smtp-Source: ABdhPJzjwv/0sLlbLiWvmxRAGel0mMOAKI6UYaYppLOrZDc1WgZAwnk5CLyfI1LGm6q5W5cApZ7TCM6rQd58C8u5svs=
X-Received: by 2002:a05:6808:f03:: with SMTP id m3mr3247262oiw.330.1643193116706;
 Wed, 26 Jan 2022 02:31:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com> <YfEG2qVO9K9G+g1d@kroah.com>
In-Reply-To: <YfEG2qVO9K9G+g1d@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 11:31:45 +0100
Message-ID: <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-fbdev@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, 
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> > Let's maintain occasional fixes to the fbtft driver.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  MAINTAINERS | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ea3e6c914384..16e614606ac1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
> >  F:   lib/fault-inject.c
> >
> >  FBTFT Framebuffer drivers
> > +M:   Andy Shevchenko <andy@kernel.org>
> >  L:   dri-devel@lists.freedesktop.org
> >  L:   linux-fbdev@vger.kernel.org
> > -S:   Orphan
> > +S:   Maintained
> > +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
>
> I'm ok with the files moving if the dri developers agree with it.  It's
> up to them, not me.

On one hand I'm happy anytime someone volunteers to help out.

On the other hand ... why does it have to be resurrecting fbdev?
There's an entire community of people who really know graphics and
display and spent considerable amount of effort on creating useful and
documented helpers for pretty much anything you might ever want to do.
And somehow we have to go back to typing out things the hard way, with
full verbosity, for an uapi that distros are abandoning (e.g. even for
sdl the direction is to run it on top of drm with a compat layer,
afaiui fedora is completely ditching any userspace that still even
uses /dev/fb/0). And yes I know there's still some gaps in drm,
largely for display features which were really en vogue about 20 years
ago. And we're happy to add that support, if someone who still has
such hardware can put in the little bit of work needed ...

I don't get this.
-Daniel


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
