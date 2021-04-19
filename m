Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B12F81
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 14:05:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C634760FD8
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618841130;
	bh=huJObfCz9waMna/K0zJD7D74cn69Tzm4Iw9NkUfu3q0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uRe+jAX+GFR9EG+cCYZmM8y9JgMWCjm0pslfCUvFvSiBs6zJMX5t4dLLDyHbKmr7l
	 NNpDDti6eLTpTK/tzkupVxSMNtUP9FztpEda7qPjME0wYAa4KbljFg0MztEMK3kXge
	 xoue1vvWDIJzec3naehoLXqZN8CqyCuq0trOk9x3+ev25xaZmYabW7RANZy8mzUpII
	 Tzo2+Gges1HgZgr3M4G9U8qbxpl40h3XRtfQEOMyZtXxIHu0exiKh9IYRG38nyVV40
	 PekPv4P8HXLAwSjRLBBeIBmsnSbFE3uHu6fH0WNTa+Gi4TY2JGrKlDsBZgYLOgUKs8
	 kOwhEks0qz1BQ==
Received: by mail-wm1-f50.google.com with SMTP id z6so474424wmg.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 07:05:30 -0700 (PDT)
X-Gm-Message-State: AOAM530/rkxcBr4D6UwGo7jCQ1pAbwRXwEdBxwOWl5mJrIMD+1ruPTvm
	sqMZVdYXPNFHBqIYso7uY8QwPfirrU9mdh7IauA=
X-Google-Smtp-Source: ABdhPJzxf+CKZUwpluSxU1z+g7/DAOzCHLxtdJcMsZjCuUxs/hjMltqX0L8WHMwcf7v93p7Yo+AtGqRgBeKuhXBiAaQ=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr21196652wmi.75.1618841129484;
 Mon, 19 Apr 2021 07:05:29 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-38-lee.jones@linaro.org> <20210415051835.GY6021@kadam>
 <20210415052556.GZ6021@kadam>
In-Reply-To: <20210415052556.GZ6021@kadam>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 19 Apr 2021 16:05:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2nNxp5J0XJWLOWiGxh7QiSP1SkFra3+aX5fzPSP14BTQ@mail.gmail.com>
Message-ID: <CAK8P3a2nNxp5J0XJWLOWiGxh7QiSP1SkFra3+aX5fzPSP14BTQ@mail.gmail.com>
Subject: Re: [PATCH 37/57] staging: rtl8188eu: os_dep: ioctl_linux: Move 2
 large data buffers into the heap
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 7:29 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Apr 15, 2021 at 08:20:16AM +0300, Dan Carpenter wrote:
> > On Wed, Apr 14, 2021 at 07:11:09PM +0100, Lee Jones wrote:
> > > ---
> > >  drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > index c95ae4d6a3b6b..cc14f00947781 100644
> > > --- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > +++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > @@ -224,7 +224,7 @@ static char *translate_scan(struct adapter *padapter,
> > >     /* parsing WPA/WPA2 IE */
> > >     {
> > >             u8 *buf;
> > > -           u8 wpa_ie[255], rsn_ie[255];
> > > +           u8 *wpa_ie, *rsn_ie;
> > >             u16 wpa_len = 0, rsn_len = 0;
> > >             u8 *p;
> > >
> > > @@ -232,6 +232,14 @@ static char *translate_scan(struct adapter *padapter,
> > >             if (!buf)
> > >                     return start;
>
> Arnd, added this return...  I don't understand why we aren't returning
> -ENOMEM here.

I don't remember my patch, but I see that the function returns a pointer
that gets dereferenced afterwards. Changing this is probably a good idea
(the caller does return an error code), but it requires a few extra changes.

If there is a larger rework, I'd suggest using a single kzalloc to get all
three arrays at once to get simpler error handling.

       Arnd
