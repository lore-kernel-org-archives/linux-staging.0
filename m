Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ABB3FC3
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 05:55:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b7so17178542edu.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 22:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMXSgeio3h45yxi1jpobrvpZ5kfyPjCGua20HuqkoIk=;
        b=DfXFHYO+pe9tx63qBvcpTu8tG9Rdogldu/rTmkMhZxmVSQikl1Li1oCuh4o8LFGvRU
         G1tjw6ES7+5T/lKSp59oD1hjVRaMVxHrtcr98IodhIJq/WUczgwd43fsgyX0ye84TqMU
         hE9FuaisdL8hjyhZ8LFtZ7EH82X863LZcLQ6GAdufCpkcJqYGd9G7ckDYtLWJj0H6Ift
         YlWJS+iCMuBJRsY5LsJUAP/FSqJ8phhaumllqUcKSTydPuPbktj/nK/mmOE/r+yUSd6L
         82teS8bmjKwP/kG3iGHkMXdZTzRIDuCW3LvjQV3dpuKd1ESfFXQqEk3mozuHIND60Zr1
         c3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMXSgeio3h45yxi1jpobrvpZ5kfyPjCGua20HuqkoIk=;
        b=eDJVU279re+afGTf6eQwh7MoPDNQPwhjL6BSa5D0z/iqXiI3UsFZTz8R4pohJrOOal
         09b+2bhh0ZCZWny95xcQvsHms5x1qXwhzOehXc3fOrytckaEm1JTtCXxjdGtR5WO3Cfq
         7CwbzCntivRLj1PHUS66oxdSMhEhjSETL0d7smehetduvNmOoyndD+Z3FSHjy9/FEjJ1
         5v4Y4atGHh7CAj3Wr2A0xYq6qdjVnG/mg1SV4SA5hT3+TfjxF5Q4ksfMjY/aOFvr+WP7
         MT20N86f3E6WvzEf/ktMkDjZVXgz2t7YoXZTckHFhK9vL16hp5+fXiJIIZvIIB8RxB+M
         pW3Q==
X-Gm-Message-State: AOAM531V4o1LzyMxZ3Z3HMAqf4OmsGDaIRHzWYCH2XLvbtbthh/idJCo
	O4EBXEwdg7UDt6f7rZE+X7M=
X-Google-Smtp-Source: ABdhPJyK5zheDpMOKgrp80d0DqZ0b6GGEYVSizMGuNCGhvmootQL0RLvpvDG47MEoejQ6wAgX4iEyw==
X-Received: by 2002:a50:cb83:: with SMTP id k3mr27091002edi.102.1629525340168;
        Fri, 20 Aug 2021 22:55:40 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id k12sm2037637edq.59.2021.08.20.22.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 22:55:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH RFC 1/3] staging: r8188eu: add proper rtw_read* error handling
Date: Sat, 21 Aug 2021 07:55:38 +0200
Message-ID: <5720270.rXTAdOU5UK@localhost.localdomain>
In-Reply-To: <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com> <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 20, 2021 7:07:36 PM CEST Pavel Skripkin wrote:
> rtw_read*() functions call usb_read* inside. These functions could fail
> in some cases; for example: failed to receive control message. These
> cases should be handled to prevent uninit value bugs, since usb_read*
> functions blindly return stack variable without checking if this value
> _actualy_ initialized.
> 
> To achive it, all usb_read* and rtw_read*() argument list is expanded

Dear Pavel,

Please, achive --> achieve.

> with pointer to error and added error usbctrl_vendorreq() error checking.
> If transfer is successful error will be initialized to 0 otherwise to
> error returned from usb_control_msg().
> 
> To not break the build, added error checking for rtw_read*() call all
> across the driver.
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
>  drivers/staging/r8188eu/core/rtw_efuse.c      |  83 +++-
>  drivers/staging/r8188eu/core/rtw_io.c         |  18 +-
>  drivers/staging/r8188eu/core/rtw_mp.c         |  37 +-
>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  20 +-
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   6 +-
>  drivers/staging/r8188eu/core/rtw_sreset.c     |   7 +-
>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
>  drivers/staging/r8188eu/hal/hal_com.c         |  22 +-
>  drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 +-
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 198 +++++++--
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  26 +-
>  drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  20 +-
>  drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  17 +-
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 394 ++++++++++++++----
>  drivers/staging/r8188eu/hal/usb_ops_linux.c   |  16 +-
>  drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 168 +++++---
>  20 files changed, 941 insertions(+), 252 deletions(-)

I agree with Philip: please, split this long patch. If I were you, I'd make 
one patch for each of the three rtw_read*() and a fourth patch for usb_read*().

> --- a/drivers/staging/r8188eu/core/rtw_io.c
> +++ b/drivers/staging/r8188eu/core/rtw_io.c
> @@ -34,44 +34,44 @@ jackson@realtek.com.tw
>  #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
>  #define rtw_cpu_to_le32(val)		cpu_to_le32(val)

Not related to your patch, these macros are useless and misleading.

> -u8 _rtw_read8(struct adapter *adapter, u32 addr)
> +u8 _rtw_read8(struct adapter *adapter, u32 addr, int *error)
>  {
>  	u8 r_val;
>  	struct io_priv *pio_priv = &adapter->iopriv;
>  	struct	intf_hdl *pintfhdl = &pio_priv->intf;
> -	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
> +	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>  
>  
>  	_read8 = pintfhdl->io_ops._read8;
> -	r_val = _read8(pintfhdl, addr);
> +	r_val = _read8(pintfhdl, addr, error);
>  
>  	return r_val;
>  }

I really don't like passing errors through arguments. Why don't you pass 
a storage location where the function save the byte read and instead use the 
return for errors? I think that this would result in a cleaner design. Furthermore,
it is used everywhere in the kernel.
  
> -u16 _rtw_read16(struct adapter *adapter, u32 addr)
> +u16 _rtw_read16(struct adapter *adapter, u32 addr, int *error)
>  {
>  	u16 r_val;
>  	struct io_priv *pio_priv = &adapter->iopriv;
>  	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
> -	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
> +	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>  
>  	_read16 = pintfhdl->io_ops._read16;
>  
> -	r_val = _read16(pintfhdl, addr);
> +	r_val = _read16(pintfhdl, addr, error);
>  
>  	return r_val;
>  }

Same.

> -u32 _rtw_read32(struct adapter *adapter, u32 addr)
> +u32 _rtw_read32(struct adapter *adapter, u32 addr, int *error)
>  {
>  	u32 r_val;
>  	struct io_priv *pio_priv = &adapter->iopriv;
>  	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
> -	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr);
> +	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>  
>  	_read32 = pintfhdl->io_ops._read32;
>  
> -	r_val = _read32(pintfhdl, addr);
> +	r_val = _read32(pintfhdl, addr, error);
>  
>  	return r_val;
>  }

Same.

I'm done for now: too many lines to read all at once :)

Regards,

Fabio


