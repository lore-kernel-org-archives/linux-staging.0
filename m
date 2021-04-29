Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F72F80
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 08:25:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s15so77567540edd.4
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iUQGD4uPM+aFQ386tGCMJIHR4xuNnFf3+z0KnOaljgs=;
        b=eOGCrfOLKtNCyZMT+1FMugK3ZEPyMyrDKQZq6BV4Od25GAaVmaUzZiI5T21VWL/osk
         FMTHzTBcxstK3CWm5dX7KzbwUEt9YMNrF5Z6fpiK3fkfPuy7V0egZI7FL1705h096XTI
         mub84LddnQzU3WOR6PmTi7t/z56Y/KR1GRdsLrPqVHFCZbt3CgItqJeu8VP7pOiIz/mc
         d/DAiq8iEAADPUTL3geFkutFX9JNYRpzSBe7gLDrKCcTc6eTyKXo/dKr/f+B24TV05+E
         pNEnqQETWONl5ewlgH30pykSn68ahKILS8g9FjaPDY1jT067oValeYERVp53ng6GHRQv
         LxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iUQGD4uPM+aFQ386tGCMJIHR4xuNnFf3+z0KnOaljgs=;
        b=W/sbEFRRAcyHNiPxd/O++rVZn0nULAy0OhN7PftaccJld/vJExu1R5phDm1gG3cHJn
         qj9TMDRYCtcF4XBMweAVXTDuo4+yNv1bPqIPf1/vOwmgQMUZrQon3s5rTLN79fyt8aLt
         oH7dR5rhS3XcacXbv/ATB6Ggmyd6W+Y5coX8VWiLtwfbjF4BpECLVoGeNLqhTYJ5cKPv
         Sp9BAIvOV+4F0bekRIqWYPnVOz+VAMPIg3mX3N+in4RkrHJKyF3V5QMmKBqNUMnLoTZh
         2IbT+uahQOvDT+q18pdGreJclC1Em0fUHDrTkZgZqGWpG4TGEgkr9TgS3Pn8R/+Z7jJX
         Z1Ow==
X-Gm-Message-State: AOAM531vq734PsyfX4TePXIlKqqm/EIvYDePcGRjuO3Svwm3WDML3BQi
	jmHu9Z83eA1ZXqQiqaJypehuo8bKqtSrMw==
X-Google-Smtp-Source: ABdhPJwr6nHgqdbfrDI/Af+DGLcN4CcxaEuXYAtfdbXJCxpMGadOmI2dR881+xA9g7vsZKNalVaaAw==
X-Received: by 2002:a05:6402:34cd:: with SMTP id w13mr16696674edc.73.1619684756571;
        Thu, 29 Apr 2021 01:25:56 -0700 (PDT)
Received: from agape.jhs ([5.171.81.14])
        by smtp.gmail.com with ESMTPSA id dj7sm1758976edb.42.2021.04.29.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 01:25:56 -0700 (PDT)
Date: Thu, 29 Apr 2021 10:25:53 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove
 set but unused variables
Message-ID: <20210429082552.GC1409@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
 <20210428113346.28305-2-fmdefrancesco@gmail.com>
 <20210429072619.GB1409@agape.jhs>
 <8266064.IJzC9MfcRG@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8266064.IJzC9MfcRG@linux.local>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 29, 2021 at 09:44:47AM +0200, Fabio M. De Francesco wrote:
> On Thursday, April 29, 2021 9:26:20 AM CEST Fabio Aiuto wrote:
> > Hi Fabio,
> > 
> > On Wed, Apr 28, 2021 at 01:33:45PM +0200, Fabio M. De Francesco wrote:
> > > Removed four set but unused variables. Issue detected by gcc.
> > > 
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > > 
> > >  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c index 
> 082448557b53..96cb4426a0f4
> > > 100644
> > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > @@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, 
> enum
> > > hal_def_variable variable, v> 
> > >  			u32 cmd;
> > >  			u32 ra_info1, ra_info2;
> > >  			u32 rate_mask1, rate_mask2;
> > > 
> > > -			u8 curr_tx_rate, curr_tx_sgi, hight_rate, 
> lowest_rate;
> > > 
> > >  			cmd = 0x40000100 | mac_id;
> > >  			rtw_write32(padapter, 
> REG_HMEBOX_DBG_2_8723B, cmd);
> > >  			msleep(10);
> > >  			ra_info1 = rtw_read32(padapter, 0x2F0);
> > > 
> > > -			curr_tx_rate = ra_info1&0x7F;
> > > -			curr_tx_sgi = (ra_info1>>7)&0x01;
> > > 
> > >  			cmd = 0x40000400 | mac_id;
> > >  			rtw_write32(padapter, 
> REG_HMEBOX_DBG_2_8723B, cmd);
> > > 
> > > @@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum
> > > hal_def_variable variable, v> 
> > >  			ra_info2 = rtw_read32(padapter, 0x2F4);
> > >  			rate_mask1 = rtw_read32(padapter, 0x2F8);
> > >  			rate_mask2 = rtw_read32(padapter, 0x2FC);
> > > 
> > > -			hight_rate = ra_info2&0xFF;
> > > -			lowest_rate = (ra_info2>>8)  & 0xFF;
> > > 
> > >  		}
> > >  		break;
> > 
> > rate_mask{1,2} and ra_info{1,2} seems to be unused as well.
> > 
> > thank you,
> > 
> > fabio
> >
> Hello Fabio,
> 
> I'm not sure about it: rtw_read32 calls a pointer to a function. I'm don't 
> know drivers programming, however that function looks like an implementation 
> of a read() system call. So I wouldn't be so sure to remove those calls. 
> 
> Could calling a (*read) method have side effects on subsequent read()? I mean: 
> could it update some internal data structure? If not I can remove the 
> variables you mentioned above and the calls to read32.
> 
> I'm looking forward to read your reply.
> 
> Thanks,
> 
> Fabio
> 
> 
> 

hi Fabio,

rtw_read32 is a macro wrapping _rtw_read32() defined as follows (in core/rtw_io.c):

u32 _rtw_read32(struct adapter *adapter, u32 addr)
{
        u32 r_val;
        /* struct       io_queue        *pio_queue = (struct io_queue *)adapter->pio_queue; */
        struct io_priv *pio_priv = &adapter->iopriv;
        struct  intf_hdl                *pintfhdl = &(pio_priv->intf);
        u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);

        _read32 = pintfhdl->io_ops._read32;

        r_val = _read32(pintfhdl, addr);
        return rtw_le32_to_cpu(r_val);

}

the actual read seems to be performed by the handler contained in

	pintfhdl->io_ops._read32;

so:

$ grep -r '\b_read32' drivers/staging/rtl8723bs/

drivers/staging/rtl8723bs/hal/sdio_ops.c:	ops->_read32 = &sdio_read32;

this is the place where _read32 is stored with sdio_read32 reference... 

drivers/staging/rtl8723bs/core/rtw_io.c:	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
drivers/staging/rtl8723bs/core/rtw_io.c:	_read32 = pintfhdl->io_ops._read32;
...

if you check it in hal/sdio_ops.c, nothing is written, just reads are
performed (and it's not odd, for a read function isn't supposed to write
something under the hood ;)).

I think those variables could be easily removed as W=1 gcc suggests.

thank you,

fabio
