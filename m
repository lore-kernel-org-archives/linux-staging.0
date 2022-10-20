Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3717E;
	Thu, 20 Oct 2022 10:29:17 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id i9so13225971qvo.0;
        Thu, 20 Oct 2022 03:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CpepSprjis+5ae/JU6KqavxGncI1IXR7MSlJhihZlRE=;
        b=RnZSspVJPsuLAA1GS5so0ZEPuWaNegeCiOiYlAnru7F5HLyfB2KyuyNxSgrzHw0Vy2
         IapRkkt/DeZ5v7sS8kUpQMYruFQ9HWksNS+r5sSwouZ362WSFqMt4TQX2Ahi1JFVHmMF
         OS5oiuxgt/y3cha57/q6i4myHFcNMCvRVZAsvHtpBBmjogw0mnM5sGmdLK1Zau11xEsS
         /YagS8jckr6BX/8OqUuJHdtvCEVrNdaNyJ1AAKEwJtUo9ObvQuqqBnPoGvMg86q3aflD
         vVeGXjRvjKLvVEMJm4ur3TXIaLjlWNr67kiE9FUBzMQhRllcvUG0EH40M0E+4nrkecTN
         L+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpepSprjis+5ae/JU6KqavxGncI1IXR7MSlJhihZlRE=;
        b=1NzIr/fZEc9VQgXzm6a60NcB/Rbpja77UwPGZxH5+/DY5kD4tLetMu3ehFwVAoodL8
         H0czMha0+EZeRDIkE68LE6sXWYsioTZD4O6Zg4t/7ztAY7FRULho+HxbtXyPwTs3jHmb
         U8jXsHFBvR9w0yFStJvkivbgBTs0L4BX6dfR4v/poDqgS3hwbts0n/DJAU5PxwpLugrB
         5y85vjhS2XnFCvvgHvDGd5sqhW4eqAEVXJv9eBIddbV+zhwl5FZR+ilKtYIjLhy6FWVq
         vj/jMfPSf9PaKQvjCy1mpBLyrk7QVSvJa56XV69brgscRb1hHuLc6qxcPDEQnGN/jwxR
         x99Q==
X-Gm-Message-State: ACrzQf2940XMGC4coHdcqoFq8YLD9brjKiVISeZbf7JZANKFBuqVnKvK
	tJ4Oy/HyD8e2x/OvaoDMIjdxImXkumNTMUmngSi3uP3CLYOONMvZWr0=
X-Google-Smtp-Source: AMsMyM7dgYuoQ/uU+La4aRoUZd/n793rZ33XplndYzQTS3OeP5YTOA8AUONCL3HT/MmsOQmAkEcno50JlzK7WUlqT+A=
X-Received: by 2002:a05:6214:d69:b0:4b4:525e:c987 with SMTP id
 9-20020a0562140d6900b004b4525ec987mr10522749qvs.82.1666261756458; Thu, 20 Oct
 2022 03:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1BN6wPMrpxPB3qP@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <20221019223446.GA154747@nam-dell> <CAHJEyKUsZ-V0waEwBEy67g+MNMR29MGJbBx3qCA4axKyPk9RGQ@mail.gmail.com>
 <814aa14-25b-d579-e2d4-5c61ddb749b1@inria.fr>
In-Reply-To: <814aa14-25b-d579-e2d4-5c61ddb749b1@inria.fr>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 11:29:04 +0100
Message-ID: <CAHJEyKVd=d-Lr6RRgMM2MYDHSVzrck4pXH6yys0=7pjarHH9dw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt6655: Fix Lines should not end with a '('
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nam Cao <namcaov@gmail.com>, greg@kroah.com, forest@alittletooquiet.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 11:18 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Thu, 20 Oct 2022, Tanju Brunostar wrote:
>
> > On Wed, Oct 19, 2022 at 11:35 PM Nam Cao <namcaov@gmail.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 07:20:11PM +0000, Tanjuate Brunostar wrote:
> > > > Code style warnings reported by checkpatch.
> > > > Improve the layout of a function header:
> > > > Put the first parameter immediately after the '(' and align the other
> > > > parameters underneath it.
> > > >
> > > > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > > >
> > > > ---
> > > > v2: put static and void on the same line and adjusted the indentation as
> > > > suggested by Greg KH
> > >
> > > I think he meant putting "static" and "void" and also function name on
> > > the same line.
> > >
> > Oh I will do this now. thanks
> >
> > > Additionally, I think your patch introduces new checkpatch problems. Did
> > > you run checkpatch.pl on your patch?
> > >
> > > Best regards,
> > > Nam
> > >
> > Yes I did. the checkpatch says this:
> > Alignment should match open parenthesis
> > #89: FILE: drivers/staging/vt6655/rxtx.c:89:
> > +static void s_vFillRTSHead(struct vnt_private *pDevice,
> > +               unsigned char byPktType,
> >
> > The only way to resolve this would be to add white space which would
> > generate another checkpatch problem. how do i fix this please?
>
> You mean that the ( is not at a point that is a precise multiple of the
> tab size?  You can put as many tabs as possible and then use spaces
> afterwards.
>
> julia
It works. Thank you
