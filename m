Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA3259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 10:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91E1E61278;
	Mon,  5 Apr 2021 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617617405;
	bh=Je/iwEPKGmWwfpx6j9nU8e8Cx0cbV02FGR+9cImDvtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9FTALqjBFbtV7oQpMRcYa2WpyX4RL+k+DoVQsoXjFO+qSHpnXlFc1YIro5ohuikj
	 0EgGr4bYUBdrCigV1+t4BXBLDRKiBrY75DTptvrBqSlGKT6w8ShM4LqfsDUeKwbW7k
	 mhk/Kbnxf4/G29RZajcgxDFBdqZnDRpJOA8alYWo=
Date: Mon, 5 Apr 2021 12:10:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] kpc2000: kpc2000: Removed extra blank line
Message-ID: <YGrh+jxGDczfqoeB@kroah.com>
References: <YGpCij8SVkJwO9AN@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YGpCij8SVkJwO9AN@fedora>

On Sun, Apr 04, 2021 at 05:49:46PM -0500, David Villasana Jiménez wrote:
> Fix checkpatch warning:
> CHECK: Please don't use multiple blank lines
> 
> Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
> ---
>  drivers/staging/kpc2000/kpc2000/pcie.h | 1 -
>  1 file changed, 1 deletion(-)

Shouldn't the subject line something like:
	[PATCH] staging: kpc2000: pcie.h: Remove extra blank line

?

Please fix up and try again.

thanks,

greg k-h
