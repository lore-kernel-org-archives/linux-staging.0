Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454063DD51F
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719163; cv=none; b=BbegNUr2snnBCHErhAhURksN1jqMRVzj6/xH8vS8hhn7fDpZLAHKdrLDik1LqfKEr/7Vm/kSjtkYt6THy1Bk+j6tudN1FLHaDUFWmvJ1yb6G2dRmIZwAEESW/nq5g/M5BXvSPD812sNrsZEs9ong1H9w5SlJxMuu0Ef3wGMCTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719163; c=relaxed/simple;
	bh=9CUaYRcAaHQtDdIPed7PnMp/ErjQVUI/rOmFTiUhSiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9jRpBGaPjuYA3RatO1V5UjX00RHNLu8ORnVoga1fJ7fRSur4wqFI5C4rKhY1D2KleRoFkRUPVfa5WuxMbHJkn4uyzKPsnkVL0wi9mZ7EX94fin4QkzJc/cVCG4COYMuNI9gFf3lC1tUA0mpDoOF7NJfOnCozMrDvQeeJ5aupX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMQXbnhP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMQXbnhP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472493849a3so1031646f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782719155; x=1783323955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNwr6uPHxUKpGJAyNPQ8nhfoGztkDSccNjDWDuCDYb0=;
        b=YMQXbnhPiOp3oKYOMbdYCv4LGxrtsQhUVAi7teyWkLAndRs8XCaE4xLiaBCS55HHpn
         alhuFmYj1VB8CoNqJHKYB/RGfKAeVFtFqtQNxL0/129zf+u9qTTbr0CSjHh/N9ZL7n86
         bIWqiLvTpuSbma3RbP5wTOBk7Enl03Erq6Z+uSnECjKy3b/ApBt8Q0q7mHVYtm3K9OOI
         +2hoeh79EClymu+fmZP6g4Pp3DFA2RrwiCCdi1Da2slwI4j8Y/5bub1asZtxiOQ0yYTG
         qFXN60D6S6CfDS1vfIaYeLClcZl6a3zSdjw8Hqnk9KE3xfYX+WAa4D+54ZXBSIUrkm3j
         XMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719155; x=1783323955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNwr6uPHxUKpGJAyNPQ8nhfoGztkDSccNjDWDuCDYb0=;
        b=dFpy9nYmTIV+M6o2+bK9NqwI70nzJ9mjugUSvkOrkxNNqhAx+/f6X/oub/boYTV7ii
         QvBRAXkH+rVFfAJC7GYn1h6cDZ0oNzFuUxeNLfKo1ZRi6TWtWg8krvcB8eipR04chfnH
         aqw3HHJz40lLyTQ/DWvEgaotZnYYIS2qK4NkA4fqEclb4OkISf8QhEJBqChGoYD3qFUE
         McFfqrLKKiZwTDSO0XUx7kijj3vejlSD0B6XKJsodCwjteOMdZMZMxP6HdU8k9sBroMa
         ioJnKfpcdaZRVhNaXNiWTU71jA+4+DsHb2pIKbB1snB556s2OMv8uPFw+7zxFp3ueYcK
         jSeg==
X-Forwarded-Encrypted: i=1; AFNElJ9xh7o1590A4DpM3hhzxGW7XGJqDEnq+bVEaeCxQdIOcN6iQ0W/2/Y/DnOPfi2QVwmh9i4NVrlIi4UV70n7@lists.linux.dev
X-Gm-Message-State: AOJu0YyYu1LGxrabE2jmeDm1r4hj8naUTKr8bIszIKPOXsnOvcSx24w5
	tq3MOb0YVasRQXPzp4TO93e69bVbNgwxOfQnLhqkjbDLy7BQa7G8G9VTGdA6KKnD
X-Gm-Gg: AfdE7clzYssSfVzPs5GGPMud/Y/2dDhnCvDUEf1u99fqH0sNa/rBDy/6nEO9XECVP9V
	XhvfVZLdb9AqFhneWPbNISe9Zq1HyHEiqe3qwvxe37oE6zCK39ZyYNCDgQE6DnpMOqimcp1100/
	YPClXJv/sOhzXmjkDmHEuAP5gtigBof3tTzSRtSNvf5Ex5oZA+82y3JJMjpXDfklG8BlOl+gHqj
	k3CRtB+Q8+yqlAgiU9PTMpnI/4sqlDfK8zgZ06RKdEsHiB8ryGKj7FTSg1PN+euZZY/paetXXHU
	dcJMsH+ivCf9MJgxva6d4NVi5h55xdmJalwVDjqxSz3aqLMpdEVsAbX38261xpj6M75ubYL4qLD
	SOg8g1c0xjRj2uvRBaZQI2IAaFUMIcgBaPFjglnMVQVd2dLAxdNqVUqp8iiGwPlPs4nzVi2PL4T
	Dbev2N6TWdUg==
X-Received: by 2002:a05:600c:1f91:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-492668857d3mr228322085e9.19.1782719155130;
        Mon, 29 Jun 2026 00:45:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-473b98814fbsm7499082f8f.32.2026.06.29.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:45:54 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:45:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: octeon: factor out device removal into a
 helper
Message-ID: <akIirkvOKWgAqCSp@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
 <20260628-staging-driver-octeon-panic-v1-1-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-1-fe8c34989254@gmail.com>

On Sun, Jun 28, 2026 at 12:31:24PM +0530, Prashant Rahul wrote:
> Factor out the common device removal sequence into a helper in
> preparation for adding cleanup to the probe error path.
> 
> Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index f3fa221f452e2..e07c6911b8252 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -104,6 +104,21 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
>  
>  u64 cvm_oct_tx_poll_interval;
>  
> +static inline void cvm_oct_remove_device(int port)

It's a minor thing, but don't mark functions as inline.  The compiler
just ignores it anyway so it's just noise.

regards,
dan carpenter

