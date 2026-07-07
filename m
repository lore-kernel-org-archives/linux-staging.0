Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10753F6600;
	Tue,  7 Jul 2026 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423773; cv=none; b=mxHpnYh7aueiC4ghXpK5236sTu4qnElYvF7nFzUToJ0syJAQDkqCgtDMweB8S6G2V6GcyGILThZsg7dl1ApdI95ZEHCn5ii72BDeJP4a54h8zA+VUMuOveH7dgNrR0LmTzOplAPcRYojVctvQE1rvP461rq+yo1RuV89qODSmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423773; c=relaxed/simple;
	bh=YFvR+hSHdXV5U+jd5QWueTbETLB+RvOyaxsYlC9PPgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKKZVtM/Fewv622yobpcOh5LjsPaaZIPlzMDb/nvy1KT+GIT+K+1WtKSJyI+o58VSA/escXCRa/p0CvB49Ad0ca+ion7iUakaf0AipaNhgwApGnslEUxKzPpqGS6Ty+LtQGdrLvZMN/Dbk1IIvwidw4n31Jce/KRF0+G9ws1FQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eDTYvCOJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eDTYvCOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A56E1F00A3A;
	Tue,  7 Jul 2026 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423772;
	bh=i/FpuVFRQiacSAL4FXvWKzy05sf5T8LOTcPUWF6qY44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDTYvCOJ6mgniOJ5VR0nWvRkvx5TO5OgKLefRJ8EJslTHxdudk4i9Nj0DkN4euXJL
	 hV3gNOc6lw05S6sjp2nTE67B0uGKDo7eTpJ0y1heCmmLLsGsu7HkfEf96Cd9Tfufwr
	 FfhMUl6TDLHCDLZOtCPPwBW0b0KUTWHVw4bNhdSU=
Date: Tue, 7 Jul 2026 13:29:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aditya Chari <adi25charis@gmail.com>
Cc: broonie@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused function
 declarations
Message-ID: <2026070702-mold-shelf-e0af@gregkh>
References: <20260622130453.63786-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622130453.63786-1-adi25charis@gmail.com>

On Mon, Jun 22, 2026 at 06:34:53PM +0530, Aditya Chari wrote:
> rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
> are declared in rtl8192c_recv.h but have no implementation and no
> caller anywhere in the kernel tree. They are leftover from when this
> driver was derived from Realtek's shared vendor codebase covering
> multiple chip families.
> 
> Verified via grep across the full tree that neither symbol is
> referenced outside this declaration, and confirmed via a full build
> of the module before and after removal that no warnings or errors
> are introduced.
> 
> This addresses the "find and remove any code for other chips that is
> left over" item in the driver's TODO file.
> 
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>
> ------------------------------------------------------------------

This line isn't needed because:

> 
> Changes since v1:
> - Rebased onto linux-next as requested by Dan Carpenter

That should go below

> ---

That line.

I think the documentation explains this, right?

thanks,

greg k-h
