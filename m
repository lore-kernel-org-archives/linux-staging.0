Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF83BE650
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509360; cv=none; b=YXBu2lySW0FdNxfwZyTMCFoS2UPt2WuWgyxwSG2YjjQiCtcwUuw6fCH33/Ml9JHu8gixb31u62cIotU82/wR1L+GS9gredw406MrmAtpdsmpdZNET1N2Gsjv6noiZ6WnyaSETbPdiiVK77oBTuQFcP23r8ormOaoJdxfeg/dFpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509360; c=relaxed/simple;
	bh=o1rFyA+rsxPg+a3o/ZLmWOAk1pe2sam9AbM0U7987oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qX4sgSMiIzuew4asha/Q2VM48vDoaiu6UZ7CjtML5YPe9z4ZHwpK0gtfwhl8rEomnh1gxvKkYsH7Y5XIYDHOT8y7GmqFyucMJHrSDU5xXJ9QAHQuoWGvW0DodD7VXIJ9Jy//fLyo6ygWLcRnsdtpc3OBWf8PtFGwutysT/kkK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azM5a0kB; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azM5a0kB"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d0db9372so25247651cf.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509359; x=1782114159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1TLq3MniW/Bb3Tfb2HMh6fVpUATCaTk43XbvWFRGiiU=;
        b=azM5a0kB3E9akSio6NHvsweWhtJRS4oclW2yxkfyBmVDBCQe1rP3SyIxdoxlehUEPw
         boCIDMZt5DfAoCkUlVEU+VYavBZivOjNirjAYVWsk4ovZIqg7VNtkOBMjTHsVNyhm2W0
         yVSrRWjOtfNjcNECOPKsahh2ok40wAEtoeFgkrylg9oZJPC52l9PUGx7mMBImUByGXTt
         aJLDPa2to9b1X3RDnWJZYokKHTd3Up34IuM4GrNqje6sMwLTaizsN30OLkJJ+kPsM8oH
         g6TeAGyKU13DEYierotbfJVGaUn1N3n8zGKeAeuQraQ4qagrq9409mmW4Juz+uvSzGCl
         y2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509359; x=1782114159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TLq3MniW/Bb3Tfb2HMh6fVpUATCaTk43XbvWFRGiiU=;
        b=TJ8Q7smlwcvw2l+UTeOSETy9pHqz91e9d+ye0xoeN4t6zGjUoHx3HgZZvYqMU/H3jY
         RdMztavz/DOCM9iGgO0ej0exxCpBE/U3faxH7iW1X3qGGNOPTye1ANIQ729HvuN7EMKq
         U8i4T0h6keGV6yQud4U3dAi/RV3Wp/oJhxfMb0VwXN4Nj7g6JH1iG9o94NGEGHpYe0KN
         a44Xggjm5YWstsAjvvy/Fee+bLx9stATv2yoCKi/8zlRw767jpQPZjY0wSw6lIu5wLFV
         jPjQGvwZMPaBtWAjxjZ5h2s2oEKcUEB8XFxCdj5oujKiQoA05/THB/XjSDc8tw99IQsC
         Qa4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/skMPw76RwYR9VU8qOvNWoRjvLHbyFv1htN/j99ZYQbd77BuvYFUxM4PZ6QeOQZid7DMg8EcM43zkuy+a2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2nJMUnwIvyMxuZ9XmDzRlAOke3S2YcmvEUl4j6PhuRxM9UEFU
	+wB6hPwDVSiCdYSEa/ZhtyW00V+Ay0/ayH1ZlKNyRqqOjz/PwqiYWB0T
X-Gm-Gg: Acq92OF0VC8GJLqvwotQlY4h735PvciUheBsH0yUo+NWytLCQXXP6Jq26nwWSLX+vB+
	l+GxzG7YH/SZaKnAs3WOQBuL8CRt+yZSZ1002V2qa8gAOGyexYWAlb+CteD8CkZXF8FT+oaU6cn
	531aPHoj+Da7hZBjBMkAOKQkr1OzDiWK9w4snhhdSLM9pXukOxUYbri3i2fPnyVIodSdLuy6bDR
	+weOxBkb0FlseZ6lToVZC6bIlDtjbm2U6etmEaVvWYdnQtBEzEMWB1Gv20Kxw97O54mJqKCOKgg
	HzcnfZcQ2PkWyxr9XbBO/98eEBu8UQmB49ERK/yWGxy4xviHVssylR5h3NKZ2k3SdSLjnqDpjL8
	Wo8r5qQj5DA/XjZeeIZs5YZ+qKfsou7ucTQvnsQwa9+hPcMPLmfp34IGrTBn6Ic82J9q45CAjPK
	V0FVvcpgypv0vxU+50
X-Received: by 2002:a05:622a:8cd:b0:517:9f43:4739 with SMTP id d75a77b69052e-517fe51ac87mr187168611cf.20.1781509358614;
        Mon, 15 Jun 2026 00:42:38 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b2cf04sm106161646d6.16.2026.06.15.00.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:42:37 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:42:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: rtl8723bs: convert update_attrib_sec_info
 to return errno
Message-ID: <ai-s56iJLJzQljp_@stanley.mountain>
References: <20260614182309.96110-1-dennylin0707@gmail.com>
 <20260614182309.96110-4-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614182309.96110-4-dennylin0707@gmail.com>

On Sun, Jun 14, 2026 at 06:23:08PM +0000, Hungyu Lin wrote:
> Convert update_attrib_sec_info() to return 0 on success and
> a negative errno on failure. Update update_attrib() to
> propagate the returned error code.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 7d10caf8cbfe..b6d9332958f5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -519,7 +519,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
                             ^^^
Change this to int.  I wouldn't have commented on this except for the
change to update_attrib()...

>  		pattrib->encrypt = 0;
>  
>  		if ((pattrib->ether_type != 0x888e) && !check_fwstate(pmlmepriv, WIFI_MP_STATE))
> -			return _FAIL;
> +			return -EINVAL;
>  	} else {
>  		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
>  
> @@ -558,7 +558,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
>  		pattrib->icv_len = 4;
>  
>  		if (psecuritypriv->busetkipkey == _FAIL)
> -			return _FAIL;
> +			return -EINVAL;
>  
>  		if (bmcast)
>  			TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
> @@ -596,7 +596,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
>  	else
>  		pattrib->bswenc = false;
>  
> -	return _SUCCESS;
> +	return 0;
>  }
>  
>  u8 qos_acm(u8 acm_mask, u8 priority)
> @@ -754,9 +754,10 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  		return _FAIL;
>  
>  	spin_lock_bh(&psta->lock);
> -	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
> +	ret = update_attrib_sec_info(padapter, pattrib, psta);
> +	if (ret) {
>  		spin_unlock_bh(&psta->lock);
> -		return _FAIL;
> +		return ret;

This should have stayed as _FAIL and then been updated in the next
patch.  It doesn't break anything, but lets still do it that way.
Let's never mix _FAIL and standard error codes.

regards,
dan carpenter

