Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6170
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 09:51:06 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id z16so1046152pga.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2CrD7zytwdxUdd+RrcJ2fDn/wxf5jDuY/dOIB395dY=;
        b=HmXQvdnhzVc2Jn7za5jIyK8J+1N/B42mbO0WjVyMtD/JrfAz7tGWMtU92wqETfhzAh
         uIa4Ob+LfTdH8qEiOq6zlcGw4C/+5ZuUel8aUIPjuBFDRtIO1auO1hdILDA3TeVwt1pc
         4PgK//U+jJua7fOWEq/WXjtAadT1gEux2XbNE953DqlpWXWmrD0rdr1iKB+g78uhvvuy
         M3pdxmb9EY48Ia+CfKHBxBi16Tu/A9HUgikR3SYIJID84Q/ucuDhUCiM8t7M3hNVJkMs
         UrIB2MBA8LjLaFMaLik1Gm8ZrU44cSPfnDqmikSRSVFdyLq4qUBQBBap87OIcrLsmVnb
         Lbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2CrD7zytwdxUdd+RrcJ2fDn/wxf5jDuY/dOIB395dY=;
        b=cDsb2ZoQbQFs3SWfRFGgxhFF0lGUGJE62w+dGfqkqW6YxrzJykbFupkeTqMYMFaKtj
         g4BKZqu8Sfdx2gMyj2VlJp0+kC2ktO+fFYrkhBFG3tPJG5NLB5MBf+NTPKceNh+PX7ry
         wtSZPsQPTd5F3u8zdkApyFDRsAipvcVtZlJ3kBm5inhA6U+D1Ult7N3c2tG/wSpplc62
         iTU+YgW1wOQTZpXk0XipWJTLc7qbVZI1sPR8QhrJP46ASHKw1XNYqbR3b2HgOiNFykpJ
         s2knJ6bO3GyMpK7XYEKEcy9LhY2xY4t98Cjyuosi1nQaZ7k5uHVDlSk+AeUmcllcuGz3
         eBdA==
X-Gm-Message-State: AOAM531N18HTqcHQw+8IQ28NdCjgqdINIY+Hx6+9/xz6KwTgTAH9jZ8c
	L/zvYxOLF9ZxXMLsW4VQR3C2oXGX220pdz3b4Zw=
X-Google-Smtp-Source: ABdhPJySmkGXyA4hCpShj73VGaOhDOQlhk1pEuV/dP4z7YxYZcl9vRJW/mfimWqrToOUcrQH3ktvU0HWdiKR5wS4Rrg=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr7331898pgi.4.1617875465880;
 Thu, 08 Apr 2021 02:51:05 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210408081850.24278-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20210408081850.24278-1-dinghao.liu@zju.edu.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 Apr 2021 12:50:49 +0300
Message-ID: <CAHp75VftjKTDJj+8m1HajMfnbLCdZ8UCNxU9wj4Pio0+FK=O4g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Fix runtime PM imbalance in atomisp_pci_probe
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 11:19 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When hmm_pool_register() fails, a pairing PM usage counter
> increment is needed to keep the counter balanced. It's the
> same for the following error paths.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 0295e2e32d79..02f774ed80c8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1815,6 +1815,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>         hmm_cleanup();
>         hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
>  hmm_pool_fail:
> +       pm_runtime_get_noresume(&pdev->dev);
>         destroy_workqueue(isp->wdt_work_queue);
>  wdt_work_queue_fail:
>         atomisp_acc_cleanup(isp);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
