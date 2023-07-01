Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8E23AD
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 10:35:18 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-440b66adc81so877004137.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jul 2023 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688207717; x=1690799717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8Eh2PL9vw+z9/shvLtMm4v72TX39RzomazCMgKz8Nk=;
        b=gk4OqIV5V//ZdAOJAaa5GPYAcNpTpuWFTFce8LSBa89KFGM/FmAS6z5QFS/XFlG38L
         CaJJGZp4IRjFS0HE/dFvsjJA9OXF4XWK0ViyYv3RwVgFzGO3uGhC4MsRej6wFtS279nM
         pUtQdHj9dNr4BiUB+sjzn8SywLstAHZDDWGH+FhRhiVHEIEriHnKgkLBhdlt9KbK2hzs
         gr0Y3fXiBDLBIlow/iHMUOFMvuL28V9RVabATiv2RFq12pvxS6R65/mDX+s+cgwKrjX5
         h13lHcSN3KrRvAnXU5xD7yji8lmqMxJNfUsOj8Ea4rI/AHevzcQoTbLfwSNVkQ8R/2f8
         7mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688207717; x=1690799717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8Eh2PL9vw+z9/shvLtMm4v72TX39RzomazCMgKz8Nk=;
        b=UzI67iMCW/uZs7r03vRliulrA0p+Bl0F1Ze3Uyq34wnZO5fc9xd/jLa5HCIxGEr+g/
         G0B5zLI26vVR/q01UkvQazK8jjV9/ujV3n4O7R87mP8VfAqjpCPpOXYskf8AWyPrZ6QW
         4QHU7DIVDMz70BssgRG7y/oF7uw1kk9xL9jMMKK5d/lR+CMV4wTvUAuwDPUe1YHIQEf7
         L/rp6ABj2Ft7Wwn+Ny2wONkm8eAT77Loz7AqmU6U2Mjl/EP0BzCOtn5gE8qZ5mvHe9Oa
         X8yRadQ4JRfjYSJv3JJsrParqIwgATQiVgJkRMlgZArYsW8hPH2V9Al+mUnJYMjTajr/
         XrRg==
X-Gm-Message-State: ABy/qLagmpEqAd/tJRoJyKfDHBtULFx1fvBRt9N2t29/S0B1IXwtrHcp
	0iukDwY72MmaBpGTum9LqSu95cVy4TOmTf2FmMw=
X-Google-Smtp-Source: APBJJlFHfNfsyxvXH3BjwiArTpL3edc4FjGRmjy6V65bUFDmug1RXImkOe4JjRA1CeTKvBNGPTUXC5oKPmqVxHbl8lU=
X-Received: by 2002:a67:f885:0:b0:444:d85f:1f3f with SMTP id
 h5-20020a67f885000000b00444d85f1f3fmr706523vso.3.1688207717690; Sat, 01 Jul
 2023 03:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
 <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com> <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>
 <69a90f88-634a-4126-8d33-e770fcc4b686@kadam.mountain>
In-Reply-To: <69a90f88-634a-4126-8d33-e770fcc4b686@kadam.mountain>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Sat, 1 Jul 2023 12:35:06 +0200
Message-ID: <CAAUT3iOOzV_pAKrA1+JhFuj2Mzt9Od-fRXxTEyvEbJicHLWBvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, eperi1024@gmail.com, hdegoede@redhat.com, 
	quic_vjakkam@quicinc.com, johannes.berg@intel.com, tegongkang@gmail.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Do., 29. Juni 2023 um 09:40 Uhr schrieb Dan Carpenter
<dan.carpenter@linaro.org>:
>
> On Wed, Jun 28, 2023 at 06:38:03PM +0200, Franziska N=C3=A4pelt wrote:
> >
> > Do you want me to submit v4 to fix the email address as well as the sub=
ject of
> > the cover letter or are you ok with me promising to make it properly th=
e next
> > time? ;)
>
> Philipp is not the person to ask, it's Greg.
>
> Yes, you are going to need to resend because of the email address thing.
>
> Probably the cover letter is not a reason to resend, but since you are
> resending then please fix that as well.
>
> The reason why we insist that you resend is a couple things:
> 1) This is a checkpatch change to staging so we assume that you're just
>    doing it to learn how patches are supposed to be sent.  So this is an
>    educational opportunity.  ;)
> 2) Greg maintains staging, usb, serial and -stable.  He's super busy.
>    It doesn't scale to hand edit patches.  Some maintainers are less
>    busy so they can fix trivial stuff like this but in staging you will
>    need to resend.  Also if it were a security fix maybe I would step
>    in and help you fix your patch but since it's just a checkpatch thing
>    no one is going to edit your patch.
>
> Right now the merge window is open so Greg isn't going to see your patch
> for a few weeks.  When he does he will press the button on his keyboard
> which sends an automatic reply about the email address thing and deletes
> the thread from his inbox.
>
> regards,
> dan carpenter

Thanks for your help and the comprehensive explanation Dan and Philipp :)
Just send v4:
https://lore.kernel.org/linux-staging/20230701102223.5308-1-franziska.naepe=
lt@googlemail.com/T/#t
