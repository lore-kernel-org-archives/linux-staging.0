Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641A72
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 18:13:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEBF861438;
	Thu, 13 May 2021 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620929613;
	bh=OvhlRqyx7Kpa4/I0T+ZjMP0SRxz+Mp6ufMqo5WJbK+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KcncL+Q/UPVGg4BEWOzw5ki0Oxym/ZBYj6eHmDa4wHSkkfuXWWwSFrxUAbz0K3lLp
	 bdCLZJDzDJy62bDcs6e55C0JzprVDuZkPd2PIdIAIkDSon8vVUgmmefJlRC5+LX2et
	 2jzbjxiWsv/gDjs8Jh3iBn7yG351BH4fRQgB9QeI=
Date: Thu, 13 May 2021 20:13:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: core: eliminate erroneous
 reporting of unused variable 'evt_seq'
Message-ID: <YJ1sSnEa+qFBOsli@kroah.com>
References: <20210513094007.6435-1-thunder.leizhen@huawei.com>
 <20210513094007.6435-3-thunder.leizhen@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513094007.6435-3-thunder.leizhen@huawei.com>

On Thu, May 13, 2021 at 05:40:07PM +0800, Zhen Lei wrote:
> GCC reports the following warning with W=1:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6003:15: warning:
>  variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]
>  6030 |  u8 evt_code, evt_seq;
>       |               ^~~~~~~
> 
> The local variable ‘evt_seq’ is referenced only when the macro
> CHECK_EVENT_SEQ is defined, move its definition and assignment into the
> control scope of macro CHECK_EVENT_SEQ, to fix the warning.
> 
> By the way, clear local coding style warnings and delete several redundant
> blank lines.

Do not do lots of different things in the same patch, this should be
broken up into doing "one logical thing per change".

Please fix up and send as a series.

thanks,

greg k-h
