Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E617C4;
	Thu, 20 Oct 2022 06:08:31 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o2so12192019qkk.10;
        Wed, 19 Oct 2022 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RG1YBqePLHwSbzu3AJsQIoB61hk/GXZV1mOupc8Gyo=;
        b=RtPHpXEsb4v2QI31P+EyeZd3bAC/JgU/h4qX7QnK3qPc6YJTnnNnXnL8ZTTjkmSl3c
         SkpS9NcPggugkrtCiFYiKNzYfFF+7PEht/xidMPrJuE3/AAnBOi+XhUZrvYwrcyeBlUO
         hrtIEu697rFuICn0W5YMtlul/o9mW1Vzcjihd776oWmI3KuEMpkpTL11DJIo0nCtiQiz
         1x6X3/8vAYv5dbl2eSaU/gsU/O47AgXOKWk3u6CIJhQAhhtHgVhXtQ8otJhxFhV/KTAq
         6IKBAHfPzLwE8F1c8jSGg9Kzh2hYa9V6sjcUu72IUARu+DyVlbulmc0zE9+Z7SMjniON
         TB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RG1YBqePLHwSbzu3AJsQIoB61hk/GXZV1mOupc8Gyo=;
        b=NJhVqhKJVDliSbc/ZU/8xUk47H0dDtjm8wF7NmIak3QvO1hlVlixaVPU18XY85KGIB
         sDqWz2YIIp/Z2i10zWGq3kr2oCH28UhPppemd1xO//xJMV5CyHt93wQsx/1rohR+OdYL
         mJglYHRSycETeu8sDf4kwWyMqbacMwCbuAHLHk1L4U8CqJVWD/KwryoP9g6hLhKORafu
         Ny2nRCMX6C2FZt1JHRKQIwc3rMWQPeir4IOhjqn+AwrRPTnsR8TMHLCMN4M+MqqerHuG
         UfIGgZViHz+Dkm8FaFehw0AYZ6Ab5HaQPyQvr8PclXfi0GNenfIQ/9NAg4nIe47r4FoQ
         txSQ==
X-Gm-Message-State: ACrzQf19Csnz28YF6BOxEjt7SpRuM+qnjIHv/W5xahpLo4a7Podh6cSM
	KDK+yQ+zIh0BXx9c1mMOfqSGX6dW1ImvW07F2sQ=
X-Google-Smtp-Source: AMsMyM5Yi9+CPGGouicLvcag7d3/xnhOdwjxMwQJ5udvnJzALJg/b2pIwTc1hUsyMAxG1cSIlCgRoKNHfaVPnBpR2CU=
X-Received: by 2002:a05:620a:22c3:b0:6ec:53bb:d296 with SMTP id
 o3-20020a05620a22c300b006ec53bbd296mr8095266qki.158.1666246110878; Wed, 19
 Oct 2022 23:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y06yiBaluz6X0C4G@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <c3c211c1c99cd19f86fb801576c55b2ae2216c6f.camel@perches.com>
In-Reply-To: <c3c211c1c99cd19f86fb801576c55b2ae2216c6f.camel@perches.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 07:08:18 +0100
Message-ID: <CAHJEyKXnSdgzGVaFX6ayU3DusETOLZRcpKJJ9ZO_76ofbBTacA@mail.gmail.com>
Subject: Re: [PATCH] staging: rts5208: Replace instances of udelay by usleep_range
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 5:40 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2022-10-18 at 14:04 +0000, Tanjuate Brunostar wrote:
> > Replace the use of udelay by usleep_range as suggested by checkpatch:
> >
> > CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> > +               udelay(30);
> []
> > diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
> []
> > @@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
> >                       return STATUS_FAIL;
> >               }
> >
> > -             udelay(30);
> > +             usleep_range(30, 30);
>
> >This isn't useful.  Please read the Documentation/timers.

Yes I read the documentation and realized the changes were not necessary
