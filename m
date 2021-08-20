Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD03FC1
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 23:41:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z9so16337744wrh.10
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3QUhhNIF90MtvR0aGkoL0e8SFaiI6LpJhm/aC61b+xI=;
        b=O2/d2Bm0Sb6mxF7NtpDLzD4bJraBroenpCI7MagbZrJDJjzJ8sRegibpfTt8PB/b7Z
         H2ipwKlG6rxYHkbnrpsZyuAE0Th4JO2GnX8Fpf4xKUHyp8HipRRqViR0ortbYj7GxjIt
         pDyx8RPhfzMbkmW5z65fdU+bcrEvpE3u43MB75mGhdj+rzdd+sWiuRt2QRlWVNJ3s+rP
         79326koagRoNk6Garge6qJJUoFXcZuw/ORE7RViSzpAGVRW4bGWRFLSgzhDPlx6drkyK
         sollbYkDWuxTj3P64x4QHIpzZxt4QXtWh1vMygwkoW8LvOHepD3R39TW+fqmp1eOTp9n
         XLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3QUhhNIF90MtvR0aGkoL0e8SFaiI6LpJhm/aC61b+xI=;
        b=L4I0YcvdNLnPlaReTcCxvD9/zkqhu/GHEid14ZgRRowRoFbV45Ug8gQWEhzxvolLkW
         dNDFwQUd6VCjssnZ3nwKhrmiMG9NwOIaoOXhdX45qQTb5TWN1AnbB4QLUlNhXZECSfPb
         NIGNk+lby2jAdsgSHUrdtwKHvsg0yMcvJ6QEdbggtChZct+xKXa69IabwgyqNsGubsNA
         F5lAKFuuMu8oUCQuqcPkM8fhWrpwuTgUU4Lhm+KdP4XuSeW8FoTFivBsI2dbDdxYaBPD
         kQMRB/7D40ULNmzrSb/PMD9s5/7GS9Rune9tt/QjtpLS/+zrIi27lYtLjmUhd+LpcZ/r
         Vw2w==
X-Gm-Message-State: AOAM530xBd2QAkYrFHMwLhChJeF8Hoii6lOE0Lo+13wBn0a32yaSGmQS
	USuzhixdzVFOBmDRfSfswfVZsg==
X-Google-Smtp-Source: ABdhPJz0GKLEvCLCboXeYmIsOLKdBpuB04trY9PXQ1BEmidLK8miU2EAyXVE40C3EJJ6H/Xegl7btw==
X-Received: by 2002:adf:f552:: with SMTP id j18mr1145763wrp.273.1629502892599;
        Fri, 20 Aug 2021 16:41:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c8sm7285216wrx.53.2021.08.20.16.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:41:32 -0700 (PDT)
Message-ID: <7a83e221a017e292bea8862191e48c6c95bb77da.camel@philpotter.co.uk>
Subject: Re: [PATCH RFC 1/3] staging: r8188eu: add proper rtw_read* error
 handling
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 straube.linux@gmail.com,  fmdefrancesco@gmail.com
Date: Sat, 21 Aug 2021 00:41:31 +0100
In-Reply-To: <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com>
	 <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-20 at 20:07 +0300, Pavel Skripkin wrote:
> rtw_read*() functions call usb_read* inside. These functions could
> fail
> in some cases; for example: failed to receive control message. These
> cases should be handled to prevent uninit value bugs, since usb_read*
> functions blindly return stack variable without checking if this
> value
> _actualy_ initialized.
> 
> To achive it, all usb_read* and rtw_read*() argument list is expanded
> with pointer to error and added error usbctrl_vendorreq() error
> checking.
> If transfer is successful error will be initialized to 0 otherwise to
> error returned from usb_control_msg().
> 
> To not break the build, added error checking for rtw_read*() call all
> across the driver.
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
>  drivers/staging/r8188eu/core/rtw_efuse.c      |  83 +++-
>  drivers/staging/r8188eu/core/rtw_io.c         |  18 +-
>  drivers/staging/r8188eu/core/rtw_mp.c         |  37 +-
>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  20 +-
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   6 +-
>  drivers/staging/r8188eu/core/rtw_sreset.c     |   7 +-
>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
>  drivers/staging/r8188eu/hal/hal_com.c         |  22 +-
>  drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 +-
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 198 +++++++--
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  26 +-
>  drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  20 +-
>  drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  17 +-
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 394 ++++++++++++++--
> --
>  drivers/staging/r8188eu/hal/usb_ops_linux.c   |  16 +-
>  drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 168 +++++---
>  20 files changed, 941 insertions(+), 252 deletions(-)
> 
...
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 953fa05dc30c..980af6c02be5 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -101,29 +101,31 @@ static int usbctrl_vendorreq(struct intf_hdl
> *pintfhdl, u16 value, void *pdata,
>         return status;
>  }
>  
> -static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr)
> +static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr, int *error)
>  {
>         u8 requesttype;
>         u16 wvalue;
>         u16 len;
>         u8 data = 0;
> +       int res;
>  
> -
> +       if (unlikely(!error))
> +               WARN_ON_ONCE("r8188eu: Reading w/o error checking is
> bad idea\n");
>  
>         requesttype = 0x01;/* read_in */
>  
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 1;
>  
> -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> -
> -
> +       res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len,
> requesttype);
> +       if (likely(error))
> +               *error = res < 0? res: 0;
>  
>         return data;
>  
>  }
>  
> -static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
> +static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr, int
> *error)
>  {
>         u8 requesttype;
>         u16 wvalue;
> @@ -138,7 +140,7 @@ static u16 usb_read16(struct intf_hdl *pintfhdl,
> u32 addr)
>         return (u16)(le32_to_cpu(data) & 0xffff);
>  }
>  
> -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> +static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr, int
> *error)
>  {
>         u8 requesttype;
>         u16 wvalue;

Dear Pavel,

For this patch, you modify the signature of the usb_read*() functions,
but only introduce the usbctrl_vendorreq checks for usb_read8.

I can see from the following patch that you have done the others too
later on, but really I would say for changes like this, they should be
grouped in the same patch. Also, just me nitpicking probably, but the
patch is rather large - sometimes unavoidable I know, but perhaps
better to group logically into areas (files or types of change) in
order to get the patches smaller and thus more easily reviewable. Many
thanks.

In terms of what we do with the errors, I would invite comments from
others on this too due to my inexperience, but I like your thinking.

Regards,
Phil

