Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653C3D70
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 17:59:46 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nO1M5-00011E-S8; Sat, 26 Feb 2022 18:59:41 +0100
Date: Sat, 26 Feb 2022 18:59:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] staging: r8188eu: cnt is set but not used
Message-ID: <20220226175941.jsizwogfd5wxjm2p@viti.kaiser.cx>
References: <20220226144843.1118951-1-martin@kaiser.cx>
 <20220226144843.1118951-4-martin@kaiser.cx>
 <1c44c931-5b90-03d8-94bd-5e68682c4787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c44c931-5b90-03d8-94bd-5e68682c4787@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> Hi Martin,

> On 2/26/22 17:48, Martin Kaiser wrote:
> > In function recv_func, the cnt variable is set but not used.
> > It can be removed.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/core/rtw_recv.c | 2 --
> >   1 file changed, 2 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index 0144c4642911..9a2e2bc2e294 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -1798,11 +1798,9 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
> >   	if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
> >   	    psecuritypriv->busetkipkey) {
> >   		struct recv_frame *pending_frame;
> > -		int cnt = 0;
> >   		pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
> >   		while (pending_frame) {

> Just out of curiosity: is this thing infinity loop?

yes it is. And the issue has been present since the driver was first
merged. Let's fix this before removing cnt so that the fix can be
backported to stable. I'll send out v2 shortly.

Thanks,
Martin

> > -			cnt++;
> >   			recv_func_posthandle(padapter, pending_frame);
> >   		}

> Nit: bracers can be removed

> >   	}




> With regards,
> Pavel Skripkin
