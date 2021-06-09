Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842E2FB2
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 18:17:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id h12so1685811plf.4
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zmeGfil6Un6NA08A7Kw0kuzyxjRcQgMr5s8V6JVF6Y=;
        b=sOVmCvqnC1sfTqDYfpxFzbHIdTv0JMyafG8+2piksXhgw4p9vpaKIqlVtHFAzI/sVO
         rx2eOpU2zGl88pUyD3eE54q9C45OSTxEUWvn4kKIHogsMJ01uOkdad022RC+NQqG0imJ
         iwMc3/Y/K4SPUFCyV8pteuRa3kuG//oa+ccNWANO7+PxjEzv1ujprl2tS6nxm8YMI02U
         2jdyme2Wz66LLgGfP0E7gp7hL4OvFZX0YGtpN9bFBJNgBJzBj3KLLAh+jU94nFMDQak2
         C9DLzBkeawhHQmBSdGae0JBy3hWdJiXslqeC6QN4nQFkxkSovVrVcvvcB7TsREvUorDg
         xH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zmeGfil6Un6NA08A7Kw0kuzyxjRcQgMr5s8V6JVF6Y=;
        b=GvQ7s7SwjRVfNubww3eLC/ke2E8/PHnACIW+WCv1CBdDXGKlOzChfKKPhBLIL9P7jZ
         TWgp0EGEP471Eutbx6LRpmjeEjNxYpYFo4x5YVqycqpxm3DFqycoZTL2QVPSXb6o7Tfg
         N6m6vXwgwJ0pt1sjJiBQlSG7EZFnojL6bZqEgvMG9Pk+n5vuUZrm9ERr7znefk9jfhdU
         gT8NIBxAjX4IsYXrUBK9duZpx1BQL+wvIl5p2erL/GLW6M5apLeMFmbcZvm20xJ1SJ/k
         Ss+ezb+TtQP6nN9zadY/vnuYhAe2BUBwCVGdRU6pseNM83/utfjKGPcoyMDoc1C1gngy
         K3RA==
X-Gm-Message-State: AOAM5334wu95CBEoz2qR7GCgIYUarZMGaDl0l2yuMyEKPPuG625iJm6l
	hPdJKP9jk4JVBlYmN3FLzoDBuaquCivZH2qsarc=
X-Google-Smtp-Source: ABdhPJzc6XIClEMrBoSl1eFW8eFnqWGroG1ShEj4jKWR0ThgjpUA2xiq3mraBMfFQ10+mwM6GV4M4Pza3hxNUmSOssQ=
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr12072536pjw.129.1623262659893;
 Wed, 09 Jun 2021 11:17:39 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210609072409.1357327-1-libaokun1@huawei.com>
In-Reply-To: <20210609072409.1357327-1-libaokun1@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Jun 2021 21:17:23 +0300
Message-ID: <CAHp75VesvRMGY25WP-ZQaqWE-kyyp25GsvM8h=yMfO5U6r1gDA@mail.gmail.com>
Subject: Re: [PATCH -next v2] media: staging: atomisp: use list_move_tail
 instead of list_del/list_add_tail in atomisp_compat_css20.c
To: Baokun Li <libaokun1@huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kaixu Xia <kaixuxia@tencent.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, 
	YueHaibing <yuehaibing@huawei.com>, yangjihong1@huawei.com, yukuai3@huawei.com, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 9, 2021 at 4:32 PM Baokun Li <libaokun1@huawei.com> wrote:
>
> Using list_move_tail() instead of list_del() + list_add_tail() in atomisp_compat_css20.c.

Have you considered using list_splice() instead of entire while-loops?
Or something similar from list.h...

>         while (!list_empty(&asd->s3a_stats_in_css)) {
>                 s3a_buf = list_entry(asd->s3a_stats_in_css.next,
>                                      struct atomisp_s3a_buf, list);
> -               list_del(&s3a_buf->list);
> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>         }
>         while (!list_empty(&asd->s3a_stats_ready)) {
>                 s3a_buf = list_entry(asd->s3a_stats_ready.next,
>                                      struct atomisp_s3a_buf, list);
> -               list_del(&s3a_buf->list);
> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>         }

>         while (!list_empty(&asd->dis_stats_in_css)) {
>                 dis_buf = list_entry(asd->dis_stats_in_css.next,
>                                      struct atomisp_dis_buf, list);
> -               list_del(&dis_buf->list);
> -               list_add_tail(&dis_buf->list, &asd->dis_stats);
> +               list_move_tail(&dis_buf->list, &asd->dis_stats);
>         }

>                 while (!list_empty(&asd->metadata_in_css[i])) {
>                         md_buf = list_entry(asd->metadata_in_css[i].next,
>                                             struct atomisp_metadata_buf, list);
> -                       list_del(&md_buf->list);
> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>                 }
>                 while (!list_empty(&asd->metadata_ready[i])) {
>                         md_buf = list_entry(asd->metadata_ready[i].next,
>                                             struct atomisp_metadata_buf, list);
> -                       list_del(&md_buf->list);
> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>                 }

-- 
With Best Regards,
Andy Shevchenko
