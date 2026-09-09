Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB735579810
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965832; cv=none; b=eiVWdxcVqUdnZEWMNC0xCFtQ6OhTMjIxsTwDJ6gLUYTjTcriThoLz562dmTmGlxRpMaXGzr1/d3uANrdyj8x6aKo/UJi/iqmLvAwFqoiu24shMj0xGuI4o6SjU/qWD1hOCbwXAHHMqorg+jAdRVNPuJqdS2J3KAG2WMoFBfei8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965832; c=relaxed/simple;
	bh=1wbHB1o1UoBwa6SsfEluV0twAsNlWwoeRLeBRagEvGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4e5aWomg9+8JKbfQ/XVRPYeqSaOAfRR+yBxUgYVncGQEHnZR+a3qW96+jXU3E+ugOOWqVNwX9c5lBtZn819dKiXUJrDVgi6enYXgx8uVyaKz+8Wl5gIRmg85fOwRkSCdMp3io2yVrQiqExoMfv2f6jGpbx6bE/YgwXJK0LAU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuGRreQ0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuGRreQ0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so9945155e9.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965829; x=1789570629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pjc62j+8bfbWKnhTk8hvktoU8q9eH1W2N/1Ffh2JXA=;
        b=DuGRreQ0+2qcaW/ddOSoGRGjuENDRBPWYY2Jbc5oRLUujKrCpWz0pj6B6+ADsaoTSu
         Yt9zjDhV/W8jrVe/wmFtlAGtRQwkKsKdzsxGTAARmKehxfgdyF29Vgn8gW2Zj/uWgstt
         xaDDSGal7k1BHFo/BnCLhoRUIfVYUiaGqDGaBLLSijW6g9y9VjBjmxlYTOHcNzLZCROd
         qsRfjc9cM7Q1YfNFkG1xL2mPVVpy2PB5Tk4gIdnNjznnn6FvffcK3nBt69txedKcktxx
         MTGPa7IuixI3Op/wMVgTBOxW/J+tMslwfum48o7am2HZ6o4+RzOQ2q+wsj5e7x1j68WO
         HTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965829; x=1789570629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pjc62j+8bfbWKnhTk8hvktoU8q9eH1W2N/1Ffh2JXA=;
        b=YQAWiuRVZW4t/2Ytz48xmVz4SdmQ5wkNHIps5sAvpVO/YTks6+0B0bGpIUu5aafSEz
         PCb5tLPC0lqrMPvU8S2mhUDtiqsRPrw5JyObIHL+KtkhdkhGLSNb/XroheQ0hNYoJ7UT
         rwmP5x+ceMjxucJMoPH9/v/MZh+rqKmi/0KcE40iB3+7uAcRalYsQWGxpK4tlSR2T2l/
         dxdj5cT0ivESaIj/INEHrTpMv9bXBOaDKOE92e7WbopTPPETDrD8jdPmjdlGklDlmOSX
         z87zzlutXrO2k8F2QERJnhHreUR7Dd5v1R9ecXC9mfT8PgZWvt6vJZ4EI6aJlTHXl1iS
         3xsg==
X-Forwarded-Encrypted: i=1; AKwUvBwd7UuwhDfTE1c9c4EW955Uilok2u3uba4cqOx7DJYrKkgWU2Znu9rZ3xhvcFIit4lwjoqOiTRlAq/N4XSx@lists.linux.dev
X-Gm-Message-State: AFuF++lB3RwstEh2lQk1YDSfwFfMD53aqel11yC/OEe3E9qzMbZGMyib
	w/o2V0DW5dBsXQYWW0mXo9V4rs4sSh3yvjNEVNbmxqha6dfH9XTV7d6v
X-Gm-Gg: AYBFou1KDiLc5PzxYK+fFRVqeZmpQhtMxvCWoFu/Pzg5akJDRNN2poq6qagDBPjI1Bh
	aUI0tMXmphlyLzU77k/Nw+qpHhxBNvpdsr56OKO6gZlFwepUMRnxz09Bg4ouQSaNNJzD9IxS9Mq
	sV6Rzj/qO4qWN2xkLJ7n0yuDz6syU67/72WTkTQPytABojQUGHS8g1TCGbphtHhAXHx5M8JBx44
	4dprcDRyYDg2i+do42PAMR/XAi3LwyL3KAFURLXe1h1n6FpuCv9uftShF4oAOwBWTVqqiZXM+cU
	lQM8EBoTRmZlC6n8O6A8Cd0O5VzwMPe2N2dwT0Rq4XSJVQSJq8bHW7K85AS9Df0ZJS4StkQnKIn
	VYAPeGd2mjiSaqy/2PzvQ+5yJSWLXEch+IxdBptT9b8Tm2FpyolwQwMKMrboqij5vo/PoaIj4wW
	WvMgcoRHi6CnKDdMo65q9HeelRXO+BsK77JM81+qnidhi/KIZ7+5NcNrSlndfpkviWazk=
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr151479915e9.3.1788965828242;
        Wed, 09 Sep 2026 07:57:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423897335e9.2.2026.09.09.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:07 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:57:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: JunHyeok Seo <starlights2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: align AES function parameters with
 open parenthesis
Message-ID: <aqFzv98OAFRzeD_j@stanley.mountain>
References: <20260905072033.54813-1-starlights2283@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905072033.54813-1-starlights2283@gmail.com>

On Sat, Sep 05, 2026 at 04:20:33PM +0900, JunHyeok Seo wrote:
> Align the continuation lines of the aes_cipher()
> parameter lists with their opening parenthesis,
> and replace the stray tab between the uint type
> and the hdrlen argument with a single space.

This paragraph should be wrapped at 72 characters.

> 
> This addresses the "Alignment should match open parenthesis" check
> reported by checkpatch.pl --strict.
> 
> No functional change.
> 
> Signed-off-by: JunHyeok Seo <starlights2283@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 2217cffac5f2..3de102a27517 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -765,8 +765,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
>  	ctr_preload[15] = (unsigned char)(c % 256);
>  }
>  
> -static signed int aes_cipher(u8 *key, uint	hdrlen,
> -			u8 *pframe, uint plen)
> +static signed int aes_cipher(u8 *key, uint hdrlen,
> +			     u8 *pframe, uint plen)

Unless it's specified by the protocol spec, then "signed int" is
nonsense.  Plus the caller doesn't check so it might as well be
void.

regards,
dan carpenter

