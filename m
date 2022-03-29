Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F90B2572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 14:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CDAC2BBE4;
	Tue, 29 Mar 2022 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648565523;
	bh=ygapdfH/Ii7vo/qtN9Pa/zO23wJORAjFHM72S2gg9Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdtlWBcq06p8V7jqC7uioRxcyIcfFMl3Lpk6UKeMxl5f4rDqHN1wp4mLu+mpgCu/N
	 ZBGdXnVy730dp2eUs6lBPmCJA4qWL8PZmgg41vYcGiL5hagnUGhDE9d7aFGr92cpLn
	 TUJAcN1R+LBkmqkJLuQ+2N90YrhaYCxvxhAAVytw=
Date: Tue, 29 Mar 2022 16:52:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux@roeck-us.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix misspelling in comment
Message-ID: <YkMdEIMHrYBPGYzK@kroah.com>
References: <1647831314-25511-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647831314-25511-1-git-send-email-baihaowen@meizu.com>

On Mon, Mar 21, 2022 at 10:55:14AM +0800, Haowen Bai wrote:
> The original error is as below shows:
> 
> CHECK: 'associcated' may be misspelled - perhaps 'associated'?
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> index 1675e2e..e02dd8e 100644
> --- a/drivers/staging/r8188eu/core/rtw_ap.c
> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> @@ -819,7 +819,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
>  
>  void associated_clients_update(struct adapter *padapter, u8 updated)
>  {
> -	/* update associcated stations cap. */
> +	/* update associated stations cap. */
>  	if (updated) {
>  		struct list_head *phead, *plist;
>  		struct sta_info *psta = NULL;
> @@ -972,7 +972,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
>  		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
>  	}
>  
> -	/* update associcated stations cap. */
> +	/* update associated stations cap. */
>  	associated_clients_update(padapter,  beacon_updated);
>  
>  	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
> @@ -1036,7 +1036,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
>  		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
>  	}
>  
> -	/* update associcated stations cap. */
> +	/* update associated stations cap. */
>  
>  	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
>  
> -- 
> 2.7.4
> 
> 

Does not apply to my tree :(
