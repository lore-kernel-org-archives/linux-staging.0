Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E767E
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 15:11:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1510301wmo.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYA+sk34MTdokaTmO6Z2RqNJkrS7NKI/SfAHszvjo7s=;
        b=AyjUdBUPSwzq13H1UQf4yKXKkqb1P7vt21u9WG70IroGGxLOVENzduplbXXl99Ouag
         032FFl96sV1zeiCn2unh6UIVmE1Fu2oX5C8F62/h0par3rHBTmzfXdiJ/aLTHdReIa2+
         u6hUjnA4FU/prOhjLEilWfkRyvAY16QkUQiknyyLYd49nee21nQwzyps0WMnUlsdK1kR
         3TbI+1Gccba+/tfKlJ39xX8c24nYJjzCxWAaUuV8ctVc68vQzbHaxqQrT+nw1qHqanxz
         vrEZSQrAmgxr6raSzrsnScnyCFR24c0Z6Cbi82BjJmaywGPikNKoXpSycIl7RCrCX8Rn
         f2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYA+sk34MTdokaTmO6Z2RqNJkrS7NKI/SfAHszvjo7s=;
        b=mXpkbARru/dZNW5FnXWOpTnK3n01vCldq5OkvVx8x3uFL0HGjC5USRx7JyRhVSxq0v
         i+4MHlo9kZMlorUirfoVeQ1MOpZ/WJSFuleH3UseMQzlBizADqvnnLklBTNUDE68sPHP
         k56Fyg4o/6NJvfmEejS4i45fBNRSt9Y7DRS/gydF6cKWy7/tfbNsR13AUGeNFsVKJ0H1
         qe493MxZKWXM494V92GDmVZ04OIqjOMUURAlg/qfWC5GLHdh93x6UGsVDdKFQX2i2pC/
         AzwzONQwYm0L6iR+IN+5GOduTGuKURLx9R3ubzgsczz/8ppLmeTQLDYIcMgMP+LvsaoJ
         E1Ug==
X-Gm-Message-State: ANoB5pn6GhravCQsQ2KARUgJEqO13ooDxx3HY6UIck64n10RG/HxpFbx
	QiUiOcEVRT9b/OhAeLqY8Jw=
X-Google-Smtp-Source: AA0mqf6vaZNTC+bOXSwaYf8dg/zdLGksVSE3FgIWIvtJ5sJRE1WWoQ9xinMoOejLW+T4Zki3NZXW8g==
X-Received: by 2002:a05:600c:3553:b0:3cf:8e62:f748 with SMTP id i19-20020a05600c355300b003cf8e62f748mr23315643wmq.175.1669216263117;
        Wed, 23 Nov 2022 07:11:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003cfe1376f68sm2603785wml.9.2022.11.23.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:11:02 -0800 (PST)
Date: Wed, 23 Nov 2022 18:10:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <Y344AdRANmS3STsd@kadam>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
 <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>

On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> <tommaso.merciai@amarulasolutions.com> wrote:
> > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > >
> > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Patch itself looks good but we have some style issue. Applying this
> > patch I got the following warning from checkpatchl:
> >
> > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > #10:
> >
> > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > msg:
> >
> > Use:
> >
> >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Instead of:
> >
> >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> 
> I always use 16 chars, to avoid these becoming ambiguous in a few years.
> 

If we assume hashes are randomly distributed and that people commit
100k patches every year then with 12 character we would have 17
collisions every 1000 years.

regards,
dan carpenter

