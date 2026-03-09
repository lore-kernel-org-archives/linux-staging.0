Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910A3D4112;
	Mon,  9 Mar 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075091; cv=none; b=p+uP+9vFa6LtdywViyv5zpNMDgE7+q2g6lt1DGL4qtiqJ7z4KK/jLw4Q7p0GEesXYjl8IIiYexCXgiVHZYPJv3I4yxe4/2tdQALm0UMb+cX2o0OdV99BLnHJESEAVtIFodd3+CpbdaYduVgHWwS1QLZ4anF2r8ZiwzVxQIDncLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075091; c=relaxed/simple;
	bh=Y+a5lDTgCi3CqPqkjb6KZnF/RtMTAB/8j3K6+aeix1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQi4I2Z46MRiKfC4r04/xA8RyptyxoindWGmcAi/Ap99K3auuPrbzieW35SN4fx4yxexsu4xutzaK74Ti7D79ZxNnKkaL+qxK+xICvuJBwqlFDSeZYumTXYRuBp/WNpPBGMyGDduOJlpInVxSnJyNIoqZ+JwGRZ67C82oNEPg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C42AWt/Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C42AWt/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC1DC2BC9E;
	Mon,  9 Mar 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075091;
	bh=Y+a5lDTgCi3CqPqkjb6KZnF/RtMTAB/8j3K6+aeix1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C42AWt/QYzriI9aAtuzOq188Rxis4KEIxuYIkreh0dfEr6xKaOHwk5zRZtPQs3WcO
	 eBqSj/d/X4znjgszskvOQe/rwB1xJgh4Sy7HZ7e78b/vt95CRi0fUxOWLruIoE3kcC
	 N05Kdp3/ZiecWwcxlu+LGciKqS6RmdSkRJ3vGDPo=
Date: Mon, 9 Mar 2026 17:51:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace kzalloc/memcpy with
 kmemdup
Message-ID: <2026030904-throwback-renewably-3703@gregkh>
References: <20260309142150.547045-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309142150.547045-1-starpt.official@gmail.com>

On Mon, Mar 09, 2026 at 10:21:50PM +0800, Lin YuChen wrote:
> Replace the open-coded kzalloc and memcpy combination with kmemdup()
> to make the code more concise and idiomatic.
> 
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---
> v2:
>  - Use real name in Signed-off-by line as requested by Ethan Tidmore.
>  - Fix a minor whitespace issue in the error return path.
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22bf3..3db6417a7de1 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
>  		goto exit;
>  	}
>  
> -	buf = kzalloc(ielen, GFP_KERNEL);
> +	buf = kmemdup(pie, ielen, GFP_KERNEL);
>  	if (!buf) {
> -		ret =  -ENOMEM;
> +		ret = -ENOMEM;

You also changed the spacing here, while normally ok, it's not good for
a first patch.  Please only do one logical-thing-per-patch.

thanks,

greg k-h
