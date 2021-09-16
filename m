Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF23FC5
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 12:14:20 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t6so15964850edi.9
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dceZ5uiDy0+Um3nYa2DJqEKVOq4Y9eg0YaVZ8ELhM+o=;
        b=ITKmohoFX118+vkERG1GZWtf0ZHVsD6dL+I+loxNI89ZaS8sQGmfM62KdbUBpGqvTB
         rM85K7KFQHHjby/u+cHQSrzMBkPTdTKIY8zWkcDzP2QEqktty9S+XVQBC5T1vtEoV4Db
         V0ow4DcMeTHCMs+k+nyJx0/RUeLhuQgT79ZO5KKt6zXHeBDL58+BAqKH1nOGQNQyzJ73
         i7YC/GI1xyNVM77N8/NV56BsZnrLz2rKhX7TioLMKJPViWDRYChGJ2VGjAJtYEVetrqE
         Np2Z5zDW1W8wGYCeGu5cQeHFtzDlO1DXnHez9zCfoVLa8HbVeI+tvNGbAE0Sn3o45wRv
         /PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dceZ5uiDy0+Um3nYa2DJqEKVOq4Y9eg0YaVZ8ELhM+o=;
        b=ZyBB+6qe0aBz+OkfN5p7OU7VHn9hoG6X4W820u+q2pvSpvz1+BCeST5BQAv2EQph8a
         nQ4+wJtHOxJLVCJeORgYjcJX6tLx2djs75H5v7CucBU6+N2WelnXiN3ALNpvq9438d1o
         bnwjHtn9BoMiq4vYZWZIsoIQoUKtrFQQbAv442mqJCVxnP0a1fDlpwdjv48wBhQRNH/z
         Q2f+n6xKMDfFQUB+s7y6Gn9xnfmWZU0sYE5d85wBqr8Qv0sOJmrmUPU5NC60xTMAo7qc
         dPcn8Uq1sy4mODRPfDQTJg2AmQB+nYRJ7IY+xccJnTTOgr3Zm1HX3e88vvOzN53htgSe
         A2Yg==
X-Gm-Message-State: AOAM531NxWtaDpjidY/OFsfTPazH316CAqEWEobQjXsrz5Clx4hD9Dz9
	ywCf5jNaC37Kn9vEmzeEn00=
X-Google-Smtp-Source: ABdhPJyiCIJyLzFmU30/g1amsyFm/bu8BYO30s73qIG7d6Jul+70WYEzQS4YU90FawDjX4s8N6lr3A==
X-Received: by 2002:a17:906:4a0b:: with SMTP id w11mr6134745eju.265.1631794458498;
        Thu, 16 Sep 2021 05:14:18 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id gl2sm1102155ejb.110.2021.09.16.05.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 05:14:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>
Subject: Re: [PATCH v6 16/19] staging: r8188eu: Clean up rtw_read*() and rtw_write*()
Date: Thu, 16 Sep 2021 14:14:14 +0200
Message-ID: <1797501.xtDa3BoUpI@localhost.localdomain>
In-Reply-To: <20210916113606.GJ2116@kadam>
References: <20210915211103.18001-1-fmdefrancesco@gmail.com> <20210915211103.18001-17-fmdefrancesco@gmail.com> <20210916113606.GJ2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, September 16, 2021 1:36:06 PM CEST Dan Carpenter wrote:
> On Wed, Sep 15, 2021 at 11:11:00PM +0200, Fabio M. De Francesco wrote:
> > Clean up rtw_read{8,16,32}() and rtw_write{8,16,32,N}() in 
usb_ops_linux.c.
> > 
> 
> It would be good to know what you did more specifically.
> 
> 1) Rename variables:
> 	pio_priv => io_priv
> 	pintfhdl => intfhdl
> 	wvalue => address.
> 2) Remove unnecessary casts.
> 3) Fix types.  Use __le16 instead of __le32.

Dear Dan,

I'm sorry for missing that. :( 

Now I remember that you asked for this specifications at least once (if not 
twice). I'll redo the commit message and add the list above in v7. I guess 
that I have to do the same in 15/19.

> The last one is a small KASan bug fix.  So good job on that.

Thanks (even if I don't yet know anything about KASan).

> > Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/r8188eu/hal/usb_ops_linux.c | 68 ++++++++++-----------
> >  1 file changed, 34 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/
staging/r8188eu/hal/usb_ops_linux.c
> > index 2098ce935dc0..d87da84eca07 100644
> > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > @@ -91,91 +91,91 @@ static int usbctrl_vendorreq(struct intf_hdl 
*intfhdl, u16 value, void *data, u1
> >  
> >  u8 rtw_read8(struct adapter *adapter, u32 addr)
> >  {
> > -	struct io_priv *pio_priv = &adapter->iopriv;
> > -	struct intf_hdl *pintfhdl = &pio_priv->intf;
> > -	u16 wvalue = (u16)(addr & 0x0000ffff);
> > +	struct io_priv *io_priv = &adapter->iopriv;
> > +	struct intf_hdl *intfhdl = &io_priv->intf;
> > +	u16 address = addr & 0xffff;
> >  	u8 data;
> > -
> 
> Deleting this line introduces a checkpatch warning.

I didn't notice the warning. This too will be fixed in v7.

> > -	usbctrl_vendorreq(pintfhdl, wvalue, &data, 1, 
REALTEK_USB_VENQT_READ);
> > +	usbctrl_vendorreq(intfhdl, address, &data, 1, 
REALTEK_USB_VENQT_READ);
> >  
> >  	return data;
> >  }
> >  
> >  u16 rtw_read16(struct adapter *adapter, u32 addr)
> >  {
> > -	struct io_priv *pio_priv = &adapter->iopriv;
> > -	struct intf_hdl *pintfhdl = &pio_priv->intf;
> > -	u16 wvalue = (u16)(addr & 0x0000ffff);
> > -	__le32 data;
> > +	struct io_priv *io_priv = &adapter->iopriv;
> > +	struct intf_hdl *intfhdl = &io_priv->intf;
> > +	u16 address = addr & 0xffff;
> > +	__le16 data;
> >  
> > -	usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, 
REALTEK_USB_VENQT_READ);
> > +	usbctrl_vendorreq(intfhdl, address, &data, 2, 
REALTEK_USB_VENQT_READ);
> >  
> > -	return (u16)(le32_to_cpu(data) & 0xffff);
> > +	return le16_to_cpu(data);
> 
> The last two bytes of "data" are not initialized.  I do not think that
> will cause a bug on either endian type of system during runtime but I
> this that KASan will catch it and complain.

I don't want to add mistakes on mistakes. I guess that you are talking of the 
same fix you wrote above and that "return le16_to_cpu(data);" is correct.
Am I interpreting your words in the correct way?
 
> >  }
> >  
> >  u32 rtw_read32(struct adapter *adapter, u32 addr)
> >  {
> > -	struct io_priv *pio_priv = &adapter->iopriv;
> > -	struct intf_hdl *pintfhdl = &pio_priv->intf;
> > -	u16 wvalue = (u16)(addr & 0x0000ffff);
> > +	struct io_priv *io_priv = &adapter->iopriv;
> > +	struct intf_hdl *intfhdl = &io_priv->intf;
> > +	u16 address = addr & 0xffff;
> >  	__le32 data;
> >  
> > -	usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, 
REALTEK_USB_VENQT_READ);
> > +	usbctrl_vendorreq(intfhdl, address, &data, 4, 
REALTEK_USB_VENQT_READ);
> >  
> >  	return le32_to_cpu(data);
> >  }
> >  
> >  int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
> >  {
> > -	struct io_priv *pio_priv = &adapter->iopriv;
> > -	struct intf_hdl *pintfhdl = &pio_priv->intf;
> > -	u16 wvalue = (u16)(addr & 0x0000ffff);
> > +	struct io_priv *io_priv = &adapter->iopriv;
> > +	struct intf_hdl *intfhdl = &io_priv->intf;
> > +	u16 address = addr & 0xffff;
> >  	int ret;
> >  
> > -	ret = usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, 
REALTEK_USB_VENQT_WRITE);
> > +	ret = usbctrl_vendorreq(intfhdl, address, &val, 1, 
REALTEK_USB_VENQT_WRITE);
> >  
> >  	return RTW_STATUS_CODE(ret);
> >  }
> >  
> >  int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
> >  {
> > -	struct io_priv *pio_priv = &adapter->iopriv;
> > -	struct intf_hdl *pintfhdl = &pio_priv->intf;
> > -	u16 wvalue = (u16)(addr & 0x0000ffff);
> > -	__le32 data = cpu_to_le32(val & 0x0000ffff);
> > +	struct io_priv *io_priv = &adapter->iopriv;
> > +	struct intf_hdl *intfhdl = &io_priv->intf;
> > +	__le16 data = cpu_to_le16(val);
> 
> This is the other interesting change.  I think the original code works
> though.

Here too, I'm a bit confused... Do yo prefer the original code or you're 
saying that, although the original code works fine, I made the correct choice 
in changing it? Can you please confirm?

> 
> > +	u16 address = addr & 0xffff;
> >  	int ret;
> >  
> > -	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, 
REALTEK_USB_VENQT_WRITE);
> > +	ret = usbctrl_vendorreq(intfhdl, address, &data, 2, 
REALTEK_USB_VENQT_WRITE);
> >  
> >  	return RTW_STATUS_CODE(ret);
> >  }
> 
> regards,
> dan carpenter
> 
> 

Regards,

Fabio


