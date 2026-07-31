Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AC3C8708
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845480; cv=none; b=tCK2bLKJNyETSm/wjnbVWFODJZ+NV3qe8Jr/56Yw1SeS/Q8CbI3SAvYgEhd7DKegBf+CcoFpXwjgCzCbYwkNNk8tdWJumiSepdwxskMwwPtD3JCIQ6M+5dckWf9tqz13u2hthzem58aQeTlFSQyCKL4DrXhnHzsx29wtUHQNWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845480; c=relaxed/simple;
	bh=0LyZ74u2q1qi1dmfzlWBIuWO4q5Tgz2kSM6W13q2vbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLxTPmZZzp5k6RkqxvlA67ar51o+WJQgZI2V9uScvFPtT5kHIfdFLG3nql+ky76jJ9kmcBx/Y3g+QX+QLKqK5aSaKIumenn40grzvkViQHzTDSxLZ8C6fok+LpVz08QeAqzIcHQQNGsHBH8Ajl5+5oPVGVRPrzolvSvhxlYSKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1vzTB60; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1vzTB60"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so2757940a91.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845476; x=1786450276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+Tse4pvOy70inx0hTOXqXvXU4gcfDFBrlYrB+8tgIk=;
        b=P1vzTB60qFZ6p7V3/8JAp2/tOXq4ssvaLU7XFVfJJcLFgWP17l97vq4na4Svtd91mT
         iN9ZZ85Hi6lM2LDCl8J7+3SyosXNJNDHEYdJH//sxUyF3yvXA45ag5NRJPG0veoqzYBz
         dP5c6y2IdjSRk7y3ME6RU1s6Kf1KZ0pXpsMRgJHOz/gMgvt8APe7bZ/+YHnDpxkalzG/
         Wp9C0bEleARBN+WHtx7sHEORafF+XIk9AdcPr6LYYqDHH/7vzyJnGZF48XK9hNDE+uUL
         YdGUH4FE69twItviWPSFzErwwa51FjRPseGQyxeVXil8Fowibxkj01yZzJJmXoe4jwkQ
         EtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845476; x=1786450276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+Tse4pvOy70inx0hTOXqXvXU4gcfDFBrlYrB+8tgIk=;
        b=Y5Kqa1PzGHhQa8YI3HsB4LlYOVvMB5v7dFNHoT2ltwOaGqlRrG+btRV6zW3TPVV/Fo
         zOW0jz3f3bR44KzZou8/N5eQRA1tt7xbodT7/JgvAruUmELJJGhQRYZwit1/pHruvIJ0
         4Dr+OAZsfhufp6uR512tBfT2/0iicy0A5GFiRsgJZcFTXc2iLpR/6v00ZUF4S0/dnQ6m
         vKHMPqASdD8zRxIK9VmifEVkuD9lpi36Vz+kIQghg8iC/SHI8oCmK9BbKuZB3yF/5/qZ
         XnScCoTBV1spKRjsBcKsOyoG86F8pFYH3ixUBmkUUuINY9ekQ3ZOL7696n1/rvgqhGUd
         KYRg==
X-Forwarded-Encrypted: i=1; AHgh+RqCQtDsR2s0nOfnd8CvgUCj4ejAzaNEQlPL3FiSsUTEhj9z6ApZvuuVVWHom3/fOb/XmrYMNFUzmSjJCi3A@lists.linux.dev
X-Gm-Message-State: AOJu0YxlZJp8lfW1+jDvfjh7b3K1u/nZKTqGLB/0RBjBEn/WjQpaXd8X
	YRv1D7N2wwDHvm3w+I7YSjm4jKE86bTR0RhHaVJVmLcGJgm3fTx4UbmV
X-Gm-Gg: AR+sD124suQmt33lTuxcuX1b6s/3iK7c7mpmK5XOSW8KaXmImGJ9QRKiWg62b/olJrq
	oWUQ1EvmuY+Z7FUTj5ZKfl3n8Fr6wKejo53PJTIcaIl7Oi5H0ht3BbkF+ReqDN2MKdEKldYr3q4
	1G6npfZil2ldJoCKD6T5o8KEgWwdvhvT4oJ8d1ihVsHyfLGol38jUVpINCAvOyItnDwsnl/6WUD
	vt1S4CmtHstGjn9l7C8kFQXMTXX7ir23sL6NmGDYgKfpqOcXWG5UTm+r5x49m4ezxBkvvuDMp+W
	jxptpHQ5dN9Gtjy/B8Th3SHgLmtETgeYdwj8PpvQULJhswni2Yb/Dao6hxZUQuf6WQG8aCtc9aC
	V1NSwe3gysjQRBxZEDOM25DKUCxpg6WvUW+QYrkI8RM5Qq3Gg8q3ISqRh0S9uGr/2T8h2wuwuLk
	7oLcF+wrJGBjSlsKcT7+GvD7BZHnEUgbJGIw2+UrEN9nmtV+zJgF49zAg5KjQunPgu
X-Received: by 2002:a17:90a:e70f:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38fbc4f84c0mr12030932a91.33.1785845476337;
        Tue, 04 Aug 2026 05:11:16 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fec1209ebsm1252691a91.9.2026.08.04.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:11:15 -0700 (PDT)
Date: Sat, 1 Aug 2026 00:21:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: disable SDIO function on block size
 failure
Message-ID: <am0R56sP8tolOTvC@stanley.mountain>
References: <20260731161710.44828-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731161710.44828-1-mhun512@gmail.com>

On Sat, Aug 01, 2026 at 01:17:10AM +0900, Myeonghun Pak wrote:
> sdio_init() enables the SDIO function before configuring the block
> size. If sdio_set_block_size() fails, the function jumps to the release
> path and returns the error without disabling the SDIO function. The
> caller then frees the dvobj directly, so the enabled SDIO function is
> left active on that probe failure path.
> 
> Disable the SDIO function before releasing the host when block size
> configuration fails.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

