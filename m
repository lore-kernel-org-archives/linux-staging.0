Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9773A5E9F
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459105; cv=none; b=pFXJ6zfu+ExP5mqwsqH2AsyuInJm+4hzwmuVYhzWgnv41iFirABM7Osx33rMu6P3iW0whfzg6osRatwuFddBoPxvl6GqIO9r/ZZrb6QnkteId4Pi9Vt4vACbiiFDWTPkBosQpX18dYnA3mo+FU6yb3lCo6TIFsSVcjZvXgj8iM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459105; c=relaxed/simple;
	bh=ld+zAQZvreuFI/Niavki4jrtLwrfxVLG3N2M+Al4Ybs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbhXrQ2lUL/8GImQEGXnpyoCpDu10VopN52MGlJcqP3ZcnS5KTjU6mQdyk1mbMfBzYCRdJDLY9BpTrn81hXAksRvvFDxiaHe6qxBb3VBixaRhMOn6Bcvad3DKnWcqtcEU/oetkmHlUbqzoR9SHqV5mpfnCyg606+tSh6hz6eFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ellcSjag; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ellcSjag"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so5039484a12.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459102; x=1790063902; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7YW75YqJGurWAq2WY56DRuhTmlKAK6YOaluv7gSzBc=;
        b=ellcSjag15jZmgWMYCxzGEL6EalYpxZbG234fD0DIfkTt65yHo8YNPfoSjy3BbRRV3
         /6TuY559XAqZ3i0HtjVj62/DBqQMFRUrGEyUaRcc1Rh2k06m6zRvqcZGD3UvLJ4b7TD/
         Y0HFuPb0mSoKXHTt0CRhzMDuz/6Y4ADi3yA2X4ippc1eQgp1EKmvjZa04HyD32IbL8qd
         sf0PBISWZwVjk31AZtXABD5qJL+438AyJP8XZndo5l0nNVECaJrJivmyVZ0+aDltcZKY
         MF6LCUufrK7GLn7jIOOTFUFYLf06KNx9njPQ/qHQ3Ip3EPLoLUURpMVZIsQmw+xgiHH+
         thhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459102; x=1790063902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D7YW75YqJGurWAq2WY56DRuhTmlKAK6YOaluv7gSzBc=;
        b=qgNMmVKLf5Oz6t64zWJpAMgIfjBHKrvbskA7DiFGJxC/zJpCBjeXm+fUGt0IHNVqXi
         MSNb1m97WT6SHEpTy/dtwuCieB55J43xXun3jkunmdbieJOYzL1M6jhTGK+VqXEhvAZa
         xuUvcQouJ6ToKiIwkZWVefmAxiqHQ5VPvsWPmDtBntjCINV80RKTzWl6KoxMVGxoCnvS
         IiNuo8Y5JiJczbXshblERGLqy9Ou/NesFYrq8lzGDUe/vlss3SrAknWjqhndin+3QUIg
         PFSfc7hDRm52rMMK/BdQRhNBWG/hKC85tdn4ABkp1mBdqgzdldLBhTKcr7gbnl4sowvn
         QpZA==
X-Forwarded-Encrypted: i=1; AKwUvBzOVv2hjU6/x96taCn9fTRSNT8dLtQnT+rkAXCUbTwQq5XLLDXGDJxrZvdWDqAiPsy9mz/XokOyL52cKWrk@lists.linux.dev
X-Gm-Message-State: AFuF++lNtwScTk317O4/zBsUs4zL97x9ssaXGjGp+02xcdRd0D4zNp6a
	xB9W/2yb3PbVX/YQYD2swdrcqrGjMUNAoJ7Y3cI96EqJfxG1lW7KSJWM
X-Gm-Gg: AYBFou3yzPGw3hlCgPqp4rNJOytpCPDJVZ/pVKgoy2ZgJNDUIBSiRoqZIJNkrXO/zrG
	F31VLp9LhKCarSDLpUZp7XAh2GmVwYgn8t6ig9Jr2ay8k/kCjkBSG6BLSIPTrpBy2He4vkewgkO
	RL9SKYwoHjlA4dyvKt6rsOQ33fgpw15uht+AOIq708G1B8mGGVW/WBT+ihgPG0Jb28hyK+wqPWk
	RkeNKDh+P4OF+bW1x9B0UHUJAJHP8YWx19LPS1/hSLPJjNsmXT5K/KWvrmY5tZpBLgRr3S/bVlv
	OJSZ4QteWTNOiShSR+UoHhVgjoYorh0XID6grhKUG5OQdj+RfTIgVqnB/2lS/K0Ff8k4RG4GFv8
	wFhWMZ0HBCUV59EOAdC5kI1qiWhJu7eCIjk8Yg9leoBq0v46tvCdFqaCm5M9Xeq5tdaVVXKjjCW
	4RDRT0xr2qFkrOtPmmDXLhD6aBEdUZOPY9DuTIfSRAeTounCRAh4LO95qGZC89tIz6njY=
X-Received: by 2002:a05:6402:274e:b0:6a9:cb12:b867 with SMTP id 4fb4d7f45d1cf-6a9f62134f8mr4169183a12.9.1789459101475;
        Tue, 15 Sep 2026 00:58:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm5243054a12.31.2026.09.15.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:58:20 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:58:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH v2] staging: rtl8723bs: fix lines exceeding 100 columns
 in rtw_security.c
Message-ID: <aqj6mUt9Q5hO8abv@stanley.mountain>
References: <20260915072923.1014216-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915072923.1014216-1-vladurares@gmail.com>

On Tue, Sep 15, 2026 at 07:29:23AM +0000, Rareș-Mihai Vladu wrote:
> Reformat long lines in rtw_security.c to fit within the 100-column
> limit by splitting function arguments, expressions, and moving
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
> ---

What changed?
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> @@ -112,9 +119,16 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		keyindex = prxattrib->key_index;
>  		keylength = psecuritypriv->dot11DefKeylen[keyindex];
>  		memcpy(&wepkey[0], iv, 3);
> -		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
> -		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
> -		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
> +		/*
> +		 *  memcpy(&wepkey[3],
> +		 *         &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
> +		 *         keylength);
> +		 */

Don't worry about polishing dead code, just delete it.  (In a separate
patch).

> +		memcpy(&wepkey[3],
> +		       &psecuritypriv->dot11DefKey[keyindex].skey[0],
> +		       keylength);
> +		length = ((union recv_frame *)precvframe)->u.hdr.len -
> +			 prxattrib->hdrlen - prxattrib->iv_len;
>  
>  		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
>  

[ snip ]

> @@ -1300,8 +1334,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
>  		/* conscruct AAD, copy address 1 to address 3 */
>  		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
>  
> -		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
> -			, BIP_AAD, ori_len, mic))
> +		int bip_keyid = padapter->securitypriv.dot11wBIPKeyid;
> +		u8 *bip_key = padapter->securitypriv.dot11wBIPKey[bip_keyid].skey;

Don't declare variables in the middle of code unless it's a __cleanup
variable.

> +
> +		if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
>  			goto BIP_exit;
>  
>  		/* MIC field should be last 8 bytes of packet (packet without FCS) */

regards,
dan carpenter
