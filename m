Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009109;
	b=0w60lHbrDCWpulk5ZfbbjIM1zH/n9HhXtDNYKyPAdjTP/HNqWzWVsY94902l1nTE6pPq
	 hP2oigJsu0i7gJrkgCkuClO8GMaeMGcYvoZuW2WPJQGz0SKYcjmP7DDPKPjZsfZCZIP+q
	 mFhS9vYajcFz94oAneac1EI5h/+nm95+d4z2bksvH6nduD35KSWea/B8BP/mBQkag52IF
	 wtbAYrHneCRT0B40nk0sYvd6wwlstqh7e2wGqx6xdac4V02ScpjYmgQqNlzPr8SzUNVzc
	 KDgUNXv006iNjo/3Hlt4k9yvCUn6GP/m1Q1MRKK0k53oyPLfo82fM+Lkwp0k99k+PFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
	b=arcggPu2LLul+HUDTI/wHvV6etW8Mc4/UdXYClIQZmVR1NpQt3vUyc9U12MQIUPuKh8f
	 psEGaKI8MfuDhN4jjQh5qh9xd2uTcOF6r5RKV/ZVWEcXJ7nnWIrFxcXp5Q/rkXpbHui0C
	 P2IxFosVit6HIYNgmP+x8234LLWyWVdArmz1PUdRqUtmVNwCgJRRWCCJpIWJf2L3c97ud
	 yIs1wXF5AU9zxelI5ZbiFZNXx6cJpoFo6WS+jrKOjlRTepPZhbYxHVJg0SIDoSbWPzac1
	 K61Lrl0d6KyeMbAisbqazCv9YgcVW+P6/9dNz8+FwDV3uWAk9joXT6aJwcoGIxugL/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8fADSSa;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD760A3836
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCD760A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8fADSSa
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2063481f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009107; x=1793613907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
        b=P8fADSSa3WOIjWxc4JlvjnQGsKh1p3O9r4R74pC5vtGGNg+hh/a542gaf8Kd1/E9rt
         7WuDAgNQfzWABrkXVOgVH82QLJWUtM8zqHLOq+kzYwIlTLnYnfKCsvs2SM31up3PGPSU
         x46Gwjjpidcm9RWdohKr2FLe0L06n+CCJkNToBpTdS+oMEwtWVN12uxCY20+69pMBJXM
         LmOZaf68Tg6fD65Bbbe2m/kJwwfezVtlcFyNI13pKBhI06HiOp5Lz/W7UmqHWcbgU4Q6
         7BUkVHceXLDBjZWzur2GKpl7if2+QvT8FFc0e0y8y4iCXWOQnIBPnkNTD4naplGNWtxU
         50lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009107; x=1793613907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
        b=MczlYgLiytbqdTqlhZG2iZojPzIOm45crndoKI5aooAsmcrpMP17q/RV7HuP/nL2J6
         RuDy18EKUtasFJFgH5dD8QPGOk3Kv6EaybFMxpGWIPzjHyv85XhiVO155Nyuk7+a/6Qx
         FB/PFdaQ3n3s1mHn0A8DTne2J3IE3x0eOTKsI5tmRr/cIfwnPVhP5mZbNcBuuyIiXnlg
         Hss+JGObJ1rtz3px/LuQJxwPnjvWNWLwAUIhAkJ1T3hbuHy7LRBL7JOfhDPBMHIKeI2W
         G+3CT81sw9Iy3ZdshLPUWX00JkRx+iOFxbOogDJrDj54Iml4+i0LPOjGoxg5ZRQrj9Bm
         6zXg==
X-Forwarded-Encrypted: i=1; AKwUvBxMsebBGWE/BzuhR0k+WJcKZWRxsy8UzcYUduqcGEGMEwqr8JsYOxUDyjdc3qxV+4z0wyMZ83TSjWMUGjP/@lists.linux.dev
X-Gm-Message-State: AFq9FYJfK86d3FXxEqHf7N3IW6HEK5W4Rz7o3o073cJgoiYevaKVA83D
	m2TkvQk1Wg+79bHGQIEdkSCs5P6EPxz5ui/cNRfyni57olpXuoSuAz+w
X-Gm-Gg: AYBFou2FZ4afTHQvuLU/DgK5dUMfJj37T4K69on3ZAPznQ6bxohkCHFghEs6ZpU3j1G
	WUNlhSq3YoUPhvYtrUI9FaXCdxZaxnzCWkb/hyTZSNgopWIL/Zyt4zOdghsiZstys8/dGSgF0jc
	O3IlatPRWnXleU9vRdzTS8QxpP+qPqFIAEOVGb9hBhY76pqnoNg+Vm9oTZrIypcmoag/sDlSbTo
	7eaX2nXnL5EbV9m5P9L9wLxQcFJwUU/BLJklwS07YvDafaSlXPLdzVbNrsGsA8YNgAMTtr5UurR
	Q92ZsWu4utzW0+p6PFrxYlsRNEcwbup/rSr7jBrD4VnbTa9M0nyNDrbCqPLnKfDd4cMBvrFITCj
	DKtIrKqljqrPzmF8ZmezjB9DqUQ/zYcmL+dTsTTw++6M/nWLS53cdXhNa351S8lVJyhkB+yiGDP
	vC1H36PbtcRL0Jo/LpdCW7Z/uzDkug7QZSJrp+TJTup5pjU1Ypf1i+994M93pvmNw4whjAu6yPu
	vAxkGVi1NwtS2rxMRzhwBNp8uRw8UXsoWvqhdjLHWo0DyRVYWIVvvEi+PktUovClFN/7kOOww==
X-Received: by 2002:a05:600c:870b:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a35ac95981mr110653645e9.14.1793009106828;
        Mon, 26 Oct 2026 03:05:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm187916495e9.4.2026.10.26.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:05:05 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:05:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Message-ID: <at8lztOr7xpvHEdo@stanley.mountain>
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>

On Mon, Oct 26, 2026 at 02:54:23PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> The fbtft_init_dbg() macro is not being used, so delete it.
> 
> Reviewed-by: Dan Carpenter error27@gmail.com

This is formatted incorrectly.

> 

Don't add a blank line in the middle of the Tag block.
Tags are supposed to be in chronological order.  So Acks come
after the S-o-by tag.

> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---

No v2 text.

Please, wait a day between resends, even for small things.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

