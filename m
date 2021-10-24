Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CC72
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 12:32:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3F5F60F45;
	Sun, 24 Oct 2021 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635078736;
	bh=Km+JhwCmBGgjOudbMH12yf4Pvj43P3NiJvVJRT1zqz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zs5UBYSZ/iMUOsQLy/nHItFh7sjv6nnBy1IHqcPKkzcIHPY8hJNEOu1qylPI5ADeZ
	 DaVVFUkpnuz2T1L3kvRMtC48kGNMJAcCZ/nRNoqKss5gIOZ6u5mUIAV4TrvDs105mr
	 Ak1TlOdKS8zUavuNKRmkuONJVqzHtyJYIGo9ArsE=
Date: Sun, 24 Oct 2021 14:32:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Christian Haukvik <jchaukvik@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fixed spacing code style warnings.
Message-ID: <YXVSTrsMvRDnVbEe@kroah.com>
References: <20211024114658.74391-1-jchaukvik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024114658.74391-1-jchaukvik@gmail.com>

On Sun, Oct 24, 2021 at 01:46:58PM +0200, Jim Christian Haukvik wrote:
> This patch fixes some warnings reported by checkpatch.
> 
> Signed-off-by: Jim Christian Haukvik <jchaukvik@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_io.c | 42 +++++++++++++--------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

This file is not in my tree.  What tree/branch did you make this
against?  Always work against linux-next so that you do not duplicate
work already done by others.

thanks,

greg k-h
