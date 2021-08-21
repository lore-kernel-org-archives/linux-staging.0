Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA872
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:47:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id g14so11546173pfm.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weI7dEBVDoKQ1ZWV63hBImrE6uK/njMI0Jn4Use0aPk=;
        b=lJ9TbWcy2L0UP7e4OsNstGjZ+H124xT39Rs/HnWh8Bxcm3mEQDfdLn0CFdY2JwVGLA
         LHkIonRmmdXTUdyamI6V2MrEm4T4spCXQfDt8liYl+xDy4KIrAdEgvzVTQV8q0xpoANa
         b0+y+LuLyXp/7CXFE1zFNhIPue9ILwrZ87SXSZd/yO9JtOiFiggHwr8csRmgK9zO2XoI
         +Uk3+JjvZtmui2Yv5El1j/g6yJlSfa8vBkgyvyUmlWIIx1TOhYdD+Y1kvmedCgsS7Xwg
         rjLtS1TawSz1sE3M1xD8PX7ibMcCm/syaiMs4JxizvtwgDPihFMlJKuSW414/XWn+66p
         9ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weI7dEBVDoKQ1ZWV63hBImrE6uK/njMI0Jn4Use0aPk=;
        b=cq5t/1qlky/Cwq0UlZPR+ISoOsXgOaEwqcdSwF+LGDPu99Absm6YL00jxJWOM384qy
         F7GidGdCQqmHMGVMy1H0Ffo94eMYp3oPLZSvqq9CcYnS+gmJPoBlw9aMyvpyfr9z9+WH
         i5Eqn5AZybGNzLoqy/fRy3/HbJc217r5Ko/Q7xxC91B5/yphORE3lkIU1e+NuzuZLIV8
         H7PKp8ud/vRmbSIFHtq+TxUqbed1KqE7n8ySN41QItJvjrcoCTi2UBEu8TY3csJ0iHDt
         EbOxfPZhvGk8790xvlfHbjshrPR1jrcaAlHblHXKiY+Erxi/uw58EEtkllG8WfKOb0Cd
         GGJg==
X-Gm-Message-State: AOAM533chdAD9OllVW+WMLSF1KKRHS35Ty57/5ijd1zvqED1HCLP+58n
	q/bGZjud5aMr7aQhEWbWTt4LNeLz9Eu2A/+TEX4iqA==
X-Google-Smtp-Source: ABdhPJykbxCkleRKKJlkecwiPdRxh2fNo6umihTj294KDTorcNY1IrVQQCcmJdlXlHhrVqcnn+5jG0NFlH5Im/5uyMQ=
X-Received: by 2002:a63:d910:: with SMTP id r16mr24184591pgg.318.1629568059462;
 Sat, 21 Aug 2021 10:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-10-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-10-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:47:28 +0100
Message-ID: <CAA=Fs0mm3=nNkBGbbodSZFcz7hT2NuV6Z_c6a+9qFMr8Vjg+_A@mail.gmail.com>
Subject: Re: [PATCH 10/10] staging: r8188eu: set pipe only once
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:50, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Set the pipe for reading or writing in usbctrl_vendorreq only once.
> There's no need to set it again for every retry.
>
> This patch is an adaptation of commit 889ed8b5e374 ("staging: rtl8188eu:
> set pipe only once") for the new r8188eu driver.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 5408383ccec3..5a55ee38d7b8 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -40,15 +40,16 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>                 goto release_mutex;
>         }
>
> -       while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> -               memset(pIo_buf, 0, len);
> +       if (requesttype == REALTEK_USB_VENQT_READ)
> +               pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> +       else
> +               pipe = usb_sndctrlpipe(udev, 0);/* write_out */
>
> -               if (requesttype == REALTEK_USB_VENQT_READ) {
> -                       pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> -               } else {
> -                       pipe = usb_sndctrlpipe(udev, 0);/* write_out */
> +       while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> +               if (requesttype == REALTEK_USB_VENQT_READ)
> +                       memset(pIo_buf, 0, len);
> +               else
>                         memcpy(pIo_buf, pdata, len);
> -               }
>
>                 status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>                                          requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
