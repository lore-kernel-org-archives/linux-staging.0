Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0B2F82
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 21:15:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id t4so3238350ejo.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZFlhpygn8M9EkNHixa9n8+YKO0Uh75M+mziq2r4Nds=;
        b=fWgz6f4yosjxvhK4oBJWUk//RGRkA5YzgIO8cuEHztdUjOnp1b8XsIYsoB/pCBJJjY
         Jlyafl1sV6eNHsZabINsp8uAb2fEpHvEqNurFqdHiujovezcXHGhm/LLnVR/LTjeRnCH
         7xKFou6fU45nCDikjE5XRopc4GayoCnWNGECAVKL+DQAHUkTOSFDaPi2qZJr8RCehjUm
         E8arJ3jNbv8LzH9WCPlo2pu8FD0pMB9cIB6wXnCi2rplaaADuazTLt4B5+5e9lL02tF4
         8BR2p3GONx4jeFsBPgveLcp8LdU8gqchxyfQzCJtS/DAVxjymBAZyxMENgnZyGwx/aRq
         LP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZFlhpygn8M9EkNHixa9n8+YKO0Uh75M+mziq2r4Nds=;
        b=C+0tgLXh67GEthhbRKCXFvZN/sV7lRDW49GZ6bpGXcCrdI1a0XuT8mfBQG3wV5YJZF
         VSmuQrQm/HDJALtR1pp7gaMtxlYS06w88DezdV8KFgw196zPqu8pxHONyLliyJdt4fS5
         Z8BWm4cmx9HOc1rf0RoM0QvRqAanfOsfxoN3Tt+XiOSlV8/VRRcEyCKK8fsxCmi1RO3O
         l2fAKfE87PY5cRUT2Er5/gvKfHm2WGYbjEjM9gI2JRUJLEyaXqQGVDs66NwpI1cP4EX0
         4CE2ZZXQBMxNnZK2ksAfw34bZ2mnXE90QhuBiHmNXZQhFMhscv3xyIXmVqouTaY20X1B
         pVzQ==
X-Gm-Message-State: AOAM532pbQuA3cOJpzUbmyc5pBoC2oB1EtbbiKOc5DOyIU9FE7j9r1eF
	6ksRN3nfDrweDB7zoJYHP3w=
X-Google-Smtp-Source: ABdhPJxcQnmKb0hGu52KiMZlWh4alDUzBnl4/bSO/ZkRymltqG5TaE2LDvOQDdi8IVDhWWtD/jR10A==
X-Received: by 2002:a17:906:e105:: with SMTP id gj5mr8964318ejb.388.1619471742561;
        Mon, 26 Apr 2021 14:15:42 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id sb20sm1390477ejb.100.2021.04.26.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 14:15:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [PATCH v3] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Mon, 26 Apr 2021 23:15:40 +0200
Message-ID: <107967147.Ip005GxVp3@linux.local>
In-Reply-To: <20210426192101.GQ235567@casper.infradead.org>
References: <20210426184245.12269-1-fmdefrancesco@gmail.com> <20210426192101.GQ235567@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, April 26, 2021 9:21:01 PM CEST Matthew Wilcox wrote:
> On Mon, Apr 26, 2021 at 08:42:45PM +0200, Fabio M. De Francesco wrote:
> > +static void setup_scsitaskmgmt_handles(struct xarray *xa, struct 
uiscmdrsp *cmdrsp,
> > 
> >  				       wait_queue_head_t *event, 
int *result)
> >  
> >  {
> > 
> > -	/* specify the event that has to be triggered when this */
> > -	/* cmd is complete */
> > -	cmdrsp->scsitaskmgmt.notify_handle =
> > -		simple_idr_get(idrtable, event, lock);
> > -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> > -		simple_idr_get(idrtable, result, lock);
> > +	u32 id;
> > +	int ret;
> > +
> > +	/* specify the event that has to be triggered when this cmd is 
complete */
> > +	id = (u32)cmdrsp->scsitaskmgmt.notify_handle;
> > +	ret = xa_alloc_irq(xa, &id, event, XA_LIMIT(1, INT_MAX), 
GFP_KERNEL);
> 
> OK, think this one through a bit.  When xa_alloc_irq() stores the ID that
> it assigned into 'id', what happens to it next?
>
Oh, I overlooked that... The ID in 'id' is lost when the function exits and 
the stack frame is unwound.

Now I have another problem: xa_alloc_irq() writes id u32* but I have an u64* 
in 'id'. What happens if I cast 'id' to an u32* when passing it to 
xa_alloc_irq()?

u64 *id;
int ret;
id = &cmdrsp->scsitaskmgmt.notify_handle;
ret = xa_alloc_irq(xa, (u32 *)id, event, XA_LIMIT(1, INT_MAX), GFP_KERNEL);

Do I destroy the information stored in 'id' with that cast?
> 
> > +	id = (u32)cmdrsp->scsitaskmgmt.notifyresult_handle;
> > +	ret = xa_alloc_irq(xa, &id, result, XA_LIMIT(1, INT_MAX), 
GFP_KERNEL);
> > 
> >  }
> > 
> > @@ -1053,8 +1018,6 @@ static int visorhba_probe(struct visor_device *dev)
> > 
> >  	if (err)
> >  	
> >  		goto err_debugfs_info;
> > 
> > -	idr_init(&devdata->idr);
> 
> You still need to initialise the XArray, either with xa_init() or by
> using DEFINE_XARRAY.  Since it's dynamically allocated, the former is
> correct.
>
I had read that XArray must be initialized with xa_init(). However, when I 
deleted the line with the initialization of the IDR, I forgot to replace it 
with a statement that uses xa_init().

Thanks,

Fabio




