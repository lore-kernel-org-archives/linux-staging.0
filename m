Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036EA72
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 09:24:27 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so4134614otu.8
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VJfKXp1p14Sm+gs5vQpJcBKQ4WQjXJ9DGqpFSWyuG0=;
        b=e56sClF+y8SAgaeuU0FLQNRkS7BEazbXNVFGQ4/xSlpwa689710GjcZwOQyeUPuxBi
         a+9uOTT9opTBsS+fmzTp0H3GTCEKwIjsBv1QCb/NQhBSDNO5WVTuaLwUaDkevmKQ3CmN
         26V2RlqlPy7TuJZhH6wdhpsLEvDj1E/QyHtR+JQgnHIPwJ6bC7mavVEe6HzbAvtnD7mC
         73PThoJm7XU7ylJXpcqZTVyhiMkZCpEzfMcmCuNuzpj+1fjGpqYR48soMadi9JyEFHIw
         hQuush82VlnWKAS6Ypt7bicm8BtwyNfArp0Xdo/R89rockOK1SqcKdkYVUD9CenFcaK5
         M2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VJfKXp1p14Sm+gs5vQpJcBKQ4WQjXJ9DGqpFSWyuG0=;
        b=JF8yxH9Uux1g/hQKUBszR1+Uzx5rf5Vo7i8ruZXV5pyTrtTZ1oRcyMjqm99Fb6vi+T
         che4jrQaPtHTTENhjQzQmayMR7zKrLSdb8G7Nw5zNFA9nlgoHKEf2EbQgcrZNZ6RxJ5O
         N+x5Km84tZ+3bLdd+GWagebe9CpkiFKwakJ/yTWk8KhPIRJERYFZDSDJNgz21nXaogBq
         KfKiusur3vINtJUT0z/2z1LvJTx/A9x+tMTgj/fWy2gabtnTyRbemTZfBc78BTpeEcBU
         IAwKiCOPt0dJKg3hO/218Us7nadP8X5dLkMaGJ2tUPLKgfIoO5T9qGnK+3zfM9z7mR65
         kIpg==
X-Gm-Message-State: AOAM530IXjM05GsBMGoavoODhD8lPEfkcCIp5ajV2o4WJzQDcsdw0dHW
	NkwlKP176RsHVRqdu5RpNokAex/2dWm2Zd73MS4=
X-Google-Smtp-Source: ABdhPJwLE3DnCKCS1byVx211ccfNqe7C4yZwYzqYsFfx0gAP/nqhYeXllz6Im0QtUHriG2U8rf/IP0AZcZCQcwi6q7o=
X-Received: by 2002:a9d:4e9a:: with SMTP id v26mr13892957otk.74.1620033867265;
 Mon, 03 May 2021 02:24:27 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1619794331.git.fabioaiuto83@gmail.com> <20210503075201.GN1981@kadam>
 <20210503081717.GA8953@agape.jhs>
In-Reply-To: <20210503081717.GA8953@agape.jhs>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 3 May 2021 11:24:16 +0200
Message-ID: <CAMhs-H9zgiP+u0jg8M4uJ6QPCs-BZ0SKaGzp85DoqnS_KkcFuQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/43] staging: rtl8723bs: clean up driver from private
 debug facilities
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Mon, May 3, 2021 at 10:17 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>
> On Mon, May 03, 2021 at 10:52:01AM +0300, Dan Carpenter wrote:
> > Looks good.
> >
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > regards,
> > dan carpenter
> >
>
> thanks Dan,
>
> when a tag is offered this way, am I supposed to resend the patchset with
> the offered tag added on or it's just a tag which Greg is going to add when
> accept all in his tree?

Greg will take care of adding this tag when he adds all of these
patches to his tree.

>
> thank you in advance,
>
> fabio
>

Best regards,
    Sergio Paracuellos
