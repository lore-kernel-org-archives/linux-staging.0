Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5E2C85
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 17:17:17 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id y73so14380960iof.4
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HXvKBkFk1lH71ezl7CL3EXrQNNj6Ir0BF0aVDC9DYGE=;
        b=PMfqQN8voBlMS7rURFm/aONiF9I7I/gvW1rl2i0LoPGCFF0rMAgTab0Qu1ufbN48tL
         PAEGMTf2KqC3RdjZwBjsIZi7y7TtmqB6CbEoeW0RZIRMbvYDN4R8CPsXpv7qss5iPqz/
         GLeUFiA36njUUHOhnpBNWOx2yhsDN7dWGc2xdvCccIFkM/8Z7r3jCu0VQY+RKns4OupQ
         /V0tTIvt86968tjD43LhBQRILbi0kkkDXakXDTVfnBY4QGRa4W4mfxDDAY1lp+b53l4E
         csXnnklm7maxiNQJyAUX/tgaB4E3ZM56927azxuNaP54krFL/6yXSLrcHUaR0EkB2U48
         LUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HXvKBkFk1lH71ezl7CL3EXrQNNj6Ir0BF0aVDC9DYGE=;
        b=J7/zuPsn9ebV0L8vEzKUC+5SGTRw4efvs8OEV+ne5wstXB+WA/IyVggfEA0M7XtrWU
         /7SCsYO/nQYOdp/YErIiXTrm7BtmWwB7J7cPgcNDgbrkC+/O+JCFeerHbUsSnc62v3g2
         XNAC5R4pYY6ckNEsuNAyjxSjCuYKI5CGmwLgi/lPJviX+9N0ekU9DlqV2xIao2jyA+jU
         dJskwREyspvv+R6LK5unsA/J2QUUyScNazRc2CWqeWmUvfFDM7RAbZyrX/zl8nsTitQA
         QBUiVzm6mKL6khySKpfY8OB0kn2zAvA3Ebe0hDimxN8IioyOWE4HMg5wlz6MAgMtxTvg
         /Ycg==
X-Gm-Message-State: AOAM533/cigc5PDKaQanYxOeVDBvsnW+qa3K1otRFqPi1PeB3XDI6dZ7
	CIf3fpOTsCvWy1U0RLj+uBeJaZzCAJymCFLFm+8=
X-Google-Smtp-Source: ABdhPJweoZvtJE2WExhW7KmaO5X4xrgZhowJknNv4FJt3QG+kk5Cn5bKZz0lrS1q9Vwg0DHA+p3Yl1b961JnUIJY3r8=
X-Received: by 2002:a02:22c8:: with SMTP id o191mr14737557jao.31.1636219037061;
 Sat, 06 Nov 2021 10:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com> <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com> <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com> <YYa0e98JTsE0PPDL@equinox>
In-Reply-To: <YYa0e98JTsE0PPDL@equinox>
From: Zameer Manji <zmanji@gmail.com>
Date: Sat, 6 Nov 2021 13:16:50 -0400
Message-ID: <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I would be happy to test the patch. I am not an experienced git user
when it comes to
taking patches from mailing lists so I would appreciate it if a commit
was pushed to a
git repository that I could pull down.

On Sat, Nov 6, 2021 at 12:59 PM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Sat, Nov 06, 2021 at 11:48:08AM -0400, Zameer Manji wrote:
> > Hello All,
> >
> > I have bisected the regression to
> > ```
> > commit 221abd4d478ab52fd17de9287fa302ac0e06f7b3
> > Author: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > Date:   Thu Aug 12 02:25:19 2021 +0200
> >
> >     staging: r8188eu: Remove no more necessary definitions and code
> > ```
> >
> > Prior to this change the device can see all networks on all channels.
> > With this change, the device can only see networks on channel 11.
> > I suspect this might be specific to the RTL8188EUS variant
> > of the hardware. Unfortunately I don't know enough about
> > this driver or the hardware to understand where the issue
> > is in the change.
> >
> > Full bisection log is here
> > ```
>
> Hi Zameer,
>
> Thanks for doing this bisection, super useful. I will have a play after
> my daughter has gone to bed and see if I can see anything :-)
>
> Assuming me or someone else finds the cause, would you be happy to test
> a patch?
>
> Regards,
> Phil



-- 
Zameer Manji
