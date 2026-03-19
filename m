Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABEB3CCFC0;
	Thu, 19 Mar 2026 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921526; cv=none; b=V305nydf0Qj2WPsR1HolTcK1cKIOu9TN9N6xPtOisUHF89ycUqt3nkeJPlYOo/8zVLMQkj0wtOinyY9Nan0g/DbBQWfcpAh5fZ/x/fuPac5NMk+tAFcVhOOsrqtIoVBErXvn/Kjz2e3B2kxhiHm96F0mwcOkE4ZGOyjbQJ5bYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921526; c=relaxed/simple;
	bh=4YOvMMgc9dsTezV+QkcuzilAEGoVHLJ1d290wokbLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuXofKbeZxC/hswcruN+s89uuK1zhUPlOfJv3uu4eU29wTU6F6HV/NUS76TXXswks5hd73pxXeqVTx+TTuFgkHyhlNzps6+HZmDdlT/fXvO2kSHLP/kStP2EF0QgkZ02qYy6UJupAvbvfVYt+xDRjfrrRtlmGIkz3jxtqkaprj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oXhThBfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oXhThBfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C82DC19424;
	Thu, 19 Mar 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773921525;
	bh=4YOvMMgc9dsTezV+QkcuzilAEGoVHLJ1d290wokbLvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXhThBfWPlsv3lbID4dcJbgSiKNphQLtKIf2bBuVVCRO1l0XnSTb/Rjtp9AAPUmuD
	 gChkZ0pfu8eSnyRd3YK2SAM+xFAnAHo/bbr1sHq56h4El+XUMgjRIXpwPY5wKD9eLL
	 jwvBEVHLuJ935G6q8dXKvUuQlVKqthPgguElOadA=
Date: Thu, 19 Mar 2026 12:58:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix long lines in core files
Message-ID: <2026031933-machine-kinship-ed7b@gregkh>
References: <20260319113836.1063-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319113836.1063-1-hechushiguitu666@gmail.com>

On Thu, Mar 19, 2026 at 07:38:35PM +0800, Haoyu Lu wrote:
> From: "haoyu.lu" <hechushiguitu666@gmail.com>
> 
> Fix lines longer than 80 characters in rtl8723bs core files:
> - drivers/staging/rtl8723bs/core/rtw_ap.c
> - drivers/staging/rtl8723bs/core/rtw_cmd.c
> 
> Split long comment lines into multiple lines and extract
> repeated expressions to temporary variables to reduce line length.
> 
> This addresses the TODO item "checkpatch.pl fixes - most of the
> remaining ones are lines too long."
> 
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c  | 18 +++++++++++-------
>  drivers/staging/rtl8723bs/core/rtw_cmd.c |  9 ++++++---
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 864cd8b6d1f1..0d40c8f45899 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -270,7 +270,8 @@ void expire_timeout_chk(struct adapter *padapter)
>  		u8 backup_oper_channel = 0;
>  		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  
> -		/* switch to correct channel of current network  before issue keep-alive frames */
> +		/* switch to correct channel of current network before issue */
> +		/* keep-alive frames */

This is not the correct style for multi-line comments, sorry.

>  		if (rtw_get_oper_ch(padapter) != pmlmeext->cur_channel) {
>  			backup_oper_channel = rtw_get_oper_ch(padapter);
>  			r8723bs_select_channel(padapter, pmlmeext->cur_channel);
> @@ -610,9 +611,9 @@ static void update_hw_ht_param(struct adapter *padapter)
>  	 *	AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
>  	 *	AMPDU_para [4:2]:Min MPDU Start Spacing
>  	 */
> -	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
> -
> -	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
> +	u8 ampdu_para = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para;
> +	max_AMPDU_len = ampdu_para & 0x03;
> +	min_MPDU_spacing = (ampdu_para & 0x1c) >> 2;

It's not usually a good idea to use a temp variable declaration in the
middle of a function for no good reason, sorry.

So I don't think these changes are really needed.

thanks,

greg k-h
