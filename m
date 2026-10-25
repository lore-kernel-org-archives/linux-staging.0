Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931583;
	b=uTU5N4fWdnigjXjBUI9XCZGk+9Dpi3ymF8GiVwFNU5FbFqpWdxPXhkG3/Kz3u5IrRv8S
	 mYbjzGUbsKNE7lMsGiZ7tsGG9tD4E7UffLGnaprFF/tPp5NuHqwv4ugWoZpiuo7v1MZmO
	 GZlAQimkLq7Mu1owDkwQiEGXMGDGAuam5bhc5x0z08LNqk4/fW++zckMQ5UVDYbkKZvy9
	 FPBL5v4LSrT/x2on3eLZvX7/RCuUZ6N/kig+WqnpZ7sf+RwwGfItmRC1NTi7/oxjilsy9
	 qHhfBjCbUjF7nrnzHOdKK5e8M2kevtlD4yHUxo8z1uvcALMuXd9vT+TWBGBirCKOXig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=sBXji8iA/1eL9YPTJhqHfbQ8hs7sG8mNf+w5hLMZXRo=;
	b=HInkLH0nHFW1Do5JQJ5FU0cqssIv/uQbvXuYqgtZvCZxaMN5SjZAekjfXC7nD4csDx1f
	 sVZXoBiiR1svIXU2Ws6NPjREF0vajXvu6BucxywhIq2ZhnMDDDHKBYd0jl6HdyTpvMB00
	 4F9JdJo0aBBt6z3i/nQBoMys8shf2xAlyFwiMuuxwoIK3BqVH4ry9CkiG1cGV/T2yt0H2
	 +lIsKQbHhJRaST9HH781345xO3ZbpJY3UlE3O+cAeAHyCpPNEhVc3K6VpFVtpIZ0Ewcuu
	 Cw6yfVM6w8XT3Tn1eouyfq9res/c0EU/Wu9JgZDzAG4KrIF7uu4teAtK9LDGgf69WGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=p9wsF1wr;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E95606A31B;
	Sun, 25 Oct 2026 12:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E95606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=p9wsF1wr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sBXji8iA/1eL9YPTJhqHfbQ8hs7sG8mNf+w5hLMZXRo=;
  b=p9wsF1wrf+2fDgZKyNOZecLahv8uj0+gqN/VlSUBcfZisoW9H7ug3/L/
   vqLyxlZXsKsdYa5NHFfT9kqXx0m1U88BAQCICuv1RWzroDGe8go4NQJb5
   TSIZTUY3GHDasd52X6YJZ8d/cKZVX0wZ4udVSBL7mcE8q/JA7+q1bo36o
   0=;
X-CSE-ConnectionGUID: mS2hlVexRgGJzBqmG7V6Zw==
X-CSE-MsgGUID: twqPJ0EtR/ulr0epeI8thQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,177,1787004000"; 
   d="scan'208";a="302214243"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:32:59 +0100
Date: Sun, 25 Oct 2026 08:32:57 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Haasham Khan <haasham93@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary goto
In-Reply-To: <20261025122504.8404-1-haasham93@gmail.com>
Message-ID: <3b68a92f-b81c-9dd7-fc91-96a761a1237d@inria.fr>
References: <20261025122504.8404-1-haasham93@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 25 Oct 2026, Haasham Khan wrote:

> The goto exit statement jumps to the next statement, so it has no
> effect. Remove it and the now-unnecessary label, and simplify the
> conditional block.
>
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Actually, this driver isn't accepting patches any more, because it will be
removed.  This was discussed on the mailing list recently.

julia

>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 6f4bdad00f60..c2d0cd314b81 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -2005,12 +2005,9 @@ static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rfram
>
>  	/* check the frame crtl field and decache */
>  	ret = validate_recv_frame(padapter, rframe);
> -	if (ret != _SUCCESS) {
> +	if (ret != _SUCCESS)
>  		rtw_free_recvframe(rframe, pfree_recv_queue);/* free this recv_frame */
> -		goto exit;
> -	}
>
> -exit:
>  	return ret;
>  }
>
> --
> 2.53.0
>
>
>
