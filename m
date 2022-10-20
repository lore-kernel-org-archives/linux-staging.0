Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5D47E;
	Thu, 20 Oct 2022 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666257486; bh=GukR2CMrVPcVqTtLd/FTF7yiaO1+yZ1rgHkKOkwIdUo=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=IEC8ZAdq7UbkFUPxHm6WhuTVqWx/R4Ff6SREXawdG5CfLSAFx3OHjGIkC63pe+P9k
	 uEZ/HOfV2MLewTP5agGoY4QWpDrJ8Q5j6BKq3w/R8cB1njiPiduAlO47xXXXs+a8zm
	 MOT7CFRmRtXbApF2eHeL+qKz8kbqcHdjpCACNCgk=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 11:18:06 +0200 (CEST)
X-EA-Auth: HnzJG3oziDi8GkDVDBNSm+UTwAFcQuUiF+SSgLtU4FldHIbfWS8BBiq1wyjJPI5fKLQhHVDu3AQgZpytAfWmzeuV2hTmeP/+
Date: Thu, 20 Oct 2022 14:48:01 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, outreachy@lists.linux.dev,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	paskripkin@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v3 05/10] staging: r8188eu: correct misspelled words in
 comments
Message-ID: <Y1ESSfUc/wW+cc6F@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666249715.git.drv@mailo.com>
 <3235c0f681d817f7f89dd80537f36e1f9686fa24.1666249716.git.drv@mailo.com>
 <Y1EFMt6fjLdRirnA@kadam>
 <72b89e31-20b8-ab7c-a447-ff2d216da8de@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72b89e31-20b8-ab7c-a447-ff2d216da8de@inria.fr>

On Thu, Oct 20, 2022 at 11:12:54AM +0200, Julia Lawall wrote:
>
>
> On Thu, 20 Oct 2022, Dan Carpenter wrote:
>
> > On Thu, Oct 20, 2022 at 01:25:16PM +0530, Deepak R Varma wrote:
> > > diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > > index 55e6b0f41dc3..1de808832ed8 100644
> > > --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > > +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> > > @@ -287,7 +287,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
> > >
> > >  		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
> > >  			if (check_fwstate(pmlmepriv, _FW_LINKED))
> > > -				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have chked whether  issue dis-assoc_cmd or not */
> > > +				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have cheked whether  issue dis-assoc_cmd or not */
> >
> >
> > s/cheked/checked/
>
> There is also a strange double space before issue.

Thanks. "While in there..." opportunity on revision :)

>
> julia
>
> >
> > >  	       }
> > >
> > >  		*pold_state = networktype;
> >
> > regards,
> > dan carpenter
> >
> >
>


