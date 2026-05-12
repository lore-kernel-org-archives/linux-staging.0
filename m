Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F97332EA0
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570878; cv=none; b=KNcKGMkZw9z1iC25hAYK4qHOolIPDhayrGwmwzALvfFue/ukpQlNK0HzDaFzD/fYtyO0tTSosD/On+j7ZndSBbNbpU8g+CWkMM9wIkwtJjQQscC3tt3M865DNbL3iyjg5zPQLgPcnuMrf05yfOmsC6dQkvkPJ9m3Q9rpcVFpKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570878; c=relaxed/simple;
	bh=Wb5Eaixtf8ds6w5uqD4P2ndnnK2y3udztabhmv6EE/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9XDWX4oZ8fC93HlB75UsQT8/uLplaLb6/3nL77zlQTCrDseL0G9QDGaK4ZpfNDj/VmPrCKNCQI5UJB3Cffjp6XEE7XekNhT4rdnZw8/E/I6P6V0WKCJFI/5Prfm+41fnRLNdQw6Zb/rcB08Migm96enuDyw/9lPn1BzgwXyllE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMFac3g/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMFac3g/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso59371995e9.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778570875; x=1779175675; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/KXokBmQXfYB3ymboSTLTvRoQOVtSVEUAohP9gpfDk=;
        b=TMFac3g/KHD7YEkJO9e5A353vJo+CG1DZ4/0KxA885YhkIwfBgiwKRwZDmca4ARNMj
         pW/iqZOFpNil2TSrp2JPUaJcYJXZRdazMaJrPWvZgJDz8Zv9+7I34z84OA/R+wYdK5pX
         nbPhbgbUkIbCJY6emrAs89D2rqaUuSUQ/w0AW1xxbxFgrpNKJUGXLUkh5x72DAp7Ejrr
         hhkBDvOlPemZds085K+tjNCjvu+Uma45jKvtU0ybecucuKcN0UnKPgSLH2NOD0i57Z6h
         8M9sxeHFY7784m4FxTDMSKEHLGB19VyIqYO7OlyE7wOcU+qsZuLI71hURaYIIBacYVlW
         5uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570875; x=1779175675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/KXokBmQXfYB3ymboSTLTvRoQOVtSVEUAohP9gpfDk=;
        b=jcpvG5XN9QAitbuFnPXC9uIB2EJH02TCAVmsnZ9WC9Ec03kPd77eaLho3EU70G0YVB
         hKx7heIMKtEhDHJv9F7xse0N2Jo3JZEJf/OGGqStMcOWEjU7H6Kg5RiJ2f+GDqF3ce4d
         5TAnbjJLNjkiHBbVfr9/bp2Zcw8qy7FU5ZyZYJWiVwYIydX21VV8V7xi3KE7eNEThab3
         MOA0c2GjicgMpgv7bo3Vm10e9wUbMP28nSQ66cLYlgDtAsSCtW81sNtfVJyMklnw51Dh
         rGePqIBzM9By/EPXX6dJwasE3S8u1cvOfDQXSyqVXSmtMlKdEyWmNEfCn8RkNCp+/jwL
         aOxg==
X-Forwarded-Encrypted: i=1; AFNElJ9gqrMhKTkYh9s6TSj9kbsFs8teViw+3rtomebwwF7HoYVyNTUvy5KYIXTssqsQvmew7ToEhebER1IDhjQn@lists.linux.dev
X-Gm-Message-State: AOJu0YwWgGfYA8XVuoiW7g2Pi9MbgKzTYfMjL3UPoaOfxqRperzlhjcu
	iRrXTopUIBIKO5IbM1HeYoo7+qfPNqv51xkNVJqhwMAjgoFdJs8UM2lP
X-Gm-Gg: Acq92OG0yXLZBKcC+jR6n8ksPPkJx6SYnHTy0ad41o514nz8Z8Grho2EHCZkSlHVYOF
	XXXtPxH9fXcYuNG7EdKlpMGABKd7xdhIe2T3JfDO+2otHDUJecjnPYxsTZ1WpuLOXdpBgjyfAVX
	3HpH6k0tSv/WzyjaJK5idwdTybqX1S1x5kiLpHX5R5qtNRvuukFv1ZSptXO8nBdbvMkPthu/zI7
	pJx3BMy9Dd8OAhdLoRSjFWOUY9c8Psj44YUfDB5+eL8nuX6kMKD30FEy8KMXWhzbHi8xca4/ptS
	1nO4cCU44pkSItLrtPhWEBIDHcYqpAdVxUwx1sXTAVhKa796Gxuh22II4jEZuNzAiSe4//3UDtv
	SjSGxn/chlcqZTtRTAVNqY4CJaBmYx8P8MzvRuYW4Wi8oZtMNp2yAp9FXW3C9sL9783gZ3cTXGC
	GGo43RW7SRxM5ob5PhK1k=
X-Received: by 2002:a05:600c:1da8:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48e635a1ba0mr320493495e9.0.1778570875315;
        Tue, 12 May 2026 00:27:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm29966188f8f.9.2026.05.12.00.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:27:54 -0700 (PDT)
Date: Tue, 12 May 2026 10:27:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	nikolayof23@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix line length checks in
 rtw_cmd.c
Message-ID: <agLWd1tPaHQvmhBE@stanley.mountain>
References: <20260512003115.5570-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512003115.5570-1-noahtechoueyres@gmail.com>

On Mon, May 11, 2026 at 08:31:15PM -0400, Noah Techoueyres wrote:
> Fix both block comments and assignment statements that exceed the
> 100-column limit to follow Linux guidelines for readability. Used
> intermediate pointers to fix assignment statements.
> 

These are unrelated.  Do it in two patches.

> Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
> ---
>  Changes in v2:
>  - Replaced repeated struct access paths with an intermediate 
>    pointer to traffic_stat to resolve the 100-column limit.
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 38 ++++++++++++++----------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..5c6999ac17f6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1106,24 +1106,25 @@ static void collect_traffic_statistics(struct adapter *padapter)
>  {
>  	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
>  
> +	struct rtw_traffic_statistics *stat = &pdvobjpriv->traffic_stat;

Don't put a blank line in the middle of the declaration block.

regards,
dan carpenter

