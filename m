Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C063E7B;
	Tue,  1 Nov 2022 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667334610; bh=0xTjCkfnnHOzBJnGaTrLX2LUmGNMU22I5WIcMTwmEGY=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Lki4df+Thgwj/gpwVq7TAa/DGgGDHvt7dg7LyayTOpZJDdjK8AjhVYsxomKGvMCw2
	 iq51AovB3WmZL4hY9IJSY5Oo/aF8K393BIuzQ1XCjku/CHllySiwSHXyB9FZUT2s5Q
	 12V4Um8ys5h483QmYXIwe5qESDOZ5iq9H8lxfbM0=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via [213.182.55.206]
	Tue,  1 Nov 2022 21:30:10 +0100 (CET)
X-EA-Auth: flZTjBEuuUNw2ArB64248TgEFfjjTv43URZghuC6TkG93sr2/fxESAS87wT+ahJNSjWWhOsbDOFlVtp7dVN1fc2LQeBs7ehx
Date: Wed, 2 Nov 2022 02:00:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unwanted variable implementation
Message-ID: <Y2GBzcnG+bT/dEcG@ubunlion>
References: <Y2FPOON3UcqqAQFy@ubunlion>
 <alpine.DEB.2.22.394.2211011811400.2834@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2211011811400.2834@hadrien>

On Tue, Nov 01, 2022 at 06:14:01PM +0100, Julia Lawall wrote:
>
>
> On Tue, 1 Nov 2022, Deepak R Varma wrote:
>
> > Local variables intended as the function return value are
> > initialized but their value does not change during function
> > execution. The initial value assigned to the variable is simply
> > returned to the caller. This makes the variable declaration
> > unnecessary and the initial value can be directly returned.
>
> I think it would be better to make an argument for each case as to why the
> change is correct, and no more interesting return value is needed.  For
> example, looking at the code in
> drivers/staging/r8188eu/hal/rtl8188eu_xmit.c, it seems that the variable
> pull was used in a more interesting way previously, but some previous
> patches removed the relevant code.

Thank you Julia for the hints. I learned that git blame will not show commits
associated with deleted/replaced lines. Used pickaxe tool to identify the old
commits. It was good learning. Thank you. v2 is submitted for review and feedback.

>
> julia
>
> >
> > The patch is produced using the following coccicheck options:
> >    COCCI=./scripts/coccinelle/misc/returnvar.cocci
> >    M=driver/staging/r8188eu/
> >    MODE=patch
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
> >  drivers/staging/r8188eu/core/rtw_recv.c      | 3 +--
> >  drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
> >  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
> >  4 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> > index 24eb8dce9bfe..9eaf345e6a00 100644
> > --- a/drivers/staging/r8188eu/core/rtw_ap.c
> > +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> > @@ -1020,7 +1020,6 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
> >  int rtw_sta_flush(struct adapter *padapter)
> >  {
> >  	struct list_head *phead, *plist;
> > -	int ret = 0;
> >  	struct sta_info *psta = NULL;
> >  	struct sta_priv *pstapriv = &padapter->stapriv;
> >  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> > @@ -1028,7 +1027,7 @@ int rtw_sta_flush(struct adapter *padapter)
> >  	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
> >
> >  	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
> > -		return ret;
> > +		return 0;
> >
> >  	spin_lock_bh(&pstapriv->asoc_list_lock);
> >  	phead = &pstapriv->asoc_list;
> > @@ -1051,7 +1050,7 @@ int rtw_sta_flush(struct adapter *padapter)
> >
> >  	associated_clients_update(padapter, true);
> >
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  /* called > TSR LEVEL for USB or SDIO Interface*/
> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index 4b68a543f68b..94f85cd7038d 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -1415,7 +1415,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
> >
> >  	struct recv_priv *precvpriv = &padapter->recvpriv;
> >  	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
> > -	int	ret = _SUCCESS;
> >
> >  	nr_subframes = 0;
> >
> > @@ -1513,7 +1512,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
> >  	prframe->len = 0;
> >  	rtw_free_recvframe(prframe, pfree_recv_queue);/* free this recv_frame */
> >
> > -	return ret;
> > +	return _SUCCESS;
> >  }
> >
> >  static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
> > diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> > index 8e4a5acc0b18..6d1f56d1f9d7 100644
> > --- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> > +++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> > @@ -149,7 +149,6 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
> >
> >  static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
> >  {
> > -	int	pull = 0;
> >  	uint	qsel;
> >  	u8 data_rate, pwr_status, offset;
> >  	struct adapter		*adapt = pxmitframe->padapter;
> > @@ -295,7 +294,7 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
> >  	ODM_SetTxAntByTxInfo_88E(&haldata->odmpriv, pmem, pattrib->mac_id);
> >
> >  	rtl8188eu_cal_txdesc_chksum(ptxdesc);
> > -	return pull;
> > +	return 0;
> >  }
> >
> >  /* for non-agg data frame or  management frame */
> > diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > index 8516e253bb03..59a97c5fb80c 100644
> > --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > @@ -2979,8 +2979,6 @@ static int rtw_p2p_set(struct net_device *dev,
> >  			       struct iw_request_info *info,
> >  			       union iwreq_data *wrqu, char *extra)
> >  {
> > -	int ret = 0;
> > -
> >  	if (!memcmp(extra, "enable =", 7)) {
> >  		rtw_wext_p2p_enable(dev, info, wrqu, &extra[7]);
> >  	} else if (!memcmp(extra, "setDN =", 6)) {
> > @@ -3027,7 +3025,7 @@ static int rtw_p2p_set(struct net_device *dev,
> >  		rtw_p2p_set_persistent(dev, info, wrqu, &extra[11]);
> >  	}
> >
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  static int rtw_p2p_get2(struct net_device *dev,
> > --
> > 2.34.1
> >
> >
> >
> >
> >
>


