Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A12C8B
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 21:07:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e3so480372wrc.11
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ohYCIyy+Dg3rq+4HCCIZxRKa6UI684YVUwrDR60CBhs=;
        b=OfBibdOCbT+5xvLAr41Q715Sv7B2KJVyP+lz/c+zha7EkMtORGNxvTUjcMpzjRDqD2
         kNYQbpFkeCE7pO0w/Eqq0KNais10wWQVCyDMszhoMeSm5HYrtx42rXaEGiG5mLvEhubx
         IZMhzSC8e/RzDoqcmchTllDXMYyD38kYljXZrgsdym7LLz4ibLZ0CbNxuDBgWtSBrH34
         70FYmdfiIWksfZ2zZv8kORsB19+WDQ1cH+Qx0LvtkidA/Vdey+0Wc36RYAuGJJI8Ea55
         Qpj6qMDhgThXj7KAi1DJs3oeHc+WNWxWFHgwfn3Y1F1quaUU1UZ8YhT2wgGZOzPu+hzk
         f75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ohYCIyy+Dg3rq+4HCCIZxRKa6UI684YVUwrDR60CBhs=;
        b=OzK0JZRVbClx/OwqMOuLjtU+krr2E8q3LDTf/E32O847/jByAbidPRtYYDMVG/AsFg
         wPhfZmNH6rXBFG8FimcYVoWIY0+jSriCQhyvJpvjUNOjgp2LdFZZe88ffj279j40ax4y
         aI2YZ9XzgzhUNM+BmfSZeC1ne5pnSWHC3vdWYM/5l2xLc9g72o3RD5An6Mzu660pzj1g
         O5oGE0wlvHUYIv2VRWmzLlTPNOFDDKOAGLjKCeb926O6FnNTaPTPz9G9ctpOB4hH4UB4
         AGqGmvfeTiB0hFdk1u+XngSENXJRW5HMJrjZjqpbPB7WihNrhsMziCk3KTN3bdRejDnM
         cEbQ==
X-Gm-Message-State: AOAM530CSo8QKrbXwBtj/dvruWjYNmzb4glqG6zrbVLbrPNTepzVvHsG
	vuAjTpA0/qKI47vVOEQ0ln18MA==
X-Google-Smtp-Source: ABdhPJy79d1J8ZuoapuiU8rKlw5S5Q+09Xc1kIFGeT1KhhIagRhF/LebZ6puOPHb/QK8U1ngA8uepw==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr1987052wrt.417.1634764055251;
        Wed, 20 Oct 2021 14:07:35 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id k10sm2915553wrh.64.2021.10.20.14.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 14:07:34 -0700 (PDT)
Date: Wed, 20 Oct 2021 22:07:32 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: r8188eu: use helper to check for broadcast
 address
Message-ID: <YXCFFO//n9N6MZXv@equinox>
References: <20211020195401.12931-1-martin@kaiser.cx>
 <20211020195401.12931-3-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020195401.12931-3-martin@kaiser.cx>

On Wed, Oct 20, 2021 at 09:53:59PM +0200, Martin Kaiser wrote:
> Use the is_broadcast_ether_addr function to check for a
> broadcast address.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ++----
>  drivers/staging/r8188eu/hal/odm.c           | 3 +--
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 995a0248c26f..b0dfafe526f7 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -392,13 +392,12 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
>  
>  static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, struct recv_frame *precv_frame)
>  {
> -	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  	u8 *pframe = precv_frame->rx_data;
>  
>  	if (ptable->func) {
>  	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
>  		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
> -		    memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN))
> +		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
>  			return;
>  		ptable->func(padapter, precv_frame);
>  	}
> @@ -409,7 +408,6 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
>  	int index;
>  	struct mlme_handler *ptable;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> -	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  	u8 *pframe = precv_frame->rx_data;
>  	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
>  
> @@ -418,7 +416,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
>  
>  	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
>  	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
> -	    memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN))
> +	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
>  		return;
>  
>  	ptable = mlme_sta_tbl;
> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 67cf8f7baba5..21f115194df8 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -829,7 +829,6 @@ void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
>  	u8	sta_cnt = 0;
>  	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
>  	struct sta_info *psta;
> -	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  
>  	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
>  		return;
> @@ -841,7 +840,7 @@ void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
>  		psta = pDM_Odm->pODM_StaInfo[i];
>  		if (IS_STA_VALID(psta) &&
>  		    (psta->state & WIFI_ASOC_STATE) &&
> -		    memcmp(psta->hwaddr, bcast_addr, ETH_ALEN) &&
> +		    !is_broadcast_ether_addr(psta->hwaddr) &&
>  		    memcmp(psta->hwaddr, myid(&Adapter->eeprompriv), ETH_ALEN)) {
>  			if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmpEntryMinPWDB)
>  				tmpEntryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
> -- 
> 2.20.1
>

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
