Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0203D70
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 18:07:10 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nO1TG-00016A-Ub; Sat, 26 Feb 2022 19:07:06 +0100
Date: Sat, 26 Feb 2022 19:07:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] staging: r8188eu: cnt is set but not used
Message-ID: <20220226180706.wierfb2ancom32zn@viti.kaiser.cx>
References: <20220226144843.1118951-1-martin@kaiser.cx>
 <20220226144843.1118951-4-martin@kaiser.cx>
 <1c44c931-5b90-03d8-94bd-5e68682c4787@gmail.com>
 <184f741c-60ed-fe32-5705-08f9769e926a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184f741c-60ed-fe32-5705-08f9769e926a@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> On 2/26/22 19:57, Pavel Skripkin wrote:
> > Hi Martin,

> > On 2/26/22 17:48, Martin Kaiser wrote:
> > > In function recv_func, the cnt variable is set but not used.
> > > It can be removed.

> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > > ---
> > >   drivers/staging/r8188eu/core/rtw_recv.c | 2 --
> > >   1 file changed, 2 deletions(-)

> > > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > > index 0144c4642911..9a2e2bc2e294 100644
> > > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > > @@ -1798,11 +1798,9 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
> > >   	if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
> > >   	    psecuritypriv->busetkipkey) {
> > >   		struct recv_frame *pending_frame;
> > > -		int cnt = 0;
> > >   		pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
> > >   		while (pending_frame) {

> > Just out of curiosity: is this thing infinity loop?


> Hm.

> This function is called only inside a tasklet. IIRC it's not ok to have this
> kind of loops in softirq context

What exactly is this doing that's not allowed in a tasklet? Does it call
anything that could potentially block? 

If I pull rtw_alloc_recvframe into the loop, that function uses spin_lock_bh +
spin_unlock_bh, I guess this is ok. As for recv_func_posthandle, I don't
see anything where we could be stuck...

Thanks,
Martin
