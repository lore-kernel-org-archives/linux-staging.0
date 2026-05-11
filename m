Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C73BAD91
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491148; cv=none; b=hyeUMWJ/5sJtdkR0CJ2eGOPKm7FQ1ymdApWJvFozbbUniOdzVuFV6S00lIVzy6U/tVxvTPAHPHeSJp1xsg8YFQLpVrHCAUqEeXD8H7qPmJBTZm7VgYgcrQ0rmTjRyb6UTt0BlUQU6FkWmcwu/utY2xsYntGG+v9AKxdEtD1Hjdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491148; c=relaxed/simple;
	bh=mzC4PLB9qRk/2P8uWHfO7LVYuSTxmJkENfQvp8kzIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6Z/4CR97Z3Luz0V+1W3aDSWwASKgGUQcr2/lCe+oPha+Xqa6Qip8WnBk+YvO+yYdR/VPmaVfqLmuIwWlhJq+kuQY2aPfgoG9r3/BzZZEtjmT/+Q+wKe6I8m3T91S2Uj0iXPm4K4VUXBjxYsGdk5Ice5Is18Q8xrIhSoHCiWAxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkXzxNQ8; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkXzxNQ8"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3863082e0c.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778491146; x=1779095946; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=venGsjONGdAMkc6DmOtDiWfs4Ltsyujig9VX4Fo6dEQ=;
        b=jkXzxNQ8c3ZMNkguLcY2CUJwnliG3Bj77revKCx8spK6LooZ0JvIe1kr5j0JUKgDbb
         D19l7J7ZhdYVlZ4KxLn3QNCeQvQKyFcYoPvTGklmAzO4sEp+6yRtUfWZ/TLf/DBNJIi5
         rDd3VZoydGNLD+Mv6D3PdktS+usTutZFWgsX4cbnqTqJyeNf0KfWnRPtYhqHGTb/lwTb
         yOnc3+who5gpX2a4DBS6sXoqrDeGo8iYDmhHxBs4qVOQMc8ObR0E6YmoB/KOvnupGcam
         YeVVgooeYxDrvv9CyUD+DdEvhM6bQMhvJrm+7L7WDoEDRL705Nuhyg7k88h/Hb0nEw78
         7FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491146; x=1779095946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=venGsjONGdAMkc6DmOtDiWfs4Ltsyujig9VX4Fo6dEQ=;
        b=FVorNOjzmX0D4BOEKvjFXN0D23udxkI+/Lkqll7FSZHUE7EwvJztXzvOVZVBYki+nU
         1pmCZfUpD8jTg2y98ms0IpVz/fgNC2RfMipw0iFS6U7AHrGxXgIu7PHTTxQfH+/RAmWB
         xA+IoH6xmMAuyqbd37JBb/UpH4gPAHJJ5KHf/pyKj8TE9z3/zqpYkinud33nfdkBDWZh
         rYdOi+zdIre5uHOaj4aTcRksLqPqgRNFErDx7o69kWADgAuCZaBUTuyHjTNEQIO4CUnf
         3rB6RBie10ioVVBKr/Gu59f48nLRRx0LNb4AZNvWzxqsSYRvDXPnB7hyCSULOZZpBKSl
         kMpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KobEVOUZnAC9rp3PkiAP3YzJDm6uOGnd4oPa0x6h+3zyAV5e+8twQcHFlyZrfqg1LgIiZR/Mq2cfN3wSq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3CUp9P6Yl/Jy5Jy6WO/F60ePu0NLNJ+Du7e16s/xVevv6tMHj
	oI6iZdfKPsCzLtSc6oyKDA+qgVVYQppI6VrTOOeCN8+FJkknchy3h4fl
X-Gm-Gg: Acq92OGJ/q7gkFLi1e/QugC/zHEi6xxEs0txATi9tJjKPtrBOAaiTPAn2VmCz1J66t4
	1y3+tSRRjl23kqGoGnFkKZMgDfs4/SEpx8NtBCiWXcG7XAaMXresiyOfUibyVhqXSqDQSSuezwy
	CNyShgXtPv8U5RpWcSIjxod2DSM0C03EdM0izxKWj570D95NW5Cq06WqpLiM4Cj0ggbxdsbBT28
	CCo9lCeWLGDPmnGIbHuhYHM8LgcNqUYd7eeofe8Lx+oHeSqCxQ2oiipVSiJmtck5Tp3fO5MDi+2
	rHM1FIQ/g4kua4vvFlYfaxity2K8IkMKZVJJUw5zQUcxAfe/3+S232xYaAv2Zib5xG5cGzszTUw
	PmbuYODMDnIPX84F/ObIuHyMIXKgpgRO2SehGV37WvjhUBYAetxuV48zYJmFUQs25Kpyaf4sxqd
	WACJuo/lRAGdaaUUQWFQ==
X-Received: by 2002:a05:6122:f06:b0:56d:9f2a:d6b1 with SMTP id 71dfb90a1353d-575596d0744mr12051800e0c.12.1778491145880;
        Mon, 11 May 2026 02:19:05 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219c6945sm5120781241.2.2026.05.11.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:19:04 -0700 (PDT)
Date: Mon, 11 May 2026 12:18:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/4] staging: rtl8723bs: remove overwriting of current
 IMR settings
Message-ID: <agGfAqihe8DHqTPp@stanley.mountain>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
 <20260511075651.11637-4-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511075651.11637-4-nikolayof23@gmail.com>

On Mon, May 11, 2026 at 10:55:30AM +0300, Nikolay Kulikov wrote:
> The code reads a 32-bit value from REG_HSIMR and writes the result back
> to the same address. This operation does not change the register's
> value.
> 
> This code does nothing and simply performs unnecessary SDIO operations.
> Furthermore, if rtw_read32() returns an error or returns an
> uninitialized value, writing it back will have unknown consequences.
> 

This commit message isn't very useful.

There can be times where reading from a register and then writing the
exact same thing back to it is how the hardware is designed.  So it's
not obvious at all that making this change is safe.

What you should say is that:

Originally, this code use to Step 1: read from the register,
Step 2: add some bits to the value and then Step 3: write the result
back to the register.

However the problem was that the bits in step 2 were always zero so
I have removed that code.  Now this function just reads a value and
writes the exact same thing back.  It is unnecessary and can be
removed.

It's not 100% safe to make this change without testing, but it
probably is safe enough once we see the explanation *why* the code
*used* to exist.

regards,
dan carpenter
