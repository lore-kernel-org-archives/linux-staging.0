Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C536B054;
	Thu, 25 Jun 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380997; cv=none; b=sCQRpYsDy4A71TfW7800BhECPaXW1e5FS0NM4BqjXpvSILXVXNBOa78g46nk7STN1PvQ2lCXGyOlqgXHElYVC6aiitap9Fj8Wk9LB0bm655AHDHRCfo08TEQQa+lVo+B0aAM0ahkG4OpZ0gHZiPvwXZ6JtLzTo026Ngo/TvOhQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380997; c=relaxed/simple;
	bh=CfUrYSg5ZSu3LGAs0qjVG4LRsoU9CtzjpyhuoWFRV3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEhWTMqpKgR2XlVakhNkA9C4LbobNkWOaGwaJAngCIlUjy1uwUREogng3f67LcFI5ilBQOgZxtNuR+LO2BgCTmoc17i8GCELt6c4xwx0iqr6MIorU7pDJmccYJkOhziIYmIHJ8Yzr0337aJ1NUKLQZrfANM8y0CW6PlYOU0n5mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ze3Vef0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ze3Vef0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73C21F000E9;
	Thu, 25 Jun 2026 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782380996;
	bh=vjvHmRMQGF8UM8M7DncbSPRKCMF5/hSG3H3EuKraXbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ze3Vef0jZc8jNLOEG+TN2VefqUW6o6kvQf2B7jC3pDfT3kUZu5t8QCV0r1L3i1yIe
	 w0JxvIqjivCIsBVMq7MkK+kBYin2y2M4sOehOPAaVmLGSnV3VRuE/2zby8IUPX3G1z
	 zaYr5aa2hDAxQcTf/sCCu91Or1AkdUkPRBT5FXwg=
Date: Thu, 25 Jun 2026 10:47:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: bound slave windows to DMA buffers
Message-ID: <2026062556-exalted-closable-8105@gregkh>
References: <20260625093137.6589-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093137.6589-1-alhouseenyousef@gmail.com>

On Thu, Jun 25, 2026 at 11:31:37AM +0200, Yousef Alhouseen wrote:
> vme_user allocates a fixed PCI_BUF_SIZE coherent DMA buffer for each
> slave image, but VME_SET_SLAVE passes the user-supplied size to
> vme_slave_set() unchanged. An enabled window larger than PCI_BUF_SIZE lets
> the bridge expose DMA addresses beyond the allocation.
> 
> The character device read/write paths also derive their bounds from
> vme_get_size(), so the oversized programmed window can make
> buffer_to_user() and buffer_from_user() access past
> image[minor].kern_buf.
> 
> Reject enabled slave windows that do not fit in the backing buffer and use
> the same capped size for slave read/write/llseek bounds. Also convert the
> read/write limit checks to subtraction-based form so offset + count cannot
> wrap around the image size check.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/staging/vme_user/vme_user.c | 38 ++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 9 deletions(-)

What tool did you use to find/make this change, and how was it tested?

thanks,

greg k-h
