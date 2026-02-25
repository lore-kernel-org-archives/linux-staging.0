Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8229A309;
	Wed, 25 Feb 2026 18:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045270; cv=none; b=qcnpJVJe0T9mrp7PhTDCbKuqvpFka6/gafXVHG36PkZvRXOm0+e+ieqCksp5xhY1EBxEt3I+qGTa2FfXs70X3ln1MNYXAu77APs26AcjwA3xVcdP0QKGkcRLZUaJRMi94ibgvOyzb+1YNu+lffY5Q8TGMzQijUv3afQVkE2tYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045270; c=relaxed/simple;
	bh=vrD+mJmmtyW+6ZcAATCZjLssCXLTV8dgGGySxPO+jTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU1XV98W/b7yeJrJUoz0zjqjxXGl6X01Tj64H3lcJlQ2WHRrfqjYATaXSw4WAY24G6DVZEydfmS0gmNb2IOptXGPxTQUEDvTxkfoO8Vt/lzDeiN5GAUct6Tw1Tdz4p0a6yt0pUX5g8y6lyrlQZfO7hY3vJAbg3t3VOHHuIOy8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lY48sPXr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lY48sPXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64F4C116D0;
	Wed, 25 Feb 2026 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772045269;
	bh=vrD+mJmmtyW+6ZcAATCZjLssCXLTV8dgGGySxPO+jTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lY48sPXrUtPmusSj3pFOpppatNP9JNLj3rjDU2q/DxAYPTuVGAGs8QgdXoxK1RLf7
	 1CrelU4eb3vY5UvEWyQMn1RANS/o+mLoaHvYHlW09OJfhoHk0XwJbIZdkzaOlb6el4
	 CijbLAI/cS/IE6F6W3incMBEAYoBf3BLA9gsosQo=
Date: Wed, 25 Feb 2026 10:47:42 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: greybus: uart: convert to XArray
Message-ID: <2026022506-untouched-scone-e6bb@gregkh>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
 <20260225183836.20434-2-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-2-chakrabortyshubham66@gmail.com>

On Thu, Feb 26, 2026 at 12:08:36AM +0530, Shubham Chakraborty wrote:
> Replace the deprecated IDR API with the more modern XArray API.
> This simplifies the code and improves efficiency.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

This really isn't needed, sorry, it doesn't improve any "efficiency" and
I think I've rejected this change in the past as well.

It's just a simple minor number, an idr is just fine for it.

thanks,

greg k-h
