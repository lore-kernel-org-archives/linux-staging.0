Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF27E;
	Thu, 20 Oct 2022 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666254774; bh=uGJOECvwfecP73hjHqlzR9cNSPgQFEOXZh8iGxXlhK4=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=VvBzD7UnofAdVZBvHTdVje69l0ptJIVbzwQxNQ1w5v8CV80HndQ2zYvb65Obmkvwv
	 +nLKKQyE+nFO1aXlIXOgRfxomp7yIZ/07LXgv6rcmjNSysH9hszk88cxl6yuvY9p5+
	 KZq+aX6AIl9AFmsc4cM0UhPoH094jquBJi3Xrrv0=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 10:32:54 +0200 (CEST)
X-EA-Auth: ijwdOOfmZqwZyS0vGc/OQ3+uaqZHbCqE/oag4KaC7DzGRAKkSd8aRAUbI2pDVef5kL0Gx/gReKkA8q+s/9lR0JHQPUBYizlB
Date: Thu, 20 Oct 2022 14:02:49 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: Re: [PATCH v3 05/10] staging: r8188eu: correct misspelled words in
 comments
Message-ID: <Y1EHsXYlgukZIkaC@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666249715.git.drv@mailo.com>
 <3235c0f681d817f7f89dd80537f36e1f9686fa24.1666249716.git.drv@mailo.com>
 <Y1EFMt6fjLdRirnA@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1EFMt6fjLdRirnA@kadam>

On Thu, Oct 20, 2022 at 11:22:10AM +0300, Dan Carpenter wrote:
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

ahhh... That's insane. I must have overlooked the code-spell indication. Thank you for
catching it Dan. I will wait for feedback on other patches and accordingly send
in the revised version.

./drv

>
> >  	       }
> >
> >  		*pold_state = networktype;
>
> regards,
> dan carpenter


