Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4970
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:07:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8E8061004;
	Thu,  5 Aug 2021 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628161651;
	bh=ZimSHSr81sxCTYUBZ1LOL41Alcaubv55ZtIbHYn9Yhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1U0qi+U9pqFAzjgGKwCbEsQTp557pdYeUAVPsLRZ3gUGw4ZQG4+cdC9pVqTcHVKA8
	 Z8qr4UbicAb3McT5TzBRioQ178yfENkKF1dhi7UNyOOwEd4gKwGX40QKZiJQYJLrTj
	 jZBcGGpdhDHdV7XfSdnxlp6R1mt/OX+ESkbRkUK8=
Date: Thu, 5 Aug 2021 13:07:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: remove RT_TRACE and DBG_88E prints
 from usb_intf.c
Message-ID: <YQvGcDMLX5OTSzIr@kroah.com>
References: <20210801173023.1370-1-martin@kaiser.cx>
 <20210804141031.12303-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804141031.12303-1-martin@kaiser.cx>

On Wed, Aug 04, 2021 at 04:10:31PM +0200, Martin Kaiser wrote:
> We should use the standard mechanism for debug prints. Remove the
> prints that use driver-specific macros.
> 
> Handle errors from the usb_autopm_get_interface call instead of just
> showing a debug print.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>  - bring back usb_autopm_get_interface, handle errors

This is a v2 of patch 1 in a series?

Or something else?

When resending a new version, please always send out a whole new series
to make it obvious what to do when reviewing them.

I've dropped this series, please fix up and resend.

thanks,

greg k-h
