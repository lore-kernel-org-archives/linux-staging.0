Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B35367
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 03:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649387237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0mJcdW33+4gW1LiIaHWfczE7pJzHwlPUBk+4IAUF7M4=;
	b=gqHpKxRwq6UtNddJ06/44SwEKfh0B+TVU6300XcPF6W4i9kkbzRN9OfHQWkJUEIXwX6Em+
	74gOqgpeBzYcqr72TX+5yqpRC2XinL9ckQ3h+7kgnKLDf49xT0TyhyweDA9jrtbno9gMnN
	jMrpi01htjSbTqHETgn+MHsOGDdw2c0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-howSd_EuOfqSOS_sRrqscw-1; Thu, 07 Apr 2022 23:07:16 -0400
X-MC-Unique: howSd_EuOfqSOS_sRrqscw-1
Received: by mail-lf1-f69.google.com with SMTP id v13-20020a056512096d00b004487e1503d0so2591246lft.4
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 20:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mJcdW33+4gW1LiIaHWfczE7pJzHwlPUBk+4IAUF7M4=;
        b=Cr1EkRSaiq5slcUJ255dGZS2X+MNdG2AvJiJdQYLsSenBj04R47dX9lsCRC49HJDLX
         7YvbhWRK1JWkxwRUXi+OwKxx6JLjkVgRefoHJNJqg31AfVT2aSNUQL63M4CwMm1FEkNs
         Mgca4hid5ObzCxasGmJXzcDnfwJgx1Aws5cdC5mLO3TnXS/dTASaitiq3j3wtMDc7Ux1
         qbmwlLT0ciL5vmz3seoo52VPilpuXIhsLT0YgJRkudFI1i3YEQPbfTu0fuvok/VKczBm
         UUD7AD4FNxYVZSM6o1gPyx3Z8XP4iju/JgCgejccySYwyXmzxSB2BntgQSu0c+35OGF3
         bCDA==
X-Gm-Message-State: AOAM532qKz8L+QjLWooW2kcJ/eAhs7BFijpcKiOlbnqrHYOt7qiDb3J0
	X156CB+FGW4vtsxbt748362t/R7X6ghBcXdiVZnqZt/6MzLawMfkX5TvC0KiFr36Vojsz0ZRkvd
	prUXOscl/J71Xh7MGfLRBIHc//MAidTikSIlUM43+Lg==
X-Received: by 2002:a05:6512:2586:b0:464:f75d:cfa with SMTP id bf6-20020a056512258600b00464f75d0cfamr3611248lfb.238.1649387234431;
        Thu, 07 Apr 2022 20:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgWwR3JIJz3D/8EgFkxuxkKo6iHijAl6dM7d1piH5tYY9YCkT5VihT277zbKJtx38DQE/DkghzZddgd4OX378=
X-Received: by 2002:a05:6512:2586:b0:464:f75d:cfa with SMTP id
 bf6-20020a056512258600b00464f75d0cfamr3611224lfb.238.1649387234117; Thu, 07
 Apr 2022 20:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220407105724.308930-1-hpa@redhat.com> <20220407115133.GL3293@kadam>
 <CAEth8oG_GAuammtSqKzyj+Vq6ZsQJJOEeFhgxYhxXHViDYvkow@mail.gmail.com> <20220407132609.GN3293@kadam>
In-Reply-To: <20220407132609.GN3293@kadam>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 8 Apr 2022 11:07:03 +0800
Message-ID: <CAEth8oHqqipXNR6QPgm_YNGPVBSZLm3EEg0k0M9tivFCwE5_2Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: ipu3: Fix AWB x_start position when
 rightmost stripe is used
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans De Goede <hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Thu, Apr 7, 2022 at 9:27 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Apr 07, 2022 at 09:17:38PM +0800, Kate Hsuan wrote:
> > Hi Dan,
> >
> > On Thu, Apr 7, 2022 at 7:52 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Thu, Apr 07, 2022 at 06:57:24PM +0800, Kate Hsuan wrote:
> > > > A not calibrated x_start setting would result in an incorrect AWB location
> > > > configuration on a sensor when only the rightmost stripe is used. x_start
> > > > should be calibrated by subtracting the stripe offset to set the coordinate
> > > > to the correct position on the second stripe.
> > > >
> >
> > >
> > > I wish the commit description said more about what the bug looks like to
> > > the user.  This is the front facing camera, right?  Is part of the video
> > > blank or what's the deal?
> >
> > This is IPU3 image processor. I tried to fix the configuration issues
> > on stripe 1 coordinate settings.
> >
>
> So in terms of users, if you configure it in a certain way then it
> crashes?  What happens in terms of what the ordinary user sees?
>

It will not crash. Currently, application, such as libcamara only uses
stripe 0 to estimate 3A (AE AWB AF). The grid coordinate can be used
to determine the area on a sensor where we use this area to determine
the 3A status. If we start to move the grid and it crosses the stripe
1 offset. The grid will be at the rightmost edge of the sensor. The
user may only feel the location of AF, AWB, AE of the image is not the
user's expectation.

I'll update them in the v3 patch.

> regards,
> dan carpenter
>


-- 
BR,
Kate

