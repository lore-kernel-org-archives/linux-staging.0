Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3EF5F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 12:26:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDD0B61003;
	Mon,  5 Apr 2021 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617625597;
	bh=cGWp0ezMmOoMvx7UXhwplUVD4fSGQMnKyA4zazI6JQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1faTQahxWxgjtCVqDvHlSxcd8pq3ZALlJX26Uxcspm2+b4HxXv3VgmF4MMZcLfBXD
	 rJ8Prz/onAo5Wac+ECykb6scnBe3nyaYiJF6ZAtAKWTHjSUEYtwAE1Xv3XghN6uRhu
	 A7mG7SRYheuVBkhfynBg02rRDUxiGsDJjDTLT5Ho=
Date: Mon, 5 Apr 2021 14:26:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amos Gross <email@amosgross.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8188eu: rtw_security: fixed coding style
 issue with spaces
Message-ID: <YGsB+tvzwuMh0jiV@kroah.com>
References: <20210405112841.GA26479@elementaryos>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405112841.GA26479@elementaryos>

On Mon, Apr 05, 2021 at 11:28:46AM +0000, Amos Gross wrote:
> Fixed spacing for a number of lines starting with spaces.
> 
> Signed-off-by: Amos Gross <email@amosgross.com>
> ---
>  drivers/staging/rtl8188eu/core/rtw_security.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
> index da26a3c705f8..a7cc7593c5fd 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_security.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_security.c
> @@ -425,9 +425,9 @@ static const unsigned short Sbox1[2][256] = {  /* Sbox for hash (can be in ROM)
>  	0x2DB6, 0x3C22, 0x1592, 0xC920, 0x8749, 0xAAFF, 0x5078, 0xA57A,
>  	0x038F, 0x59F8, 0x0980, 0x1A17, 0x65DA, 0xD731, 0x84C6, 0xD0B8,
>  	0x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
> -  },
> +},
> 
> -  {  /* second half of table is unsigned char-reversed version of first! */
> +{  /* second half of table is unsigned char-reversed version of first! */
>  	0xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
>  	0x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
>  	0x458F, 0x9D1F, 0x4089, 0x87FA, 0x15EF, 0xEBB2, 0xC98E, 0x0BFB,
> @@ -460,7 +460,7 @@ static const unsigned short Sbox1[2][256] = {  /* Sbox for hash (can be in ROM)
>  	0xB62D, 0x223C, 0x9215, 0x20C9, 0x4987, 0xFFAA, 0x7850, 0x7AA5,
>  	0x8F03, 0xF859, 0x8009, 0x171A, 0xDA65, 0x31D7, 0xC684, 0xB8D0,
>  	0xC382, 0xB029, 0x775A, 0x111E, 0xCB7B, 0xFCA8, 0xD66D, 0x3A2C,
> -  }
> +}
>  };
> 
>  /**
> --
> 2.17.1

There was another patch for this same driver to fix this a different
way.  Did you see that on the list?

Anyway, your patch will cause the indentation to be wrong, so I couldn't
take it, sorry.

thanks,

greg k-h
