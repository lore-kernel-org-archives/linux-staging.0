Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD771
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 10:22:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id u21so99088011ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gJfdEhIdapqa6Us1PNUMC3TDm9zWvCXbA4Rr4T9F47w=;
        b=R5bqu3oSGn4eMe8WE7TT5mrzKygWc2nxUUfMRBvM/YhJF7tXIYngBfvClnmSmY6N4D
         O2UBes6HyRjOw2lo50q697bMKO4Qyj+nIMkiUwB8MDDXTjoMdAFhQiLUQaV3WLXhgrjz
         fLPpebSx8Q6RiFTJIb3P7PgwzMMZbPipy3olgmOUTtkhxZKPkNxxuJS5N09G3YtpEH6X
         hBfPYcYz+QoaqNypsk7dBeNbL1JuIxJoM2zmMfGnx8FcVHBfcCrZYqshywBvBEdOEpQl
         7y/r+OsRRJHczS2Jz2Omiy2QMoMxXnzeZoVCTR6Grs6FGy5kLJXMCyrVpc2tpfN77KAA
         +mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gJfdEhIdapqa6Us1PNUMC3TDm9zWvCXbA4Rr4T9F47w=;
        b=Rc7qNfKbB10HXQW1B0goHFuSHkjIJ833798WOIPGBe0t53It6L/RRsRoojCP0BJ1/X
         ZG2/AIW0xq6EfxN4Aaq1lvcszryCRGF/83eUP1bFm6Trja6K4pJMnDnkyUwTCJFNJ/6t
         GL+N1erDij0KQn3+DB080SqQIBZRXFgTuvginetqk9HqNFfEKCYmXppYzf+iQ4Mxy1/M
         88Nka2US7B5JsnbU9dVgG8Ss4d9gCyWLUWr3Fi0le0oab6FNsFXwZnsjlfzlYJI1xcrf
         r16Jma5rE004c8poKrVcla1dEvhOgxBRHlxrbiSob3rymWq0GMYvEeedmzrGGOrhEzHk
         AaHg==
X-Gm-Message-State: AOAM530Elqjtm2zVV7kCvBGFJYYWXuB49ZIM5yuB5eb6QWNN8KqRe+DN
	FKmjLW1Lqq0h4iIuUBucMOU=
X-Google-Smtp-Source: ABdhPJzE11qjhkTpc9OpF1AUvjUYTOGJoltCWMB90MnzAaJ8WFiPzymnNZUQvc95ut21GDOrY9I63w==
X-Received: by 2002:a17:906:edcf:: with SMTP id sb15mr17551889ejb.202.1619691728127;
        Thu, 29 Apr 2021 03:22:08 -0700 (PDT)
Received: from agape.jhs ([5.171.81.14])
        by smtp.gmail.com with ESMTPSA id hd30sm1521264ejc.59.2021.04.29.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 03:22:07 -0700 (PDT)
Date: Thu, 29 Apr 2021 12:22:02 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove
 set but unused variables
Message-ID: <20210429102201.GF1409@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
 <20210428113346.28305-2-fmdefrancesco@gmail.com>
 <20210429072619.GB1409@agape.jhs>
 <8266064.IJzC9MfcRG@linux.local>
 <20210429082552.GC1409@agape.jhs>
 <YIqECQk/1Zb4JRjb@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIqECQk/1Zb4JRjb@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 29, 2021 at 12:01:45PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 29, 2021 at 10:25:53AM +0200, Fabio Aiuto wrote:
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
> > > 082448557b53..96cb4426a0f4
> > > > > 100644
> > > > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > @@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, 
> > > enum
> > > > > hal_def_variable variable, v> 
> > > > >  			u32 cmd;
> > > > >  			u32 ra_info1, ra_info2;
> > > > >  			u32 rate_mask1, rate_mask2;
> > > > > 
> > > > > -			u8 curr_tx_rate, curr_tx_sgi, hight_rate, 
> > > lowest_rate;
> > > > > 
> > > > >  			cmd = 0x40000100 | mac_id;
> > > > >  			rtw_write32(padapter, 
> > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > > >  			msleep(10);
> > > > >  			ra_info1 = rtw_read32(padapter, 0x2F0);
> > > > > 
> > > > > -			curr_tx_rate = ra_info1&0x7F;
> > > > > -			curr_tx_sgi = (ra_info1>>7)&0x01;
> > > > > 
> > > > >  			cmd = 0x40000400 | mac_id;
> > > > >  			rtw_write32(padapter, 
> > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > > > 
> > > > > @@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum
> > > > > hal_def_variable variable, v> 
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
> > > >
> > > Hello Fabio,
> > > 
> > > I'm not sure about it: rtw_read32 calls a pointer to a function. I'm don't 
> > > know drivers programming, however that function looks like an implementation 
> > > of a read() system call. So I wouldn't be so sure to remove those calls. 
> > > 
> > > Could calling a (*read) method have side effects on subsequent read()? I mean: 
> > > could it update some internal data structure? If not I can remove the 
> > > variables you mentioned above and the calls to read32.
> > > 
> > > I'm looking forward to read your reply.
> > > 
> > > Thanks,
> > > 
> > > Fabio
> > > 
> > > 
> > > 
> > 
> > hi Fabio,
> > 
> > rtw_read32 is a macro wrapping _rtw_read32() defined as follows (in core/rtw_io.c):
> > 
> > u32 _rtw_read32(struct adapter *adapter, u32 addr)
> > {
> >         u32 r_val;
> >         /* struct       io_queue        *pio_queue = (struct io_queue *)adapter->pio_queue; */
> >         struct io_priv *pio_priv = &adapter->iopriv;
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
> > drivers/staging/rtl8723bs/hal/sdio_ops.c:	ops->_read32 = &sdio_read32;
> > 
> > this is the place where _read32 is stored with sdio_read32 reference... 
> > 
> > drivers/staging/rtl8723bs/core/rtw_io.c:	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
> > drivers/staging/rtl8723bs/core/rtw_io.c:	_read32 = pintfhdl->io_ops._read32;
> > ...
> > 
> > if you check it in hal/sdio_ops.c, nothing is written, just reads are
> > performed (and it's not odd, for a read function isn't supposed to write
> > something under the hood ;)).
> 
> Yes, but many types of hardware _REQUIRE_ reads to do something.  So
> "read that does nothing" is a requirement for some operations.
> 
> As an example, a write is only guaranteed to have been finished if you
> do a read of the same location back from it on some hardware busses.
> The bus can reorder things, but a write/read of the same location can
> not be reordered.
> 
> Sometimes you have to do reads multiple times to get things to "stick".
> 
> Other times reading from a location changes a state in the hardware
> (horrid but HW designers aren't the brightest at times...)
> 
> So you can NOT just remove reads without knowing that the hardware does
> not require this.  This is an issue where GCC "warnings" mean nothing as
> gcc does not actually know what hardware does, or does not, do for many
> things.
> 
> thanks,
> 
> greg k-h

thank you for explanation, my hardware knowledge is poor:(
Sorry for noise.

fabio
