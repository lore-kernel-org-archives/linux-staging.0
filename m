Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507C378D87
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776282973; cv=none; b=PkOeu3LnDO/YrQGhGSu7dutGhLBwXWlO+izumdKaF0WIWOryoCjpy1RPQfIX+lQ9NdKWZkqbdKwN7JbQZ/De4epy5l8/cjLQUivq9Vfg3Nnpm/xuSc5S/x3EQIgGSvLnt7PulEAQkgB35S6xx/sgO/+cGT2pAk6oA5lNRuVsp5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776282973; c=relaxed/simple;
	bh=W1LTulubr9TL/UfwjdegdwUx5akyKQxeDDaubGeE7mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbnLw3DYvF2tirheFKg3jKVKloyzgz2mCvdlH0U/HJldL2xbW8WlTLGmdADXkTz/s8hJAyPImKZ7lF+JVgTA6FBtXy9mxrptYVKRKH7dELZKVqYh8NSU719QHJQawmgzJZbqu0YvKiB+dSL8te60JjClmDzazN8KR9+UceVMr7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsBLoWbL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsBLoWbL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4647298f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776282971; x=1776887771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEl2OJLVmeUKNE3lrILu4jNBkDcCdXL1nw4osbZOHXw=;
        b=LsBLoWbL3LUm5LiEt96iwYhsnktuJojITXcmPi8hT/Kd61PvSA5iPDygGMnnn/aeSj
         cRiLzAopU8OzkvwRQxXQFLr07nHeQGeILYmOrc0b00Z//hzH0CbLb3wSJU/7MrbG725p
         tSuQV34Ik147S3pC2RV3QoaFrCCSNwmearRef39rIn14oPtxdT7xK5FxwxSAgn8spij8
         VBkmJb4zjZnGmIzspwhK436pe7VYuthv7qrhEmA3uX5ZCFXMT9PxH/LqlxrRURcCn/uP
         LcI9pY+uXZAyuDXxESlpbssJpwicea5+pEBcIgC48jZKB0E98buL6DBRfhf+fSMTIc7+
         hDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776282971; x=1776887771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEl2OJLVmeUKNE3lrILu4jNBkDcCdXL1nw4osbZOHXw=;
        b=hvUchgMOzNGCHFka7p0nYy6HBntHYpSc2l8LnZK7Qi5tRlPVZFQ+n6EK5qwa+A6W0l
         iKmbjzEShPdPUQ44MN213M/nJT5eVDwckhmlqEpA6oGOkvRkaDNjOIGDe4QTlUyFSS1W
         TR7g6fZLyL4Q9kgdf3KSzDyO3tbdLwcJqNMnCP85FhRKllyenACBNZhGHx2zJNdVq/SG
         uxp6AEkmgeXgRkETaZmz5YWNB+xO69oV6WVmBtEPyl958U6n5S7fLgW0UQ8rOCv2gJG9
         Gok546iHvYbdJmvb9gcBaRDRHSWX+i6XeKNLccd7Jtk8LYpwq9oZNGlEfMZVT3gPKHtg
         47vw==
X-Forwarded-Encrypted: i=1; AFNElJ/SkUGF2kZRCc3xYBjozOSrH73fth2NPD0/h9q8Bted0vAn/4IuN0mpsIbgpUYbz22N0cIELGoxU1TM6oJY@lists.linux.dev
X-Gm-Message-State: AOJu0YyrEQx768lfp4lxpyPcVMTwNh30aAFR3BiWnndEJXeQ96OliLko
	Ily9FIxdLkj/qs/ZlxYdJ2Lfl6smcRP3OaBd97pZjl6uQksdSMc/e7TQ5t4k3oVG
X-Gm-Gg: AeBDiesJvh6MbyQEWVJrFSJCt0qZhf12IXRLrN8AYV4JLxKDoR+AB67Yn/fk1Y8ik9c
	FT2og/9GSZlY4Bn/nUs/IJrKbSt6rFG58x1AD6Y7aHATc2MzqDgMt0wGLUdqO6GhFqKyfcaT9cw
	Kgce8rNM4uXXZ32odFfMOBM+cXpTg4qFKDzMF51Miof+paDBpAnVu/XQRtSqgLS+ci2ToBfwxJJ
	oPUxHj55/5BjBAEJ2Oa39uXRAAOr7Yo/phwsbIB6Ack3xaSfsjIbE2qB33oGAgOzh1F1AWIj7lX
	n+3neda9tKEZRad/VbBXWUhTI594OUTTqlnO6yCtS8eQrL6T7SUsF3gisf90iNfoi6HFr9vstE2
	Z8RGtxSoADZ52btrTwR9a7PPwMD2Wk+YKitzGPG9ozNqx58se5ZzQnsOK/cd8AkcfqP2/a9cu6X
	vnzz1HNRo8Y5yx5SjDf/ewtujpk9DRLQ==
X-Received: by 2002:a05:6000:4203:b0:43d:9bb5:bd9a with SMTP id ffacd0b85a97d-43d9bb5bfbfmr14140449f8f.23.1776282970578;
        Wed, 15 Apr 2026 12:56:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5fd6sm7761528f8f.24.2026.04.15.12.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:56:10 -0700 (PDT)
Date: Wed, 15 Apr 2026 22:56:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/5] staging: rtl8723bs: fix heap buffer overflow in
 recvframe_defrag()
Message-ID: <ad_tVr0Pyz9ws01I@stanley.mountain>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
 <20260415185501.440492-2-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415185501.440492-2-delenetchior1@gmail.com>

On Wed, Apr 15, 2026 at 07:54:57PM +0100, Delene Tchio Romuald wrote:
> In recvframe_defrag(), a memcpy() copies fragment data into the
> reassembly buffer before validating that the buffer has sufficient
> space. If the total reassembled payload exceeds the receive buffer
> capacity, this results in a heap buffer overflow.
> 
> Additionally, the return values of recvframe_pull() and
> recvframe_pull_tail() were ignored. On failure those helpers revert
> their pointer updates and return NULL; continuing past such a
> failure would leave pfhdr->rx_tail at its pre-strip value, so the
> subsequent bounds check against rx_end - rx_tail would operate on
> stale pointers.
> 
> An attacker within WiFi radio range can exploit this by sending
> crafted 802.11 fragmented frames. No authentication is required.
> 
> Check the return values of recvframe_pull() and recvframe_pull_tail(),
> then verify that the fragment payload fits within the remaining
> buffer space before the memcpy().
> 
> Found by reviewing memory operations in the driver and tracing
> buffer pointer manipulation through rtw_recv.h inline helpers.
> Not tested on hardware.
> 
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v4: check return values of recvframe_pull() and recvframe_pull_tail();
>     drop unnecessary (uint) cast; add Fixes: tag and Cc: stable
>     (Dan Carpenter). Luka Gejak's Reviewed-by dropped because the
>     code changed.
> v3: rebased on staging-next; sent as numbered series with proper
>     Cc from get_maintainer.pl.
> v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
>     apply).
> 
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index f78194d508dfc..a739c2bada2a1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1127,12 +1127,26 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
>  
>  		wlanhdr_offset = pnfhdr->attrib.hdrlen + pnfhdr->attrib.iv_len;
>  
> -		recvframe_pull(pnextrframe, wlanhdr_offset);
> +		if (!recvframe_pull(pnextrframe, wlanhdr_offset)) {
> +			rtw_free_recvframe(prframe, pfree_recv_queue);
> +			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
> +			return NULL;

We have four blocks now that do exactly this...  Add a cleanup at the
end of the function:

	return pframe;

out_err:
	rtw_free_recvframe(prframe, pfree_recv_queue);
	rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
	return NULL;

Btw, I'm planning to review the other patches in the series so hold off a
day before resending.  If I haven't reviewed them by End Of Day on
Thursday, then I have gotten busy and feel free to resend at that point.

regards,
dan carpenter

