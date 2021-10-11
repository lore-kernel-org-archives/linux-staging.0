Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2CE72
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 15:37:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B54F60C49;
	Mon, 11 Oct 2021 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633966634;
	bh=FYqUw2kqkpM1DyrtfaYbrUz43GROjaDL9qhLZeZKSHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnEwP3jXLhW/kkBdFK240IKzVDBWwrB2McxnaSed+2Q7aZcTB1gefyv+On5HW7XpK
	 +C7MON9sKw+5Rsw9mIROp1BMU6c8cnUKxTman4S83uX8tU/IYRARhfHz6Ot3XMnUYh
	 5ZcvTV+sket4R6EyIIXIbP5gPwtSNLFrQXYi78C8=
Date: Mon, 11 Oct 2021 17:37:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
Message-ID: <YWRaJfSqKsTqsRdr@kroah.com>
References: <20211011152941.12847-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011152941.12847-1-vegard.nossum@oracle.com>

On Mon, Oct 11, 2021 at 05:29:41PM +0200, Vegard Nossum wrote:
> Fix the following build/link errors:
> 
>   ld: drivers/staging/ks7010/ks_hostif.o: in function `michael_mic.constprop.0':
>   ks_hostif.c:(.text+0x95b): undefined reference to `crypto_alloc_shash'
>   ld: ks_hostif.c:(.text+0x97a): undefined reference to `crypto_shash_setkey'
>   ld: ks_hostif.c:(.text+0xa13): undefined reference to `crypto_shash_update'
>   ld: ks_hostif.c:(.text+0xa28): undefined reference to `crypto_shash_update'
>   ld: ks_hostif.c:(.text+0xa48): undefined reference to `crypto_shash_finup'
>   ld: ks_hostif.c:(.text+0xa6d): undefined reference to `crypto_destroy_tfm'
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  drivers/staging/ks7010/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

What commit caused these issues?

thanks,

greg k-h
