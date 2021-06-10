Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F50173
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 16:25:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08E6B60C40;
	Thu, 10 Jun 2021 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623342300;
	bh=WwLLfcwGZHDA7ZGpQXlP63WXRUejUeq9+2++Wn7zSP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIWMv4ay18ENXTAuS3f1UbSGfY04qOBcjRirgNP8oUbh/lEb0DqKYWD4VjQc6RVzo
	 LdgcXRMxC8x+NwsS11IsEbB/Tb8qn4jMRWD9+sByeGuHugCr0TgSdQLt5MSHENDkgN
	 CYrXpdquvDQwDycL0s+04v4Jzqyso2k4apRNDISE=
Date: Thu, 10 Jun 2021 18:24:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Philippe Dixon <philippesdixon@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix various checkpatch.pl warnings
Message-ID: <YMI82S+F/YiO+hD0@kroah.com>
References: <cover.1623339773.git.philippesdixon@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623339773.git.philippesdixon@gmail.com>

On Thu, Jun 10, 2021 at 08:51:14AM -0700, Philippe Dixon wrote:
> This patchset contains minor changes to remove some checkpatch.pl
> warnings and better follow the Linux kernel coding style
> recommendations.
> 
> Philippe Dixon (3):
>   staging: rtl8723bs: core: add blank line after variable declaration
>   staging: rtl8723bs: core: add * to each line of block comment
>   staging: rtl8723bs: core: remove whitespace from beginning of line

In the future, make your 0/X email subject line also reflect what part
of the kernel you are changing.  Something like what your commit
messages have in their subject lines would be helpful.

thanks,

greg k-h
