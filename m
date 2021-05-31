Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41071
	for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 01:48:43 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso9640054otl.13
        for <linux-staging@lists.linux.dev>; Sun, 30 May 2021 18:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o9uHZUYuo+yV5/DqSfe9QUFOUckyCZOcmcmbsp3ZHvs=;
        b=iQyrLyU6d+GL0TV5DxOk5BD5wFRKanmvccuXNUBmeU8Id/MWAtIYzWmhoI7eDB7yw5
         NUGnox704j/V5aswtLjS+6ZLp/qAcK9lfFea2bnNRAQKTnZXUpxmdx0FUVM1yjPu/EeS
         4RMXse3J10yl+z13FEoVVC+kvyJn30at/kNSW4B/Gk+DlnVpHD02Uwp7vgmzbLHrmOEZ
         KRmkqMExcOH1UOmFzLwwquSxQ6CLJlAjGiGIrS/FlSddUTt6DkCV6rsaGWJ3pZCL+MF3
         IHtZIJoWwz+mSiYYNhg835nO6pY00sRtn3InJviWGHH8m5MlmaZQcfpk9Nkyoxqm4s3g
         HyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o9uHZUYuo+yV5/DqSfe9QUFOUckyCZOcmcmbsp3ZHvs=;
        b=cWzPuKJkeQlb7spfe2nDAPofR9wmc4lBrhMnuiLEo/Fc58ffIwxw5/YYiQOYFjwSud
         O/1bU9E9vOGgOXRu7PxTCrc0OSd+ewqH74iZPPDIe5ptqEvKsl7oR8CBe86z8xLV+kai
         HwzgIsB9IRQ2SVfsakmChBznjb4+83FbkHzXP+pzPhiSJFuLD68GePG0s1iyyq9RMxhA
         SVusqDWFc5W77LBxuYTGLz5qJBVX76kM8B7x0Sm43c1o9G1APz38g8td5WOJeAluAw57
         MrRHlH20pEwvDuujgkoXa1LpumdB9bd2P8Um1q0LnBvcleFy0yLJVdW9lJ4tylE/WZAM
         zDUw==
X-Gm-Message-State: AOAM533JdBVviPGmR3bNe0rdsOFv4qvevizWxVru8ztUYbZjCAOR8w8v
	LlTAd5pRfJDJgLNciysUsZ2CXVCvMGIlBqOk4HA=
X-Google-Smtp-Source: ABdhPJyl8cG9i1nvWMuvpFnAKKYEmtdZZPT6V+TyQqwXeIvGUcYHhT2ZPwQnB2p2U7NNtPQ3JFSi4f5q1z446ZQqiBs=
X-Received: by 2002:a9d:7a9:: with SMTP id 38mr6428408oto.362.1622425722686;
 Sun, 30 May 2021 18:48:42 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1621786036.git.lucas.p.stankus@gmail.com> <20210526180717.23d13296@jic23-huawei>
In-Reply-To: <20210526180717.23d13296@jic23-huawei>
From: Lucas Stankus <lucas.p.stankus@gmail.com>
Date: Sun, 30 May 2021 22:48:06 -0300
Message-ID: <CACKVXZA5jLLUugreowQJYndgN8+zG8T99ubkpu6utVC4GwADzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] staging: iio: cdc: ad7746: initial effort to move
 out of staging
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio <linux-iio@vger.kernel.org>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 2:05 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 23 May 2021 14:11:35 -0300
> Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> > Tidy up driver code by removing vague comments, simplifying probe
> > return, and extracting capdac register write to a separate function.
> >
> > These small patches are a starting point for improving the ad7746 driver,
> > hopefully to a point where it's possible to get it out of staging. I'm
> > looking up to feedback on what could be improved to accomplish that.
> Usually the easiest way to get such feedback is to propose moving it out of
> staging, (with move detection turned off in git format-patch).
> Then we'll review it in a similar fashion to a new driver.

Oh okay, sorry for the unconventional patch set then and thanks for
giving me the heads up about the format-patch flag, I'd probably get
that wrong if you didn't =/

>
> Starting point though for any review is ABI.  Looks like there is some
> custom stuff in here which either needs to go away or be properly
> proposed and documented.

Nice, I'll look into that.


>
> This series applied to the togreg branch of iio.git - initially
> pushed out as testing to let 0-day poke at it.
>
> Thanks,
>
> Jonathan
>
> >
> > changelog v1 -> v2:
> > - Dropped num_channels fixup patch (applied from previous series).
> > - Split general code style patch into several atomic ones.
> > - New patch to catch capdac write boilerplate into a single function.
> >
> > Lucas Stankus (3):
> >   staging: iio: cdc: ad7746: remove ordinary comments
> >   staging: iio: cdc: ad7746: clean up probe return
> >   staging: iio: cdc: ad7746: extract capac setup to own function
> >
> >  drivers/staging/iio/cdc/ad7746.c | 58 +++++++++++++-------------------
> >  1 file changed, 23 insertions(+), 35 deletions(-)
> >
>
