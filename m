Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077183E4C9F
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495764; cv=none; b=BWaMaUqYKRAXtkN2zOepGiunz0/UICReSdgpfgHrkDp5r28v0b47Ayu/CQKJsVCllDPYzhsUrlmF9aKKeWumMGEU9J/LzCay+nvo4ZYqDgej/j9ZVHelwFKQOsClXeHUP8Ow4rb6qPGTXb2SAieYz7961XBZ0Gcyeue/da+KJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495764; c=relaxed/simple;
	bh=UttL/smsbJtkih5lb1VV/UF9Ho2WkKRkc69jT3EqbN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbyQ3IBEdKzKSu8m/1JhLgISBM1RlSmHc2r9XtZ5uUwtWrq7HdXH4guEkjPeRnLp2U80e1oW6OMP9YP0f211d6QzJW4GJR6EOhbxXv4w3K7P19YdGzIruU7SCGa53vf5Ync5sFnH4U3vicR9UEr8zU081n4gzYq4mDBqFHZ8DKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax6/hCXC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax6/hCXC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1f5208b38dso146499466b.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785495761; x=1786100561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6uNV2GL6C0ZsZDyZS0/gYxz+j9PZV4eKokd6xszxy0=;
        b=ax6/hCXC1rXBV1fDdqCWqAAaLU96Rof/LEZhfa+f9YXy3d2kWgrANRUtm+oruiOzlZ
         dhYc+9/P6WovU2CBnldlyauQFd14Q5/nB0HAKT0w5jEyY6A5FfmRn1QvAY0ieAGDly6Y
         Ll2ktU+zUrQZ/JhkphEVQ6n7Yku9DNzDMMr++XPxYKZlzIBWabpq0Y4UnXRUkw6c4J7B
         rt61KwEKdyJ3EblivL+qm0YVkaWSi8N6dMXnUu0Moyh1rKB6hU5J13OcNKMtZTI+mwVx
         /ts4CfrbgF/wDf8A5L3zi92QwoPNHpo80MuZg7K2ygOK5fLx0SE+0plqPru3MOFruLGi
         WHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495761; x=1786100561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6uNV2GL6C0ZsZDyZS0/gYxz+j9PZV4eKokd6xszxy0=;
        b=rsvNyQwgdgVjsl/F4cE7XcV3P9PyOuZQ3SB5PkOMMGuhPR0MUyMFDw+mS4i+KMJywv
         BnyicBkrTiXWqJTitVxKivJCyTseFaCv2a1KJkmwSswy2e0mwluQ86cZQW+CGXRbhuYL
         rLgTAmAHE+N4rtfUvEQhHczXYAOSPDA8ES+WPItWfuaHb/QLKmw3FmL+srUTvr5tqQAO
         eEbdT3RG5CZeSCmwl6DppSlEOp7vE00JhkFBxpEN+G7c6aVGwC/38/bel8ar++ShjvC8
         IRaAo2b63GWwcIYSkyCR7+8FxEJfyps0BIaFbDzWoTEGJpnqLxqw8O3dWuOAo6u5jRbu
         dV5w==
X-Forwarded-Encrypted: i=1; AHgh+RrNgtecSZjZ7g+EqLwjnGhwhMmETt8PF4oxvwR0cmxAxtzE2slN6+mJgQ8ahkxAUEJ8UPdk1c4qArQ14vh/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Ya7oc8ihvMoslVADWhgqyQMoK4vfhCq11lmyW3J1nGdSBda0
	A4TmEzLrMBNrmm8ImVQH80hzhSrnvZgA0DGP+bbBMkkojgpxgJugjX1f
X-Gm-Gg: AR+sD11fsayniA0V28CpCpbo5zb4Ho5fbLdAtCB86kf+G4rzf40N4V2achQbPVhWspQ
	N8tktlJKEpIcFUyvJyfFRBDu9DAJU1BzKjj4gdABxWxiG2ZpGsX3owigEzAY+69OTMGARC3hXJU
	qzk5rNAdd+HU0ELb3ERdoH5enIXn2rGlfSr/Lql65zt0pv5ZEpmowxwxSRESg11fMcVQG9SE9Iz
	e3uzpfoDE+3dEhUdaSDkpKE4odGPyTw14HRA0N91PZmOJd3sw1ozWqXNhLdpzrdVCPAgMJ6XD5p
	45h9uWJXB3/CBrfvcax7NdFxo32l9sTTkyD7Bnnq6mRK3QovM+obLkQ9N7cKeJKv2oF31CSmgk1
	yUKRvLRM196NdJSndeSK0b6Co1dMBB0Out0ssbikudqJxvLNHt7PQQ6w8iZfXzNFZFWw7z+Rp5a
	lmRE1Q42+Cad7iyMqXlAbqhYhxpVHOEB48unhoATR2rQXXqHP+k64cb3okMg==
X-Received: by 2002:a17:906:7948:b0:beb:133d:cf02 with SMTP id a640c23a62f3a-c1fd24147f3mr89622466b.26.1785495760950;
        Fri, 31 Jul 2026 04:02:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c93a87sm114875166b.18.2026.07.31.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:02:39 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:02:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: propagate errno handling for
 mgmt xmit
Message-ID: <amyAy1GO98r6wV9T@stanley.mountain>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
 <20260731070546.20959-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070546.20959-3-dennylin0707@gmail.com>

On Fri, Jul 31, 2026 at 07:05:45AM +0000, Hungyu Lin wrote:
> Convert rtw_hal_mgnt_xmit() to return errno-style values and update
> dump_mgntframe_and_wait() to translate the result back to the existing
> _SUCCESS/_FAIL flow. Update the prototype in hal_intf.h accordingly
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
>  drivers/staging/rtl8723bs/hal/hal_intf.c      | 9 +++++++--
>  drivers/staging/rtl8723bs/include/hal_intf.h  | 2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index f5ab94a2d0a0..0027f9333738 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1990,6 +1990,10 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
>  	pxmitbuf->sctx = &sctx;
>  
>  	ret = rtw_hal_mgnt_xmit(padapter, pmgntframe);
> +	if (ret)
> +		ret = _FAIL;
> +	else
> +		ret = _SUCCESS;
>  
>  	if (ret == _SUCCESS)
>  		ret = rtw_sctx_wait(&sctx);

This is awkward.  I would have allowed it either way, but it's good
to note this kind of thing in the commit message:

"After this change the error checking in dump_mgntframe_and_wait()
becomes quite awkward because we need to convert zero to  _SUCCESS (1)
and negative error codes to _FAIL (0).  A follow on patch will
change the dump_mgntframe_and_wait() to use kernel error codes
consistently."

regards,
dan carpenter

