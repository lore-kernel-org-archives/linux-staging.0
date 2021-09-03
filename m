Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27C3FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 18:53:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso180653pjb.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cYg95UwxTL2wMWqBMmt8+HU/FFQUMY2wtY0M2szhJz8=;
        b=QIp/9/b95JTMk9GYZ/8RlI4mVoQv4y2yt6N+yut/ximLGMu+tuqgZ16WFcVWV1mqGq
         fepqe7v2A20HFYssg1nO6q3PyQblDX7qDazWYNC3Pc4VhRasd1EvBTpM67pwafkmKzDG
         8ZwaEw4euZAjKAjqzI5lRX4/sF1I7IIB4936jkCUQS49BrMluF7f8P0mevm9wlS7ku4e
         hqgcayKLbLvuVb/IOKLhAUOVhyk+g8yH4rXzxJUWxtaXS1b9YKwwWvnEEsSVj+yGWCeM
         /MQVfEbjm1zYGzx5w2DGXmIzOVBMQhysdwrnSbZKmhRZ5B1HpMAWs21lk0F51MSBhyYE
         Z3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cYg95UwxTL2wMWqBMmt8+HU/FFQUMY2wtY0M2szhJz8=;
        b=bOLRvK1td6zi4sH+MiqLCyDQ8jxBD19kP1dnEqwuzRslznt12v6oMGnkCGqmvfDkek
         oA4gqYYkUbOiFg8RkEjefuEKTuglxd5OlqsfWV3xJZLg9kTLWYHp67s6FwlmTpLF7rSl
         rSQVZL5r8yjH876yA2UgYE90KaxIcx4uUDqtKti3l2Cped9gV3syhElBYBVUE8Qe5jNs
         JqKaK40TeD/W+ViNiM4FMizsFafMnG7ot1cTd39QTGijDTXrKaGIn/OThsj2XZVf+iJ2
         kMbK5KzU2CXWmw5ATSW3PWeMJ3O09BUz2QD7u90knAYl9GbOjPAfPaJkUUA+iYsJ1+qq
         MV/g==
X-Gm-Message-State: AOAM532RyGaSPzIVb4r5b6HH0qfupK3ZAFAVNNmiaO+QoTEC/9qSJ7iJ
	U8BkLF4IhS+W9crQQJbkqGk4cxO5deYp+o5tRgvetQ==
X-Google-Smtp-Source: ABdhPJzaqbi+WTtOyW8aEzKZGLrWRFG0rYEWODEzLKf/vG09PU01udkGwV0zaahhozokMiR2kCRYO8U8/ekTQehdJDk=
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id
 p4-20020a1709026b84b02900eef9661911mr224187plk.69.1630695220952; Fri, 03 Sep
 2021 11:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YTJhwQstKPUYRwN+@user>
In-Reply-To: <YTJhwQstKPUYRwN+@user>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Fri, 3 Sep 2021 19:53:29 +0100
Message-ID: <CAA=Fs0mP7xqiS7+EX+J5MYH-AkEN_5SgtLrxAd669kXHG7Jk+A@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc
 and memcpy
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Sept 2021 at 18:56, Saurav Girepunje
<saurav.girepunje@gmail.com> wrote:
>
> Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 81d4255d1785..495fadd2b8c8 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
>         }
>
>         if (ielen) {
> -               buf = kzalloc(ielen, GFP_KERNEL);
> +               buf = kmemdup(pie, ielen, GFP_KERNEL);
>                 if (!buf) {
>                         ret =  -ENOMEM;
>                         goto exit;
>                 }
>
> -               memcpy(buf, pie, ielen);
> -
>                 /* dump */
>                 {
>                         int i;
> --
> 2.32.0
>

Dear Saurav,

Looks good, thanks:
Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
