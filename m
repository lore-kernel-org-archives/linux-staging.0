Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CC2564
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 10:20:25 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nhqOg-0007ex-MY; Fri, 22 Apr 2022 12:20:18 +0200
Date: Fri, 22 Apr 2022 12:20:18 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: r8188eu: use ARRAY_SIZE for mlme_sta_tbl
Message-ID: <20220422102018.7xh3eqhnswd7tktp@viti.kaiser.cx>
References: <20220417102221.466524-1-martin@kaiser.cx>
 <20220417102221.466524-7-martin@kaiser.cx>
 <20220422100800.GG2462@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422100800.GG2462@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sun, Apr 17, 2022 at 12:22:21PM +0200, Martin Kaiser wrote:
> > Use ARRAY_SIZE instead of hard-coding the number of entries in the
> > mlme_sta_tbl array.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > index abb910f33c1c..973adebdd69c 100644
> > --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > @@ -404,7 +404,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
> >  		return;

> >  	index = (le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE) >> 4;
> > -	if (index > 13)
> > +	if (index > ARRAY_SIZE(mlme_sta_tbl))
>                   ^
> This is an off by one.  Should be >=.  The auto builders would have
> caught this eventually.

Thanks for spotting this, Dan. You're right, the array has 14 elements :-(

This has already made it into staging-next, I'll fix it in a new patch.

Best regards,
Martin

> >  		return;
> >  	fct = mlme_sta_tbl[index];

> regards,
> dan carpenter

