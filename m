Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE270
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 07:24:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25BC8611EE;
	Wed, 16 Jun 2021 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623828283;
	bh=8KojXHjsJ/LnApv/9ehE4CNk7eTEPufL4aZfipKxfMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6Z7rXGc85p1bBlKzSQ2btDHGj184uhMB3fNF2oX5BAWzXVwrhm1OGI9/Co8TyIHJ
	 8mwDzvmyzeJNE1l45h354aClwMKsf1baHstg007FM23+E8QwfmWZvn8iNTjRhEMgbJ
	 +OlwrKTAeE0j8D2sb5Ds4xEem0ypTxNly+M6Ij68=
Date: Wed, 16 Jun 2021 09:24:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/7] Fixup unused variables and warnings
Message-ID: <YMmnKSWJNIk/XJR7@kroah.com>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>

On Tue, Jun 15, 2021 at 11:36:00PM +0100, Phillip Potter wrote:
> This series fixes an empty goto label by removing it and converting its
> associated goto to a return. It also changes a decrement operator to
> prefix to make it clearer, and provide expected behaviour. Finally, it
> removes a lot of unused variables warned about by the kernel test robot,
> which are a result of my previous DBG_88E removal series, and removes an
> entire function as well which is surplus to requirements.
> 
> Phillip Potter (7):
>   staging: rtl8188eu: remove empty label from
>     mlmeext_joinbss_event_callback
>   staging: rtl8188eu: use prefix decrement operator on trycnt variable
>   staging: rtl8188eu: remove unused variables from core/rtw_efuse.c
>   staging: rtl8188eu: remove unused variables from core/rtw_mlme_ext.c
>   staging: rtl8188eu: remove unused variable from os_dep/ioctl_linux.c
>   staging: rtl8188eu: remove unused variables from hal/rtl8188e_cmd.c
>   staging: rtl8188eu: remove _dbg_dump_tx_info function

In the future, can you use "staging: rtl8188eu:" on the prefix of your
0/X email so these can be caught easier by those of us who filter on
stuff like this?

And thanks for fixing these so quickly, I'll go apply them now.

thanks,

greg k-h
