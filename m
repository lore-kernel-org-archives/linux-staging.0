Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CCD1CF93
	for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726459949; cv=none; b=WMJ+TYJPquayby+py1mcNQs9Efzm5qAqtwxgm7GtaRNUFV2ywHEv0rE2DqykqJoKRrBoxZp0paBFUFWwSkWI6/+wShZqFsIl6wVKjmILFCIuLpOrvULTEQiU5VWeJ7RjeiApdz5DL/7ov3q57/jJMsC7hs3bl6JNvBJc+qIU+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726459949; c=relaxed/simple;
	bh=fOMZ4jnR3B94Pxfaw5hxV/eTHiQuE4qMCdekMEAcFNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ef1caNT4alyZ4srwjxKnkBBen6XY6t/G2af3zchLfa+hVLEJL98ZS1ZTFTdovxj3rN/fCcSJlvuSRSzBOyMsyjLODIAOSQfkQM1dCuGjXv9JyrHPRbjDtO61jSpaAChj3DxTn5T9x9+kvcCuNfz7FBH4P8PR7jqUV5L9cCMxaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0XeFcUN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0XeFcUN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so31176855e9.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 21:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726459945; x=1727064745; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBYcp0cztEoi8SXhYg4j4NHc7gka1ii3pCNxKSCW8DU=;
        b=d0XeFcUNBJaK1KX31+vGoR3AXq5vxo9cxHaHcHL8Ft9Nd2SE+x7wCz3VrTWDPhtWYI
         bMuQkB5VRSxkxCFn4k7R1qMROAA1sS6agRQl8+0cRIeT6GhRkuxsZlgjqoUKPTzjN5DJ
         FHxkdXMNKecMKdHaxDf6hcZFieaN0WndGwTWzmvZXVw6TkhzDRsDAh7XFmr5dJRtDF9T
         vuZrPjhq1oJXMbPR0Lgl8Gkv6j0BUvtYfFjb2GvTSFijzpHwue6Wc4Yht06Hpgjx/fov
         ObYfETF7CII5GLLj1b36krbZn31yfBkVuKb6nko9w162rGarFoszosj4Jy6iFnhhPxWO
         RLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726459945; x=1727064745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBYcp0cztEoi8SXhYg4j4NHc7gka1ii3pCNxKSCW8DU=;
        b=t9idkdPLeRFk/wFQdc1/e/a3jIBalF5ZzK1O7b+bW84bpazWZnO8ZOAsPCxYvhn2m3
         qHVSaOThquqYj1f1h0NuGYyrqcZY+QwlE5ADaulDqYCGsTEvbOebglRJXHvvHCvuqbQb
         fUuSOoMNftxvX0LbRzDFsDvzHZncfSKqRfCeAR5TPhNWnflTKWO1AZ0uobkh18ljWjhv
         5Rek84X/bX5vM4nDxSrz9dgwULXES5wFDKzSgswUmfxC3A1I+oRkWE/mPI7/s9xhhh6D
         C3t4vXptytbuVknjrah3fKb5ZKngOSMrOrCeiKCjXt23dIze0sFpB2JY2EYMHYudHukz
         uSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW37kFusqY84Gqz9d1w1dV+jrltBEI2OGZ/XpEQeCB7Z1dzPurjzPnVyBER8LMow3S3XJ54TY1+i2mpD4Ps@lists.linux.dev
X-Gm-Message-State: AOJu0YzAfgY7j31tW7kj0MyEHZItvYginVFgVhrVBEMvFdjHp1EWhYUL
	wwRd7KIj8KGE9nH81E1JOvrrLVu3CfO4NOzbbDgEdtYqu9OSAarLlHhCdg==
X-Google-Smtp-Source: AGHT+IGw2Cr8O3Jjyn++nhqEvbDdwkM92HBwOKyJafeySg1rKPB4mVnwQisqmu1Jh9X4Tq1scUFDCA==
X-Received: by 2002:a05:600c:3b15:b0:42c:bb41:a079 with SMTP id 5b1f17b1804b1-42cdb531bd4mr104724425e9.1.1726459945129;
        Sun, 15 Sep 2024 21:12:25 -0700 (PDT)
Received: from kernel-710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22d8b15sm63738155e9.18.2024.09.15.21.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 21:12:24 -0700 (PDT)
Date: Mon, 16 Sep 2024 06:12:23 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Mikhail Arkhipov <m.arhipov@rosa.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lynn Lei <lynnl.yet@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] staging: wlan-ng: Fix potential double free in
 skb_ether_to_p80211
Message-ID: <ZuewJ3ZvWdrCFZVt@kernel-710>
References: <20240915185804.83811-1-m.arhipov@rosa.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915185804.83811-1-m.arhipov@rosa.ru>

On Sun, Sep 15, 2024 at 09:58:04PM +0300, Mikhail Arkhipov wrote:
> Fix a potential double free of the p80211_wep->data pointer in the
> skb_ether_to_p80211 function. When encryption fails, the function frees
> p80211_wep->data but does not set the pointer to NULL, leading to the
> possibility of double freeing the memory if the caller attempts to
> free it again (calling function in p80211netdev.c (line 385) attempts
> to free this memory again using kfree_sensitive at line 432)
> 
> Set p80211_wep->data to NULL after freeing it to ensure that further
> attempts to free this pointer are safely handled, preventing a
> double free error.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: b5956dd26f84 ("drivers/staging/wlan-ng/p80211conv.c: fixed a
>  potential memory leak")
> Signed-off-by: Mikhail Arkhipov <m.arhipov@rosa.ru>
> ---
>  drivers/staging/wlan-ng/p80211conv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
> index 0ff5fda81b05..b2e224e1e33f 100644
> --- a/drivers/staging/wlan-ng/p80211conv.c
> +++ b/drivers/staging/wlan-ng/p80211conv.c
> @@ -215,6 +215,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
>  				    "Host en-WEP failed, dropping frame (%d).\n",
>  				    foo);
>  			kfree(p80211_wep->data);
> +			p80211_wep->data = NULL;
>  			return 2;
>  		}
>  		fc |= cpu_to_le16(WLAN_SET_FC_ISWEP(1));
> -- 
> 2.39.3 (Apple Git-146)
> 
Hi Mikhail,

I cannot apply your patch. Reason is that wlan-ng was removed some month
ago.

Are you using the right git repo?

git remote show origin
* remote origin
  Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing

Thanks for your support.

Bye Philipp
