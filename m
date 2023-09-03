Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591B1843
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 09:54:44 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-26f6b2c8e80so345224a91.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Sep 2023 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693734884; x=1694339684; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSZnlEu/1rZ58eHSJVj+WQ7718jJFMdsyl5ARuTMrGw=;
        b=SqqEVHeZw8Z+54i8PUTznEPAitAWzldVM3oHuZeKf81BxXhjsugEJ/LuVUWCJhJhuD
         DbdB93aYafQfMWW6+n3YXWgKT9HOovFsoZ0aOmObCZayroOtLT+nM9MZsyDdQbZkoiCu
         /7KY50b4uiK/7T2um1/MzfOryGAnhIfy3j/2x6wBYp1V9fZDC1G1n8QnNAGvgWqSWP5Y
         0WcLqEppEvMVMSl/sTRYOa/qx6t2ml2qo60dTCg3oMK5XPy/boGQ7EY7+ZVq1s9zx9sb
         XoRq5qx1RSp/8ZFx3ZSfIKuthkGASehznP+rvqKmeqzfz+Yo9Z2JSa4GD04iIvr2So5A
         uMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693734884; x=1694339684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSZnlEu/1rZ58eHSJVj+WQ7718jJFMdsyl5ARuTMrGw=;
        b=SinfRWx2F5HVuv16nOXbOtXr2or7Zckmb0LTj3CY6X36+5wXw3kd5YRQdz4Km+B1KM
         NNdJdMMNYJw0MN1x4yTTtgBYJeWswrm/DJizJL7h86BEPlGlecG8eloRHbTlp1Y461rd
         2SwwaUzkG0Wal8sUDM6r2DuP/DMUgnTC3w3W0xlx7Z5AhO8Osdb0ofT8EDyuuZTR5YKp
         Mg6HSAjEyIOrjQxJ3tI7vNlc4ISOBfo2m3Y4KYQKcxjG55Pu8BYJZXW2a4tSKulvfeaP
         04BLM1F3h2TqyytSCHvjbY8y8Wvav6qVPDWX+p2uA6q+KJUtjaFk+JtSC919TAjbJBtS
         ulQg==
X-Gm-Message-State: AOJu0YwfwVMKih9jlWMZXPSEbUAblw4TMqg1et6I07k7ZpB46anceAP8
	NC3opYZxOFpw17bvDkiOli3WgGBV602WsAFIG/0QrADdIt7CWXTU7WA=
X-Google-Smtp-Source: AGHT+IFLSgzbrRKCnF9RL63/5b8qz1Rz5YWHK+jFN02iQnHY6JEc6/Tjg+6d/Pvn3J8BBIqmfwsV3/N1+6hGB8fSfvo=
X-Received: by 2002:a17:90a:db4c:b0:268:5c3b:6f37 with SMTP id
 u12-20020a17090adb4c00b002685c3b6f37mr6657137pjx.0.1693734883661; Sun, 03 Sep
 2023 02:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230903082253.562042-1-bergh.jonathan@gmail.com>
 <2023090324-recopy-unisexual-db41@gregkh> <CA+MPq=VjvQSmY_coVxrmisXavgaZa78ram-SH2pHvOZ=AvaqRQ@mail.gmail.com>
 <2023090349-fresh-empirical-425d@gregkh>
In-Reply-To: <2023090349-fresh-empirical-425d@gregkh>
From: Jonathan Bergh <bergh.jonathan@gmail.com>
Date: Sun, 3 Sep 2023 11:54:32 +0200
Message-ID: <CA+MPq=U87cDJt1r8HCrw4LoM4PwtBRuP+z77=CcqG1HAKJZ=NQ@mail.gmail.com>
Subject: Re: [PATCH] Staging: Fixed some formatting warnings in the vme_user driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks mate, appreciate that. I'll check it out and give it
another whirl (assuming the rest of the talk is still valid ... and
you guys still want these sorts of patches!)
Cheers
JB


On Sun, Sep 3, 2023 at 11:40=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Sep 03, 2023 at 11:17:41AM +0200, Jonathan Bergh wrote:
> > Hi Greg,
> > I hope you are well. I got this response from your bot!
> > I pretty much followed your FOSDEM instructions for *first kernel
> > patches* so i thought I was doing it right.
>
> That's a really old talk, things have changed a bit since then :)
>
> > Based on the video of your talk, is more required in the SUBJECT and
> > BODY for such a (basic) change? It seemed the above was pretty much
> > inline with the terseness / examples you showed in your presentation.
> > Hopefully thats the case.
>
> Yes, you need a better changelog and subject line.  Read the link that
> the bot referred you to and look at all of the examples commits that
> have been accepted for the files that you modified to give you an idea
> of what is needed.
>
> thanks,
>
> greg k-h
