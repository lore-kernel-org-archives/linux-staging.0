Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319992C80
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 07:31:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id r19so22561084lfe.10
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 00:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5v6Yv2PTALZV81MwXFtZ1rqpH6wW8mXRMgyhMKUACeE=;
        b=jKzQfSO+x3YNza53ylLadTQhAg3leSQwNu5To0Md4XLrrAY2BcB2EpzcSSZ/dcQRAx
         GCS2hPQShkC7t3kOWeD+36J2jsuENANsFd60MRmuYDWwgFpnYTA2sPXsP3JaNGG34EJw
         ODPXTfDUaHEglmjbIKT1S1Fpu2CYCeoyKvhF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5v6Yv2PTALZV81MwXFtZ1rqpH6wW8mXRMgyhMKUACeE=;
        b=XsmAzVomha3jcJ9dLd9lWhxNdxNJ59GGGKEh0B0lyIK6Tl6zz+nSzd1DppFOftck/W
         mE8xF2+Ul2HWNnjSuXFo7kNTLHP+yeBLZ2lLXrFTyYIByLPwsuAcwz1YOKE29XN/fd31
         TgFHtS4xzlzQqn0fAAYndGZ6fLZLjUB2anKCtk4zwH8E5NJAna2+MQsSxjrV8j03n8I7
         kAd3uOuovGSH3RnXUpbtef93nW21QpiUFCHbg4FFMREDYAZF6fnrEoXaZ7onL3hcADj8
         jhBPjp+bCS6ERY0h72NcKIEhtjPydqDsz1RBfwcu8nUTWw/fNqIBGVYo+beMmQeHpnLa
         PVKg==
X-Gm-Message-State: AOAM533TrK2bUyYj5CK3nW6bBMl1q9Smd2ryA0UwQsZjLNWSJMBFyjFg
	oT/KkxovynK5eYLVQGbLf1dM0meMUv7l6nP9CMFATg==
X-Google-Smtp-Source: ABdhPJwUzlceOWh+FeOpcEW7hALYyLGrRfBub2/LsdDbiuQ7zctHURNLqdHAbEtPrWJMw8kuOqGzvHLNlygUTXK0wRI=
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr4394571ljq.457.1634196679846;
 Thu, 14 Oct 2021 00:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211008100423.739462-1-wenst@chromium.org> <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
 <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com> <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca>
In-Reply-To: <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Oct 2021 15:31:08 +0800
Message-ID: <CAGXv+5GJCaxnPPkXRp5xrTBuq-5=ggfjPbRhyS4vdm3meM_4eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 9:40 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 13 octobre 2021 =C3=A0 15:05 +0800, Chen-Yu Tsai a =C3=A9crit=
 :
> > Hi,
> >
> > On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufresne.ca>=
 wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > thanks for looking into this.
> > >
> > > Le vendredi 08 octobre 2021 =C3=A0 18:04 +0800, Chen-Yu Tsai a =C3=A9=
crit :
> > > > Hi everyone,
> > > >
> > > > While working on the rkvdec H.264 decoder for ChromeOS, I noticed s=
ome
> > > > behavioral differences compared to Hantro and Cedrus:
> > > >
> > > > 1. The driver always overrides the sizeimage setting given by users=
pace
> > > >    for the output format. This results in insufficient buffer space=
 when
> > > >    running the ChromeOS video_decode_accelerator_tests test program=
,
> > > >    likely due to a small initial resolution followed by dynamic
> > > >    resolution change.
> > > >
> > > > 2. Doesn't support dynamic resolution change.
> > > >
> > > > This small series fixes both and aligns the behavior with the other=
 two
> > > > stateless decoder drivers. This was tested on the downstream Chrome=
OS
> > > > 5.10 kernel with ChromeOS. Also compiled tested on mainline but I d=
on't
> > > > have any other RK3399 devices set up to test video stuff, so testin=
g
> > > > would be very much appreciated.
> > > >
> > > > Also, I'm not sure if user applications are required to check the v=
alue
> > > > of sizeimage upon S_FMT return. If the value is different or too sm=
all,
> > > > what can the application do besides fail? AFAICT it can't split the
> > > > data of one frame (or slice) between different buffers.
> > >
> > > While most software out there just assumes that driver will do it rig=
ht and
> > > crash when it's not the case, application that do map the buffer to C=
PU must
> > > read back the fmt structure as the drivers are all fail-safe and will=
 modify
> > > that structure to a set of valid value s for the context.
> >
> > I believe what is happening in Chromium is that the decoder is opened w=
ith
> > some default settings, including the smallest viable resolution for the
> > output side, and the buffers allocated accordingly. When dynamic resolu=
tion
> > change happens, the decoder does not check if the current buffers are
> > sufficiently sized; it just assumes that they are. And when it starts
> > pushing data into the buffers, it realizes they are too small and fails=
.
> >
> > The spec also says:
> >
> >     Clients are allowed to set the sizeimage field for variable length
> >     compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioctl
> >     VIDIOC_ENUM_FMT, but the driver may ignore it and set the value its=
elf,
> >     or it may modify the provided value based on alignment requirements=
 or
> >     minimum/maximum size requirements.
> >
> > The spec only guarantees that the buffers are of sufficient size for th=
e
> > resolution configured at the time they were allocated/requested.
> >
> > So I think my first patch is a workaround for a somewhat broken userspa=
ce.
> > But it seems the other stateless drivers are providing similar behavior=
,
> > as I previously mentioned.
>
> That's what I mean, this is not a driver bug strictly speaking (assuming =
it does
> guaranty the buffer size is sufficient) but it is without your change
> inconvenient, as userspace may be aware of the largest resolution it will
> decode, and may want to allocate larger buffer upfront.

Thinking about this more, I think a few follow up fixes for each driver
are in order. The spec implies that the driver should override the value
should userspace give some unrealistic value, such as asking for a 256 byte
buffer for a 4K frame size.

Cedrus (CCing Jernej) comes close, but a 1K buffer might not be enough for
really large frames, even though it's slice based?

ChenYu


> As per Chromium bug, this is being addressed already. Thanks for this dri=
ver
> improvement.
>
> >
> > > As for opposite direction (output vs capture) format being changed, t=
his should
> > > be documented in the spec, if you find it too unclear or missing for =
sateless
> > > codec (I know it's there for stateful but can't remember, would have =
to re-read,
> > > for stateless) let us know.
> >
> > AFAICT the capture side is working OK and to spec.
> >
> >
> > Regards
> > ChenYu
> >
> > > regards,
> > > Nicolas
> > >
> > > >
> > > > Andrzej, I believe the second patch would conflict with your VP9 se=
ries.
> > > >
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > > Chen-Yu Tsai (2):
> > > >   media: rkvdec: Do not override sizeimage for output format
> > > >   media: rkvdec: Support dynamic resolution changes
> > > >
> > > >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> > > >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-------=
----
> > > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > >
> > >
> > >
>
>
