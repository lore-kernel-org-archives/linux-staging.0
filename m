Received: from p3plsmtpa11-02.prod.phx3.secureserver.net (p3plsmtpa11-02.prod.phx3.secureserver.net [68.178.252.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8636E6D0D
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 08:27:52 +0000 (UTC)
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by :SMTPAUTH: with ESMTPSA
	id UmSJlT6Q41vvDUmSJljCvT; Fri, 09 Apr 2021 01:25:31 -0700
X-CMAE-Analysis: v=2.4 cv=bIzTnNyZ c=1 sm=1 tr=0 ts=60700f7b
 a=p3QOco+7hGoYrtPqiBtjvA==:117 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=3YhXtTcJ-WEA:10 a=pFd2Zl5z2vwA:10 a=ZZnuYtJkoWoA:10 a=pGLkceISAAAA:8
 a=OLL_FvSJAAAA:8 a=4RBUngkUAAAA:8 a=1XWaLZrsAAAA:8 a=AFfvQUj85srtwFEc7eAA:9
 a=QEXdDO2ut3YA:10 a=cDyXFGGuxjcA:10 a=z54qQdpIc_cA:10 a=Wv7ntmRM1ZwA:10
 a=wqjlRBnl_XkA:10 a=bt_fcZFKdygA:10 a=oIrB72frpwYPwTMnlWqB:22
 a=_sbA2Q-Kp09kWB8D3iXc:22
X-SECURESERVER-ACCT: vthakkar@vaishalithakkar.in
Received: by mail-ua1-f43.google.com with SMTP id r20so1579216uam.6
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 01:25:31 -0700 (PDT)
X-Gm-Message-State: AOAM532UMvHUFBxFOLZAcTNBpnzXFXW1SA62ZkQSzGo8SNUgf/CA4oSD
	GwoTS2DVkEiRJWQzh2NTld8hxY3hlvGj1BW54Q8=
X-Google-Smtp-Source: ABdhPJyROeFMY/XO5ctTLI5Jn1Ao8OxqdGhQ7Q8oaXRUimPF9Nqz3PbviDZ1RbUpXtHuk0VguihwD7T9pLGGYqXwbMI=
X-Received: by 2002:ab0:2819:: with SMTP id w25mr9917224uap.76.1617956730971;
 Fri, 09 Apr 2021 01:25:30 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
 <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
 <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com> <6bba0e0a5768e902ffec4bda563d4ca810412f84.camel@gmail.com>
In-Reply-To: <6bba0e0a5768e902ffec4bda563d4ca810412f84.camel@gmail.com>
From: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Date: Fri, 9 Apr 2021 10:25:19 +0200
X-Gmail-Original-Message-ID: <CAK-LDb+L-hXpVgFpAz95921p6JOPZ8=BSYAiqjRpYv0oV=YK2A@mail.gmail.com>
Message-ID: <CAK-LDb+L-hXpVgFpAz95921p6JOPZ8=BSYAiqjRpYv0oV=YK2A@mail.gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2 v2] staging: media: hantro:
 Align line break to the open parenthesis in file hantro_hw.h
To: ascordeiro <alinesantanacordeiro@gmail.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Outreachy <outreachy-kernel@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfNSNnKc2zM/fn3wGRE+eSDkIFdYm4W4JGbZDDkFG7QkYRP5Ux8CApz66usaXZY5lCwz6axnkEt3cvwlAOa8H/1/ApXEQPMpabg7xSYXLAv9BD+33c0TF
 OzZW4W7gfmSl0bOMF3B1lJMKZwTxpDQLBa+BHxIWYSc/UKjykAUiA2TySyroJHK++9y9GzPqwLEG2/vO9Ibdnz/vkS0OU/z9BA99suA3+OWJjtzIG2y8D8wH

On Thu, Apr 8, 2021 at 7:41 PM ascordeiro
<alinesantanacordeiro@gmail.com> wrote:
>
> Em qui, 2021-04-08 =C3=A0s 13:20 -0300, Ezequiel Garcia escreveu:
> > Ola Aline,
> Ola Ezequiel,
>
> > Welcome to the kernel community. Hope you enjoy some of this
> > Outreachy adventures.
> Thank you!
>
> > Normally, when you submit a v2, we want to know what changed
> > between the first submission and v2.
> >
> > If you are subscribed to linux-media, you can read some
> > of the series with a vN+1 and look how it's done. Examples:
> >
> > https://www.spinics.net/lists/linux-media/msg190043.html
> >
> > https://www.spinics.net/lists/linux-media/msg189923.html
> >
> > I'm sure your Outreachy mentors can tell you more.
> Thank you for the examples, it won't happen again.
>
> The reason for sending a v2 is that I sent my very first patchset
> yesterday and I sent the cover-letter together, but (I think) I wasn't
> supposed to, and as the patches weren't marked as [PATCH 1/2] and
> [PATCH 2/2] in the email - since I commited all the files with the same
> message - I tought it was wrong and sent again today.
>
> However, I just realized that I've changed just the subject of the e-
> mail, but I would've to change the commit message, right? And then, it
> would be a second version, am I right?

Your next version should be v3 with information about changes since
v1 under --- . If you send it with v2, it'll still be confusing for people
because then they have to manually find out the difference between
two different patchsets with the same subject line. :)

You can also check 'Revising your patches' section in the tutorial.

> Thank you in advance,
>
> > On Thu, 2021-04-08 at 11:07 -0300, Aline Santana Cordeiro wrote:
> > > Aligns line break with the remaining function arguments
> > > to the open parenthesis. Issue found by checkpatch.
> > >
> > > Signed-off-by: Aline Santana Cordeiro <
> > > alinesantanacordeiro@gmail.com>
> > > ---
> > >  drivers/staging/media/hantro/hantro_hw.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_hw.h
> > > b/drivers/staging/media/hantro/hantro_hw.h
> > > index 34c9e46..a650b9c 100644
> > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > @@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width,
> > > unsigned int height)
> > >  void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
> > >  void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
> > >  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> > > -       const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> > > +                                 const struct
> > > v4l2_ctrl_mpeg2_quantization *ctrl);
> > >  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
> > >  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
> > >
> >
> >
>
>
> --
> You received this message because you are subscribed to the Google Groups=
 "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/outreachy-kernel/6bba0e0a5768e902ffec4bda563d4ca810412f84.camel%40gmail.c=
om.



--=20
Vaishali
