Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2C23E346;
	Tue, 24 Feb 2026 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955966; cv=none; b=LhVoT5b+gouvC8crj51APGiwXiISJyEkxU/vecrmSaSXmG1f+Ku8bTDo9wt63IT2m8fCKi0GpO/QSdXYAam3OEMHYo2WGslPv7KJZ4mOSqt5h/4s9o4Wty7cnybJRRQd7qNREzvG+JoufMYxiWGD1eALHtKxoQLBq7hVo8IwoYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955966; c=relaxed/simple;
	bh=qNzJtkWg5iGLADv5xpoG4UPQ8ZoKnzQBJ5VIK4QWk3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWOwjUikgmT6v/hAa+DOPYTTqE2elX4dTXtAu9PGSkV/OyY8q3TK8szzUqbtI+fu6RCWDRFaRh2XxqwoVGwkucD6+D+t+lrccF35CG4iFJXZz7aTd3tw4TPCL+UzaewM2yqKt03XMXErYxbOVDvomijmZb5P1AXPaGsxNTzTAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v0WiYIEk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v0WiYIEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA54C2BC87;
	Tue, 24 Feb 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771955965;
	bh=qNzJtkWg5iGLADv5xpoG4UPQ8ZoKnzQBJ5VIK4QWk3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v0WiYIEkYOlnBNfx9xld5ccginh2OYKIam9BONrOFoHFqe40GOMb6uaiGrUpxcww7
	 bGJd2jXyqZ/ylykO6aoEjWr9HRBITpWKjou24BnYjaIYp9M+ROT7e/lm0u68DyOppe
	 lYKq9iYyk1jyjdSONwscWY2vtFvOY1bg+CzZR9pA=
Date: Tue, 24 Feb 2026 09:59:19 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	linux-kernel@vger.kernel.org, ethantidmore06@gmail.com
Subject: Re: [PATCH v3 1/3] staging: rtl8723bs: Fix "inclued" typo in
 ioctl_cfg80211.c
Message-ID: <2026022436-banjo-kitten-5661@gregkh>
References: <20260224103413.48216-1-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224103413.48216-1-giorgitchankvetadze1997@gmail.com>

On Tue, Feb 24, 2026 at 02:34:11PM +0400, Giorgi Tchankvetadze wrote:
> Change "inclued" to "included"
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v3: resend as series with unique subject lines (Greg)
> v2: fix subject line colon spacing (Ethan)
> 
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index a47d0d3fa2b7..038157442348 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2264,7 +2264,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
>  
>  	len = head_len + tail_len - 24;
>  
> -	/* check wps ie if inclued */
> +	/* check wps ie if included */
>  	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
>  
>  	/* pbss_network->ies will not include p2p_ie, wfd ie */
> -- 
> 2.52.0
> 

None of these patches were "linked" together, they all look as
individual changes.  Can you use 'git send-email' to send a series
for when you send the v4 set?

thanks,

greg k-h
