Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5770
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:51:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9230613B1;
	Tue, 13 Apr 2021 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618300317;
	bh=kH6tzlgbDeOX411elnJ/YrqiObxFCB2d+i2jEGP6EVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfyifVtZP+00T6KM/wUeCHuGZbvos4c60CfXdKSe1HM5C/MJOypnszg+TY/YTfQ3F
	 G3MJKorJ8mYVYR51as0PxCb+sAk2sWrfhTCDjd5PZeAmRJYLTnGJq/OmlI7NWvToT7
	 50flA6rU2+1jtClNXN3Bt8gbHqrnQfW5IRvA4Uv8=
Date: Tue, 13 Apr 2021 09:51:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 0/2] Remove spaces and blank lines
Message-ID: <YHVNmqagCRLbicR/@kroah.com>
References: <20210412175903.17819-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412175903.17819-1-fmdefrancesco@gmail.com>

On Mon, Apr 12, 2021 at 07:59:01PM +0200, Fabio M. De Francesco wrote:
> Removed spaces before tabs and multiple blank lines from Hal8723BReg.h
> for readability improvement. Issues detected by checkpatch.pl.
> 
> Fabio M. De Francesco (2):
>   staging: rtl8723bs: hal Remove spaces before tabs
>   staging: rtl8723bs: hal: Remove multiple blank lines
> 
>  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 43 +++++++++------------
>  1 file changed, 18 insertions(+), 25 deletions(-)

This series does not apply to my tree, please rebase and resend.

thanks,

greg k-h
