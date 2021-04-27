Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E571
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 09:32:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEE45613C2;
	Tue, 27 Apr 2021 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619515952;
	bh=tPt28XM8aJLIshA3dm6rMjVcvA0FXwOFYDhvj9Mdv+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brhLK1kI4KhPfwhvrqbMh144h8bMt77mjN21VMVEqLk3g/oEwPlIB4TaswAg+4ULs
	 cN2fYd18Fy6GadECxf8XbfGdmdQtynBAl1SIsf6+jKHFlzlfR8MyYbJjDbhs53f35Q
	 tPoq7wh/bXDFMfqAORHoX7q2uvgbX5/vuVIzaWG4=
Date: Tue, 27 Apr 2021 11:32:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Marco Cesati <marcocesati@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] staging: rtl8723bs: avoid bogus gcc warning
Message-ID: <YIfaLbsAUjs86418@kroah.com>
References: <20210422152648.2891996-1-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422152648.2891996-1-arnd@kernel.org>

On Thu, Apr 22, 2021 at 05:26:19PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc gets confused by some of the type casts and produces an
> apparently senseless warning about an out-of-bound memcpy to
> an unrelated array in the same structure:
> 
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_ap_set_encryption':
> cc1: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
> In file included from drivers/staging/rtl8723bs/include/drv_types.h:32,
>                  from drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:10:
> drivers/staging/rtl8723bs/include/rtw_security.h:98:15: note: at offset [184, 4264] into destination object 'dot11AuthAlgrthm' of size 4
>    98 |         u32   dot11AuthAlgrthm;         /*  802.11 auth, could be open, shared, 8021x and authswitch */
>       |               ^~~~~~~~~~~~~~~~
> cc1: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
> drivers/staging/rtl8723bs/include/rtw_security.h:98:15: note: at offset [264, 4344] into destination object 'dot11AuthAlgrthm' of size 4
> 
> This is a known gcc bug, and the patch here is only a workaround,
> but the approach of using a temporary variable to hold a pointer
> to the key also improves readability in addition to avoiding the
> warning, so overall this should still help.

What version of gcc causes this?  Should this go into 5.13-final and be
backported?  Or is this only showing up on "unreleased" versions of gcc
and it is safe to wait until 5.14?

thanks,

greg k-h
