Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FDD2FB6;
	Tue, 21 Mar 2023 16:40:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so62144837edb.6;
        Tue, 21 Mar 2023 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679416844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrlZjsekimYZz2rusTzf5CWJE1JU9y76N7MnQtLQqd8=;
        b=XHiOY/mfOqvXk4Ag+FACvgulRCUOH59TQOQG7rMtHMGVjKwqVHAwlkPH6nXoEyF6fm
         MSY+z+pb1Gd7om8MSBHKvSlZOppnTarPtColtqLG6Z0EU22PV394Wq0ctnQfog+uvrXT
         VrYYj+/vG3J8pfanual0EW5LHlgy7Ks12/X2ZnuxicSPuH+laZ70GKIFq5OKEzS542pL
         WMBWeBJsLJG+inw9E8uPFbWtQvRwibydjz4lS8iR1t2nSvZQPpceMh9hhGnyGguH+fea
         7bQm4dMth22PGIiFZwsMLuupOppws2lOKEqmtuDvSTcmpUiF6c5m6u82zAkAa+BiWoPt
         yT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679416844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrlZjsekimYZz2rusTzf5CWJE1JU9y76N7MnQtLQqd8=;
        b=6Eyq9eEYUpvZjiznqWk4S4r7TLB0xG/vSZP0SeWvOmAyLA2UZK9LRR0GBgh18v3jI+
         ddXF1EMG6rRFtQlt0LAZmoVD0NCsFt2Ce66vJXpqT7uzW2OO3t9mxV0BKGO6BJ8KB6YD
         1HgsZVqehA95hhZcY6YXXodLc3Gms4VDhPOCu26rJwYkkbGAHGfbRtI4MppB3cGzQ3BF
         eHaFUbyBjOfV8eDZFbRiPLj2U1wBma3IY56+UtdgdRVFmTutETF4VHTlCuY6NJ8to0k3
         wmtrH9wCYJlFKr8mWIBdg8oQIyA3MwvXMpvUeBb+mNWCSHgTURnUXahLWEJBWsKiFFi3
         o6Lw==
X-Gm-Message-State: AO0yUKWiVzg8bEyf9jCiftYbAsrrn9w0vGuk8R1GduLUGXmQF/fG+lac
	dytbaaimET5WDe74IatXmBs=
X-Google-Smtp-Source: AK7set/KvDidl1A0DDtGzN2QPf7Ud1/aoKKKDxJURSPbZfTSD2dnlvBJwIC1KUPCJkCH0jQvggCX8w==
X-Received: by 2002:a17:906:11d0:b0:926:320c:cd98 with SMTP id o16-20020a17090611d000b00926320ccd98mr3511021eja.36.1679416844594;
        Tue, 21 Mar 2023 09:40:44 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906748600b008bfe95c46c3sm6045983ejl.220.2023.03.21.09.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:40:44 -0700 (PDT)
Date: Tue, 21 Mar 2023 21:40:38 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: remove camel case
Message-ID: <ZBneBozTNWpsfqcL@khadija-virtual-machine>
References: <ZBiPlhkqHUegMRAb@khadija-virtual-machine>
 <ZBlKijo6zLsE8jUx@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBlKijo6zLsE8jUx@kroah.com>

On Tue, Mar 21, 2023 at 07:11:22AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 20, 2023 at 09:53:42PM +0500, Khadija Kamran wrote:
> > Several variables and functions were named Camel Case. This resulted in
> > checks pointed by checkpatch.pl
> > 
> > Avoid camel case by changing names.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/iio/addac/adt7316.c | 64 ++++++++++++++---------------
> 
> This has nothing to do with "greybus" :(
>

Hi Greg!

I am sorry about making a really silly mistake here.
I will try not to make a mistake like this again.

> >  1 file changed, 32 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> > index 79467f056a05..49702beeac30 100644
> > --- a/drivers/staging/iio/addac/adt7316.c
> > +++ b/drivers/staging/iio/addac/adt7316.c
> > @@ -672,7 +672,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,
> >  		adt7316_store_da_high_resolution,
> >  		0);
> > 
> > -static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
> > +static ssize_t adt7316_show_AIN_internal_vref(struct device *dev,
> 
> "Vref" is correct, please keep it as is.
> 

Okay understood.
Thank you.

Regards,
Khadija


> thanks,
> 
> greg k-h
