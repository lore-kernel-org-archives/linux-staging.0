Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6623FC2
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:58:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id c17so15009728pgc.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1QEzz8l10ItQyTj7R7UnaMBv4HzmAT0MuoYeWEko34=;
        b=NVgAk9sX2H5XPJKqTjIeK3u/mKQNJ/yfRoAM5NCYBWJiRVOfDw6XtN25QrqN6viyO3
         8a595bmdo0+4GEMKjEDdHmSuJbz1csuEpQUPITluIbx+NSsnUmUI/O8fhaxuoPqzyo/P
         DdftZOOdz/8y8hLXmvCnUiRDjL+T1opKYISCulL//sfmO05EaAsJFDbMu+/ipAX2/sGP
         6/QxAHNWqLQwTUbmVaqqgIjPdiR65Nao/4XPxg0tOIfUxP8/RTVsAVTdGexpCEkeG5K9
         c0FJvtXbMr1Usc+H5eHU3HgFhHbXZk3IVRN3fOL42m4PTH8/J6vfbTvZCdBseHJTQ9NK
         N/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1QEzz8l10ItQyTj7R7UnaMBv4HzmAT0MuoYeWEko34=;
        b=Hg0XDVf7yPPSfUoiUzkoslJiVyGhp3wF3tOFzrPyuaCMsDjvhu0XqdCmNa8kLwk72H
         amZ//vWBXtZXjk12Nc+FAp2RWDiBMaDXYyrUhU42bGaSCqUJ6ezd637dXZLvWIZ9PIGL
         2Q11wenixrEtA9GguxC46ItLoRunLUiiv30Qr6v4x4ELaEHR2iMFEbq2U1ZzLiup+5cy
         FAGUWs2X0Qc8h1uk50fmqwfRAeshTlGPJccnzC1JJm1O0+Go0vdSPvtxKjUMTNzF+f6H
         Vi80TyrfcdBJvquxrl8VePy2hL4c+LxOsHqaT9uG9X0Z05FYMBd+DFHhfAJcnQu2Cv5K
         C1Sw==
X-Gm-Message-State: AOAM533XXCKZvtY9Axl0/HXx52FKUuR9sLYxDO+K9qmhY0K3RjOCLziB
	LmaMXs6U9vaT39XEkETrTPx8Ni/hktyRARsc1bbsDw==
X-Google-Smtp-Source: ABdhPJwEoaX3sH59fomXWEOKyrjNhGQnlPM9ZNdL791GaE5sj8mEhORNycvvLERmMeeJCaW6msqclGYBlqJOaG4KoBw=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr29693865pgo.208.1629676722589;
 Sun, 22 Aug 2021 16:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YSFgrLUfXzgcT6k4@user> <1821445.fzUCeO1EU3@localhost.localdomain>
 <CAA=Fs0mu4m04_Be4-f=W+=_hhGn5oJ2q=KOmZdRrMyGhMgqc-Q@mail.gmail.com> <18734228.Nv2I6EOGHm@localhost.localdomain>
In-Reply-To: <18734228.Nv2I6EOGHm@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 00:58:31 +0100
Message-ID: <CAA=Fs0kZvkSmf9vH_Z1rUbDMYYd5SWbQQXhGpMxDbfvWQs338A@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 17:24, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
>
> Dear Philip,
>
> I didn't mean to be harsh with you, I apologize if this is the message
> I conveyed. Really!

Dear Fabio,

No apology necessary :-)

>
>
> Now it is clearer to me what acking means. I've given only a handful of
> acks because I thought I should also check if they applied and if they
> build. It takes time. Now I understand it is not required. Thanks.
>

Yeah I try to ack as many as I can now, but couldn't possibly do as
many as I do if I had to build test them all, especially with my own
code to write and a family/full time non-kernel dev role. It is
certainly desirable for the majority, but if the code looks
good/correct and is a simple patch then in my mind an Acked-by is fine
to give in any case. That said, I will no doubt make mistakes on that.

>
> Please, don't ever think I'm not more than sure that you give a lot
> of your _unpaid_ time to the kernel and I thank you very much
> I know what it means, because I too have other commitments :-)

Thank you, and I appreciate your involvement so keep up the good work :-)

Regards,
Phil
