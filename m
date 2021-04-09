Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDB70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 11:59:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4574272wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1JxLGtNxnOp44Fk3GR4yu3/dSaD+2VjIuaHuj9l1KiQ=;
        b=nMGELfkFKUlyq1MbWUKQSzrWlQcNqbav3ngNWkPz7v/ypHRgI5TAgc71uyUfqA6GYq
         9t/E6YNdsgGllOqJl0WsUjFupq+dNbxdi67u5SrsmwTI3qaX2fgl6B8sgPfWF7kkR0vP
         +cCQrsq4QL3e1bl8kIgc5P4rXKQwMrxNM/Jwpe9E+w3X6slHXBi9UP17swan1UcA/8Je
         a9RCgH4JO8mVuQZctGq0Ft/ngtEfn9HLyUWrdp1OZiUSKRRR11gEKvfwKdCK6BaG96ZM
         5sM8IbS4bNUcMtya/q05yRK3Q9CeXkMa6Dm732oluQ0UtsLSDBZUgUykMoHp8imSWGRc
         sV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1JxLGtNxnOp44Fk3GR4yu3/dSaD+2VjIuaHuj9l1KiQ=;
        b=n3sKHVO0gWbPdHngCmP+jJP4r1UA8/dbQ9BtkzlVs5HGDGlZLsTqEHoekATc7Ffo1Z
         AfccAAU7h+r65OD2bVQsScM9Zf4N5sXvOJI9oG+BzvQeDgOwUstT4yhBAbihewwBw6yX
         5k8rpP+0YQ13OGXI8CDpgNXnF2vzW0IrfYs4KNHxEC56zW1eAxAlmZcgdbk99Vmh4paC
         a355enjd5XzFppG1yf95Na8Nxe4gOY2P7Zzpi4AB7vH+fCc4twAejQVO1hLIUYZy9nVL
         ZifsNv04Ppq+zj1LPWCv71AMTsZT7lLne8aeNTZuiZjiEl73fIso+rmDcMX1qOeBY+w9
         691g==
X-Gm-Message-State: AOAM5329UlchNujilUw/pU7GetSIOvcRcKeSErQyG5sMd8hRfLuR2M8m
	e2sahzKR7nIksi50pZ5s7dfzcSI1hn4njXMeTX4=
X-Google-Smtp-Source: ABdhPJw+h9YP0xI/t8HB8HQXIT3HtxhdzO19Cb0l3tmB5+0Y9WuDgFa5h1a3TR4Umpd2g2+C2cpqPS3XRZJ4xfEUxWo=
X-Received: by 2002:a7b:c003:: with SMTP id c3mr13360369wmb.59.1617969550800;
 Fri, 09 Apr 2021 04:59:10 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1617957240-53633-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617957240-53633-1-git-send-email-tiantao6@hisilicon.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Fri, 9 Apr 2021 07:58:59 -0400
Message-ID: <CAGngYiVfattJKO7npMHTagxNfzU-B=rP3FoZ89_yzy-c=Zw2RQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fieldbus: simplify devm_anybuss_host_common_probe
To: Tian Tao <tiantao6@hisilicon.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Tian, thank you for the contribution. See below.

On Fri, Apr 9, 2021 at 4:33 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/staging/fieldbus/anybuss/host.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
> index 549cb7d5..2924e68 100644
> --- a/drivers/staging/fieldbus/anybuss/host.c
> +++ b/drivers/staging/fieldbus/anybuss/host.c
> @@ -1406,7 +1406,7 @@ void anybuss_host_common_remove(struct anybuss_host *host)
>  }
>  EXPORT_SYMBOL_GPL(anybuss_host_common_remove);
>
> -static void host_release(struct device *dev, void *res)
> +static void host_release(void *res)
>  {
>         struct anybuss_host **dr = res;

You're expecting a double pointer as the argument here...

>
> @@ -1417,21 +1417,17 @@ struct anybuss_host * __must_check
>  devm_anybuss_host_common_probe(struct device *dev,
>                                const struct anybuss_ops *ops)
>  {
> -       struct anybuss_host **dr;
>         struct anybuss_host *host;
> -
> -       dr = devres_alloc(host_release, sizeof(struct anybuss_host *),
> -                         GFP_KERNEL);
> -       if (!dr)
> -               return ERR_PTR(-ENOMEM);
> +       int ret;
>
>         host = anybuss_host_common_probe(dev, ops);
> -       if (IS_ERR(host)) {
> -               devres_free(dr);
> +       if (IS_ERR(host))
>                 return host;
> -       }
> -       *dr = host;
> -       devres_add(dev, dr);
> +
> +       ret = devm_add_action_or_reset(dev, host_release, host);

... yet you pass in a single pointer here. Is that going to work?

> +       if (ret)
> +               return ERR_PTR(ret);
> +
>         return host;
>  }
>  EXPORT_SYMBOL_GPL(devm_anybuss_host_common_probe);
> --
> 2.7.4
>
