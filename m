Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F07B
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 09:47:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k62so857269pgd.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r9GDWyDCDQbP8gK/rtX9xXTioe+x5z2qA2AuchM8mAw=;
        b=JY3mZMPztCqqQuPe1aPtE9RB3QEAYQADsrKPe0tCVFEhkIT12dwrhUAZz13CMpW8ss
         pDgg26/lhYh0mdIavRkBrTkqgPKLh2v/QP9e7/Tp0G7foutWFTWM8sjwbYdkjft7Dhpa
         wUdm1lymR8mZ0EeSuZU18mKJypSGtgUU/tGKHebJsd8tREZNsxgSVyhtBjRpnCpPJn72
         UCbxUkxDTfG+IEbHLcCHgdnWNQOO8079K/45evp7TzD7oAWkE9/hg0tfM1tYufE0E32e
         zCHTPrhwP/nyO3i6eESdeC1F2BRJvxTc1E1mGQJjXlhbV/lH/alztYJfkO4dtpQA7wtl
         DkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r9GDWyDCDQbP8gK/rtX9xXTioe+x5z2qA2AuchM8mAw=;
        b=0ZKlmogr/qh4mJuHewi/ao1Jh4AvkvgC8I8CG/E+sq73Y12EbF/TdJCNkUhGbf+1mF
         GTRPu9dGp1L3k1/kH2AOwD9j5HezBc0iS8WFunRp6aQbubM8hYOmuk8FbNJe0ryWB8P9
         ieahr2wxEtGpZ8EzwKnQFQQ9stkBpNCVSV8fwzWLLnIpmsWuYr/qdXZM88CN+xAOG1Jv
         e2G+D1FOahR9ki+f/Ue9tdstg4blaY8AbSytlAdWFe7Du6uaDIEGArHwA92Cp5XTpQer
         kVJz1rhriPxQFCkum175UxC5FdN9opyWw+a/cwFbvlasLFubnQ8Vxq1O7PF3gQCNowAa
         gj+A==
X-Gm-Message-State: AOAM5337P/Jbvkkb4tfR4rKltxMrELmJ1h3j6FeEZrPgpeCCh01EUeXh
	T+mepHNfuDctIjijq9tpUAw=
X-Google-Smtp-Source: ABdhPJx91tvep5CKWCfz4Jn+VMz/Qmp8ixmWlQWXwKFaPxVujm+Yy+KiY+60mh/jdLI/s9MGwASYMA==
X-Received: by 2002:a65:5a8e:0:b0:365:3b6:47fb with SMTP id c14-20020a655a8e000000b0036503b647fbmr5847841pgt.147.1650016030122;
        Fri, 15 Apr 2022 02:47:10 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id s19-20020aa78d53000000b004fdaae08497sm2241832pfe.28.2022.04.15.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 02:47:09 -0700 (PDT)
Date: Fri, 15 Apr 2022 17:47:05 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Message-ID: <20220415094705.aibh3jr4wzhddmud@ppc.localdomain>
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
 <20220414154215.GL3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414154215.GL3293@kadam>

Hi Dan, thx for your review.

On 22/04/14 06:42PM, Dan Carpenter wrote:
> On Thu, Apr 14, 2022 at 10:12:23PM +0800, Wang Cheng wrote:
> > Due to the case that "requesttype == 0x01 && status <= 0"
> > isn't handled in r8712_usbctrl_vendorreq(),
> > "data" (drivers/staging/rtl8712/usb_ops.c:32)
> > will be returned without initialization.
> > 
> > When "tmpU1b" (drivers/staging/rtl8712/usb_intf.c:395)
> > is 0, mac[6] (usb_intf.c:394) won't be initialized,
> > which leads to accessing uninit-value on usb_intf.c:541.
> 
> These line numbers are sort of useless because everyone is on a
> different git hash.

I will correct this.

>
> > 
> > Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> > ---
> >  drivers/staging/rtl8712/usb_intf.c      |  6 +++---
> >  drivers/staging/rtl8712/usb_ops_linux.c | 14 ++++++++------
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> > index ee4c61f85a07..50dcd3ecb685 100644
> > --- a/drivers/staging/rtl8712/usb_intf.c
> > +++ b/drivers/staging/rtl8712/usb_intf.c
> > @@ -538,13 +538,13 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
> >  		} else {
> >  			AutoloadFail = false;
> >  		}
> > -		if (((mac[0] == 0xff) && (mac[1] == 0xff) &&
> > +		if ((!AutoloadFail) ||
> > +		    ((mac[0] == 0xff) && (mac[1] == 0xff) &&
> >  		     (mac[2] == 0xff) && (mac[3] == 0xff) &&
> >  		     (mac[4] == 0xff) && (mac[5] == 0xff)) ||
> >  		    ((mac[0] == 0x00) && (mac[1] == 0x00) &&
> >  		     (mac[2] == 0x00) && (mac[3] == 0x00) &&
> > -		     (mac[4] == 0x00) && (mac[5] == 0x00)) ||
> > -		     (!AutoloadFail)) {
> > +		     (mac[4] == 0x00) && (mac[5] == 0x00))) {
> >  			mac[0] = 0x00;
> >  			mac[1] = 0xe0;
> >  			mac[2] = 0x4c;
> 
> This is a separate fix from the rest of the patch.  Send it by itself.

Ah, thought to send a patch series.

> 
> 
> > diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
> > index f984a5ab2c6f..e321ca4453ca 100644
> > --- a/drivers/staging/rtl8712/usb_ops_linux.c
> > +++ b/drivers/staging/rtl8712/usb_ops_linux.c
> > @@ -495,12 +495,14 @@ int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
> >  	}
> >  	status = usb_control_msg(udev, pipe, request, reqtype, value, index,
> >  				 pIo_buf, len, 500);
> > -	if (status > 0) {  /* Success this control transfer. */
> > -		if (requesttype == 0x01) {
> > -			/* For Control read transfer, we have to copy the read
> > -			 * data from pIo_buf to pdata.
> > -			 */
> > -			memcpy(pdata, pIo_buf,  status);
> > +	/* For Control read transfer, copy the read data from pIo_buf to pdata
> > +	 * when control transfer success; otherwise init *pdata with 0.
> > +	 */
> > +	if (requesttype == 0x01) {
> > +		if (status > 0)
> > +			memcpy(pdata, pIo_buf, status);
> > +		else
> > +			*(u32 *)pdata = 0;
> >  		}
> 
> This isn't really correct.  In many cases status is "len" is less than 4.
> I'm slightly surprised that nothing complains about that as an
> uninitialized access.  But then another problem is that "status" can be
> less than "len".

Sorry, I should explain it clearly. If I did right, watching "status"
with gdb while running syzkaller reproducer, "status" returns from
usb_control_msg() is -71. In which case, *pdata won't be touched in
r8712_usbctrl_vendorreq(). As a result, "data" in
usb_read8()/usb_read16()/usb_read32() will be returned without
initialization. I think that is why kmsan reports:
Local variable data created at:
 usb_read8+0x5d/0x130 drivers/staging/rtl8712/usb_ops.c:33
 r8712_read8+0xa5/0xd0 drivers/staging/rtl8712/rtl8712_io.c:29

> 
> A better fix instead of setting pdata to zero would be to add error
> checking in the callers and then change this code to use
> usb_control_msg_send/recv().  Probably just initialize "data" in the
> callers as well.

I tried something similar which also works fine, but I think this patch
does't fix it at root.
https://syzkaller.appspot.com/text?tag=Patch&x=15be2970f00000

> 
> regards,
> dan carpenter
> 
thanks,
-- w
