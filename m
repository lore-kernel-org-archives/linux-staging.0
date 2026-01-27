Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41C334C22;
	Tue, 27 Jan 2026 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524788; cv=none; b=gngRk0jhTCZUoEALmQXfHu8LxjcbDssh8rjnOFRMW7v/fHbW9KNDQK8Ag2TErsalW+MreHLEm97lNMPY16gl7DZ5BlBmZj7PX1K807pTHdT5053fKXo3+51pmgryfkMc48KeuaqpaarD3kV4jCslgW1gyQuZQTwugMqSBSz9bgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524788; c=relaxed/simple;
	bh=WyXN5lgesYsDh8aIdFhziwTswL2AMoIeg0VRpGE/6qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8S/vR8x7VPAwbBUHq1raKVItN2M/V0puAp2b/Buk/LsVDHzQ7jMquav5EjgOD3xEFSNVKlR20qEF9RJx5z8AdOrDbHQlnHgLUp78OgL507HG5Mf+pLd1nVC+hvpgAzI/RhQr5uGtvtkTgnZyFRybvgFA3YwmGxDijS8QLb0v1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NYUmKVMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NYUmKVMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7469FC116C6;
	Tue, 27 Jan 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524787;
	bh=WyXN5lgesYsDh8aIdFhziwTswL2AMoIeg0VRpGE/6qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYUmKVMIfMHfyNXSxrhdK/00mM1MUAZJIXdnT6p9cnd524A60IKrIErdegCAuHLS3
	 PZTJbdupsIfUp/7EIrCOm9dNygsPFfr85zzuh1FB0rtJpK8VPMtHqD6n0yOF5XP7PL
	 dVc3EPH9dQAmXUtiO1iXzLret52pbX2ys0puRK30=
Date: Tue, 27 Jan 2026 15:39:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: rtl8723bs: core/rtw_mlme_ext.c: refactor
 security IE parsing in OnAssocReq
Message-ID: <2026012714-discount-wavy-ba95@gregkh>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116160914.88069-1-william.hansen.baird@gmail.com>

On Fri, Jan 16, 2026 at 11:08:47AM -0500, William Hansen-Baird wrote:
> +	parse_status = rtw_parse_assoc_security_ies(padapter, &elems, pstat);
> +	if (parse_status != WLAN_STATUS_SUCCESS)
> +		status = parse_status;
>  
>  	if (status != WLAN_STATUS_SUCCESS)
>  		goto OnAssocReqFail;

This logic makes no sense.  Did you do this by hand or have a tool do it
for you?

thanks,

greg k-h
