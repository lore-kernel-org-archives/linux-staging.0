Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5147E;
	Tue,  1 Nov 2022 18:35:08 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id j9so4613311qtv.4;
        Tue, 01 Nov 2022 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp/5zmqM/RRSJ5KnMbkLWKzmrtWigi1LkGGYrFbPaTM=;
        b=lxPCP9+nJSjdQo6Cqjh3U+VVEYZCf36lwRLzVrnii1J0qX8AjtVnp1GhYk9fHuLo9N
         pQicVNcZpOzHvXErSZ5wbIkWAAoPCn0qXsEJsJ/EXr9vvdm0iMAfD4H7Ri9xT55OpE88
         3oLbIaD8tVpkb5rI7AcBE8NhB/gjgQ9ghGR3Q36Xfm0vSh7Lo/U5Dj87H6vrqhuOSta5
         baQEkkhi1b4KI2eNyc+sCvEjv3C+jTdB+hJGL56e8bMJ62dn87HK0Dc6tAqXmp2mXsVn
         ngCAipTmduycuO72KZ538lIUebALfLpxndTznamUTITFyqcyqQMis5RT1/pUZ2+76Quj
         xFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yp/5zmqM/RRSJ5KnMbkLWKzmrtWigi1LkGGYrFbPaTM=;
        b=2qXiUD7tJd1ZmwjOBp9iJSGeWKC/O7s8lI2UqfaRv5dOso91ffQYigiVYiku78ak2z
         nmS7hqQ4wmoI1/8s7H2cHAlcVh/HAx8HBjX0FrrPGFRvSy+u5gJNaTUY/j+rEA0PUNHJ
         YMlYwyOouWSAkb3mS8NMldEuweKJ304Blw3dv7Xt0/1yYJA8sFiG1uWEvbKDeYxTtNxt
         kvocGoPcHv3PgNygha6Xw67ui3cBR/JwgTZmKEYf5Lu4GmHbIPvTMknDzUhmKetpy9xx
         2YdBJ3lDcMq8YdmjhXEceQK0VDaRYXKYBQc/sUrDnnIkD4m6q/KzYHE38/vpoeGlfZ35
         vLlA==
X-Gm-Message-State: ACrzQf3kr1c0gMSx7PNR/ujvJj1yCr/TSs0vT+RiTTWCTG0U5AbS+HHX
	LLTyhznX+wBUg06//uTfy/7NKZU2MdhapEGax6E=
X-Google-Smtp-Source: AMsMyM5nJwkXIV9Yq3G5AGu4VggIq65hvmlUkP2Q2uokcZtgpBbuQ4JE7I3Pa1+EPgNxTowyIJ4IHcCpxV2ucpqR5UI=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr15920035qtw.281.1667327706975; Tue, 01
 Nov 2022 11:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1667305446.git.tanjubrunostar0@gmail.com> <Y2FjuHeVzY5VYG97@kroah.com>
In-Reply-To: <Y2FjuHeVzY5VYG97@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Tue, 1 Nov 2022 19:34:55 +0100
Message-ID: <CAHJEyKV98M5P2N7qvdwdP8R_=wEmc+_TpTk+RFSo5a+sCO15Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] some checkpatch fixes in the file rxtx.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 7:20 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 01, 2022 at 12:37:58PM +0000, Tanjuate Brunostar wrote:
> > These fixes are focused on the function s_vFillRTSHead
> >
> > v2: changed confusing changelog messages
> >
> > Tanjuate Brunostar (2):
> >   change the function name s_vFillRTSHead
> >   Join some lines of code to avoid code lines ending in (
> >
> >  drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
> >  1 file changed, 22 insertions(+), 26 deletions(-)
>
> Please look at your subject lines you are using here, and look at the
> mailing list for previous patch submissions, and at the git log for this
> file, and fix them up to have the proper prefixes on them.
>
> As is, I can't take these.
>
> thanks,
>
> greg k-h

There is a version 3 of this. Please review it instead

thanks

Tanju
