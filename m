Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7675742B753
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769060118; cv=none; b=G8lrrZkeKS1OlGJrpINhALNlQECAa71EG8wT0NvNBgBDSUuoAz1o2PiX3+Ie2lpwdZogLkVk5Z/K39M64t1IaVQ4oYuibn9vQ+nifvmfVcy8yHnZJLYzBiWi5Q0CiMBC4PMpXS/QzqITyWQtIHWx+N39MjT5NhAC6jSCruNFws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769060118; c=relaxed/simple;
	bh=QLC0cefX9RbqfzbWgR+dlU9xiaUFt69geoQDWLAvrCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUhM3cWsZYga5PzfAHF+4/R8WIy+tfcOQifG/fvxUq7lWRJlr9iKrBkwwioCLrEvqQPndEwvrG3Xja6lNtzP/TgAIjpROx7xGy54QmrX38VTjpMJn7S8Vkzyoy2/qIQUooGeIZmUetZegaNMR+ZFIJ8vxFsE64ee7pj7eti3kkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmKVFyBZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmKVFyBZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee0291921so4584195e9.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769060114; x=1769664914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGDKCZ3+vAXOARnphfTvf//nYofjqcqGd3IChsKVzcc=;
        b=FmKVFyBZDlHuhrdgreuDflytsRoqmhI8AjyaTb546evv5aJ4xyPnEmJTMpg/gIh1R4
         0g8To+IBbnnYdURe8iaLuHS4z33SEHIXHtp6d5Y29DLrmjIz07Zhabnt6kQK9/08kX8O
         QYbP1cW9qLqcp6DGDoTUsVehGbtMk/I1QJCbYIETSRX/KvnIsHEEGF6pjGZu335fCf8U
         kpnnWQKC9PmxJeWrZQ+SPDRjdRhhZHq1Msnv0lri48Y4qJSimYaGYYDJ58rLF+T8XTcW
         D6A7mkYcQBsrp/6r+ugtLjOrBpwDaqzvSP1dBMCwWWpYKQ7e4LjRzK63QE1EeKB0bGMi
         dOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060114; x=1769664914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGDKCZ3+vAXOARnphfTvf//nYofjqcqGd3IChsKVzcc=;
        b=WfmhEXOL61geQeV3/LrV/N5bUD5s/9UCtLmwGB6tJZOC967cUZ97TgZH9yiCNmcjfw
         Yiax7g+ezQC2XNlJ6fOOzSUWkpaSwhv0LknnAP5+ZmRoryW+67JDsjfVEBqRymZEJ/Do
         EXyb6p9DoY275WholHaWW7U6TWNpKJGgwCr5UtI48/WPHXDEonl6gR4wyYtsXyh/CMER
         bmv1NivRev80ASyaIYxM7hKXRZqpS2lndX6xXIFkqo3Q2+1Vj+ZBdYVoReDc2i4zrQOL
         0jARxxBJxapA1MF2xnfkAFVibDeaLxqCjX3UqDbJzZVyzMZbGUuZpOMCzs6a9ez5PSGR
         IU8w==
X-Forwarded-Encrypted: i=1; AJvYcCXcF7ru4bN4qbjqxQfbxJOPBxlgocUaiLufPZE1mBzuccj2qiywu27O3fNtSVPcI9kttTzMZdSSrp2Q6KKP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx82gscpxOs9Dm8TyBT/lZiKKlCqEMlrrYKMKURaUa5US2IAP3o
	+4gu1PFrYwCHW4dWf8iUkh5S9UDaIceCLu2YFWELQ23MepS2Ykuhhuxt0hgXOH+Jnfc=
X-Gm-Gg: AZuq6aLLA0LCAmYsLb3galsJSn1ruOK7bi772gXws8eEZ1RW2+hB6eMSnJyezQrW4pp
	jeywAsJJanFVj9S7JKcIuK94CK7UlXEWsmE8NA69f6V5PImiuNUKCh7klk0sPWveAyCS4lWzk0Q
	8C9qDcYcjCqHYxolV0Re/GjdCw8dFeSBoeJPCVMVXeWNLnM63yF/wQwO9ob+xdFAR89j0+0eEk5
	Z69yX849Tlvlth2JYAvssPJDJiY3SDG/tVwDRM4NR+4iIRAR074yBQIbUzOtB6AIhR6T7Osgl9L
	oW26Ex/z+KJ7NoypfP8uUS3Mv3t7OaboHUTZ8r95jvf1mzVunXLeMV0QpBJPm5MLDLb/HRVqcjC
	ay/olnOMjzMfnJnEIYtwTAnPA4dlNtjnu60I3bgA+fL8zlz4wNlSYlnVjPQyBiEvE4vhjHyx+SD
	NIPBLxJ/nQCbyeefJF
X-Received: by 2002:a05:600c:6206:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-4801eab5255mr310638445e9.8.1769060113455;
        Wed, 21 Jan 2026 21:35:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470403d3sm40235045e9.5.2026.01.21.21.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:35:12 -0800 (PST)
Date: Thu, 22 Jan 2026 08:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: change return type of
 _rtw_pktfile_read to int
Message-ID: <aXG3DSMRf1Ojn436@stanley.mountain>
References: <20260122041450.2325560-1-s9430939@naver.com>
 <20260122041450.2325560-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122041450.2325560-2-s9430939@naver.com>

On Thu, Jan 22, 2026 at 01:14:48PM +0900, Minu Jin wrote:
> The current return type of _rtw_pktfile_read() is uint,
> which makes it impossible to propagate negative error codes
> from internal calls (skb_copy_bits()).
> 
> In preparation for returning proper error codes
> (eg, skb_copy_bits return -EFAULT when error occurs)
> when data is insufficient or copying fails, change the function's
> return type to int.
> 
> Additionally, update the type of the 'rlen' parameter, 'len' variable
> from 'uint' to 'unsigned int' to comply with the kernel coding style
> as suggested by Andy Shevchenko.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/include/xmit_osdep.h |  2 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 14 +++++++++-----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
> index 8704dced593a..880344bffe2f 100644
> --- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
> +++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
> @@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
>  
>  extern uint rtw_remainder_len(struct pkt_file *pfile);
>  extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
> -extern uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
>  extern signed int rtw_endofpktfile(struct pkt_file *pfile);
>  
>  extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 944b9c724b32..ea54a573e025 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -21,15 +21,19 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  	pfile->cur_buffer = pfile->buf_start;
>  }
>  
> -uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
>  {
> -	uint	len = 0;
> +	unsigned int len;
> +	int ret;
>  
>  	len =  rtw_remainder_len(pfile);
> -	len = (rlen > len) ? len : rlen;
> +	len = (rlen > len) ? len : rlen;

How did you generate this diff?  The before and after lines are
exactly the same.

>  
> -	if (rmem)
> -		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
> +	if (rmem) {
> +		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
> +		if (ret < 0)
> +			return ret;

No, you can't do this or it will cause a bug in rtw_xmitframe_coalesce().
So that also means don't change the return type from uint to int in this
patch either.

Normally, we would do the bugfix first and then the cleanup in the
follow on patches.  That way we could backport the fix and leave the
cleanup.  It doesn't matter in a practical sense in this code but
that's the better way.

regards,
dan carpenter

> +	}
>  
>  	pfile->cur_addr += len;
>  	pfile->pkt_len -= len;
> -- 
> 2.43.0
