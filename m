Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF931C27;
	Sat, 14 Oct 2023 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7PKl/SB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7d532da4bso35722907b3.2;
        Sat, 14 Oct 2023 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697269183; x=1697873983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3pfyKY5IaoFuTuLVntmNnqtU1SUqO73JEN0YvBTiXE=;
        b=F7PKl/SBjw98+fFCm/3JrUtLbk50gj5MjAivgGXXkbh5LOZdu+5FKke03rcKoo5V5b
         CUesKZUrL8BC2jfe0YAByCP6T8z5hwwZjddb6AKNutIMJg5Xaun0PbjLBi2tz/9dsHTy
         LLIk7yy8PkU9afu1XCqZVJgQ/V4YUTM3nepJjcQ7gQGRyAvU3WsRKC+w2/0wTK/yArcs
         XpuSk/dgj8RS0l985vhhKC7PxHEaMtdvCS7++tiKbKCuCz2yhSiINdbPIc4b4fB1nTYa
         kLQglojbjT1fM4In1Y32nyZlTMj6wdhTxF6kvWrAE67COIzkGvGqV7Zkf3jrPhkadUYh
         n4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697269183; x=1697873983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3pfyKY5IaoFuTuLVntmNnqtU1SUqO73JEN0YvBTiXE=;
        b=XunowIjRCBUdw0HJ1kFaNbXr49wzFrlCO+NaM/d6uYMJpDpYJW6YfEpO9JzFXThE1w
         B2mi9RyNJ6GR7zmQEa/RBzzSBZGBIp2ik3GhBYm1B+lsxYU+JrHJ1i4qOzEYANc3ed/L
         X0e2SH2EjgOheBihWLoucVjwv4M+EN3PUXVsCWGY5CdrGRnpkS55VbCBVdkd7ynvSUJr
         jO40lKD+fATDq57UI6y+xAYKavtvhizKOGOcRH53eghCzRvkz5SXLYTgGhwYWJPeHcje
         dHcSKCwtuOVCrDrTm1R7stcP2F1vSOhBkUP7GWjriLPrGLiNfGaUX7pSROPQvdrmuhDG
         qrZw==
X-Gm-Message-State: AOJu0YwmEnRmLPYdrOVAbknkRlIMIynGqsU70FQMHZwY6BFI9QHFreo6
	SFuhKMYADplE9j9gVihkyTM=
X-Google-Smtp-Source: AGHT+IFLBBfUUgNr6LViOF1jpi5Iia8QBECN3q2/onj7OgNd1yfaPOAeXkVgoQpt6phF2TPyemePTw==
X-Received: by 2002:a81:a546:0:b0:592:5def:5c0d with SMTP id v6-20020a81a546000000b005925def5c0dmr31356836ywg.45.1697269183527;
        Sat, 14 Oct 2023 00:39:43 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id w3-20020a818603000000b0059c8387f673sm394202ywf.51.2023.10.14.00.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 00:39:41 -0700 (PDT)
Date: Sat, 14 Oct 2023 08:39:34 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Add bool type to qlge_idc_wait()
Message-ID: <ZSpFtrC5xuYzgZhw@gilbert-PC>
References: <ZSoxLxs45bIuBrHg@gilbert-PC>
 <alpine.DEB.2.22.394.2310140819450.3383@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310140819450.3383@hadrien>

On Sat, Oct 14, 2023 at 08:23:13AM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 14 Oct 2023, Gilbert Adikankwu wrote:
> 
> > Reported by checkpatch:
> >
> > WARNING: else is not generally useful after a break or return
> >
> > The idea of the break statements in the if/else is so that the loop is
> > exited immediately the value of status is changed. And returned
> > immediately. For if/else conditionals, the block to be executed will
> > always be one of the two. Introduce a bool type variable 's_sig' that
> > evaluates to true when the value of status is changed within the if/else
> > block.
> 
> The idea of the checkpatch warning is that eg
> 
> found = search();
> if (!found)
>   break;
> else do_something();
> 
> is equvalent to:
> 
> found = search();
> if (!found)
>   break;
> do_something();
> 
> Because now the normal computation is at top level and the if branches are
> only used for error handling.
> 
> But that is not the case in your code.  In your code, it seems that there
> are two cases where one would like to break out of the loop.  The code
> would be better left as it is.
> 
> julia

Thank you for the quick review. I thought about it the you described but
then realised the else was not redundant that was why I went the route
of trying to suppress the warning. I will revert the changes as you
have suggested

Gilbert
> 
> >
> > Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
> > ---
> >  drivers/staging/qlge/qlge.h     | 1 +
> >  drivers/staging/qlge/qlge_mpi.c | 8 ++++++--
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
> > index d0dd659834ee..b846bca82571 100644
> > --- a/drivers/staging/qlge/qlge.h
> > +++ b/drivers/staging/qlge/qlge.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/netdevice.h>
> >  #include <linux/rtnetlink.h>
> >  #include <linux/if_vlan.h>
> > +#include <linux/types.h>
> >
> >  /*
> >   * General definitions...
> > diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
> > index 96a4de6d2b34..44cb879240a0 100644
> > --- a/drivers/staging/qlge/qlge_mpi.c
> > +++ b/drivers/staging/qlge/qlge_mpi.c
> > @@ -909,6 +909,7 @@ int qlge_mb_wol_set_magic(struct qlge_adapter *qdev, u32 enable_wol)
> >  static int qlge_idc_wait(struct qlge_adapter *qdev)
> >  {
> >  	int status = -ETIMEDOUT;
> > +	bool s_sig = false;
> >  	struct mbox_params *mbcp = &qdev->idc_mbc;
> >  	long wait_time;
> >
> > @@ -934,14 +935,17 @@ static int qlge_idc_wait(struct qlge_adapter *qdev)
> >  		} else if (mbcp->mbox_out[0] == AEN_IDC_CMPLT) {
> >  			netif_err(qdev, drv, qdev->ndev, "IDC Success.\n");
> >  			status = 0;
> > -			break;
> > +			s_sig = true;
> >  		} else {
> >  			netif_err(qdev, drv, qdev->ndev,
> >  				  "IDC: Invalid State 0x%.04x.\n",
> >  				  mbcp->mbox_out[0]);
> >  			status = -EIO;
> > -			break;
> > +			s_sig = true;
> >  		}
> > +
> > +		if (s_sig)
> > +			break;
> >  	}
> >
> >  	return status;
> > --
> > 2.34.1
> >
> >
> >
