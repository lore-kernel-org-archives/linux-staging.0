Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE670
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 09:26:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86C276023D;
	Wed, 26 May 2021 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622021194;
	bh=ihMAfrU+cIBr0TbhWoWtSQDcvN2KnrbF5Dp0KkT0TlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkSdwgnPXqikqcne9N4QCLm/t1hp6wQJcJdqoB1JQEYYHy/fyNwC7zTQsbEoMmp1I
	 Fr4sBIiJ4DZzTOlLRNbXOBJ59xTj4FGCT1O/DZ1tz7YlLTi52nz7UCy84yiCZjstKV
	 KlUWSzFzYoiY1Muy2aBbsF1ndGWMUOFN9P9bBuQ8=
Date: Wed, 26 May 2021 11:26:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove the repeated declaration
Message-ID: <YK4UR3mJA3QGnzUL@kroah.com>
References: <1622018639-55426-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622018639-55426-1-git-send-email-zhangshaokun@hisilicon.com>

On Wed, May 26, 2021 at 04:43:59PM +0800, Shaokun Zhang wrote:
> Function 'rtw_indicate_wx_disassoc_event' and 'Hal_SetBandwidth' are
> declared twice in their header file, so remove the repeated declaration.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h | 1 -
>  drivers/staging/rtl8723bs/include/rtw_mp.h    | 1 -
>  2 files changed, 2 deletions(-)

What changed from v1?  Always list that below the --- line please.

v3?
