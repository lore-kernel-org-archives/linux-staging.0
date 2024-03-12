Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340377F11
	for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234198; cv=none; b=Xad15lwTqPxRbaMtt0o1mRNlfhQVKinZgT/Jn3uGR5jur+CUH3ygsG0N3sXS0ECJPi6tfC6H9aZLVkoDBPvy9/kxlW6zkkDTp7SgvT2tpPjbsRpcbPmTGxHP4RuS6eC5zzxJhHdgSxCk4PNHTbA4YLGlSv2ZKwRXPYsv3uoyDE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234198; c=relaxed/simple;
	bh=s1TPGDD3FQrj7OxiV2Kb3nYfjuUTXMyg7DkuslLMXRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4O4dgHhDL68EXv6D9bGuj1hDogmfIT3vsZO5wz9UMPs90Q7AJKZiYtgukgx5nqXK2JyeVe4+KHfDAPc1FtZ3iM8e2hvuiQBeivjJb231U236N3+TcBCEnASam7G5/tkcb6ede9X/ioMw54TdvumuNCXsbVIhF/6zQY79JAWH8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9Lm1Vev; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9Lm1Vev"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a45bb2a9c20so618836766b.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710234194; x=1710838994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6i3TaLouGAS+GfFlJ9J9LI/0HUB7fKxpK6hNinsoOw=;
        b=n9Lm1VevkV1erevRbUnF09oyI6JNtEKsO1JpdwOpuErRaKZBuQykVSkxC1ytQIILhV
         1Y76hj3RZiFG7JdR+rQM7Bdphmm0TOW8Y6wgV+njjz5EHMzbJ5ZIZ/a7YqC70KjKz/9/
         XW74Z0IEZD4BDAggq/BmZMkPiKNmOMDKjc/ZKTAoONdq00B8UwR2eFyOCEy8ixyP3CUr
         4nPXPTVxLzcx+Pyb2hpG6w1nsa38Zpm21uKJAnm+EuHZ12Ch1EeRGPx8b/CL5eHLttEm
         bCPIZCxp/g8RRrppscO7nWmVzlxfge1eQnj7ns2EVa8aAwjurJW7ZUp0FGRk1wHVSPP5
         zfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710234194; x=1710838994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6i3TaLouGAS+GfFlJ9J9LI/0HUB7fKxpK6hNinsoOw=;
        b=PvfRffvJHC8coQA7nrqYjNHG5nTwvx1P08T5mJDQgXm4qRvP1+3CplD5b7UXtzxr63
         A61Vp0DckFTok/KV49wmQQTSGv6GPK532X3Ll9sDoon8BOkwbczfyAQyL3tCaLkfw6Uf
         VRec0XzD8sfSniEoNNtkw0nSAQYZy4MBraRlq3jjeSB1ztgnVgAR1yfX9Q1N5/6U8nbF
         /a+jCTX1Lcljh3FaVW5mJfEoBB7P6WqPwQOuNbHkFaOszQ2uJy395Vk/nyxNa68/prFe
         UpAFI5TmzXL2BoRPsdFTCSXi9bxziQ/uICmuakKVzGJFxUVWup10GaFsTy3Ruo9Xc7r5
         62Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUX44Cbw4PwYG70mXrMpfC7qSdIXehTVLNQnf4AB92tG5wpLB2UjN3vqi01oFtkklwnABF2FpXAkVnMf/BMfamHmoRTL8rKcbvgmHofJw==
X-Gm-Message-State: AOJu0YzGC58T/jk8I1DvOVaEWCGIYMqaw7fAftv2upFD1kSjbtsVEMku
	9oaTMCxH9pZnGc0lx/IxUrJwfImaEuJhlEJQPargdhaab2ReDlPV+5ZJxBSQmlY=
X-Google-Smtp-Source: AGHT+IGdtm50SLGxk2hDpFRAfup4txP1asLzv4Joh/YOzp2qyBoqbm6d1pprOfLQaSq5NS65zoeS+w==
X-Received: by 2002:a17:906:11da:b0:a44:dc35:df19 with SMTP id o26-20020a17090611da00b00a44dc35df19mr2047419eja.67.1710234194076;
        Tue, 12 Mar 2024 02:03:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a45fefe4fc5sm3576879ejc.135.2024.03.12.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:03:13 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:03:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Felix N. Kimbu" <felixkimbu1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
Message-ID: <9bffd12a-afae-45cd-a4f3-451872146bf3@moroto.mountain>
References: <Ze9Ie67PCSvBU+og@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze9Ie67PCSvBU+og@MOLeToid>

On Mon, Mar 11, 2024 at 07:07:55PM +0100, Felix N. Kimbu wrote:
> @@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
>  		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
>  		if (!p80211_wep->data)
>  			return -ENOMEM;
> -		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
> -				  skb->len,
> -				  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
> -				  p80211_wep->iv, p80211_wep->icv);
> -		if (foo) {
> +		decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
> +				  					skb->len,
> +									wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
> +									p80211_wep->iv, p80211_wep->icv);

With the rename the indenting did need to be updated, yes.  However it
should have been:

		decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
				  	    skb->len,
					    wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
					    p80211_wep->iv, p80211_wep->icv);

[tab][tab][tab][tab][tab][space][space][space][space]skb->len,

See my blog for how to resend a patch:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

