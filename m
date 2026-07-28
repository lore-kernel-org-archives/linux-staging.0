Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC13BA24E;
	Tue, 28 Jul 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223103; cv=none; b=AQhJFs5zXab3VrVHO06wRW8N3GJ1cEdobw4BeEkMNW0YeZtJT7JXu1EDnPKBs8wK4Oi0RjyRKQqlXxmhaW/AzYGkW3Ol6ogYL+1K6Qv0j4mugJ0VOwaMIenGcjyauBp+ffAjHp53mavTXyx2bI+izRt6xDAANhnc7b9QXoMIq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223103; c=relaxed/simple;
	bh=tkf40jImDccHsVtwCQqpdtrNaP4l0KQ23wio5NCaz9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnQWC2eK0APokUyn8rEpIlFCBx21mIyunCJT7vGXbv+QojB7SOFZ8dRWvv1Ji3J7JmvaK7exJN5KMwLzqd8Lt45DXJPQDcCHy4b7mUSdjNuvERAZlsrlJmAGfo/KI8SGAxPlK02ecs88iJ+KDFo7D/YfEFPVen0BADxrhNz6AeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tvihYlgd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tvihYlgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5011F000E9;
	Tue, 28 Jul 2026 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223102;
	bh=/DFf/mVo/5VzPVEn9lx5iZv+v02AXQAt5YyhZJu4AcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tvihYlgd1fwD8OVkCXg5cudt4bBbA6wgVPzuXuzQnb+KZvMc1cNqRr7RVTkGFU+pE
	 Q2YVH75+EqTlDQzyWcLgaqv992EGHI2dLf2R9bqqV6zo0zaMANM+5tAtiwflq1L5w0
	 zySqyIcR3pkdWL2JwXM3WtbnV2etC85dhZnyoeK4=
Date: Tue, 28 Jul 2026 09:18:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Remove unnecessary parentheses
Message-ID: <2026072836-blob-morality-4337@gregkh>
References: <20260723152417.475323-1-mukhtarfaisal03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723152417.475323-1-mukhtarfaisal03@gmail.com>

On Thu, Jul 23, 2026 at 08:24:17PM +0500, Faisal Mukhtar wrote:
> Fix style problems found by checkpatch.pl,
> which are the unneeded parentheses inside if
> statements in vme.c.
> 
> Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index b5c66b66ce32..68b5c4613724 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -1210,9 +1210,9 @@ void vme_bus_error_handler(struct vme_bridge *bridge,
>  	u32 aspace = vme_get_aspace(am);
>  
>  	list_for_each_entry(handler, &bridge->vme_error_handlers, list) {
> -		if ((aspace == handler->aspace) &&
> -		    (address >= handler->start) &&
> -		    (address < handler->end)) {
> +		if  (aspace == handler->aspace &&
> +		     address >= handler->start &&
> +		     address < handler->end) {

Please see the archives for why this patch just makes things harder to
understand.  checkpatch should have not warned you about this, always be
sure to use the latest version.

thanks,

greg k-h
