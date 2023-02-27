Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7EB640
	for <linux-staging@lists.linux.dev>; Mon, 27 Feb 2023 04:47:42 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q16so4855958wrw.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 20:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5pnNZDw7QdzXNOM+p7zLL9mRnQ7pTZFlC2sCefY6Q8=;
        b=AHQerDa0D2gjrEM3/6+pbLu4EiE7JH0iQUJsmQawF//n2hqu4ifk3pKnMxtJo70oe8
         LWTykC2xWmhDNGh78Zz/3SkmxqKnp24YjESUQjfYtHcjiY0u6Rd6vRG6rm53+FN7xO/z
         baZjhYDb6P0t6WXduyD8vQk/lHvDiHo1CwkmuXCcpwegaaCCmVWubqfR0BcuABcpqRgY
         ZEzTFevfoq70+52/jkAF190nHN32zUIrxZMMowEThZQJ1ro1EHgTl6Ysn2ooLE/BkWnk
         Ro65Q4vGICHCDBzDy5V3t4QEPxQWWnk+Uj++pbyGKLtRpS9+bW0KSIg6ujs5aEIx6LRm
         Q1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5pnNZDw7QdzXNOM+p7zLL9mRnQ7pTZFlC2sCefY6Q8=;
        b=k9sOiydm0g1qFl8SiwnAC1QMiMRhGz/dUKTNZ/RRxR9+hgqXCszvL0Rfe6Dc1ILEVy
         19c1Cvc9sz7/RCuNHr2KNVBYLGMXpr4C6SrAkyhP6R7kPJ8gE8XB4zwVLjuwMPSz7qQy
         k/QDj3/4INe57+CvUJsDSqkBVoZg3x45JvZBcs7z8y8DK5kMDR7G2m6kHVohhiPAoJHt
         9zaUmtuFeO17SV73msYPPLVXIKug1B/0uVPxG00pGmu+VuKYAW3f2g60JKzogGmewXCT
         J3B4AZPmex/XBge0MbPZFS1c85xOBiccwAcU6HCgmon63QGHNzxcLBmHHLSzTaYTMCwu
         VRpA==
X-Gm-Message-State: AO0yUKXsQYJG6FEgjJbOrchmMZ4FQdYNT/iy6vQGJrOGSE+rW5HRLALt
	z/rSt8TANy9UuIWDIQWKWFKmphPkeGE=
X-Google-Smtp-Source: AK7set+fSKmzs4msMrukUAYpzEAtIIuForVzV1d56gIL7HgeIIg8/V8ApAM576tUsxHihha54pYg4g==
X-Received: by 2002:a5d:4105:0:b0:2c5:5eff:5c81 with SMTP id l5-20020a5d4105000000b002c55eff5c81mr19270737wrp.38.1677473260421;
        Sun, 26 Feb 2023 20:47:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a5d54d0000000b002c71703876bsm5908843wrv.14.2023.02.26.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 20:47:40 -0800 (PST)
Date: Mon, 27 Feb 2023 07:47:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <void0red@gmail.com>
Cc: paskripkin@gmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: add a null check of kzalloc in
 go_add_group_info_attr
Message-ID: <Y/w16PI4klfJaeXA@kadam>
References: <20230226132500.3933232-1-void0red@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226132500.3933232-1-void0red@gmail.com>

On Sun, Feb 26, 2023 at 09:25:00PM +0800, Kang Chen wrote:
> kzalloc may fails, pdata_attr might be null and will cause
> illegal address access later.
> 
> Signed-off-by: Kang Chen <void0red@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_p2p.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> index 93d3c9c43..802e1170a 100644
> --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> @@ -31,6 +31,8 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  
>  	pdata_attr = kzalloc(MAX_P2P_IE_LEN, GFP_KERNEL);
> +	if (!pdata_attr)
> +		return 0;

Return success here is not a good thing.  We have to fix the caller to
check for errors.  (Fixing a bug half way just makes it harder to find
the bug so it makes the situation worse).

regards,
dan carpenter

