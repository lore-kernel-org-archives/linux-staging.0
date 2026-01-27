Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1B345CA0
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525988; cv=none; b=ETy/mIpLY1lHnbLpjvU8jFkd+kkqbnWMvtKQBjXgOjYEWLRfz0jcbCpolQ0FLA4Zh27KXrDZDD/lD1xmJWF8Jn2shGK8/Ycsv5ylbLQJdk5/iCvMuj3PGZ5yq706A/OC3NKAeUV+kyTM5I6MQ82drqROEPoGPi168TeBEPt5dWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525988; c=relaxed/simple;
	bh=uxZq5GwTfudjH1/RqLNet6H7npCzFkDSMqRItsGk5U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQtpc5WCZBsbOig1PRGKPTSFi9kalDDLO/0ps5mow3rJEDpiBTbfhScFXZiEzNWmBzDn3QmRk/kN6VM60VLnEF9nxdA173DhPJ1vrsDQnoApPn+aS8LOkbm2pRgByHy8Iot9CrrmS3IGLKAxts6Ukbb+WtFTucd8jpl0nrJCYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FiOdUVR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FiOdUVR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99488C116C6;
	Tue, 27 Jan 2026 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769525988;
	bh=uxZq5GwTfudjH1/RqLNet6H7npCzFkDSMqRItsGk5U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiOdUVR7pjnWnWqej56Op4GloY3LnsYFz97obSzi09JaxkN33pgdmgFQczagFwp9A
	 hdY3g04B2r5m3af/Ux3hS4vrMkANI52gONracT25g9TKfUy6axyrRwOrMK52VumFQ4
	 ZHOLXMgoXDtZju9EifqbzOSjA0dXwxCRj1r/3mdo=
Date: Tue, 27 Jan 2026 15:59:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace in
 rtw_mlme.c
Message-ID: <2026012717-sports-valuables-45c3@gregkh>
References: <20260127142917.57857-1-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127142917.57857-1-giorgitchankvetadze1997@gmail.com>

On Tue, Jan 27, 2026 at 06:29:17PM +0400, Giorgi Tchankvetadze wrote:
> Remove trailing whitespace found by checkpatch.pl in rtw_mlme.c.
> 
> Changes in v2:
> - Separated from parentheses cleanup to comply with "do one thing at a
>   time" rule
> ---

The changes need to go below the --- line and there was no signed-off-by
line.  Did you run this through checkpatch before sending it out?
Always do so please.

thanks,

greg k-h
