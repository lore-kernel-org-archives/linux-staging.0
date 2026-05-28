Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B13B2D39
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963901; cv=none; b=nx1NfhcOzJ+G4ubjbM44HUzTpv/QaQGU5fd3RvD+5a9Bxvt9HY4rUMkKDRS6qkVSOOJyaKfOTbDFGK5+KOYHXNET6lGZeu8QhfaoRPfv4KyE7jP3SYKKj1swLwOKYt9H764A7wGucxH9LWHRvb+L/lZ4rZCiy6eDS3UUX8kUB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963901; c=relaxed/simple;
	bh=Kh7QnjxuOhyWKhIYaYI4L3W85kEIW4x/T41nKxAulLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnf5wTvDGob8UdSpJRxowe0AJJ8hvvKlQ8kCUBh8SGCXqs0H0aXY99ZqSSZsbaC85ig6AL9ZpVG9PzCwERXRMbYj+LvFfg5gmXbZ4bERwibwpwJc5Trj3Pa2CAYWDvwLBvaLHZcwWzUXovPBbnzKILG6F8/f++P6r4JDIg+EJiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5GI28Nv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5GI28Nv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so64351535e9.3
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779963897; x=1780568697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMiDf3p96guC+hrc6r+Sp0WDhCNRuzrhB23PfVLi2iU=;
        b=B5GI28Nv3WicypHnCuklGRvH2bbgxDKfQPocaxNdrSRfN6ZKb7BhjbvUOL44cPo2nJ
         yWqrqAg5UUSBxoBymLWytdhYIOu57YT7ZKZp6LR0SbswNuaLVR96CFiRhl972YiXX2zI
         2OOKpVqIUlr+OT13Bw0auOjKryFhds/WMXMVgS+wkD3KWDaMuJ06Tyn6G+vNHZwvMnII
         wlnbFkRcorA9dS+32rNwIr5ZHdWzwRCk3thJWZSk9NshpGXElfG/zZ3BjmfxQxuw1Qyk
         d/bdK+OD+1RFqLveJli+HBMpDj4ZhOPtauuo9EGOqS6/+wrhFEsRPzmJcGBiQ3ZvmVxj
         wn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963897; x=1780568697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMiDf3p96guC+hrc6r+Sp0WDhCNRuzrhB23PfVLi2iU=;
        b=s9csXFYR+dlEg1ZBzJsThtTjm+10jTlRd6mdmfhe/L6P1b6wKryZGNGaMdwG1ub+Bl
         +BevihklvQ4CzEwKsrI1Ph6KyVrv7PbGI7Ofko9w/Y3vYjxe7MXK9GMZ2z+4yniwR9uU
         3IG6lhoJsCr6L2aH8bK6QBZPBisJPscz7LTxEiJy0Gn7icAOCdbbjMYrchi0pKrPuQYj
         N0LZw85LfVfRIfSOnIH1YKzUU6qVxus20+RKFU1f1ZgBcEUuWuJdKthjt6NCtAxWvghX
         dlMPHnjE++THfiBnr/DL3eV3Hs/jjr/OjUCnodIGMbAO5vqdrLFNnFKf9DCO91uyrLvv
         EJPw==
X-Forwarded-Encrypted: i=1; AFNElJ/wdBBQZ+K46AUn0EZu0F4MsRyRZomd3o1ZTHC8o9RRKrhXwSVxbNa9G77FQNv/tGeoJHhvDTzhi1Fof2R1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/m28g9dZtwPBXmEQQ1ChLmSMf5Ji1n01WeoEyGt93rFuluSrO
	CztWS13jhVs/+fV1dXLsPj5VsONcb0mznwvdsYKjVS016c0Y0NxW+VjhCB43qA==
X-Gm-Gg: Acq92OH6zXxCpHsWrvHhXamMZheuRsvuwRhW4ufCcynRqc4zTihTZgj4yaADyGtYa4b
	Fe/y7/42Z5T+/z51DD55xpTBo8PujgJfkvdAOHEFGyXDqQRwjJs8qm7GWzyIv4SiP6IvtN/LDL2
	myy5gk8hp0IaurxNT57h/o73T4tNco9jSMgXlBWQYUxatzlu0S+051UoH1TKXoHQGh46ybA4wYH
	z+OxJhma/9Mnttgb5Hkhc6bXaPEsk+DQDf2IXHhorH6ovKYS4oIjNbj2usw0E6AMtt5twmrs38D
	ulvea3mzGdkBtDRGve9/IuH4LiEDhFRgIGZWQUbKdG+B+/Ys4su1iq25myMzbgOqzgPSpJGjDNp
	eyFFeWJZz80Oiw1JXPHSXLhx/YVaGqFRQQr2ZKz5cjVBuPhv7NENnu9NXLyj6b7TmxG/ibKtuo5
	yIUS6EXhoHHdPAmthWd0OUtbwlpp3KJkwU2FUGk7/O+Mgf
X-Received: by 2002:a05:600c:5288:b0:490:50e8:45c3 with SMTP id 5b1f17b1804b1-49050e846f9mr385148005e9.0.1779963897506;
        Thu, 28 May 2026 03:24:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b5a30cfsm19631725e9.2.2026.05.28.03.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:24:56 -0700 (PDT)
Date: Thu, 28 May 2026 13:24:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant else after return
Message-ID: <ahgX9AUuNqpzwbDV@stanley.mountain>
References: <20260528-fix-else-after-return-v1-1-f07ea0f010fb.ref@yahoo.pl>
 <20260528-fix-else-after-return-v1-1-f07ea0f010fb@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-fix-else-after-return-v1-1-f07ea0f010fb@yahoo.pl>

On Thu, May 28, 2026 at 11:55:42AM +0200, Tomasz Unger wrote:
> In enqueue_reorder_recvframe(), the else branch after a return
> statement is unnecessary. When a duplicate sequence number is found,
> the function returns false immediately, making the else keyword
> redundant. Remove else and fix the indentation of the break statement.
> 
> Reported by checkpatch.pl with no remaining warnings.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 86c5e2c4e7dd..51536f155750 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1789,8 +1789,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> -			break;
> +		break;

You have made the code buggy.  Don't follow checkpatch blindly.

regards,
dan carpenter


