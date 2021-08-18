Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CD72
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 20:34:34 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id o2so3533461pgr.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eHAShe2ZZZIC3ikmSrmgq0PWvhk6AlENUGfgwID98ag=;
        b=B1TY3A4EquqGKmOxkNxqpEF6Yau2sOmo2aGYv7IXhSz9vWWX1FzxEMc8L+MpzGVIS+
         arpPiDciXMIMoR0edg6Xht1sbtNOQRgOdrOcYzXR6Fu28ogqvVG9cVvhH1OylS0FufmZ
         DgUmmP6PplJKlLhVF7dKriY4e7APK5s5DImrLQff+BIr6BangBrCfnXnk/zrTMO9PH03
         xdp92qeQqOtMy302qd2HGJ57VWaNXG/V0n7bdzjnHISCm8z210HUqcF+en8uzF9WC97X
         cWvyI9VpCQrgeIn5AdxsOKIFBN7Bo2yCuxFNNDNcIBcQkob3z/POYo2CKV6iX42i4VpY
         W3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eHAShe2ZZZIC3ikmSrmgq0PWvhk6AlENUGfgwID98ag=;
        b=d3+FH1JgA1Syj1obuEplKrzqkRTV3BeHaaAEzfSVeGFMwah+4ogoHNV1Vrd7TLrBxE
         RHlws8nDGVm0kbX0PlCrdnj9ibN+nlMBo3PjQ+H/9HLsig0U+qIycmf7S0iPHVvTSxSL
         OP3I1S257rMpi/xbny9TjNOI+C93F7HxyO/1uKkHvmlRw8hvEF+s/rQ9rml7m0M+vV0u
         AxcTR4wwhoUL3YqEkN1Y+G5ueYeog3NLB+Y28gB4UoQ857sac615sXmWCVoARJ2jY+hD
         JczbiMaI3TgvELbezjbOqnR234cUGPqQVSr3S6zPKsQ4ht5RARdayXVNlPNyliz+efho
         DD5A==
X-Gm-Message-State: AOAM530C3VDixCCIoGcANDdZIuXXCg/xIgmpRL3c6CTgQwEBEZZM8CW1
	HNqDw/bM+DkTmTzWRFqX1OOMG726JNTvKpDJIemcKA==
X-Google-Smtp-Source: ABdhPJyPILcJZiHXsIn184+numDWK81weiNXSDGmxRPp46df1Rw3UDh5ZF1UoM5GRC/X8NC+XYLgfaTWnOcmBa9+8sI=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr10665794pgo.208.1629318874433;
 Wed, 18 Aug 2021 13:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818200041.10870-1-martin@kaiser.cx> <20210818200041.10870-2-martin@kaiser.cx>
In-Reply-To: <20210818200041.10870-2-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Wed, 18 Aug 2021 21:34:23 +0100
Message-ID: <CAA=Fs0k5b1XzUJbHX=W9AZzaG+bm9K9rLshwRzcMRS=zE0=5rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: ctrl vendor req index is not used
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Aug 2021 at 21:01, Martin Kaiser <martin@kaiser.cx> wrote:
>
> The index for r8188eu's vendor-specific control requests is not used.
> Remove the index parameter from usbctrl_vendorreq and pass index 0 to
> usb_control_msg.
>
> This patch is an adaptation of commit 3d0be94f62fd ("staging: rtl8188eu:
> ctrl vendor req index is not used") for the new r8188eu driver.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 33 +++++++--------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 2583e3a941fd..953fa05dc30c 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -10,7 +10,7 @@
>  #include "../include/recv_osdep.h"
>  #include "../include/rtl8188e_hal.h"
>
> -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, u16 index, void *pdata, u16 len, u8 requesttype)
> +static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
>  {
>         struct adapter  *adapt = pintfhdl->padapter;
>         struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
> @@ -56,7 +56,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, u16 index, vo
>                 }
>
>                 status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> -                                        reqtype, value, index, pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
> +                                        reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> +                                        pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
>
>                 if (status == len) {   /*  Success this control transfer. */
>                         rtw_reset_continual_urb_error(dvobjpriv);
> @@ -104,19 +105,17 @@ static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         u8 data = 0;
>
>
>
>         requesttype = 0x01;/* read_in */
> -       index = 0;/* n/a */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 1;
>
> -       usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>
>
> @@ -128,15 +127,13 @@ static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         __le32 data;
>
>         requesttype = 0x01;/* read_in */
> -       index = 0;/* n/a */
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 2;
> -       usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>         return (u16)(le32_to_cpu(data) & 0xffff);
>  }
> @@ -145,17 +142,15 @@ static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         __le32 data;
>
>         requesttype = 0x01;/* read_in */
> -       index = 0;/* n/a */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 4;
>
> -       usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>         return le32_to_cpu(data);
>  }
> @@ -164,18 +159,16 @@ static int usb_write8(struct intf_hdl *pintfhdl, u32 addr, u8 val)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         u8 data;
>         int ret;
>
>
>         requesttype = 0x00;/* write_out */
> -       index = 0;/* n/a */
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 1;
>         data = val;
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>         return ret;
>  }
> @@ -184,7 +177,6 @@ static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         __le32 data;
>         int ret;
> @@ -192,14 +184,13 @@ static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
>
>
>         requesttype = 0x00;/* write_out */
> -       index = 0;/* n/a */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 2;
>
>         data = cpu_to_le32(val & 0x0000ffff);
>
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>
>
> @@ -210,7 +201,6 @@ static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         __le32 data;
>         int ret;
> @@ -218,13 +208,12 @@ static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>
>
>         requesttype = 0x00;/* write_out */
> -       index = 0;/* n/a */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 4;
>         data = cpu_to_le32(val);
>
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, index, &data, len, requesttype);
> +       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>
>
>
> @@ -235,7 +224,6 @@ static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata
>  {
>         u8 requesttype;
>         u16 wvalue;
> -       u16 index;
>         u16 len;
>         u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
>         int ret;
> @@ -243,13 +231,12 @@ static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata
>
>
>         requesttype = 0x00;/* write_out */
> -       index = 0;/* n/a */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = length;
>         memcpy(buf, pdata, len);
>
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, index, buf, len, requesttype);
> +       ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, len, requesttype);
>
>         return ret;
>  }
> --
> 2.20.1
>

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
