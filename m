Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBA7E;
	Thu, 20 Oct 2022 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A2OD/3lXR+n8/xF7zMwneo+Y64iQCKSfGS8WUfo7cmM=;
  b=DSC40wcEcg6nyMHFSfwrSXX0ufvWBEcYlz7+hySs91kMYO7DDvZhUGdg
   jgfqmCdsLM9m/Lzjt+PzxOdXn6fPdalBKI1r/tp7yeMOfuwgCGpuR+Ns7
   D7cGIgzaIsokpkq0cFiTQWq4g4VIQisFwJvpNeF+1dQGZrYJlwsIOE0Xo
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,198,1661810400"; 
   d="scan'208";a="66128175"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 11:12:54 +0200
Date: Thu, 20 Oct 2022 11:12:54 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>
cc: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev, 
    Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com, 
    saurabh.truth@gmail.com
Subject: Re: [PATCH v3 05/10] staging: r8188eu: correct misspelled words in
 comments
In-Reply-To: <Y1EFMt6fjLdRirnA@kadam>
Message-ID: <72b89e31-20b8-ab7c-a447-ff2d216da8de@inria.fr>
References: <cover.1666249715.git.drv@mailo.com> <3235c0f681d817f7f89dd80537f36e1f9686fa24.1666249716.git.drv@mailo.com> <Y1EFMt6fjLdRirnA@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 20 Oct 2022, Dan Carpenter wrote:

> On Thu, Oct 20, 2022 at 01:25:16PM +0530, Deepak R Varma wrote:
> > diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > index 55e6b0f41dc3..1de808832ed8 100644
> > --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > @@ -287,7 +287,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
> >
> >  		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
> >  			if (check_fwstate(pmlmepriv, _FW_LINKED))
> > -				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have chked whether  issue dis-assoc_cmd or not */
> > +				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have cheked whether  issue dis-assoc_cmd or not */
>
>
> s/cheked/checked/

There is also a strange double space before issue.

julia

>
> >  	       }
> >
> >  		*pold_state = networktype;
>
> regards,
> dan carpenter
>
>
