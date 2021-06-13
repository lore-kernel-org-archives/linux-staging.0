Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F92FB2
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 10:27:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58621611CC;
	Sun, 13 Jun 2021 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623580021;
	bh=jMfZUmtHh0e5AoMiIZXNSQV+E64D4H3MFVmGjvyGQ6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0kZVZPBdgNfuHs2ccce98GakQqil2D8h+K4Ov6U3jL90RKMphQES/XRll+30PFFS
	 70z/K85gm/KXikMP14PtkBH6y0SPmNhl760/lsJf4PkMDExT5lzslLvBtwCr/rwi4a
	 3rWhG36f/R7yes0sqTBzSvj8Bg6xkxg4hZPWHaeg=
Date: Sun, 13 Jun 2021 12:26:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jhih-Ming Huang <fbihjmeric@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtw_security: fix cast to restricted __le32
Message-ID: <YMXdc/UtkcVOlZ70@kroah.com>
References: <20210613102229.1424495-1-fbihjmeric@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613102229.1424495-1-fbihjmeric@gmail.com>

On Sun, Jun 13, 2021 at 06:22:29PM +0800, Jhih-Ming Huang wrote:
> This patch fixes the sparse warning of fix cast to restricted __le32.
> 
> Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index a99f439328f1..2f4da67e31c6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		arc4_crypt(ctx, payload, payload,  length);
>  
>  		/* calculate icv and compare the icv */
> -		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> +		*((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload, length - 4));

When you use __force, that usually implies something is wrong here.

Look at the recent changes that were just submitted for this a week or
so ago in the mailing list archives, and the discussion about them, to
see the issues involved here.

I would need to see a _LOT_ of description in the changelog about why
these changes are actually correct, before I can take them.

thanks,

greg k-h
