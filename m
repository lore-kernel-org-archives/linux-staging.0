Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8583FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 21:20:44 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k24so17827445pgh.8
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzvvjN55G6aH7L+WF3w6Ape9hLyYF6OiJZ3R0SJXV4M=;
        b=HIGlLVOuF6Uc6lqaWgoCbOA+4PANea69PmWibk9pQ90E18OQtQ9NjdVtg4gr9BhRDl
         Y8iGXjNXoBrM+ovH3DlRyzMTJf8WaBrLScu3e9bX0GJ/emLGpg1i/CliT2AWGLNrAo/2
         Bj70SLb9mf50wF+wDyUHSHg8bUa+lWP4fJU3VgjjlWaYor453PplbCRkwIQFqbZCYgjt
         YZ/Urtp/5dJ6vSl6sHYe56p7TVxmPJYTd1cJ0jSIem6JxoA1wkXvJzfqrhbbRpRXNxeA
         vvq+CLtmnbhVXNl+UGRLrxYF3teghLQvhfrui4OMaZ74+DoIWS81UW2Spi92T7uCr473
         kaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzvvjN55G6aH7L+WF3w6Ape9hLyYF6OiJZ3R0SJXV4M=;
        b=tfzNg3dxxxB5qu1dUsSZ6dHRkORpEQOs/3rJHamnXXQfKyi0tXjNHVyTWNfk8nJxXV
         DGtgOREYm+aWPKyyURObuH8wxZgs9cxBgHx3+igupBeqWkMt52I40r4EYfO/mfQGQ9ff
         NvlLDOpthLnE4N6cAakqjnoQPkbU3o4kAGjPD8E5ChviJA2rfL8fOPuGkyY7kPTBM7Is
         ZsznGtf5ZZ07gkZLR6h2Cir+aBKMVtPzNDLn8zgb2x69MVJ63JLGK5JB01IvEyzjex20
         wu1L/csFRHBqqxN0Zed89NsYM8f43Cpc31h/bgvEZZZVkKj17XJL1NeSjm6WzWYYNgbm
         htZA==
X-Gm-Message-State: AOAM530dhyQY6mjHSPB190y73bmp4vvHwUnml9uYC3TZS4fD8of5dgRr
	ckBYV+AER65HWnFkI7yN17z5i4TwSYq7MGSVxsiLzhRirgtxYgJG
X-Google-Smtp-Source: ABdhPJxQV6KlBuY4Uu2+VpUA/lkXnBmb+TaFx3kE0sHNiLkcqjNr3ZG8Z+9MF38Cs+v83qMS731lraUA1+H+OC3X4zk=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr35907806pff.71.1629753643794; Mon, 23
 Aug 2021 14:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823184059.19742-1-paskripkin@gmail.com>
In-Reply-To: <20210823184059.19742-1-paskripkin@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 22:20:32 +0100
Message-ID: <CAA=Fs0mW_4aVNYuLkZMS9ov0CPNKfPB7C=FS2z67Ui+hEvtaRA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 19:41, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> rtw_deinit_intf_priv() always return success, so there is no need in
> return value
>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index e002070f7fba..37694aa96d13 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
>         return rst;
>  }
>
> -static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
> +static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
>  {
> -       u8 rst = _SUCCESS;
> -
>         kfree(dvobj->usb_alloc_vendor_req_buf);
>         _rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
> -       return rst;
>  }
>
>  static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
> --
> 2.32.0
>

Dear Pavel,

Looks good - going to test your RFC series now btw.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
