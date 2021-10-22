Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D72C81
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 06:03:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9C0E610CF;
	Fri, 22 Oct 2021 06:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634882620;
	bh=JzgnnT1vFNgovNqLd0ix+p3ErAjwejA4YDXOJPW46DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP4eMK/D/5vCVwIvgd2zAttaYuMFnHtCLmZpd1H506OMwbnAOo/VXsYOw34oPxeSb
	 Wk4A28bCoQy/XAVs2Xhb1xoB9DcJj2t68x8gK/qAQRpS5Nh+jMzzKCre3XevUKSdRN
	 aTAKYkAI9E4YWXy6V9UTCnHQ+J0UUl3KOXJa+tgk=
Date: Fri, 22 Oct 2021 08:03:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kushal Kothari <kushalkothari285@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com, marcocesati@gmail.com,
	straube.linux@gmail.com, philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 4/4] staging: rtl8723bs: core: Remove unnecessary blank
 lines
Message-ID: <YXJUNy0VXEwxeBe+@kroah.com>
References: <cover.1634845504.git.kushalkothari285@gmail.com>
 <f6d2ba1d544c70519bad5c04f012cba0214b379a.1634845504.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6d2ba1d544c70519bad5c04f012cba0214b379a.1634845504.git.kushalkothari285@gmail.com>

On Fri, Oct 22, 2021 at 01:27:53AM +0530, Kushal Kothari wrote:
> Remove useless blank lines
> 
> Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index fce3256cc275..690e4627663c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -316,8 +316,6 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  	return _SUCCESS;
>  }
>  
> -
> -
>  int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
>  	int res = _FAIL;
> @@ -367,7 +365,6 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
>  	kfree(pcmd);
>  }
>  
> -
>  void rtw_stop_cmd_thread(struct adapter *adapter)
>  {
>  	if (adapter->cmdThread &&
> @@ -735,8 +732,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
>  	}
>  	/* for ies is fix buf size */
>  	t_len = sizeof(struct wlan_bssid_ex);
> -
> -
> +	

Please do not add new whitespace errors :(

Always run your patches through checkpatch.pl to ensure this.

thanks,

greg k-h
