Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09033C8
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 17:39:13 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id t9so2163820qkm.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 09:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9g1BEZvZrqodmFDOISLKzRjoO7gt900zQziLNPYxxig=;
        b=iW5x6FyZ4kRruJuSjFDnWk3ekJ4QnBXu61QLi+LYYLgr3C/dTiEk1S/AjpKOH/cNo+
         iGXdACuzne7GknNIXvnfUAO6OT1Ssy+qoMhMwFGiQeIj5HHiGGUxPnArgkAPK8ceZQdm
         6jX5Hl7BNZTO18U4LQqpXHH7O8GvYSDlGa4bX2Jv1gKj/YQaFfcrh7UO47ldtINtb8Y4
         OvHCH5VrEMi+vsaImGlbd6YJFKqQsjoKEch9yCKE/7pGEfvTg5NKhprOUUTroDH1Rsuu
         W+xiHucnnbQJU9cwi36Q7uSjt9twwRWoa+XUKrKzPsskwpu/fcJK3P4SB3S1+fzY53VS
         zNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g1BEZvZrqodmFDOISLKzRjoO7gt900zQziLNPYxxig=;
        b=EX6T8CpfkYtSCWA2vMiFssmuCHQth8iKneMGZ+A2Mov5ArDp/2ub8TF3ZPjd8RV8OL
         UjTRS0kLejXO+PcI6Y7ueFjzXu49MNyhnhVWrhpg7LBqhXzizNXCXZDpYoH8DYZ307WC
         T8+OmyJLKZYen6+QEVBCvEsdAJGxmiOCbhFTGSKZzGrH5UbMiIgHB2CpeyC+3TQF6+Sl
         63dyVpQfd7nX2Y1Fz2zigyDQiGPmiKLY8A5Sfvwra3Kl+IZnEoExS3qrHQqlFkXH2kwi
         UewcA8JySYx+RkfyyiAaX21O74GE9sRWSeMB3D5s/yam9oWSVkOXrM/Qo1eOMrSVsMK2
         LPcQ==
X-Gm-Message-State: AFqh2kocam1veH4qwTsXQouM232x1Y3a3L6JAFbRUBzf1V2lKCX/NjEs
	50HgHvX6Vlacutg/jXN8tFy0Mx9xKkw8JpYsR4g=
X-Google-Smtp-Source: AMrXdXuh+LNPNSifVpuzE1cBEKvlIsgIpCH851pokA3KW+zv3u8Bf8TXGoBoW+nGOBhzndBUlwTJv+42etN/8riX1U4=
X-Received: by 2002:a05:620a:1139:b0:705:b8ad:5b36 with SMTP id
 p25-20020a05620a113900b00705b8ad5b36mr862323qkk.734.1674236352582; Fri, 20
 Jan 2023 09:39:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y8lZreSphK6DIkJg@kadam> <20230120171408.16099-1-bpappas@pappasbrent.com>
In-Reply-To: <20230120171408.16099-1-bpappas@pappasbrent.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Jan 2023 19:38:36 +0200
Message-ID: <CAHp75VfhWV7ArGZ_S-ik7UxvvOocKWTtAHhKGC4tSV+Y8dgb9w@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: pci: sh_css: Inline single invocation
 of macro STATS_ENABLED()
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: error27@gmail.com, andy@kernel.org, colin.i.king@gmail.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 20, 2023 at 7:14 PM Brent Pappas <bpappas@pappasbrent.com> wrote:
>
> Inline the single invocation of the macro STATS_ENABLED().
> The macro abstraction is not necessary because the logic behind it is only
> used once.

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
> Changelog:
> V1 -> V2: Inline macro instead of replacing it with a function.
>
> V2 -> V3: Remove unnecessary check that stage is non-null.
>
>  drivers/staging/media/atomisp/pci/sh_css.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 726cb7aa4ecd..93789500416f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -97,9 +97,6 @@
>   */
>  #define JPEG_BYTES (16 * 1024 * 1024)
>
> -#define STATS_ENABLED(stage) (stage && stage->binary && stage->binary->info && \
> -       (stage->binary->info->sp.enable.s3a || stage->binary->info->sp.enable.dis))
> -
>  struct sh_css my_css;
>
>  int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
> @@ -3743,7 +3740,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
>                          * The SP will read the params after it got
>                          * empty 3a and dis
>                          */
> -                       if (STATS_ENABLED(stage)) {
> +                       if (stage->binary && stage->binary->info &&
> +                           (stage->binary->info->sp.enable.s3a ||
> +                            stage->binary->info->sp.enable.dis)) {
>                                 /* there is a stage that needs it */
>                                 return_err = ia_css_bufq_enqueue_buffer(thread_id,
>                                                                         queue_id,
> --
> 2.34.1
>


-- 
With Best Regards,
Andy Shevchenko
