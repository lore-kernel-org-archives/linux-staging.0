Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB57B
	for <linux-staging@lists.linux.dev>; Tue, 10 May 2022 03:34:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so1034918pjm.1
        for <linux-staging@lists.linux.dev>; Mon, 09 May 2022 20:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CZ1QdS/D3rgCmw+Zycki6j1IWtRyZB2FiDM7FD6ZGy4=;
        b=lMmmY4nLRQd8BsH/lO2MBfdzCuU6S7jC3MHaOmd6hr7SwHTC8Rfu4Waack75xECioc
         1x49pTXz65EykrxjojpOYVDP9ZMpzMyeMpMW6LVEWwkonJ0F9Hrucxz3L6ASZX+h6BEH
         tsvs1YWPvK/FmEK7WUT6g0j4J8v5LP3OAtWs1RJv64+1RHhWDEj31Ood/o6kV1xsTMo4
         2z7hra6JfFy+OCvRUavVFd8Y4kqLWSka8wUK1BFh1mQpJyairE+KriSEhlYKn5BbmBz+
         7HT/c2a9wwaLr3j175eLkn1SYrYiYCsjFLaxWtxtm4s2BugCD1JTYW3ShtAGfpnIk+/W
         B59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CZ1QdS/D3rgCmw+Zycki6j1IWtRyZB2FiDM7FD6ZGy4=;
        b=DXLCSOkJlcXkKIN8XhyMBf8+8aqwDO4FaaqrDg6MIZ+ljPtixbxVEhQrXehZBw5dBg
         EBWUAFnRI0tIbU44rBOk4I7gECxqgN/+DHpmuxHmjnKtPt+Oc7C+2TsLzRSDx/seHuvn
         60uhAhKPz8F40sC5RnOdyCwCAIzSNPh/i6H7MuGge4/iwvkWmj5OaMrMy6SQVvmi7kcN
         xmcWEOCRMYcuQsEmNhgF1hqY3WvyYLQuLvhmj5DNpagceAFbMwnAb76JmJhZUhtlslSY
         UZ/HwGWbtTTCsve9s+oOTEKNyRU5pq92DBi70Lh11taMZauSqwNkgHfbAmjfNlJOAoHj
         4CEg==
X-Gm-Message-State: AOAM533yOWtYhnWa5mB8/HcSZfBvH1tnICVm7sH29e7/7BGHaT5xAiBk
	wH/d/cT+lIkjjPvRvqo171k=
X-Google-Smtp-Source: ABdhPJzBCOnWl+Fsjf8SC5B2ZH/hGKxtSSQwNDu2PN16mLJrvUj16WliQAJPgU/0i3PAKBpFzCvzRg==
X-Received: by 2002:a17:90a:f310:b0:1db:effb:a614 with SMTP id ca16-20020a17090af31000b001dbeffba614mr29401587pjb.233.1652153670101;
        Mon, 09 May 2022 20:34:30 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id c4-20020a170903234400b0015e8d4eb283sm664755plh.205.2022.05.09.20.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 20:34:29 -0700 (PDT)
Date: Tue, 10 May 2022 11:34:25 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] staging: rtl8712: fix uninit-value in usb_read8()
 and friends
Message-ID: <20220510033425.6uzanqtejdlmtwl2@ppc.localdomain>
References: <cover.1651833575.git.wanngchenng@gmail.com>
 <b9b7a6ee02c02aa28054f5cf16129977775f3cd9.1651833575.git.wanngchenng@gmail.com>
 <dba1acfa-1e82-7b6b-928a-beff18c51f5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba1acfa-1e82-7b6b-928a-beff18c51f5b@gmail.com>

On 22/05/06 03:12PM, Pavel Skripkin wrote:
> Hi Wang,
> 
> On 5/6/22 14:59, Wang Cheng wrote:
> > Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> > ---
> >   drivers/staging/rtl8712/usb_ops.c | 27 ++++++++++++++++++---------
> >   1 file changed, 18 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8712/usb_ops.c b/drivers/staging/rtl8712/usb_ops.c
> > index e64845e6adf3..af9966d03979 100644
> > --- a/drivers/staging/rtl8712/usb_ops.c
> > +++ b/drivers/staging/rtl8712/usb_ops.c
> > @@ -29,7 +29,8 @@ static u8 usb_read8(struct intf_hdl *intfhdl, u32 addr)
> >   	u16 wvalue;
> >   	u16 index;
> >   	u16 len;
> > -	__le32 data;
> > +	int status;
> > +	__le32 data = 0;
> >   	struct intf_priv *intfpriv = intfhdl->pintfpriv;
> >   	request = 0x05;
> > @@ -37,8 +38,10 @@ static u8 usb_read8(struct intf_hdl *intfhdl, u32 addr)
> >   	index = 0;
> >   	wvalue = (u16)(addr & 0x0000ffff);
> >   	len = 1;
> > -	r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index, &data, len,
> > -				requesttype);
> > +	status = r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index,
> > +					 &data, len, requesttype);
> > +	if (status < 0)
> > +		return 0;
> 
> Wait, but what about partial reads? I see that r8712_usbctrl_vendorreq()
> uses `usb_control_msg()` which can read less data than was requested.
> 
> So here you are just hiding these error by zeroing data
> 
> >   	return (u8)(le32_to_cpu(data) & 0x0ff);
> >   }
> 
> And as i said in previous email: caller can't see an error.
> 
> Imagine caller waits for some register to become 0. Caller sees that
> usb_read8() returned 0. Is it an error? Is register really become 0?
> 
> 
> Generic read API prototype looks like following:
> 
> int read_something(struct my_cool_dev *dev, void *data, size_t size);
> 
> and it returns 0 on success and -errno on failure and data returned via
> passed pointer. So, if API returned an error caller should not touch @data,
> since likely it's uninitialized

Thank you for your remind, sorry I didnt understand your previous reply
about "register and 0" that you explain very clearly above. I am thinking
about it standing on that the return type of usb_read8() is u8.

thanks,
- w
