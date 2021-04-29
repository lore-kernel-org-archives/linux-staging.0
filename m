Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A830C71
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 09:53:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u21so98972703ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnNPh2b75YNxs2qRAaG57i5JJJLVdZwXHfNvQ/zzmEM=;
        b=pujg8k2C90xCtA4VBhU7vWF6Dfhhlie9t2kibPG64lwqLHhp7eyBAQO4bP1Gyr6JYY
         yhBk96KD6OAEIrTFJ+bJf0xssXlJEy4SpuggV9h/JhIj+5UOm60kzPN3T/xeeGQyPPbH
         uycVq4lTEbii3s4D283vggZ4WsfzPbU4/z7aEh8DNq62rUAq/nqUyLx7D1j9iWy27Z1C
         WMREzpWro9mk2ywfMRiOEmk2NSa6w+Ktrsa+Ql8sLwHk0KnlmoCLwJEzpS3jBQKWIAaF
         5xdA000UTuPySDfWfv+mN6sE79+ohgNl75Et2LOEh3NI4pcugWDlybM1/tYBRUy6e+Pt
         QGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnNPh2b75YNxs2qRAaG57i5JJJLVdZwXHfNvQ/zzmEM=;
        b=diCvjpqLHxfyIKrfwkoYIqZCSowXTaO3LKMiWFoKGeGSuuArJa5mQ6Esd61arNc+Dl
         GHZDXhLW0mVRx4yknBgHOHPMdOorQEo/XGKToBo5S9A90DuZR2JtrnIBbENS4dFIBn+w
         rdUxd6/xibPd//XvI8O/CiIokg7BYQOozd8v1mHfzqLp+9F7q1YtqMd9x9XF45Zd0+6v
         prBtbQmFwiwj/qTfujSHOIhSj7WNAXMfnb+nVNiWieynGzSo6w4eeAOJrllBqyIhI7dT
         tCP8A73fMsrT15e/9m/WeEy8a2rwmsYMjwXQERHsMZ7h1QE61kwuCo5058GhDvjdjMdp
         NuLQ==
X-Gm-Message-State: AOAM530MRKSmnII32gBO5LKAnRLOoZ4Jgn+0FSbQQjbEgXVICVU5Yg3+
	n/WFsfXgwKctB32YJMzjNTs=
X-Google-Smtp-Source: ABdhPJzsuYo0/0yXAHRQBz4bRxD1B9lDoXNllWnRWq/m9I0TN3LQCiTe/vI+hDeilBcjcprm1UqKTA==
X-Received: by 2002:a17:906:d054:: with SMTP id bo20mr3217717ejb.207.1619690031167;
        Thu, 29 Apr 2021 02:53:51 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id md17sm1403814ejb.23.2021.04.29.02.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:53:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Thu, 29 Apr 2021 11:53:49 +0200
Message-ID: <4752203.GVlTWv8ZW8@linux.local>
In-Reply-To: <20210429093250.GD1409@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com> <2336223.vu2A7xvVi3@linux.local> <20210429093250.GD1409@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, April 29, 2021 11:32:52 AM CEST Fabio Aiuto wrote:
> On Thu, Apr 29, 2021 at 11:16:24AM +0200, Fabio M. De Francesco wrote:
> > On Thursday, April 29, 2021 10:25:53 AM CEST Fabio Aiuto wrote:
> > > On Thu, Apr 29, 2021 at 09:44:47AM +0200, Fabio M. De Francesco wrote:
> > > > On Thursday, April 29, 2021 9:26:20 AM CEST Fabio Aiuto wrote:
> > > > > Hi Fabio,
> > > > > 
> > > > > On Wed, Apr 28, 2021 at 01:33:45PM +0200, Fabio M. De Francesco 
wrote:
> > > > > > Removed four set but unused variables. Issue detected by gcc.
> > > > > > 
> > > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > >  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
> > > > > >  1 file changed, 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c index
> > > > 
> > > > 082448557b53..96cb4426a0f4
> > > > 
> > > > > > 100644
> > > > > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > > > > @@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter 
*padapter,
> > > > 
> > > > enum
> > > > 
> > > > > > hal_def_variable variable, v>
> > > > > > 
> > > > > >  			u32 cmd;
> > > > > >  			u32 ra_info1, ra_info2;
> > > > > >  			u32 rate_mask1, rate_mask2;
> > > > > > 
> > > > > > -			u8 curr_tx_rate, curr_tx_sgi, hight_rate,
> > > > 
> > > > lowest_rate;
> > > > 
> > > > > >  			cmd = 0x40000100 | mac_id;
> > > > > >  			rtw_write32(padapter,
> > > > 
> > > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > > 
> > > > > >  			msleep(10);
> > > > > >  			ra_info1 = rtw_read32(padapter, 0x2F0);
> > > > > > 
> > > > > > -			curr_tx_rate = ra_info1&0x7F;
> > > > > > -			curr_tx_sgi = (ra_info1>>7)&0x01;
> > > > > > 
> > > > > >  			cmd = 0x40000400 | mac_id;
> > > > > >  			rtw_write32(padapter,
> > > > 
> > > > REG_HMEBOX_DBG_2_8723B, cmd);
> > > > 
> > > > > > @@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter 
*padapter,
> > 
> > enum
> > 
> > > > > > hal_def_variable variable, v>
> > > > > > 
> > > > > >  			ra_info2 = rtw_read32(padapter, 0x2F4);
> > > > > >  			rate_mask1 = rtw_read32(padapter, 0x2F8);
> > > > > >  			rate_mask2 = rtw_read32(padapter, 0x2FC);
> > > > > > 
> > > > > > -			hight_rate = ra_info2&0xFF;
> > > > > > -			lowest_rate = (ra_info2>>8)  & 0xFF;
> > > > > > 
> > > > > >  		}
> > > > > >  		break;
> > > > > 
> > > > > rate_mask{1,2} and ra_info{1,2} seems to be unused as well.
> > > > > 
> > > > > thank you,
> > > > > 
> > > > > fabio
> > > > 
> > > > Hello Fabio,
> > > > 
> > > > I'm not sure about it: rtw_read32 calls a pointer to a function. I'm 
don't
> > > > know drivers programming, however that function looks like an
> > 
> > implementation
> > 
> > > > of a read() system call. So I wouldn't be so sure to remove those 
calls.
> > > > 
> > > > Could calling a (*read) method have side effects on subsequent read()? 
I
> > 
> > mean:
> > > > could it update some internal data structure? If not I can remove the
> > > > variables you mentioned above and the calls to read32.
> > > > 
> > > > I'm looking forward to read your reply.
> > > > 
> > > > Thanks,
> > > > 
> > > > Fabio
> > > 
> > > hi Fabio,
> > > 
> > > rtw_read32 is a macro wrapping _rtw_read32() defined as follows (in 
core/
> > 
> > rtw_io.c):
> > 
> > Hi Fabio,
> > 
> > Thanks a lot for your reply.
> > 
> > However, There is something less than clear to me... how did you find that
> > rtw_read32 is a macro wrapping _rtw_read32()? I mean: I knew that, in vim, 
one
> > can go to the definition of something by using ctrl-] key.
> > 
> > If I do that on rtw_read32 it takes me to a static definition of it in
> > drivers/net/wireless/realtek/rtw88/hci.h. This is a one line function:
> > 
> > static inline void rtw_write32(struct rtw_dev *rtwdev, u32 addr, u32 val)
> > {
> > 
> >         rtwdev->hci.ops->write32(rtwdev, addr, val);
> > 
> > }
> > 
> > When I use ctrl-] on write32() it takes me to struct rtw_hci_ops in 
drivers/
> > net/wireless/realtek/rtw88/hci.h.
> > 
> > After that I wanted to find where the member (*read32)() is assigned but I
> > don't know where and how to grep it: I tried "grep -rn "\bwrite32\b=" 
drivers/
> > staging/rtl8723bs/" but I found nothing...
> > 
> > Can you please explain what I'm doing wrong in following the path I 
mentioned
> > above and how you find out that macro?
> 
> $grep -r 'define\s*\brtw_read32' drivers/staging/rtl8723bs/
> 
Really interesting... does it imply that ctrl-] is broken? Or, does it just 
imply that I should use ctrl-] *if_and_only_if* the the command you showed 
above outputs nothing?

I think that automated finding of definitions is a fundamental tool, so I'd 
like to understand, in general, what are the steps and in which order they 
should be carried out. I'd really appreciate if you can list all the necessary 
steps. Other newcomers would benefit from that, IMO.

Apart the above question, I'm going to remove the other unused variables and 
add a Suggested-by in v2.

Thanks again,

Fabio
>
> it's a grep I always do to check if a function is actually
> a function or a macro..
> 
> > Thanks for your time,
> > 
> > Fabio
> > 
> > > u32 _rtw_read32(struct adapter *adapter, u32 addr)
> > > {
> > > 
> > >         u32 r_val;
> > >         /* struct       io_queue        *pio_queue = (struct io_queue
> > > 
> > > *)adapter->pio_queue; */ struct io_priv *pio_priv = &adapter->iopriv;
> > > 
> > >         struct  intf_hdl                *pintfhdl = &(pio_priv->intf);
> > >         u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
> > >         
> > >         _read32 = pintfhdl->io_ops._read32;
> > >         
> > >         r_val = _read32(pintfhdl, addr);
> > >         return rtw_le32_to_cpu(r_val);
> > > 
> > > }
> > > 
> > > the actual read seems to be performed by the handler contained in
> > > 
> > > 	pintfhdl->io_ops._read32;
> > > 
> > > so:
> > > 
> > > $ grep -r '\b_read32' drivers/staging/rtl8723bs/
> > > 
> > > drivers/staging/rtl8723bs/hal/sdio_ops.c:	ops->_read32 =
> > 
> > &sdio_read32;
> > 
> > > this is the place where _read32 is stored with sdio_read32 reference...
> > > 
> > > drivers/staging/rtl8723bs/core/rtw_io.c:	u32 (*_read32)(struct
> > 
> > intf_hdl *pintfhdl, u32
> > 
> > > addr); drivers/staging/rtl8723bs/core/rtw_io.c:	_read32 = pintfhdl-
> > >
> > >io_ops._read32;
> > >
> > > ...
> > > 
> > > if you check it in hal/sdio_ops.c, nothing is written, just reads are
> > > performed (and it's not odd, for a read function isn't supposed to write
> > > something under the hood ;)).
> > > 
> > > I think those variables could be easily removed as W=1 gcc suggests.
> > > 
> > > thank you,
> > > 
> > > fabio
> 
> thanks,
> 
> fabio




