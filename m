Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CAC3DD525;
	Mon, 30 Mar 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892469; cv=none; b=Nc7k2rYdbFSgvz2n06g0lOe+yT2V6NW75Wl/HyBOV0GoVp8mR740JHKbYB7zvzEzcI0TrMiHtTvmhy5hHvkeKPa0Y3IztwzhrPiYucKJuVUL1Ki2VDS5PctWU//HKYb7rq5VfPvumjIgoP/3rGTuK0L7AW3SO+xgJ+BcDWyXRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892469; c=relaxed/simple;
	bh=lUhpo5wJEfTORuLeoULSSxq8j3cyq+a3U7YmQNzLrqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaNI6VF/2P0W9tXRaS0bio971RME3mDyjInlmvcZmt9MqBxoI4rpelTiS/jR3Fz0OF4PGHdQ6qjMD54P5plUmbGACRy5wTeVJFPt1ewXcKtXKIlcbtStMPf9d+jLZqZynkXG2XIEQ4Alyx6A9PbczaCNYQQ1mkTNolM3KT4gNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yrE9Zqry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yrE9Zqry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABC7C4CEF7;
	Mon, 30 Mar 2026 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774892468;
	bh=lUhpo5wJEfTORuLeoULSSxq8j3cyq+a3U7YmQNzLrqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yrE9ZqryzdDiNjTtcHR3rRG3hMc5igbinlCgtZ08E4nzxiggv0Jn+IGsC2AqW/wIC
	 tCVVdzLzjytktjjM5RWNxVDKtfie0KiDQy7lRxTwc6WcJr+CIGgEVRchslC4lNMRoc
	 QVi1PKAomYYDHUcM8QkuTwmqHe+fGTqgY/tPLBOE=
Date: Mon, 30 Mar 2026 19:40:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Remove dead code
Message-ID: <2026033052-pluck-phrase-6c03@gregkh>
References: <20260330165510.33134-1-ethantidmore06@gmail.com>
 <20260330165510.33134-2-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165510.33134-2-ethantidmore06@gmail.com>

On Mon, Mar 30, 2026 at 11:55:09AM -0500, Ethan Tidmore wrote:
> Remove commented out code and remove if statement with no body but a
> line of commented out code.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 83 +++----------------------
>  1 file changed, 7 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4b4012411011..3327519dd729 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -20,8 +20,6 @@ void init_mlme_ap_info(struct adapter *padapter)
>  	INIT_LIST_HEAD(&pacl_list->acl_node_q.queue);
>  	spin_lock_init(&pacl_list->acl_node_q.lock);
>  
> -	/* pmlmeext->bstart_bss = false; */
> -
>  	start_ap_mode(padapter);
>  }
>  
> @@ -32,8 +30,6 @@ void free_mlme_ap_info(struct adapter *padapter)
>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
>  
> -	/* stop_ap_mode(padapter); */
> -
>  	pmlmepriv->update_bcn = false;
>  	pmlmeext->bstart_bss = false;
>  
> @@ -377,7 +373,6 @@ void update_bmc_sta(struct adapter *padapter)
>  
>  	if (psta) {
>  		psta->aid = 0;/* default set to 0 */
> -		/* psta->mac_id = psta->aid+4; */
>  		psta->mac_id = psta->aid + 1;/* mac_id = 1 for bc/mc stainfo */
>  
>  		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
> @@ -413,17 +408,14 @@ void update_bmc_sta(struct adapter *padapter)
>  		/* ap mode */
>  		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
>  
> -		/* if (pHalData->fw_ractrl == true) */
> -		{
> -			u8 arg[4] = {0};
> +		u8 arg[4] = {0};

Um, are you sure about this?

That's normally not a good thing for kernel code to look like (i.e.
putting new variable declarations in the middle of the function.

Please be more careful.

thanks,

greg k-h
