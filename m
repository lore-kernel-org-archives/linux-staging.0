Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087170
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 10:58:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4BF5610CC;
	Thu,  5 Aug 2021 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628161130;
	bh=W5+8fOY46ERocNkBVQLYJeWbPtwbDFyp6xF/ik8h/eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1jsVLZwZ58FQkjNBQRcEM5qgjbwjB6z6jei1avtf1LG6AbM7JyCWX1x/rpZ3vpJo3
	 qd1CIWmtgof+cxjrxI3WPi1+CuKpg+wd1VxGpGWe7pFh+kFy5L9Ij9dw97tyas20PV
	 7YES607a+ZXIbHjVs2/OlRZKulfaieBp2Rhq+2Nc=
Date: Thu, 5 Aug 2021 12:58:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] Various cleanups of driver
Message-ID: <YQvEZDF6DiBxZv38@kroah.com>
References: <20210803135223.12543-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803135223.12543-1-Larry.Finger@lwfinger.net>

On Tue, Aug 03, 2021 at 08:52:13AM -0500, Larry Finger wrote:
> This set of patches removes some wrappers around simple actions,
> and replaces some of the home-built bit manipulation macros.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> 
> 
> Larry Finger (10):
>   staging: r8188eu: Remove wrappers for kalloc() and kzalloc()
>   staging: r8188eu: Remove wrapper around vfree
>   staging: r8188eu: Remove wrappers for atomic operations
>   staging: r8188eu: Remove 4 empty routines from os_sep/service.c
>   staging: r8188eu: Remove all calls to _rtw_spinlock_free()
>   staging: r8188eu: Remove more empty routines
>   staging: r8188eu: Remove rtw_division64()
>   staging: r8188eu: Remove wrapper around do_div
>   staging: r8188eu: Remove some unused and ugly macros
>   staging: r8188eu: Remove some bit manipulation macros

Portions of this series applied, again, can you rebase and resend?

thanks,

greg k-h
