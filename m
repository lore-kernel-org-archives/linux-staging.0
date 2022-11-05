Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB71FBE
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 11:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24150C433C1;
	Sat,  5 Nov 2022 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667647539;
	bh=jfg/4c1UCY8U3L+jJad3hJPYkRufK72dheC4IwORutg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk1Bnbfyl+VPEGotpnb44CIhqklTgzy9AzZg+nYEZNYeLojPY/HZJP0OPKlY4Lliq
	 uKkJg4ihS0zVyAOrq5EHPeRGwmxCBd4xthWueoOiIj3a8SFp6NNKFrBwDK6NMLJ6Wt
	 5papXka3PZVRn9deIm76v2O1Qzh4L5CeDqVf7nWc=
Date: Sat, 5 Nov 2022 12:25:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Michael Straube <straube.linux@gmail.com>, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: convert three functions to bool
Message-ID: <Y2ZIMCv7n8OgzqTG@kroah.com>
References: <20221105093916.8255-1-straube.linux@gmail.com>
 <Y2ZD0B6bsDbdpa6A@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2ZD0B6bsDbdpa6A@equinox>

On Sat, Nov 05, 2022 at 11:06:56AM +0000, Phillip Potter wrote:
> On Sat, Nov 05, 2022 at 10:39:16AM +0100, Michael Straube wrote:
> > The functions
> > 
> > is_client_associated_to_ap()
> > is_client_associated_to_ibss()
> > is_IBSS_empty()
> > 
> > return boolean values. Convert their return type to bool and replace
> > _FAIL, which is defined as 0, with false. Another step to get rid of
> > _SUCCESS / _FAIL.
> > 
> > Signed-off-by: Michael Straube <straube.linux@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_wlan_util.c   | 18 +++++++++---------
> >  drivers/staging/r8188eu/include/rtw_mlme_ext.h |  6 +++---
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> > index e50631848cab..c95438a12b59 100644
> > --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> > +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> > @@ -331,35 +331,35 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
> >  	return le16_to_cpu(val);
> >  }
> >  
> > -int is_client_associated_to_ap(struct adapter *padapter)
> > +bool is_client_associated_to_ap(struct adapter *padapter)
> >  {
> >  	struct mlme_ext_priv	*pmlmeext;
> >  	struct mlme_ext_info	*pmlmeinfo;
> >  
> >  	if (!padapter)
> > -		return _FAIL;
> > +		return false;
> >  
> >  	pmlmeext = &padapter->mlmeextpriv;
> >  	pmlmeinfo = &pmlmeext->mlmext_info;
> >  
> >  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
> >  		return true;
> > -	else
> > -		return _FAIL;
> > +
> > +	return false;
> >  }
> >  
> > -int is_client_associated_to_ibss(struct adapter *padapter)
> > +bool is_client_associated_to_ibss(struct adapter *padapter)
> >  {
> >  	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
> >  	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
> >  
> >  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
> >  		return true;
> > -	else
> > -		return _FAIL;
> > +
> > +	return false;
> >  }
> >  
> > -int is_IBSS_empty(struct adapter *padapter)
> > +bool is_IBSS_empty(struct adapter *padapter)
> >  {
> >  	unsigned int i;
> >  	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
> > @@ -367,7 +367,7 @@ int is_IBSS_empty(struct adapter *padapter)
> >  
> >  	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
> >  		if (pmlmeinfo->FW_sta_info[i].status == 1)
> > -			return _FAIL;
> > +			return false;
> >  	}
> >  	return true;
> >  }
> > diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > index e234a3b9af6f..7652e72a03f4 100644
> > --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > @@ -432,9 +432,9 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
> >  u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
> >  u16 get_beacon_interval(struct wlan_bssid_ex *bss);
> >  
> > -int is_client_associated_to_ap(struct adapter *padapter);
> > -int is_client_associated_to_ibss(struct adapter *padapter);
> > -int is_IBSS_empty(struct adapter *padapter);
> > +bool is_client_associated_to_ap(struct adapter *padapter);
> > +bool is_client_associated_to_ibss(struct adapter *padapter);
> > +bool is_IBSS_empty(struct adapter *padapter);
> >  
> >  unsigned char check_assoc_AP(u8 *pframe, uint len);
> >  
> > -- 
> > 2.38.0
> > 
> 
> Hi Michael,
> 
> Thanks for the patch. Just my personal opinion, but I would prefer to
> keep the return type as int, and have 0 for success and then _FAIL
> replaced with an appropriate error code depending on the circumstance,
> (e.g. -ENOMEM). This is generally the convention elsewhere in the
> kernel. Others may not agree though.

For functions that are just returning true/false like this (and the
function name is something like "is_foo()"), a boolean type is fine and
makes more sense as you will only check it in an "if ()" statement block
like how these are being used.

However, these function names are horrible for being in the global
namespace, but that's a totally different issue that can be fixed up in
a later patch.

thanks,

greg k-h
