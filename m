Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82D173
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 17:37:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c9so9469462wrt.5
        for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vW8tFxi+eZ4ew0CNxb6xm4hWC8hncULQUNWJqEVWN5k=;
        b=PKrZS0K+sJJRFXn1PyzgDQd04q8zWTUvBQ0PX2HHwZgAxzJf6evpMlzYjPqVJI13vF
         liSPJ1uUAuc7U02J3nul8vZM/6CuzrTQAIs014yvgWf6H9T92FSFxj3jcubqroN6VGeJ
         +FWD6Od8+R0oRfyMld/tPJvuaOQV3QnbGRgGotq6k0w2P/Cwy2VwlADPMnlJLrEBR2RS
         BdvyeT2pt0X8x+noLzMLPIddrK7u+gj2vW8aELkhS17npUDIIqiSVR7NryNF/Ksd1IRp
         e6i16Q73sQv3FCuIx6yiu+AxIiNNyF+eHE7aDgy9/OCVK8DB7Kpinn4LJ74HHuo4mkgT
         +nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vW8tFxi+eZ4ew0CNxb6xm4hWC8hncULQUNWJqEVWN5k=;
        b=TWrS+lkB0ndgb80iikDcBhLK4IJz8789Vrn1zLeIDCv3RgodfUXF7Hr7VJyONHV7sX
         Pbmo1JQhA+Xae8WzIRlm+oCJLSMA6wDmzSzkNomUbuZCxVUA046+PgTn221Qb8vM4kSl
         o3HlbKNJOLJXGw1g845Wijj5ZkF5jeOX5pnL2Za9VP8SVDBxS5B9G9Uc29AoYHYzzx8v
         xKho+U0B6Mq7oH1nmAj+NHwDSEh/MBynb62yTxAchvB3fJEha7umIILBT5t7CVHcxu5x
         DQVZ0YZ5Go5q8Ucf5vG4UwnD79/+mD2O8dF2uvEeVGdrwpZJAPhyYWBiLwfX6oVaJtXp
         1RNA==
X-Gm-Message-State: AOAM532krtQAj+HebJAESUdful7di8mKjVn6jIPenR59EkVQW+G2iaiH
	xppwKT4vFhHVUu8Kx8NEQcQb2w==
X-Google-Smtp-Source: ABdhPJzlBy5uJP96SgskJ/VIN/jo1WbK1RqcJFWUjDnz/7kmT8zCW9VN4JVjOrSFP8SehtgLXmPz4A==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr9830932wrx.107.1623519454717;
        Sat, 12 Jun 2021 10:37:34 -0700 (PDT)
Received: from KernelVM (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id 32sm12432991wrs.5.2021.06.12.10.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 10:37:34 -0700 (PDT)
Date: Sat, 12 Jun 2021 18:37:32 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, kaixuxia@tencent.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	liushixin2@huawei.com, unixbhaskar@gmail.com, gustavoars@kernel.org,
	martin@kaiser.cx, bkkarthik@pesu.pes.edu
Subject: Re: [PATCH 5/6] staging: rtl8188eu: remove
 DebugComponents/DebugLevel from odm_dm_struct
Message-ID: <YMTw3OQbxRdUccK6@KernelVM>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
 <20210611002504.166405-2-phil@philpotter.co.uk>
 <20210611002504.166405-3-phil@philpotter.co.uk>
 <20210611002504.166405-4-phil@philpotter.co.uk>
 <20210611002504.166405-5-phil@philpotter.co.uk>
 <20210611002504.166405-6-phil@philpotter.co.uk>
 <20210611090819.GD10983@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611090819.GD10983@kadam>

On Fri, Jun 11, 2021 at 12:08:19PM +0300, Dan Carpenter wrote:
> On Fri, Jun 11, 2021 at 01:25:03AM +0100, Phillip Potter wrote:
> > diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> > index 80cdcf6f7879..3e7f184ed39a 100644
> > --- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
> > +++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> > @@ -1851,11 +1851,6 @@ u8 rtw_hal_get_def_var(struct adapter *Adapter, enum hal_def_variable eVariable,
> >  		}
> >  		break;
> >  	case HW_DEF_ODM_DBG_FLAG:
> > -		{
> > -			struct odm_dm_struct *dm_ocm = &haldata->odmpriv;
> > -
> > -			pr_info("dm_ocm->DebugComponents = 0x%llx\n", dm_ocm->DebugComponents);
> > -		}
> >  		break;
> 
> We will want to delete everything to do with ODM_DBG_FLAG but that can
> be done in later patches.
> 
> regards,
> dan carpenter
> 
Dear Dan,

Thanks, yeah I considered taking this clause out of the switch
completely, but I wanted to keep the patch set focused just to removal
of odm_debug.h - I'll get this done next :-) Thanks for your feedback.

Regards,
Phil
