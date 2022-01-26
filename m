Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6C2C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 11:24:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so1623550otf.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCtOvzmb9/mx72Ui1G8gLBm5A9F1BJtElWdIDXeMmF0=;
        b=KN8ygqBrm2dd9m4JKpN0ivDz9vFAd4sM+Jo250JWFfS7Fb0jrfDxVtjeWag9YgMJzO
         Ai4COV/8AMUKGvKvgGkScYEDjMJiWVqqXKZyFyEl/tJxqAuJNa3cxzEaswKPlkWjpIGb
         F5u56sCs+46RCDVor9dn7G4nmOEvnFb1fLPmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCtOvzmb9/mx72Ui1G8gLBm5A9F1BJtElWdIDXeMmF0=;
        b=wT/XfjkkxzmXl/k0hP6fiUj/3p/X8ZJV8K/3H5kBxh9Ccz9T1P6xboi4b3N0wtiQiw
         VIb2jRcyn/k/q9xiBqY8JlzBoiTgkVi7hhKYmjV5ofk33zD5+SGcJYyqCkhkQkIIa1oI
         5qveO5n93PeEv2STjwbsBS+Dox3dNoNVzi0W5oQrUB9OTuAxzy9dxdmVPNcBRDYvhfm5
         14A2YeRoCTOXWIrk4IS7zhaSnlA1Y8Sq9oSODBiPZomlzbP5o6fnq2QFT7LZLkBVwZIY
         Dz1ExVJcN6KE4YK/mMTZtlhGo8fxuSAaHMAdHUUYTeGk8J9zzjpaR4uaoSC37fnbWVE+
         CLHA==
X-Gm-Message-State: AOAM531f7bpqFeyDVm1oJCkgExml9rvIGzM+Zy4XYSYP9sMzsq4TPj9D
	j5NSUks7qXzbPY+NJjYrB5VogSY5So2JrQXN+6s2+g==
X-Google-Smtp-Source: ABdhPJyJ434k8CTtwA2xfNAfr6EGCCAY/54kbGMlKb50hwBQ2htN+9NdPN5HmH3wpOHEdJ2kuYTIeZNw6vajtaWaJbE=
X-Received: by 2002:a05:6830:2704:: with SMTP id j4mr17448609otu.323.1643196257387;
 Wed, 26 Jan 2022 03:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de> <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de> <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
In-Reply-To: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 12:24:06 +0100
Message-ID: <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org, 
	Michael Hennerich <michael.hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 12:18 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 1/26/22 11:59, Helge Deller wrote:
> > On 1/26/22 11:02, Andy Shevchenko wrote:
>
> [snip]
>
> >> P.S. For the record, I will personally NAK any attempts to remove that
> >> driver from the kernel. And this is another point why it's better not
> >> to be under the staging.
> >
> > I agree. Same as for me to NAK the disabling of fbcon's acceleration
> > features or even attempting to remove fbdev altogether (unless all
> > relevant drivers are ported to DRM).
> >
>
> But that will never happen if we keep moving the goal post.
>
> At some point new fbdev drivers should not be added anymore, otherwise
> the number of existing drivers that need conversion will keep growing.

And that point was about 5 years ago, and has been discussed at some
plumbers meanwhile, resulting in the staging TODO patches to make
these drm drivers to destage them.

Fixing bugs in fbdev is all fine, reopening it for merging new drivers is not.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
