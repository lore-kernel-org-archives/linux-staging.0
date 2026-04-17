Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E359C21CC59
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 05:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404153; cv=none; b=o+k5qB8dUZS/bkXKqkZTHlBMOgXlppa8yv2qtVRVRN7KAeNPSiEirrTh/K7uM6o/7krsATsZTrYCXiGnO+axX3bXn3q8vEnoYvuF/xJmPDe05618u3nHS11CMVScS+vaNECVyfWaxbQxsnacQnRyE4ifEOjgNBVX/o7/+kbzW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404153; c=relaxed/simple;
	bh=H7Xq2K5I8hzgnXyhrf2co5G5yOb2ZO9zyuH3/e/iFYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYMt/qMwDNAfzQJFkZ9GxEmFuJxcb70ryALGZJV9GQkVY7wdOYH3vdsl2iNmWEsF5reFNPS3COMPDgLGXAuo28Fi3woI+z79zm34BNsgn5fBkxjK1VAJof5G2+PubzhXPDcWUBRW7vKqIdbKW/HFvlal9Z1Z2rvnhI86pX9+u1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2ale3gw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2ale3gw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd832155so166008f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 22:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776404150; x=1777008950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Te/LO0MnsMHbXYIyZUpJ0thN+bRfr4i4+FjbbQ/Rk7k=;
        b=p2ale3gwJhBZDrxtNgadMZ4pO641Px+YRMd7woMQkVEP+f1wU3sbQeHelIjrA+ru6j
         lc4YbqD2uhKezF+qWfEymEXDv0+8rHwITrO5pcmkh+ZaQ9Vo0RBFyLPC+qXpAYGcR2ro
         iltp8hv13lh6eHxnKCj0qn3MBGRRgkALlf+YDpqZGQHMorq4BZ2k0g/c5V9amK8s9Xko
         frI1xsZILgDo8DeUFxiLQb2SeMXN41oj2vV8mSO8tQLo0MaLkqd8M9HsfwpZnTUzpgQ8
         aRNdFjwzsA0M6B6ysqNcBcUjSgmHqbDKO0SxONKw/CM70jh0dzuulUXXmxFOav4Hy9Cz
         J2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404150; x=1777008950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te/LO0MnsMHbXYIyZUpJ0thN+bRfr4i4+FjbbQ/Rk7k=;
        b=rP0BeKKFHa00FVYi+cOgeIDqDGYbkVYTqeDp0cqPB96J+0KSIJaXaZPjDPRi+SbuCi
         lcTXccvevI9ZZRLQCZcxX+vFMGMLj4KlYv+DmmJvHlmJDQjdYfCofAgVrlL0LjtOiLVb
         xklh57gLYp4r6j4ELLgbTkEvQS3Z2BvzWHZIs3qf3cUEz/dOFPSziXwBSMHBCKo7tVTi
         0dbyeDYkjafCR2mNqAt6GIfSxg8JU6b1ZNFJFubF5BfdeVbvsNdYt04+6nEdkygVFNid
         bizMUY9/mHxDN5/wWczNKh2WrV4BZkOU51/3I6/oQF3pFn9CqOjGg+ocLoxeIgQW+sm6
         rPUQ==
X-Forwarded-Encrypted: i=1; AFNElJ99ZkVeplu32HNEd5XHETmttYs1/ksa0+5LMnNxZLOiUEE0LWhMZf78uDuDvBvCdC6/IoJ1HxP1nElcdEdW@lists.linux.dev
X-Gm-Message-State: AOJu0YzgtIWnKfo3wdkPtf49fBxrxOtBTX+lhBaPdRFqt9zibAg048ZK
	Pi4i12bPojZhbSqagXeZMNPAeFr/srlwvWKZzHyiiItqF1u10/Zj0HKh
X-Gm-Gg: AeBDiev9QT3x1MBgyDpwFxvjyrwwuCBxJevVNaPSSbwfeSj6QPQf7WPv+ODq0LVirCW
	nBU9EmuoActOSx0qu8tHHIGp6VP9c7qV+sC8xebgNOkRwPGwR1SKnvNT6dKZXMbwYPNx5ZuzPov
	xO3iWmXFYebdHaxIbmuUAjiBA0yUxTPPTirRkcnCyhGBW9L8Lm4LB69ZK+xEuBSbGhQ1j9FknQC
	b0WM0L13NEk0q74B79Gz5k98+05a9o8SZjRwR7RDTgwAR/qUkdC2DuxueNllua30VjUL6LOKXfm
	ESYGcUyHDPM8LnVrAbEp/sHP/YJ7tJsUDqST04SXGlh9lBaduW4lxRIerYx8uNaXR/p6nng+C9E
	VZIVL8+J/gM51TaQ6EpI7HovrOMNXkmCO1TSK+z+43hRJy6DVsLOabcMXn6E+4DkSmOMShMvpLE
	6TSHfmsGP16K2upGRe/Yz2aer+gYSYfA==
X-Received: by 2002:a05:6000:1ac9:b0:43d:2f94:3b40 with SMTP id ffacd0b85a97d-43fe3db343dmr1761578f8f.6.1776404150220;
        Thu, 16 Apr 2026 22:35:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a397sm1875966f8f.23.2026.04.16.22.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:35:49 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:35:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 3/5] staging: rtl8723bs: fix out-of-bounds read in
 portctrl()
Message-ID: <aeHGsjwV5_qIuT5U@stanley.mountain>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
 <20260417030110.42991-4-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417030110.42991-4-delenetchior1@gmail.com>

On Fri, Apr 17, 2026 at 04:01:08AM +0100, Delene Tchio Romuald wrote:
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 40884788a30d6..b11982fbe7e1f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -537,20 +537,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
>  			/* blocked */
>  			/* only accept EAPOL frame */
>  
> -			prtnframe = precv_frame;
> +			/* Ensure frame has LLC header and ether_type */
> +			if (pfhdr->len < pattrib->hdrlen +
> +			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
> +				rtw_free_recvframe(precv_frame,
> +						   &adapter->recvpriv.free_recv_queue);
> +				return NULL;
> +			}
>  
>  			/* get ether_type */
> -			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
> +			ptr += pattrib->hdrlen + pattrib->iv_len + LLC_HEADER_LENGTH;

Don't do this unrelated cleanup.

>  			memcpy(&be_tmp, ptr, 2);
>  			ether_type = ntohs(be_tmp);
>  
> -			if (ether_type == eapol_type)
> -				prtnframe = precv_frame;
> -			else {
> -				/* free this frame */
> -				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
> -				prtnframe = NULL;
> +			if (ether_type != eapol_type) {
> +				rtw_free_recvframe(precv_frame,
> +						   &adapter->recvpriv.free_recv_queue);
> +				return NULL;
>  			}
> +			prtnframe = precv_frame;

Same.  If you really want to do it, it has to be in a separate patch.

regards,
dan carpenter

>  		} else {
>  			/* allowed */
>  			/* check decryption status, and decrypt the frame if needed */

