Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8BA23B2
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 06:09:54 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id h126so2646845ybc.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 23:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kP0LyTf+EiQY7fo4NN9fTawSgavBYcmQCB65qo3H3i8=;
        b=gWIFxN086BRLC08wt0RLKOoxxVt9OkQj3kIwI8jgVTjmMdVxCvAawkZ9mYjNcd7neI
         bA90gANRFYdD6d4kt/3S9EnuD6gvJjt3onlvvv9sx34rf/TOfPpgMq3C84eVZTvdVfMe
         yicsqqr5BFbBFuvNSsN3M8Qaxuy+oc0UDmPck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kP0LyTf+EiQY7fo4NN9fTawSgavBYcmQCB65qo3H3i8=;
        b=J73UA0uuaeCdBoN7F+/qvNC3h/ljiHflA2YtSXhc5H4NNJAMltmU/BxXHzJr+X42zH
         uWOItPHgJGNyZkoM5IYf4MNL3wxcoYP9JxQsuz9515BX36bvOdYg3yGzlOB96ulhWsq6
         n0E1JX+IXwVhu7Ja4c1KwoctxRlNthL7/2aOMkOh5DdKRBD+o4ILZ+O0+xPeYWAEoG7W
         Xsk1iL1qsnxko3tIKCgVu9sHf0nEBzRFXvQEbDcy2z7ym95YsyaLLgHpyF5HuxgcGSZI
         OvPQLMSksa3zGgQiy7waD0snnxv+Ox+4as7d/Cdr36vLPPy5JrsAbRkHB7BcvfklDjo4
         5rxw==
X-Gm-Message-State: AOAM5329GzfXSriL+Ah2wFTxprlmS+WvAxCmo+bD6ct4+MgGGMcshi7L
	KhLL9BJgrwxiU5h9gafqOU+usBYycAmWkU4wyJcT8A==
X-Google-Smtp-Source: ABdhPJzIGIFjLlDvvMTOWTCB9hIFczSOzUaQIahpV9y3ceIotV+ooWK3mFsz44hE5i2Mp0jREIT4vTJRATclSB5PsO4=
X-Received: by 2002:a25:32c2:0:b0:628:86af:da05 with SMTP id
 y185-20020a2532c2000000b0062886afda05mr27569966yby.278.1647410993824; Tue, 15
 Mar 2022 23:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301042225.1540019-1-wenst@chromium.org> <CAGXv+5F-Nir_OHbenYntDhOVFviLP1n-dZcaw07GohSc=YK6SA@mail.gmail.com>
 <CAAEAJfCdj1fbvt1Aj2SiH8HN=UoG8_F+TY99xVWDcZy2xnS8ew@mail.gmail.com>
In-Reply-To: <CAAEAJfCdj1fbvt1Aj2SiH8HN=UoG8_F+TY99xVWDcZy2xnS8ew@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Mar 2022 14:09:42 +0800
Message-ID: <CAGXv+5HcpbvUEfgYQv0iEPBF=u-p+dk8=-vegf5D8D3rkEs6EQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: hantro: Implement support for encoder commands
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 2:38 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Mon, Mar 14, 2022 at 3:59 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Hi Ezequiel,
> >
> > On Tue, Mar 1, 2022 at 12:22 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > The V4L2 stateful encoder uAPI specification requires that drivers
> > > support the ENCODER_CMD ioctl to allow draining of buffers. This
> > > however was not implemented, and causes issues for some userspace
> > > applications.
> > >
> > > Implement support for the ENCODER_CMD ioctl using v4l2-mem2mem helpers.
> > > This is entirely based on existing code found in the vicodec test
> > > driver.
> > >
> > > Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >
> > Gentle ping on this patch. Any comments?
> >
>
> Pong. I have been a tad busy the past weeks and haven't been able
> to review this yet. Sorry about that.

Got it.

> Meanwhile, and given how delicate this code path is in our experience,
> have you guys run regressions tests with this patch, in particular with decode?

We landed it downstream two weeks ago [1], and so far nothing has failed.

However, given that the driver doesn't support decoder commands either, the
new code might not be exercised in the way you assumed? At least no failures
indicates there aren't any incorrect code paths, i.e. decoder ending up in
the encoder path or vice versa.


Regards
ChenYu

[1] crrev.com/c/3456042
