Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A731A057;
	Tue,  7 Jul 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416318; cv=none; b=nAtPARnN6YjJC3ZhWsP2W/RKZEkfh+ywVkRiaPpcl2xBs7JR86eAUUR59vVF0B5iTHKaRtP3jMgLXvKTGt/mVSv+XTuS0jBbiwIlSJVJnU4OZUebi/SFSUtIMLB6nSJ04rmB6JOO6hNPzliikFgEwvKEK4rCcGsa8aZvXGt9NXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416318; c=relaxed/simple;
	bh=M11bDDVZGYrq54vSLctu1uH6qRW7Jisg/vbOE4BwyH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8PVz0xjQzhq+U1XWINEwoyXMvZKXBqhKkiM6R/QkEqytcr0skm1qV/0M67Ai65SGGFDt8euxMhNiz2sDyxKfHM0EGIphOytq56Igh9w0POl7WFSKlLGImd0hxkGpC7/VOBQktWttqmeFL/ft2oizNQUD3NWyR956z21+dHk3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pr0aMbP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pr0aMbP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AD11F000E9;
	Tue,  7 Jul 2026 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416316;
	bh=LZzLSM3caeXkfVB7g8pHzQPyIluIJjjDC2vWWJT8JG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pr0aMbP6QOIk9dIGB53j4hQXREkr3sxEfumKhRjEML7rFaDZo1wHgXvjQcMNLUoYT
	 ClIPXKrXC5rVLWv4Re9DVGSI6iClVf3nnm6A3CpOaMW5CmZqochck2ou+d8RRS359e
	 f7gQWmHfCyp26qDLTz21p/k23JNaFI3qSe1pn3Ic=
Date: Tue, 7 Jul 2026 11:25:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Srivastava <atg271@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: ethernet: remove redundant parentheses
 in conditionals
Message-ID: <2026070722-trash-boogieman-292f@gregkh>
References: <20260702203557.59238-1-atg271@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702203557.59238-1-atg271@gmail.com>

On Thu, Jul 02, 2026 at 01:35:57PM -0700, Abhinav Srivastava wrote:
> Remove extra parentheses in 3 multiline if conditions and align
> continuation lines under opening parenthesis. No functional change
> intended.
> 
> Signed-off-by: Abhinav Srivastava <atg271@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index f3fa221f4..e28625b47 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -247,9 +247,9 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
>  
>  	dev->mtu = new_mtu;
>  
> -	if ((interface < 2) &&
> -	    (cvmx_helper_interface_get_mode(interface) !=
> -		CVMX_HELPER_INTERFACE_MODE_SPI)) {
> +	if (interface < 2 &&
> +	    cvmx_helper_interface_get_mode(interface) !=
> +	    CVMX_HELPER_INTERFACE_MODE_SPI) {

You changed the indentation :(

Also, now we have to remember what the precidence order is, which is a
pain.  We write code for people first, compilers second, and this code
is the same either way for the compiler, so leave it alone to make it
easier for people to understand it.

thanks,

greg k-h
