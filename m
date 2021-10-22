Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E272
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:21:21 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mdqje-0001HT-GL; Fri, 22 Oct 2021 11:21:10 +0200
Date: Fri, 22 Oct 2021 11:21:10 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: r8188eu: use helper to check for broadcast
 address
Message-ID: <20211022092110.d2mcmf2qe2jtkld4@viti.kaiser.cx>
References: <20211020195401.12931-1-martin@kaiser.cx>
 <20211020195401.12931-3-martin@kaiser.cx>
 <YXCFFO//n9N6MZXv@equinox>
 <f5657f12-e20e-5cd9-e872-32e294741e88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5657f12-e20e-5cd9-e872-32e294741e88@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> > > +		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))

> Hi Martin,

> I'm not an expert regarding alignment. Is GetAddr1Ptr(pframe) always
> __aligned(2) as required by is_broadcast_ether_addr?

Hi Michael,

thanks for spotting this. To be honest, I didn't look at this in much
detail when I wrote the patch.

I suppose the pframe comes from recvbuf2recvframe().
precvframe = rtw_alloc_recvframe(pfree_recv_queue);
with
struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue; 

This should be initialised in _rtw_init_recv_priv().
rtw_init_queue(&precvpriv->free_recv_queue);
...
precvpriv->precv_frame_buf = (u8 *)N_BYTE_ALIGMENT((size_t)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
precvframe = (struct recv_frame *)precvpriv->precv_frame_buf;
and the frames are added to the free_recv_queue.
RXFRAME_ALIGN_SZ is 1<<8.

So pframe should be 256-byte aligned.
GetAddr1Ptr adds 4 to the start of pframe.

I guess we're safe here.

> > > @@ -841,7 +840,7 @@ void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
> > >   		psta = pDM_Odm->pODM_StaInfo[i];
> > >   		if (IS_STA_VALID(psta) &&
> > >   		    (psta->state & WIFI_ASOC_STATE) &&
> > > -		    memcmp(psta->hwaddr, bcast_addr, ETH_ALEN) &&
> > > +		    !is_broadcast_ether_addr(psta->hwaddr) &&

> Perhaps we should add __aligned(2) to the hwaddr variable in struct
> sta_info to be safe?

> u8	hwaddr[ETH_ALEN] __aligned(2);

Hmm, some of those arrays in other parts of the kernel have
__aligned(2), others don't...

Can anyone else give some guidance?

Thanks,
Martin
