Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A97426ED1
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842283; cv=none; b=OY7k8Oeljzne7PRfmPez1v9+8ps7LxrxU/jSymo/MTxUT4FdyR2a/1m3BHjmZNV37HF28sQ18tCDjMsRDvL5Po4JbQIBMe5i7aiYDRuGUdCUfqp1pdKjcGvbD7XU2/pjH7VEFiSvwV4FI9ogX3hflSZIuWjG20XYcUJMaJLywLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842283; c=relaxed/simple;
	bh=cvyV/WI0dRnDIwNczQydcASvrsgMMrlioZZHejIy2Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUVEVYJVoXUCEqHjdhmtrGTxiCA6PEq2f7hGNlTgNH0B8q2PFy8fWGlw1WpFD1bSo8kTaEISxh9rUsEp6PEilFFMWJi67u76UEUcCtkCZrpxkCtdU5LehGN3xYdg5h2h10NGfEYrctNRAevfx/MXJpsYGsRwOC/XdY1jxZa0K1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+wL1A1w; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+wL1A1w"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso78604265e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842281; x=1779447081; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mUsN8FHr7tCwzAB6K+rR45LudEA+QL8sSLJPMSY+4k=;
        b=b+wL1A1wD8CbbWxFRCppKlroEv5QvPYZcwKsLaITAfhmXIraxeWGGX6azjXaNkIKs2
         Bw2Wfec/gXwXvvJHwP7nQ0AmyfZD78oQStD/53zpBUPjazogcGVM2SHicBkSOTGtRvdj
         rs/Wfq6g1cc/WinuASH+BFn8oEjN0QAdNNyRNLTuyfHO0HA+LzbfEZD/p/qbeOyf/K/7
         nAxI4MY7aE1obuj0WxE6a1+hzJJjduWyRyQ9dIJBv5dh99yZFFv5S4N4+IcpJsNDQImV
         7QSxH6tjL2zrR1g/9MZHit7CWHtuG58lE0oNuzviKXINP7kOmv3DVN+91DaODK/MUQM8
         UsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842281; x=1779447081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mUsN8FHr7tCwzAB6K+rR45LudEA+QL8sSLJPMSY+4k=;
        b=tM4iNnxLGafmQqtMDwlgmYbjcbonLP3BCPTZxhSVXbW0ZEQWKnvHNuhGEMXFQdzUgO
         BodHeoI34HuUT4vvsOp8CQbIvlHRhkXKjaLGYR3z/tT8XezPdMnWK0zHQfuWyGE0QMjB
         NUZBmOM1d16f9tINOOo8rG1H+nl4UVcBD4jTwZwENyD5YOVqJASlCoQHdfFKkvbaSa3F
         xYqsNFCpoRQqJgMqD/IZev/vcj7nb3bosBky+yfnh1LHhC1nNrDYzt7TnEpMxYjXJjQx
         /zRfokRiut9cp2Im8bi1t50GpQRPmDuznd8Ku/vFVwpnMM2q3M2sqS6jSXO84r1+3JoW
         HAvw==
X-Forwarded-Encrypted: i=1; AFNElJ84fyvcfUfKYOti4ccuKehkxQuEQ39RLVi307ZK0aou2jFzCUOss/W4aETI+X7xOYg7d77in0UmjsGql8RV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7oAmRDs7yBQNL+Zg8v9DQXfmI9CLDIRECMGn4HBf792y5jL4d
	h4lIjhyRHEDA6k+y1JxMNDDN5mI/Z58CvCgQO7e0E9Ygiv3ha6XBR3MZ
X-Gm-Gg: Acq92OHoo1NqxK0iF4M/XI8EutKFjWlpXnmzNUMKYLBKQPfP8A56pvv9CV4gB+/VC5P
	kOu8YxIpr0zBNF+NYx9ehfS4UasCkNTitCRynW/1QolyJq+E+j3I9FTLmhIJqjAtTRfWmwWfk2w
	uGtNNWHj202DGx4oVTDydhIiYuDbRVkR3xix6HD7MAIPSURilDTxQdVGwxgkMuVp6IYc/rPc/EQ
	WXfLOKs1nuz8LdIBxMcXR7PpuSLjAjHQ8cFeGzM+CGXKIeUZ1HNjoNZnrG0v6ZqJmFVjuj7dcLf
	VYu3NTJFcunPTm2x7hmaLk+9SM0sopHHf0flLXyOftp/9vECpDYZI+MIwWs4rc7MFoZ2qRioYfw
	SQ+d7s2JZQbTKRxQSuLwZZEdyoOKLvgPU119ZcwaiUs+36AcfasUZ+mH0Csdev9jck+fRFOoBM1
	Xb/buoO8WsJr0fyIZZMZ8=
X-Received: by 2002:a05:600c:4e87:b0:48a:93d2:60d2 with SMTP id 5b1f17b1804b1-48fe59ab8c8mr50422295e9.0.1778842280958;
        Fri, 15 May 2026 03:51:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c516sm55458295e9.13.2026.05.15.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:51:20 -0700 (PDT)
Date: Fri, 15 May 2026 13:51:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Message-ID: <agb6pfUb7GhzdYAN@stanley.mountain>
References: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>

On Fri, May 15, 2026 at 03:42:03AM -0700, Alexandru Hossu wrote:
> Hi Greg,
> 
> Here is the fix.
> 
> Alexandru
> 
> ---
> 
> The loop in HT_caps_handler() iterates up to pIE->length times, but
> HT_cap[] is only 26 bytes. pIE->length comes from the HT Capability IE
> in the association response and can be up to 255. This lets a rogue AP
> write up to 229 bytes past the array using a bitwise AND into adjacent
> struct fields.
> 
> Clamp the iteration count to the array size.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

This isn't how you send a patch.  Try applying your email with:
`cat raw_email.txt | git am` and use git log to see the problem.

>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 4f41f88908d7..e271d1e395a5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -935,7 +935,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
> 
>  	pmlmeinfo->HT_caps_enable = 1;
> 
> -	for (i = 0; i < (pIE->length); i++) {
> +	for (i = 0; i < min_t(unsigned int, pIE->length,
> +			       sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {

Just use min() instead of min_t().  They're both unsigned.

regards,
dan carpenter

