Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65C7B;
	Fri, 28 Oct 2022 06:13:26 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id q127so4202725vsa.7;
        Thu, 27 Oct 2022 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svUKb/qGduMTdMpMANs9sftdQURYpjN7AKh6kz9DZ6I=;
        b=lAnaWCGYhih1u7TWtMjy+gL28ADi0aS/VKHL8wVCLiQ7cdRnxEF62JJIPDKQi3xLn3
         MwOolUGV100XU77+5strKd4TJu/wu1+mAZaRQ1qXZw/b0LgUA7YsISKIzI6n/HlTYvcV
         GmtR1l0SmVQSLcLZp6p61aiR3W0PQ1ORR3UwH+CmajrqdBblDmT4DhZ1wjnLYO1tVrl7
         A3FEGW54Pc1MmmOv1EAi93dTfpP0HVRS6RNL1G2UkOtullgBhWqCz05vuX9Vvz30Y4Vf
         g/vkB+zy3aF+QpnbAKxRaGBgO1bot8pant36vEOT69Iff63cTTxj9PrWRodK968buJvB
         Z9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svUKb/qGduMTdMpMANs9sftdQURYpjN7AKh6kz9DZ6I=;
        b=drbjlQh3t7DpNIe92pWYi7UhuBQB3htiRp80p/EpHVqh85Hat+No5v7yzwbnFOjbIP
         JOO2UPIxs4fFVK4ynFQqcyFweqiM30NGYwcx2UirjWdZN49KyG/gPlgGE+N8NAIk0945
         v35tAD+HnUsF4D/g+KqDEIwbjANw+bPImJoMrjotKKfR0wvRgiW6XBtS9UdU8BslJx7g
         11bBRDYfimM3+4Ft7nnKTR9Bjm59hkcyQHLIV1SBOdKGLADEhdEdCh5VURu3sp6vF3k6
         9zW7rJh/EAT7zRfKNOj6p49CIORnpWjSjPeTcbXUHSfit98I3FedlqXv/V7j6UjQIglO
         invA==
X-Gm-Message-State: ACrzQf12xv0cb9KORnXGq0/CCxakeO06BpSJjZbUXgOEXF38Y6tae/xe
	JURa+h4LFKQRyz1wAJFAbItvZ/w2hMOumgGM9xI=
X-Google-Smtp-Source: AMsMyM5yYz4YZOQ8J/3ry14yHAjgQh8eJL0ctUFcoxocbjaFkHKniRrnfwdUS5loiGVK0aNpDPUmkjB5xFd8BqyLBUs=
X-Received: by 2002:a67:c313:0:b0:3aa:3a91:690d with SMTP id
 r19-20020a67c313000000b003aa3a91690dmr8873394vsj.25.1666937605163; Thu, 27
 Oct 2022 23:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028051420.GA30073@rdm> <Y1tx8XjmR5QKV9lQ@kroah.com>
In-Reply-To: <Y1tx8XjmR5QKV9lQ@kroah.com>
From: jovial umwari <umwarijovial@gmail.com>
Date: Fri, 28 Oct 2022 09:13:14 +0300
Message-ID: <CAMk1CBOdgwnt3E7ByZMASv+O1WAmgKvsvMv5Gy9UNgg=kMBRJQ@mail.gmail.com>
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thank you
working on it now

Best Regards
Umwari Jovial

On Fri, 28 Oct 2022 at 09:07, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 28, 2022 at 08:14:20AM +0300, UMWARI JOVIAL wrote:
> > i used checkpatch.pl script to identify the above
> > Repetition of the same word in one sentence same line
>
> Please read the documentation for how to write a good changelog text.
> Hint, "i" is not something you see in a text, right?
>
> Also, why do you have WARNING in the subject line and not the driver
> name?  Again, read the documentation please.
>
> >
> > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> > ---
> >  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> > index 090345bad223..30a0276b8b58 100644
> > --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> > +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> > @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
> >   * If we turn on USE_RXTHREAD, then, no need for critical section.
> >   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
> >   *
> > - * Must be very very cautious...
> > + * Must be very cautious...
>
> The original text here is correct.
>
> thanks,
>
> greg k-h
