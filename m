Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA551D5CC6;
	Mon, 15 Jun 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510088; cv=none; b=Og1ly/9+ooNERiS6GvvE0Rt+BfzJaGdZF9j94rSn0j6exc0tDT6nTlrOvtIhfGzAnltjZ93+386CNCApuV3tGl/pLFJ+VISWAdEcjQnYL0aQg07rIpoV/mWhQGk4ngafONEUHttclsvTSrTrLo+S9NdNqbtYf1VtxzR8ZqlB+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510088; c=relaxed/simple;
	bh=HK+dX7M/Dt6HIKj3xEFadkNjIruz5aS/dwaU6PEmrKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUBpgTti7+mFBUXhep/6wcmHWS8QK7Son/9i5H20OKPnFimBu4e6UOnP2jg4NgoHOtcagUqVgD2TxETqDmLAUVyXaV5/4TH2DSw5Kq30uVsyHDhYjopoaNaY//NCxBT8oAt9Ta8hX6eaQ8iP8wRsZ+R3M7I9ECAo85cpDcnAI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZwZm39z1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZwZm39z1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E80E1F000E9;
	Mon, 15 Jun 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781510087;
	bh=IiluGqSXuX+JKG272ukTGGnFbUWOei1mmSR7QXoNR7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZwZm39z1B29pr9gizPCdykKQ1KOOFQh4eRcKFiW5fJbWw/sQo2M++eaZOz5mTAI64
	 tQVgiQgsurVn6A85+vcxgxzKdchjPlkFlGaM/6eL87TtsMPRcCLmwVp8JJzQNVqnUs
	 O2f5lPphcZKZsgmvzQ9DWkCzCpthTQfhzS5ufUfY=
Date: Mon, 15 Jun 2026 09:53:45 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: greybus: camera: remove broken camera driver
Message-ID: <2026061519-clammy-marina-6dee@gregkh>
References: <19e6eb80318.39c60cbc208598.4490466986425288169@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19e6eb80318.39c60cbc208598.4490466986425288169@zohomail.in>

On Thu, May 28, 2026 at 06:43:33PM +0530, Ashwin Gundarapu wrote:
> The Greybus camera driver has been non-functional since its inclusion
> due to a missing greybus_protocols.h header and reliance on deprecated
> v4l2_mbus_pixelcode enum.
> 
> The Project Ara hardware this driver was written for never shipped,
> and the driver has seen no real fixes in over 8 years—only treewide
> cleanups such as GFP_KERNEL conversions and debugfs error handling
> changes.
> 
> Remove the entire camera driver (~2,000 lines).
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  drivers/staging/greybus/camera.c    | 1047 ---------------------------
>  drivers/staging/greybus/gb-camera.h |  127 ----
>  2 files changed, 1174 deletions(-)
>  delete mode 100644 drivers/staging/greybus/camera.c
>  delete mode 100644 drivers/staging/greybus/gb-camera.h

You forgot to delete this from the build and configuration at the same
time :(

thanks,

greg k-h
