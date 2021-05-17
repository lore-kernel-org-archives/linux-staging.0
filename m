Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB02FB6
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:21:57 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lijkQ-0001s7-1u; Mon, 17 May 2021 22:21:54 +0200
Date: Mon, 17 May 2021 22:21:54 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: rtl8188eu: use safe iterator in
 rtw_free_network_queue
Message-ID: <20210517202154.3swbe3e2tbcjbuit@viti.kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <738695eb-61f1-54b2-cd68-2143e831e338@wanadoo.fr>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <738695eb-61f1-54b2-cd68-2143e831e338@wanadoo.fr>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Christophe JAILLET (christophe.jaillet@wanadoo.fr):

> Le 16/05/2021 à 18:06, Martin Kaiser a écrit :
> > rtw_free_network_queue iterates over the scanned wireless networks and
> > calls _rtw_free_network for each of them. In some cases,
> > _rtw_free_network removes a network from the list.

> > We have to use list_for_each_safe if we remove list entries while we
> > iterate over a list.

> > Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> > Without this patch, it's easy to get the driver into an endless loop by
> > scanning, connecting and disconnecting repeatedly.

> > wpa_supplicant -B -Dwext -i wlan0 -c /path/to/my/config...
> > while true ; do
> >     sleep 1
> >     wpa_cli reconfigure
> >     wpa_cli add_network
> >     wpa_cli set_network 0 ssid ...
> >     wpa_cli set_network 0 psk ...
> >     wpa_cli select_network 0
> >     sleep 6
> >     wpa_cli status
> >     wpa_cli disconnect 0
> > done

> >   drivers/staging/rtl8188eu/core/rtw_mlme.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)

> > diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> > index 159465b073c2..14816ad51668 100644
> > --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> > +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> > @@ -199,7 +199,7 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
> >   void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
> >   {
> > -	struct list_head *phead, *plist;
> > +	struct list_head *phead, *plist, *temp;
> >   	struct wlan_network *pnetwork;
> >   	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> >   	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
> > @@ -207,7 +207,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
> >   	spin_lock_bh(&scanned_queue->lock);
> >   	phead = get_list_head(scanned_queue);
> > -	list_for_each(plist, phead) {
> > +	list_for_each_safe(plist, temp, phead) {
> >   		pnetwork = list_entry(plist, struct wlan_network, list);
> >   		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);

> Nitpicking: 'list_for_each_entry_safe' could also be used to simplify code.

Thanks for the hint, I just sent out v2.
