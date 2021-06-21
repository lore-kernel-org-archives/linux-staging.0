Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E409173
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 15:51:09 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y13so2686048plc.8
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uXok+abI+/QaFNT9jA8hKXmptxZAJ4Kr1cCJQURaU7Y=;
        b=keU4suHt1fJRTQFBlYKBRC0EMAguG5yl/OEsfzIdYAVmTyomWeSylFT6kDyBWJdBjU
         ZDGzlX32ZDgQoH/aRyJh6E0K4npRE6L1yEaAgCPAlRbe3/45iCjkKDdgy6CrDFx4PMZS
         l0cbm3IwwP7jfs5czMCx5RnMS8Fxkk5L30j/ji9ggkS7L1Tf51Ilz5GemxRjYSADHXRF
         yUvC22gLQu2HP7zLgtz6uDXrrRdcoiB6GfUKPQWrPo4eBfWy2V6PxxriXAwJi6YM6aXe
         HRCNnzUom1QT8qVvXb275q45N5PtZ9x+W1idtkcUWGTNT1DATfr7yPt/fNkVxxiAJCnT
         l+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uXok+abI+/QaFNT9jA8hKXmptxZAJ4Kr1cCJQURaU7Y=;
        b=crsBCGE76vnAp0UbOtbS4kBUz0S76+DX8InG/jDi60WW1ig3Db9RpdN1UMrsRpyO1K
         lZ+uK+4y92qVgnbYvUBKMK0kVb6QSrcKw7RRMr59VIzKnWoIsLhG4+2uiDh2JDbLH0PC
         cBYG759zv/Px8/uSwrX0LspOyLZQgMIC9fh6hhhKVVpy4o6JEHLFShYM9GGTYJG3ycU/
         CpQGQC1VmZ5uAgKr9dtprwl7wxAe04LYAZ/GjKGNGGJzgGlN+oI1QuDGfpKx11epnC+D
         cgyABhVrknRigwm0fduHrkvGEtHGrcZQmRBojGmrz63hv+GKDmC4F1ZBOS7Giz7pB+Rb
         GqlA==
X-Gm-Message-State: AOAM533pFa1SYn917ouj5hx+zUFX2Wk+HurVry44VOZDrWXbAyzNAXJC
	5ukCwPGQcL8EeOtMYvIyk6o=
X-Google-Smtp-Source: ABdhPJy6Zwf17fgWA7Hdl+PWaUAEFCFpeJzvpNK0Kqsu8GlNRgdC36ejdamvFNrTEu74JMnuylfj+A==
X-Received: by 2002:a17:902:9a4c:b029:119:d507:dccd with SMTP id x12-20020a1709029a4cb0290119d507dccdmr18368549plv.55.1624290668969;
        Mon, 21 Jun 2021 08:51:08 -0700 (PDT)
Received: from gmail.com (36-229-229-123.dynamic-ip.hinet.net. [36.229.229.123])
        by smtp.gmail.com with ESMTPSA id ge24sm4252254pjb.18.2021.06.21.08.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 08:51:08 -0700 (PDT)
Date: Mon, 21 Jun 2021 23:51:04 +0800
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] rtw_security: fix cast to restricted __le32
Message-ID: <20210621155104.6w237avwjto3vysi@gmail.com>
References: <20210619075255.107807-1-fbihjmeric@gmail.com>
 <20210621081928.145203-1-fbihjmeric@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621081928.145203-1-fbihjmeric@gmail.com>

On Mon, Jun 21, 2021 at 04:19:28PM +0800, Jhih-Ming Huang wrote:
> This patch fixes the sparse warning of fix cast to restricted __le32.
> 
> There was a change for replacing private CRC-32 routines with in kernel
> ones.
> However, the author used le32_to_cpu to convert crc32_le(), and we
> should cpu_to_le32.
> 
> Ths commit also fixes the payload checking by memcmp instead of checking element
> by element and removes the unused variable.
> 
> Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>

I forgot to add the Reported-by tag. 
already added in PATCH v6

thanks.

jmhuang

> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index a99f439328f1..8dc6a976b487 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -92,7 +92,6 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
>  void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  {
>  	/*  exclude ICV */
> -	u8 crc[4];
>  	signed int	length;
>  	u32 keylength;
>  	u8 *pframe, *payload, *iv, wepkey[16];
> @@ -119,10 +118,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		/* decrypt payload include icv */
>  		arc4_setkey(ctx, wepkey, 3 + keylength);
>  		arc4_crypt(ctx, payload, payload,  length);
> -
> -		/* calculate icv and compare the icv */
> -		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> -
>  	}
>  }
>  
> @@ -537,7 +532,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
>  	u32 pnh;
>  	u8   rc4key[16];
>  	u8   ttkey[16];
> -	u8 crc[4];
> +	__le32 crc;
>  	signed int			length;
>  
>  	u8 *pframe, *payload, *iv, *prwskey;
> @@ -618,10 +613,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
>  			arc4_setkey(ctx, rc4key, 16);
>  			arc4_crypt(ctx, payload, payload, length);
>  
> -			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> +			crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
>  
> -			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
> -			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
> +			if (memcmp(&crc, payload + length - 4, 4) != 0)
>  				res = _FAIL;
>  		} else {
>  			res = _FAIL;
> -- 
> 2.32.0
> 
