Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3115B998
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777117376; cv=none; b=e6aD5meBpWM9FnIfZ46UgkFz9IiIrgKhWAkFUJI75hq7vo4LO6LAojX726AV9g36sYKQ8k7kmRM/039quQmqFXanW8daE4Qc/QKbnaypY3Hpwc7ujWSMb3Jelxa8q8CbP8Qn0ABgAgsaOkx9O+79vGclBxphgzikGiGG5yzvFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777117376; c=relaxed/simple;
	bh=caoUSn1Mpr8Dwx8XyT7i4avjJQodnDFlky8abydIAi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQCqs/ocOhVL5ZySHdxiWCx1zANL+YUWRtmCHjB3gV8tPdFuSoQIh1pLR8M8dTgHBBs2FM0RRuON24d/4xBvVrhYf6CIBcp7YxmQVQFgPAz2kHcnKA3Y3jDqvN+Fh3SbBabICH4naQelXfwYM7fFHRZ5JoeCMNmE+t7ANcAdvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETfsQ/wT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETfsQ/wT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso90151285e9.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777117373; x=1777722173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hx7UIP4Zrmov+r2GHY1/Hw2pieYlhsrxH0giSd350GY=;
        b=ETfsQ/wTX76p5Z15/gRrIuwHdDuzQ7StaKQMll9Uy5VegtuBoq/8xVNtcWazrbTzCv
         tvQXaiInrV4CgY9vjXCEwwmpnFbPwXO0ipkdlcxrX67wuxJ1yC/uiZzaVPSpKR+tQlJO
         DkCO2t3XcJXfFR+Gc0QESBmQ85/fJDOggV27Ht502FuK0EGScAqkjQeXAU+lCJelsE+g
         ZROiTbdi1LaQa/972QK7yGjQQqji9d+5VvOgt+vR62yo3COx7Ub+kVdR/l5Y1A8wBGDW
         wexFzgJk+H7ReuNfaeC64JPZFCMd7Og5yNEPSkD3BKil71BDJn5qD/6h1uRLxiJIh/hC
         v7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777117373; x=1777722173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx7UIP4Zrmov+r2GHY1/Hw2pieYlhsrxH0giSd350GY=;
        b=GtfbOdDQRoE3FJn7QazgACti11qarPGsb2Aa9BUBCXeA5snrj6hBsRqAANSEPqUp4n
         6qfFJDWD8bli9VueV3lPamkxsW9Nr3/HA+MAvBp1wWrl3+LlJStSy3SIe17DUrgYoo1A
         mfgAyzT1qjJ3jtb6y4uIIAKhqC3RDJ6fQdhILZbOJHOmlSL9SCkdUIAoQmpCp85syr80
         uyuls33ssFfSXjyDi1cHoMITqAGAtAgf+c8ivQigsfPi9UsvAYpDVWNH2A+rgdl2qvNN
         Z61ofuC7nSuvN/9JYZA3HplcrV5kQgQhbZIjWQ7yMb5XobUImm+nLqaHjIXF9LEhPPb/
         t3EQ==
X-Forwarded-Encrypted: i=1; AFNElJ86GiJB/3Mgjn4XYyb+SYLTINpNoj6JA5K+/fFCrjl+2nmqkHMtD52qY+MLy0p/P/nN9Epe4QsbAWe25wt5@lists.linux.dev
X-Gm-Message-State: AOJu0YxGaHxCv823kLrT6VVHbnleGrr3gPCL58HGElwR+ovtN1QGWVK5
	lfUmPxJbZtuaFQpfBoU7qWl+n4UUzHjoRQgzPCZULSDNDOhLsTCmyY6q
X-Gm-Gg: AeBDietk9Nd/9wW/vpSihA0Xph00BIx2eOcPV6lgX97JRg1OvyULg4Oj/Fnqa3Bz0fr
	snsYWwlwoEEdzkecG6SLvZt15kFN9g7mnxo2vVhpOTqNYKcd52/ttJcx9IcNMfRbTh6/5LmF1/B
	WJcQ8tFYbkUWr2q5jlPGFyeeUh+gRX6DiC++Xb13I+TTQQJKyZ93cCFsi5jKDyotCv8TAnDxtcy
	Cw1kQdXIKZKbmXRo4Q8iGZAs1XPm8QlkZJGj28zFM5fLtsMc3A5ZLAt4GtZjxVI1uhEAZ3/RLSs
	B+oyNo5AJ8sjIiV2Dm2pRJTtyemnkITGJpeQyXH/+5ISsFsBMA0usDQjbWkTEsfDxNI2pnQ0s7i
	i8DwcrPmtqfWNa6CgnpmP432LRDSDYkuQvSpifPqNL2wUwa9Rl/2/n7d7X7IuOqt46atcwZx5hh
	7CnOCQYbXMk2JF5Gq7yV1/sPPoIMDZhw==
X-Received: by 2002:a05:600c:828a:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48a65ad191cmr90211485e9.13.1777117373143;
        Sat, 25 Apr 2026 04:42:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm689130685e9.14.2026.04.25.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:42:52 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:42:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix OOB read in
 update_beacon_info() IE loop
Message-ID: <aeyouDLjj7tV3ZcF@stanley.mountain>
References: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
 <20260424151932.3734611-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424151932.3734611-2-hossu.alexandru@gmail.com>

On Fri, Apr 24, 2026 at 05:19:30PM +0200, Alexandru Hossu wrote:
> The IE parsing loop in update_beacon_info() advances by (pIE->length + 2)
> each iteration but only guards on i < len.  When a malicious AP sends a
> beacon whose last IE has only one byte remaining in the frame (the
> element_id byte lands at len-1), the loop reads pIE->length from one byte
> past the IE area.
> 
> Additionally, even when the header bytes are in bounds, pIE->length itself
> can extend the data window beyond len, silently passing a truncated IE to
> handler functions such as bwmode_update_check() and ERP_IE_handler().
> 
> The parallel fix already applied to OnAssocRsp() uses two guards:
>   1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header).
>   2. Break if the IE's declared data extends past the frame boundary.
> 
> Apply the same pattern to update_beacon_info().
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index b75e7f4f8d27..551d7200d3a9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -1292,7 +1292,11 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
>  	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
>  
>  	for (i = 0; i < len;) {
> +		if (i + sizeof(*pIE) > len)
> +			break;

At the end of the function it does:

		i += (pIE->length + 2);

Could you change that to:

		i += sizeof(*pIE) + pIE->length;

The original works, but it would be better if all three checks were
consistent.

regards,
dan carpenter

