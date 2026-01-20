Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB443636C
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917577; cv=none; b=s9/1vrILWfhRXh18tPXMpSTKQqs87c8MHlL+h9/C/4yIUEGxva9s9OxNMLhmqKBZWQjmpclWeBDQAtHPMUdm9Tz23FDGSPlYK9zGGkzCFh2sP2ae8pCnSdeG+KNSoMrboLQuxfCp7KwDA1zjwABFhSwRoFMbOwHycVJoX6UJZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917577; c=relaxed/simple;
	bh=kMOXrt1aNrTcuiwTjrx+c/MbKRiuWZpNMYgeNISc9uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWLo2thNZYOGccSQQQQ6bLJ+IOmIlNxtbDj9uOytZ6lfSTd2AJ17z1/Y4XomNfHxRCW+ovqjxtRJ0qi5ZFSU5iE4pDjsHfxn8DCJp2pLSg3aqk6oYImxNRqsZnyP/wRMiXzlFYK/+rS9BERi9I7Of1Q0f0eaSge8rpuPGUck0W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W9YhkTKP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9YhkTKP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3250920f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768917573; x=1769522373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noODPEebgKaeGyXbSdyM6vmBeIf9OQCmhewSNkdpqzE=;
        b=W9YhkTKPvdIhn8fuJPmUO85ii4Dcs0zkhZbrOrCB9+/45m2kuD1wbEhcrKs4OrFJaO
         RrCiYhpC4+pOjVv6zq/PJw6qK1vtBpyfzo1sp4k4YyZ8vLPnhoBeRPz0weIBoc4/dVB2
         FHkIgjjCEEBamx/dGiWTDLEOTe9cIUkb9aX8OfAb6Du8RlsHnrsEfysjO4fb6laFlJi4
         mq/qs2EDsIKtyNSux/gIjK8JIEnK2hJn0MRz6zVKQRP4ZEMDC/Ru8mbMmqu6V60dJHWo
         S7jj6Yr4doez2IcoM/UlhPN9uL3piahxGUXY1U65o3I90VR7VlJ4FLV+oEr3QUsn62Fj
         aR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917573; x=1769522373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noODPEebgKaeGyXbSdyM6vmBeIf9OQCmhewSNkdpqzE=;
        b=HTLcZoKi9GVrNPj7V/lnXOt60wMgUso2y2h7Z0xpbYPX0QMfoS35gIqmXG5hcbuev5
         YKfWNvvybWe20K7Zs+xipPHlvF8HI2a5hgjjg07evMEwK/ETqGxmwKwCNZphR3keT29z
         jwHptPNVxKvSDG1AlgrMTxYqgryeknPXXLZesYkVbikKu88UtUTvGsr/HAtdu1ANvXCU
         H0HC+CaJj1K8wJQHk9ia0lm2y+XxnrCyhwmq6xPghmtZfE28RJcCZlJWdPH2UyRkT5nq
         BquJPSlvkfzoxSb0rH3PCt1ju5Xk+p+Z7oO0c5RTFqkhcoMgsWJo4FuZvqifkWTP6zpq
         L6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU754U+y/rMMAnb9XvyA8BVSVWvvFhnFbjl8BUiFC/ZSA+FgGhavYlcFz0LMNpGi4o/Uj7KUXpkHYLvUEIs@lists.linux.dev
X-Gm-Message-State: AOJu0YzCVJ+ltloVCZgX4ZvN3yxqS/LLw9zO9nhjaFGtzDNX3V6Ns+uk
	j+q58qCFSsgwgDnHzosdASgL+rz/yxqDj6Gh3KN21Tu4LHCpl0oJrXm99Gk5Z0OXODs=
X-Gm-Gg: AZuq6aLA2mKCiXS+XPcNJ9N6tXfoRZLad/+iwBGXrC7CSTZa6RJyDSRnn1Tvxe8YNKE
	avX/uqfVHoKJP5OsDsTdZqoeeVLBTsxJJjGPsYjbQDOEiWpxm9LSWvfWneHjJPWOrmZ+2oNvwGW
	J5buJzjGrVnvR8sIJfs85LBsdFmkEIwtMrD1fFzeu3itL7PEnmz4QQI1EGd0pWOsHsnluao8xWO
	OMWb/gJsCEoZJE5BFTkHJ08JCT2eK2poEZFXfaEKZpSj1kmLbPoeBsKYEjS7hWzEd8jGcqJVU+F
	bw41rvk/R+hRBopvUnQ7VaSyNTsbwRl160hSt9Xkt1n1bIMjZuIN77Dr0J7pqnLJQqOyyPspaG1
	E4AucVDFw3kiOO85b6LF0cdUq8wXhMFZ3U4Aw6YlHZuBybJzMGh1S2oJYgea5NJQJpkQ15yhbjD
	fFzdHvw3CRfT2wrPQ0
X-Received: by 2002:a05:6000:4021:b0:432:851d:3676 with SMTP id ffacd0b85a97d-43569bd29demr18655393f8f.57.1768917573353;
        Tue, 20 Jan 2026 05:59:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm29470787f8f.21.2026.01.20.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:59:32 -0800 (PST)
Date: Tue, 20 Jan 2026 16:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-KQbHblIy-MTIu@stanley.mountain>
References: <20260120132241.2119454-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120132241.2119454-1-s9430939@naver.com>

On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 21690857fd62..135bc5432be6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -603,11 +603,13 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
>  	s32 UserPriority = 0;
>  
>  	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
> -	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
> +	if (_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN) < 0)
> +		return;

Eventually we'll want to return an error code here too.  Make it easy on
our future selves and do it this way:

	ret = _rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
	if (ret < 0)
		return;

>  
>  	/*  get UserPriority from IP hdr */
>  	if (pattrib->ether_type == 0x0800) {
> -		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
> +		if (_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr)) < 0)
> +			return;
>  		UserPriority = ip_hdr.tos >> 5;
>  	}
>  	pattrib->priority = UserPriority;
> @@ -627,8 +629,12 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
>  	signed int res = _SUCCESS;
>  
> +	signed int ret;

Don't put a blank line in the middle of the declaration block.  Just do
"int ret;".  Everyone knows "int" is signed.  Don't follow the local
style when the local style is wrong.  Also only use s32 when it's part
of a networking or hardware spec.  Just use int.  Do people imagine that
we'll change int to be unsigned?

Same comments everywhere.

> +
>  	_rtw_open_pktfile(pkt, &pktfile);
> -	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
> +	ret = _rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
> +	if (ret < 0)
> +		return ret;
>  
>  	pattrib->ether_type = ntohs(etherhdr.h_proto);
>  

[ snip ]

>  extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 944b9c724b32..5b9b959e23ca 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -21,15 +21,19 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  	pfile->cur_buffer = pfile->buf_start;
>  }
>  
> -uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
>  {
> -	uint	len = 0;
> +	int ret;
> +	int len = 0;

No need to change the type of len any more.

regards,
dan carpenter

