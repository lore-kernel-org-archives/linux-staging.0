Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38382C85
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 13:48:45 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id i12so20409153ila.12
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyJRlMxgypQBawfO4MnRS1PrXxf8qwrkwJ8sbBjmvxk=;
        b=lg0VpO4WpsNGVhi3US+Plu18x9ELXYeY/a+Gjmh0KE4uiGdDc7bj2BYS9BGh+I630d
         GMcPDsZ4XGe+oH+T4P+XCzlnxZ40KTegUHoFh0/90TAO4KxsiJluUahYvO5rKRhBy37s
         F6TSvniydNG5hRtcIIiCbQD11XzpNsvSHZJQgd0b9IY61tcJuyVr+npNhcyuUmJeMVvO
         wTsOy01pU4VeJVZ8weWZNixl21BVRy/9vTI+mFuUDJQdZrkjnGemJMv2GzwreJXuna6t
         pJbFJJqfhinEeJG/mlGReTSOz5XuTZYzV62JOVCY3+39TRm/rIBZF9aatwTJVpbLhXpq
         qUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyJRlMxgypQBawfO4MnRS1PrXxf8qwrkwJ8sbBjmvxk=;
        b=FKDW8ILWZHXTYLZsT6WmAfhnnvTlu/rY4gjjdd/22p7rHH3K+kzt3KTeyKbbwIU+jI
         a15VoRht9X4pHR81hELquqOuNwBqoRonNCl6nQHURYQUI8mt6Q3/XL+o+rOHr+fGSIPg
         y7mIM+jh2khBcZHSHZ/ZrC2WLhNLBc1faq+Ij1jExYswsmhmE/deAkyEXkHRIFusL9Nm
         yjbYGjUInqNed9/OXVtMUm7sq/JmrcCK2x8d4d6wjqfJ0FpUe6oQj4GXWOz6/fky/gYN
         jYL3MlWSwltU/mYP8K50CXKiKM5Ax1St/PxCQC9TVd3hSzI2ZJIwn9O5xvvcyRVo95fK
         hW2g==
X-Gm-Message-State: AOAM533vCT3Dz9N2U85ZbPlmoghK1vGxO0t6kx7a9PyhF3x7JszNTO7p
	g3km0pzkNbWNSJLw54LFoRH8jJ7VJvsveOUcrHY=
X-Google-Smtp-Source: ABdhPJzRrtLamaODkh+2FsFy4cqn8oy2+eiI0fQP9p4+Jt0x159EfGFkEEPONDhaRlnd0rhiICW2y3Ud55AKzr0TZ20=
X-Received: by 2002:a92:cd8b:: with SMTP id r11mr4522430ilb.320.1637070524621;
 Tue, 16 Nov 2021 05:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211116011451.896714-1-zmanji@gmail.com> <6d2d9c4a-3f05-1d51-42dc-b1ebbb4aefe1@gmail.com>
In-Reply-To: <6d2d9c4a-3f05-1d51-42dc-b1ebbb4aefe1@gmail.com>
From: Zameer Manji <zmanji@gmail.com>
Date: Tue, 16 Nov 2021 08:48:19 -0500
Message-ID: <CABtXzjSPNxe-n9QTujMB7=CmhqPFp8V2e86BXmoErWm+6c5coA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove unused defines in wifi.h
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry Finger <Larry.Finger@lwfinger.net>, 
	Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 11:56 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/16/21 04:14, Zameer Manji wrote:
> > None of these defines in wifi.h are used so they
> > can be safely removed.
> >
> > Signed-off-by: Zameer Manji <zmanji@gmail.com>
> > ---
> >   drivers/staging/r8188eu/include/wifi.h | 57 --------------------------
> >   1 file changed, 57 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
> > index 193a557f0f47..7cbc7015e90f 100644
> > --- a/drivers/staging/r8188eu/include/wifi.h
> > +++ b/drivers/staging/r8188eu/include/wifi.h
> > @@ -13,32 +13,9 @@
> >   #define BIT(x)      (1 << (x))
>
> What about BIT() macro? It's already defined in include/vdso/bits.h and
> can be included via include/bits.h.
>
> Most likely linux/ieee80211.h contains bits.h. Haven't checked yet, but
> anyway redefining kernel macros is not good approach and BIT() can be
> also removed.

This is a good observation, but the objective of my patch is to remove
unused defines so it will be easier to do the work that you mention. wifi.h
and ieee80211.h redefine a few kernel provided values, and I intend to
follow up by addressing all of them in one go.

Would you be willing to ack this patch as is?



-- 
Zameer Manji
