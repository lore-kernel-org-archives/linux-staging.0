Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1039EF1F;
	Wed, 18 Mar 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843624; cv=none; b=JZJ6eftQEqqNAEeAjLgw4rtXiHS43O3nPUzg9O1h6XWxrdsYM+XcJ1lLzagPU/SXUagjok+8PncsR8LpB4SRtXHhVEVO62fMz1YLB8gUbifGEzSFvnQO/CCP68Z5vuOI80OtnuJkNeEaM+FWUQ5DFNuRGml4aorIoFyAozQXOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843624; c=relaxed/simple;
	bh=ReoYuwagINM7EoBGkVPEe4DaVEeIZ+MOlju/euHQhks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSTs76NtHsIKCXjmkJRieD2lo45apvzidiP9+1p/iWCsGnFbYvl25KDTnU9jF1Dm83O6MpB3OaS4gTKf5WEwiCxtPng798EP31Vo3DS8VtrMUs+JjWpkiyCoEhbQsL5f0mow4eNXvX+sUaJUBGeTjM8b6sDwkgH/68GM5dbd41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1lnxORml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1lnxORml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F3EC19421;
	Wed, 18 Mar 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843624;
	bh=ReoYuwagINM7EoBGkVPEe4DaVEeIZ+MOlju/euHQhks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1lnxORmlMlaAgrOtnNt2y2B1SzwdKDauOO3F9MyACnN8n6QPT8nljXdGx+h7aBKLy
	 w2XiYkX3xWgykJDT28P+z2tdZNPIyiJzkQDUJGLlBx2jE3AQy2D+jlxO7hLqvKu9M+
	 mkjjRnZpTI1R46gtAPf2+9HKsGrpVnnadplup67Q=
Date: Wed, 18 Mar 2026 15:20:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: replace DEFINE_IDR with
 DEFINE_XARRAY_ALLOC in uart.c
Message-ID: <2026031859-nest-booted-56ec@gregkh>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317211651.8098-1-rayfraytech@gmail.com>

On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> Replace deprecated DEFINE_IDR and idr_* functions with the modern
> DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.

What tool is causing people to want to do this change that I keep
rejecting?  Can you please go and fix it?

thanks,

greg k-h
