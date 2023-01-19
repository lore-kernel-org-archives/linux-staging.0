Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF147485
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 14:39:20 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id p188so2731432yba.5
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 06:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kvfRouGYUkIYzfxHUcwrstqXmNVmW04bPhCFhKA1H7E=;
        b=eVdYoWoitswFXn+eY4IJ9622Y4VAy0zNvxtFX7AYKsVBDHGIcDStTLOBIATzIGoTug
         g7QSlf6Fzoh8Wzhc78eINRTDmo50PV+XWWvcr7109cTF5YPZLyK3cISGG2xdTIUSLDpX
         tv63dXHMgE1+C+xYBZJFLF216fRihoXds+7zibZSLPETwFH9+jeVWi4TBdQD3Rv0rJPh
         Scf1W6zVHBT9o+smV17TfBzoZINbljWqyeuM0L0pP1lXANSWOpzutycAybkP8DqqK8fS
         3JxGAG9ijXd7nrKwRBZ7we/B4RDxCRzKl51xPMM9D20sw/9crcmt/NUMdnBnjQT+xz7b
         bb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvfRouGYUkIYzfxHUcwrstqXmNVmW04bPhCFhKA1H7E=;
        b=YKmos/QuBPTFY8qcs6W6cgYbJul+vnmXe7yjGNPs7y2MNsOnHZ2K/4qpu9xR0K5kcJ
         rLdw82vdUdMiDN6JEEv85RJhQg6Pc8NUjY2Y0VOj5dNDJ4Dw6KGaA03TNIQCJFqZToMA
         Qfr7icT44fGylfP8x7FumZ8uGARPP7A1kXfe3NgNZUT5NJPpqp7sJLiv09uxNZ82b8SX
         h+ZxnN49e2ngujUZ+gtCj0YY8d/IwCuNqFEyk19Gwla+zq01PxU45fa9ThSC4cu3w9Lj
         RL/8/OKiSFnELMknWbkLefbQROxU0fhZ6JLT1uAyYx61QduBVJawAxWwv1SOX9xyKDIS
         Yg3w==
X-Gm-Message-State: AFqh2koi8XRLcSn+8Pc5DtNI40JHKzMMGefTz+nDpNUBZFoJSjwLwFtv
	NTUcHAGkqJzV8n5AN2vDzV8WH1a04oUYDbDDWSO6tw==
X-Google-Smtp-Source: AMrXdXvkRdrXG4AIQQgFLkBJ0cBId619roqwYS2XeYk6pfuRMEaeJUWft/jaJIXYZmguMSTONGPdb/vE5+CBkhM/xio=
X-Received: by 2002:a25:e0cb:0:b0:7fb:858a:b1b4 with SMTP id
 x194-20020a25e0cb000000b007fb858ab1b4mr325439ybg.488.1674139159741; Thu, 19
 Jan 2023 06:39:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com> <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com> <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
 <Y8lS5eBliYw5EHBb@kadam> <CAMEGJJ2b1KFQY1m1eTcvf8_kGBBTjzrBD2i_M2uR+6v4gEcbVQ@mail.gmail.com>
 <Y8lVvHMIYeSOLM5q@kadam>
In-Reply-To: <Y8lVvHMIYeSOLM5q@kadam>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 19 Jan 2023 14:39:10 +0000
Message-ID: <CAMEGJJ2grBH6NgA+0hwGwmkgRtk0GErULkH6XXbvaykRDzQnfA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, 
	Adrien Thierry <athierry@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jan 2023 at 14:37, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Jan 19, 2023 at 02:31:50PM +0000, Phil Elwell wrote:
> > On Thu, 19 Jan 2023 at 14:25, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Thu, Jan 19, 2023 at 01:47:44PM +0000, Phil Elwell wrote:
> > > > > > I understand the desire to remove the custom logging. I don't welcome
> > > > > > the loss of flexibility that comes with such a strategy
> > > > >
> > > > > What "loss of flexibility"?  You now have access to the full dynamic
> > > > > debugging facilities that all of the rest of the kernel has.  What is
> > > > > lacking?
> > > >
> > > > Perhaps I've missed something, either in this patch set or the kernel
> > > > as a whole, but how is one supposed to set different logging levels on
> > > > different facilities within a driver/module, or even for the module as
> > > > a whole?
> > >
> > > Yeah.  You will be still able to do that and more besides after the
> > > transition.  Cleaning this up makes the code better in every way.
> > >
> > > Documentation/admin-guide/dynamic-debug-howto.rst
> >
> > Are you saying this patch set gets us to that point?
>
> Yes.  The patch has some issues, but yes.

OK, thanks. I'll be watching how this plays out with interest.

Phil
