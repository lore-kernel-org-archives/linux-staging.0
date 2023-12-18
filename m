Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462E3A1B6;
	Mon, 18 Dec 2023 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FPYOjKG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E6EC433C8;
	Mon, 18 Dec 2023 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702913404;
	bh=Ft53wJ3PGGwCwY7lkYO/ANeImec+CQl0ao7r43A5rXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPYOjKG8MmmxxEXlgiJrSZgkqXi9yrAvd/vkaG/SYRwpDipOI9u8sfxWXjRiqtbCL
	 uYnEOp0/GbULKcnHUpuvPZEVjkiCkl6zr4jsl/l0iKi46t/hm6ErpD8POlrw76iI35
	 SClJQ1EPTxcjdE7hpEicliVHiqcI2884EUrJEJZI=
Date: Mon, 18 Dec 2023 16:30:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan England <rcengland@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: fix open parentheses alignment
Message-ID: <2023121809-viewer-depict-f23f@gregkh>
References: <ZX3oDRuQ1OvZwCe3@kernel.ryanengland.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZX3oDRuQ1OvZwCe3@kernel.ryanengland.xyz>

On Sat, Dec 16, 2023 at 06:10:21PM +0000, Ryan England wrote:
> @@ -639,16 +640,16 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
>  		if (p2ndxmitframe) {
>  			u16 total_length;
>  
> -			total_length = r8712_xmitframe_aggr_next(
> -				pxmitbuf, p2ndxmitframe);
> +			total_length = r8712_xmitframe_aggr_next(pxmitbuf,
> +								 p2ndxmitframe);

You have 100 characters now, why not put this all on one line?

>  			do {
> -				p2ndxmitframe = dequeue_xframe_ex(
> -					pxmitpriv, phwxmits, hwentry);
> +				p2ndxmitframe = dequeue_xframe_ex(pxmitpriv,
> +								  phwxmits,
> +								  hwentry);

Same with this?  And others in this patch, try to neaten stuff up when
you make this type of change.

thanks,

greg k-h
