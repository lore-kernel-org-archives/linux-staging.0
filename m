Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3873072
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 08:57:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id p16so24000591lfa.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cJkXtllod03ASJOjpCx5K+AcoQxgr0tE6UkPMxu5Eto=;
        b=eueADRYoewoSYpVz8YvCdvPt7I/D1V1WPupQU1Q0pWkueR15ZggK44wUZUCER0czoP
         pFz6nf61zrCCNBoJF39y/tNKVlHQEwE3kLio6beL8/kizOUfWmruII1ZC3ypxB5GzlNf
         yPzyf8NkFOX1x5+idgWIjkDi4RnjMkW+FDMyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cJkXtllod03ASJOjpCx5K+AcoQxgr0tE6UkPMxu5Eto=;
        b=ivT89gIoGsXcr6B4nly1Rgp+09/j6D4s3Tz0tLCH0Dt8RdMghICy5RKeeTd/37HZxN
         hphZrpG8tQn+Jy3r5DNCf4PIrfChRCbH6T6Au1C33pyjGa9PMWkrUxLMn0JvQ6a8SPn+
         XgzKc5oy5ygIJfIquC8m5umFo1g2NF7hcAqtm11YIwFUShO3h3PNsZJjJVw9vT2Y9F6+
         jiirer5xppQ9ekV0ui36D/V2z6Fv1UurMIWeHYftBTYYoDctLLNptMO102GqbF2xu3c2
         zL8dDNHqFuDHf7GsPkBv2huaYqaaipPkfIAzPnTSu57WrtnptHABAbE05kOd77Ilshgl
         6T1w==
X-Gm-Message-State: AOAM533BndJhXkPupyK2hFuTQNATQuu6IFr6YoYyYwXTmX8HbyHD3WiV
	Zg9Rk1n0abFUatazdp0tPZCArBiofquOmYzJAOe/GQ==
X-Google-Smtp-Source: ABdhPJxFnqXoY5+ZoP8h/WSL8B0pcFOtWM1x/foifUtGjGhbuT/pwWs8Tlj7xNuioIoY240fAwHSYqpG+CLdiB6pvbc=
X-Received: by 2002:a2e:b618:: with SMTP id r24mr4768727ljn.414.1634201852088;
 Thu, 14 Oct 2021 01:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211008100423.739462-1-wenst@chromium.org> <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
 <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
 <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca>
 <CAGXv+5GJCaxnPPkXRp5xrTBuq-5=ggfjPbRhyS4vdm3meM_4eg@mail.gmail.com> <CAAEAJfAratFPK0iU8QWMr36ZFCL5cgBneKkzymy+gCgJV=goOg@mail.gmail.com>
In-Reply-To: <CAAEAJfAratFPK0iU8QWMr36ZFCL5cgBneKkzymy+gCgJV=goOg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Oct 2021 16:57:20 +0800
Message-ID: <CAGXv+5FsjNihOfvLib=MHf9Qq3X3t=fR2BY4myQ1tivkSJc6pw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 4:46 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Thu, 14 Oct 2021 at 04:31, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Wed, Oct 13, 2021 at 9:40 PM Nicolas Dufresne <nicolas@ndufresne.ca>=
 wrote:
> > >
> > > Le mercredi 13 octobre 2021 =C3=A0 15:05 +0800, Chen-Yu Tsai a =C3=A9=
crit :
> > > > Hi,
> > > >
> > > > On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
> > > > >
> > > > > Hi Chen-Yu,
> > > > >
> > > > > thanks for looking into this.
> > > > >
> > > > > Le vendredi 08 octobre 2021 =C3=A0 18:04 +0800, Chen-Yu Tsai a =
=C3=A9crit :
> > > > > > Hi everyone,
> > > > > >
> > > > > > While working on the rkvdec H.264 decoder for ChromeOS, I notic=
ed some
> > > > > > behavioral differences compared to Hantro and Cedrus:
> > > > > >
> > > > > > 1. The driver always overrides the sizeimage setting given by u=
serspace
> > > > > >    for the output format. This results in insufficient buffer s=
pace when
> > > > > >    running the ChromeOS video_decode_accelerator_tests test pro=
gram,
> > > > > >    likely due to a small initial resolution followed by dynamic
> > > > > >    resolution change.
> > > > > >
> > > > > > 2. Doesn't support dynamic resolution change.
> > > > > >
> > > > > > This small series fixes both and aligns the behavior with the o=
ther two
> > > > > > stateless decoder drivers. This was tested on the downstream Ch=
romeOS
> > > > > > 5.10 kernel with ChromeOS. Also compiled tested on mainline but=
 I don't
> > > > > > have any other RK3399 devices set up to test video stuff, so te=
sting
> > > > > > would be very much appreciated.
> > > > > >
> > > > > > Also, I'm not sure if user applications are required to check t=
he value
> > > > > > of sizeimage upon S_FMT return. If the value is different or to=
o small,
> > > > > > what can the application do besides fail? AFAICT it can't split=
 the
> > > > > > data of one frame (or slice) between different buffers.
> > > > >
> > > > > While most software out there just assumes that driver will do it=
 right and
> > > > > crash when it's not the case, application that do map the buffer =
to CPU must
> > > > > read back the fmt structure as the drivers are all fail-safe and =
will modify
> > > > > that structure to a set of valid value s for the context.
> > > >
> > > > I believe what is happening in Chromium is that the decoder is open=
ed with
> > > > some default settings, including the smallest viable resolution for=
 the
> > > > output side, and the buffers allocated accordingly. When dynamic re=
solution
> > > > change happens, the decoder does not check if the current buffers a=
re
> > > > sufficiently sized; it just assumes that they are. And when it star=
ts
> > > > pushing data into the buffers, it realizes they are too small and f=
ails.
> > > >
> > > > The spec also says:
> > > >
> > > >     Clients are allowed to set the sizeimage field for variable len=
gth
> > > >     compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioctl
> > > >     VIDIOC_ENUM_FMT, but the driver may ignore it and set the value=
 itself,
> > > >     or it may modify the provided value based on alignment requirem=
ents or
> > > >     minimum/maximum size requirements.
> > > >
> > > > The spec only guarantees that the buffers are of sufficient size fo=
r the
> > > > resolution configured at the time they were allocated/requested.
> > > >
> > > > So I think my first patch is a workaround for a somewhat broken use=
rspace.
> > > > But it seems the other stateless drivers are providing similar beha=
vior,
> > > > as I previously mentioned.
> > >
> > > That's what I mean, this is not a driver bug strictly speaking (assum=
ing it does
> > > guaranty the buffer size is sufficient) but it is without your change
> > > inconvenient, as userspace may be aware of the largest resolution it =
will
> > > decode, and may want to allocate larger buffer upfront.
> >
> > Thinking about this more, I think a few follow up fixes for each driver
> > are in order. The spec implies that the driver should override the valu=
e
> > should userspace give some unrealistic value, such as asking for a 256 =
byte
> > buffer for a 4K frame size.
> >
>
> Where is the spec implying that?

In Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst:

    Clients are allowed to set the sizeimage field for variable length
    compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
    :ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
    value itself, or it may modify the provided value based on
    alignment requirements or minimum/maximum size requirements.

I guess I read "minimum/maximum size requirements" a bit liberally.
Maybe it refers to how much buffer space the hardware can address or
program for each request?

> This is encoded content, so I'm really inclined to avoid this path.
> Having the driver decide what is "unrealistic" would mean some
> heuristics in the drivers for something that should really come from user=
space.

And if the driver refuses to give adequate buffer space, then it's a bug?


Regards
ChenYu


> Thanks,
> Ezequiel
>
> > Cedrus (CCing Jernej) comes close, but a 1K buffer might not be enough =
for
> > really large frames, even though it's slice based?
> >
> > ChenYu
> >
> >
> > > As per Chromium bug, this is being addressed already. Thanks for this=
 driver
> > > improvement.
> > >
> > > >
> > > > > As for opposite direction (output vs capture) format being change=
d, this should
> > > > > be documented in the spec, if you find it too unclear or missing =
for sateless
> > > > > codec (I know it's there for stateful but can't remember, would h=
ave to re-read,
> > > > > for stateless) let us know.
> > > >
> > > > AFAICT the capture side is working OK and to spec.
> > > >
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > > > regards,
> > > > > Nicolas
> > > > >
> > > > > >
> > > > > > Andrzej, I believe the second patch would conflict with your VP=
9 series.
> > > > > >
> > > > > >
> > > > > > Regards
> > > > > > ChenYu
> > > > > >
> > > > > > Chen-Yu Tsai (2):
> > > > > >   media: rkvdec: Do not override sizeimage for output format
> > > > > >   media: rkvdec: Support dynamic resolution changes
> > > > > >
> > > > > >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> > > > > >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++---=
--------
> > > > > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > > > >
> > > > >
> > > > >
> > >
> > >
