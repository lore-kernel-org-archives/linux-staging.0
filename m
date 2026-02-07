Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0C18A6DB;
	Sat,  7 Feb 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770467662; cv=none; b=Q/N6y1L7J0q9Ug9EVz2a/eDzVpofRKDFb3JHKo1s3oDErGYi8Ge4advVJcZweZdgqFg//JFEdcBu47v48SJ7Oa1YOqmoRXvStYGk2O+TCzi7ioQcoAE+OxVau4eHgqdfgIHrufJlCNV+zXgikQRYKiU/IbiYRC635uItT0Pwii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770467662; c=relaxed/simple;
	bh=f9lVPlSiTmwtR/jS/SPz4Tl8rPWGBr63yibbL2ZV0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIvk0TqGELeK7xJ3OAr8+D8OCW9wf9soKziR19jZbSd3AVhlRg5mGjjhwxkHR3mV/rcTU6P9hm/OuHKs2o87N6VV/I6pJOQLVVtsLAmoOehNpoeEOFDp9YcJpG1vu+Ehsth8767aLF5xHH19kaO9+Cv6I2Naf0PZhfW3BIqtwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ds4JwvaY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ds4JwvaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B83C116D0;
	Sat,  7 Feb 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770467662;
	bh=f9lVPlSiTmwtR/jS/SPz4Tl8rPWGBr63yibbL2ZV0kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ds4JwvaY2AOFzGaN3Kh5k/u791a9j/ZhN4O9XG4e9YMzgWXTGiENPDWjbb5iHSjGL
	 No/aeFayraq0ir7epD8H2+BgoVrbjouH9l1/EV4m12nYi5qJVrD9JQGfLuykhisD8Q
	 FrOeTIOgdjD8+koWrIhqNl1KJovTKuqxLzSiRIR0=
Date: Sat, 7 Feb 2026 13:34:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] staging: rtl8723bs: fix memory leak in
 rtw_cfg80211_inform_bss()
Message-ID: <2026020736-filing-phoniness-119d@gregkh>
References: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
 <20260130001641.17941-3-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130001641.17941-3-samasth.norway.ananda@oracle.com>

On Thu, Jan 29, 2026 at 04:16:40PM -0800, Samasth Norway Ananda wrote:
> After successfully allocating buf with kzalloc(), if
> cfg80211_inform_bss_frame() returns NULL, the code jumps to the exit
> label without freeing buf, causing a memory leak. Add kfree(buf) before
> the goto to properly free the buffer in this error case.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 60edeae1cffe..d80e23cfdf8d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -314,8 +314,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  	bss = cfg80211_inform_bss_frame(wiphy, notify_channel, (struct ieee80211_mgmt *)buf,
>  					len, notify_signal, GFP_ATOMIC);
>  
> -	if (unlikely(!bss))
> +	if (unlikely(!bss)) {
> +		kfree(buf);
>  		goto exit;
> +	}

This is already fixed in my tree, what branch did you make this against?

Always work against linux-next at the least, ideally against the proper
subsystem developer tree as documented in the MAINTAINERS file.

thanks,

greg k-h
