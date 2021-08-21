Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6708272
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:27:14 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso11020171pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HLWCn02MgCPOMWc3SzwkfWYw42/4p4VBHBuNhVkmEPk=;
        b=Vk3YbIKE0MG4qacLCkB6pkFHgrD1C1Lid8H5AchZ12QaAu3YGhYnvrnMYeupTk6V0Q
         LfO7CEAdRHYtDWfel5YHGFmTwaGoBoP24sTvy6q/qRplgTjIU8R/mbIeZuDDgCV0PhQy
         wPgRrDcqhrC7BUeuGzectdbvY9p+EvBneFbxi4muvSPY6SwlT2RWZfvB979FXC5JyZ9L
         9Y8VTQuh+56wWWpfSTu/1juiJJgc1CE1Au9adDE/XAYO6x4e6NBZ4+Apqi2vmbHzJu6S
         OIGbW2Sh1OlpW2KsvWua8WuwVysVFcq9nkSwU1IuJ2W97SD27KvZ0FdWMOSY6A7IqZtL
         ibSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HLWCn02MgCPOMWc3SzwkfWYw42/4p4VBHBuNhVkmEPk=;
        b=WkgNwfCTPvViioLYeBei/g7mL1QyJiUmuaUfXJh/U/uPWFNCs2Vqt13X7F0AjJ5OOd
         wegAX2HGKssJCcOexdqPUml4dGQyqNqUmDecpiIyJBPztozXFKDXlE38zppfpbEqHTqq
         Qa4eHniF0E4kN341xN0qI8F7A1f8rUChM9veYhMOrKAtCHhVEkY4exoGrXn4fRcPy8w+
         y0ot+ts3XsnWygztFdIDTzX5OoF2FVAWStb5cbQvQSudP6+BxJdauKARK/6LKoUHJ0A4
         Qp3up722i/1sMu7/+3J4tQPHURKYkwzccXvfeNGHzf2O+1n7PVXUuLLDKRP2BXHlj7ZL
         BEFQ==
X-Gm-Message-State: AOAM531sEJ4r9UEzjoIzCGsQprrEb/3LOchG7AL0ZziMe8Q2RjcCoe5J
	skhsEhyx/g4X6Vp+Lr1Q8u3Uar7gONnzcQCSCMsw2g==
X-Google-Smtp-Source: ABdhPJyTTIoTWdj9P9z98L4sZipGb1Y2PcrZtOZxfVNO3x4w4cC9prKMVZlGLvNS8E9xh8EwcIqUIt3KLwCfrRIccOM=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr10902605pjq.217.1629566833962;
 Sat, 21 Aug 2021 10:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-1-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:27:03 +0100
Message-ID: <CAA=Fs0mU0bkXPY35fkuudoWfAps2jp1qc3ga53LXgg6d+0bVSg@mail.gmail.com>
Subject: Re: [PATCH 01/10] staging: r8188eu: remove unnecessary cast
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> name is a const char * by default. This type should be ok for r8188eu.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index e002070f7fba..72556ac10d7d 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -61,7 +61,7 @@ struct rtw_usb_drv {
>  };
>
>  static struct rtw_usb_drv rtl8188e_usb_drv = {
> -       .usbdrv.name = (char *)"r8188eu",
> +       .usbdrv.name = "r8188eu",
>         .usbdrv.probe = rtw_drv_init,
>         .usbdrv.disconnect = rtw_dev_remove,
>         .usbdrv.id_table = rtw_usb_id_tbl,
> --
> 2.20.1
>

Looks ok to me, thanks. I would consider using a cover letter style
[PATCH 00/10] style approach as an addition in future though, just my
personal opinion.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
