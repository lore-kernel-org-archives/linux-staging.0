Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5C971
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 09:33:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u17so98964630ejk.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mVDpQxeTCMq46bao8sy9cnrDvz662NxXvCGy2842XSk=;
        b=XIn696y5s3nQNvaOHb7ZQC5AkLwso8hmCtzWa3OuTSHiW0etnQEvHvOAu4NDNHQPkQ
         Zsp5yVjwQGNI+3Ijf9mY3fNUY36K09rqxAQoiohiRsVVE/xEEgprsv5cRS3FVka0cTxH
         hhQ904F3Ay2q1+waxm+qgfVzTcAbLmbV9ye5zSdEAAJ9++K/0Qnw1sPdAxfcxoPGZsjb
         Pi81D2XV+Ac2wYIdrDMH5h+JISZH3l2cCynLGfDkUVky+KD40KYTnwVlUBirIC0Tfa6Q
         /53mFkAFJVysFsQlV9GwzE9F/CgL3hGmhVPecfLjFjC5bgvt94s7crIgmVPJ0pIeufLc
         rixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mVDpQxeTCMq46bao8sy9cnrDvz662NxXvCGy2842XSk=;
        b=q9lzoP8yA/wW5Ax9MRzKd6MV27AR0SFgN+9WTQzNwYNWYPVfahFKfW9lVhlvI2PiOS
         E4P3ZdSXvHoFu9IZ57ySvAps6cDwmEJhEHy3b6ZX8yZ4nTZCR2W/qnQh6plrGH6LmTMT
         VAUSFjd3PaIw4KsH4udqZai1qBQ3oT4iTm3hWpVjqVGgr9WC9UIPpjhxMsmNyyX/sYer
         UGr9HOtL+beTX2AOPA2ntht4z7UkYp2S2ib4ZJc65OHZQRZsrNbY+ITyWjNlKYrIKkWc
         QS4lsJ/0d3i363ysmrKQ/wHsEXaceaPWBU3VUzrx4okMMvhCYDLlpMLI7275FO1NQoAj
         aXCg==
X-Gm-Message-State: AOAM532pE85duRwUcJUwPs7Rg33OJH81Sx3ZJRtcdUev/mZF+y4qIWi3
	YzJiU8RufY2U5/t4defPCSw=
X-Google-Smtp-Source: ABdhPJyu7EJGrJVitIw+ZVXJWa+RqWaHus2Yaz8XlMZoE0QyEDZ4Ng9qqIebxoqtP2fw9vzHrWJA6Q==
X-Received: by 2002:a17:906:4889:: with SMTP id v9mr6716100ejq.21.1619688778789;
        Thu, 29 Apr 2021 02:32:58 -0700 (PDT)
Received: from agape.jhs ([5.171.81.14])
        by smtp.gmail.com with ESMTPSA id n17sm1853594eds.72.2021.04.29.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:32:58 -0700 (PDT)
Date: Thu, 29 Apr 2021 11:32:52 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove
 set but unused variables
Message-ID: <20210429093250.GD1409@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
 <8266064.IJzC9MfcRG@linux.local>
 <20210429082552.GC1409@agape.jhs>
 <2336223.vu2A7xvVi3@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2336223.vu2A7xvVi3@linux.local>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 29, 2021 at 11:16:24AM +0200, Fabio M. De Francesco wrote:
> On Thursday, April 29, 2021 10:25:53 AM CEST Fabio Aiuto wrote:
> > On Thu, Apr 29, 2021 at 09:44:47AM +0200, Fabio M. De Francesco wrote:
> > > On Thursday, April 29, 2021 9:26:20 AM CEST Fabio Aiuto wrote:
> > > > Hi Fabio,
> > > > 
> > > > On Wed, Apr 28, 2021 at 01:33:45PM +0200, Fabio M. De Francesco wrote:
> > > > > Removed four set but unused variables. Issue detected by gcc.
> > > > > 
> > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > ---
> > > > > 
> > > > >  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
> > > > >  1 file changed, 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c index
> > > 
> > > 082448557b53..96cb4426a0f4
> > > 
> > > > > 100644
> > > > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > @@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter,
> > > 
> > > enum
> > > 
> > > > > hal_def_variable variable, v>
> > > > > 
> > > > >  			u32 cmd;
> > > > >  			u32 ra_info1, ra_info2;
> > > > >  			u32 rate_mask1, rate_mask2;
> > > > > 
> > > > > -			u8 curr_tx_rate, curr_tx_sgi, hight_rate,
> > > 
> > > lowest_rate;
> > > 
> > > > >  			cmd = 0x40000100 | mac_id;
> > > > >  			rtw_write32(padapter,
> > > 
> > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > 
> > > > >  			msleep(10);
> > > > >  			ra_info1 = rtw_read32(padapter, 0x2F0);
> > > > > 
> > > > > -			curr_tx_rate = ra_info1&0x7F;
> > > > > -			curr_tx_sgi = (ra_info1>>7)&0x01;
> > > > > 
> > > > >  			cmd = 0x40000400 | mac_id;
> > > > >  			rtw_write32(padapter,
> > > 
> > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > 
> > > > > @@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, 
> enum
> > > > > hal_def_variable variable, v>
> > > > > 
> > > > >  			ra_info2 = rtw_read32(padapter, 0x2F4);
> > > > >  			rate_mask1 = rtw_read32(padapter, 0x2F8);
> > > > >  			rate_mask2 = rtw_read32(padapter, 0x2FC);
> > > > > 
> > > > > -			hight_rate = ra_info2&0xFF;
> > > > > -			lowest_rate = (ra_info2>>8)  & 0xFF;
> > > > > 
> > > > >  		}
> > > > >  		break;
> > > > 
> > > > rate_mask{1,2} and ra_info{1,2} seems to be unused as well.
> > > > 
> > > > thank you,
> > > > 
> > > > fabio
> > > 
> > > Hello Fabio,
> > > 
> > > I'm not sure about it: rtw_read32 calls a pointer to a function. I'm don't
> > > know drivers programming, however that function looks like an 
> implementation
> > > of a read() system call. So I wouldn't be so sure to remove those calls.
> > > 
> > > Could calling a (*read) method have side effects on subsequent read()? I 
> mean:
> > > could it update some internal data structure? If not I can remove the
> > > variables you mentioned above and the calls to read32.
> > > 
> > > I'm looking forward to read your reply.
> > > 
> > > Thanks,
> > > 
> > > Fabio
> > 
> > hi Fabio,
> > 
> > rtw_read32 is a macro wrapping _rtw_read32() defined as follows (in core/
> rtw_io.c):
> >
> Hi Fabio,
> 
> Thanks a lot for your reply.
> 
> However, There is something less than clear to me... how did you find that 
> rtw_read32 is a macro wrapping _rtw_read32()? I mean: I knew that, in vim, one 
> can go to the definition of something by using ctrl-] key.
> 
> If I do that on rtw_read32 it takes me to a static definition of it in 
> drivers/net/wireless/realtek/rtw88/hci.h. This is a one line function:
> 
> static inline void rtw_write32(struct rtw_dev *rtwdev, u32 addr, u32 val)
> {       
>         rtwdev->hci.ops->write32(rtwdev, addr, val);
> }
> 
> When I use ctrl-] on write32() it takes me to struct rtw_hci_ops in drivers/
> net/wireless/realtek/rtw88/hci.h.
> 
> After that I wanted to find where the member (*read32)() is assigned but I 
> don't know where and how to grep it: I tried "grep -rn "\bwrite32\b=" drivers/
> staging/rtl8723bs/" but I found nothing...
> 
> Can you please explain what I'm doing wrong in following the path I mentioned 
> above and how you find out that macro?

$grep -r 'define\s*\brtw_read32' drivers/staging/rtl8723bs/

it's a grep I always do to check if a function is actally
a function or a macro..


> 
> Thanks for your time,
> 
> Fabio 
> > 
> > u32 _rtw_read32(struct adapter *adapter, u32 addr)
> > {
> >         u32 r_val;
> >         /* struct       io_queue        *pio_queue = (struct io_queue
> > *)adapter->pio_queue; */ struct io_priv *pio_priv = &adapter->iopriv;
> >         struct  intf_hdl                *pintfhdl = &(pio_priv->intf);
> >         u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
> > 
> >         _read32 = pintfhdl->io_ops._read32;
> > 
> >         r_val = _read32(pintfhdl, addr);
> >         return rtw_le32_to_cpu(r_val);
> > 
> > }
> > 
> > the actual read seems to be performed by the handler contained in
> > 
> > 	pintfhdl->io_ops._read32;
> > 
> > so:
> > 
> > $ grep -r '\b_read32' drivers/staging/rtl8723bs/
> > 
> > drivers/staging/rtl8723bs/hal/sdio_ops.c:	ops->_read32 = 
> &sdio_read32;
> > 
> > this is the place where _read32 is stored with sdio_read32 reference...
> > 
> > drivers/staging/rtl8723bs/core/rtw_io.c:	u32 (*_read32)(struct 
> intf_hdl *pintfhdl, u32
> > addr); drivers/staging/rtl8723bs/core/rtw_io.c:	_read32 = pintfhdl-
> >io_ops._read32;
> > ...
> > 
> > if you check it in hal/sdio_ops.c, nothing is written, just reads are
> > performed (and it's not odd, for a read function isn't supposed to write
> > something under the hood ;)).
> > 
> > I think those variables could be easily removed as W=1 gcc suggests.
> > 
> > thank you,
> > 
> > fabio
> 
> 
> 
> 

thanks,

fabio
