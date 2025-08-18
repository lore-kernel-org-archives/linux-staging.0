Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F225D549
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498580; cv=none; b=UPKC4S9Hb8gE6Dys64Gpp9mcKBloPhN8CS7jBb9S+fEhDJ7p7YU/qSsxTEBLfqz9AVdnm0RW7AXUmWkhW+Thjv9uUCaXrhH1tak0HPojd6q3z5GPPdjBlnKmzShTgN14Qqq2Q1a95Fc/WA71UBd1Tx6WNkFIpo0ltJ6Do4b0GJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498580; c=relaxed/simple;
	bh=5g0wbn6Ph17xvgAq5KvhX1KEiqUBS3GvRDxnv2BGP5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9yGcU6uDgFhJg1JhqGFxY7Z8sOo2hyh+illwXdq9kv6+aJNwk+TYFwulUSofAvrRTT/YMVRbR9JZywn64+DcgD6yHdS6cZVW9Fp7k54ontmxoihFxD0/NOkPPPEbV9wOn14no43xf5II/7mk0jeXuUSWMMmytUV4D8NqslvERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oI5gvo/h; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oI5gvo/h"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e411c820so2006299f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755498577; x=1756103377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3tkiOT20kGsUTSkgr+xHio85hrWrVQxIwikWx+eXEg=;
        b=oI5gvo/huzi5smVgypjmiYEgVoMDE8q1NNCdJ6XEOeZP5FHO0Sr5V0AYkfXxLCdvuX
         PVn66cTOSqWJNUJyw6BNvO3HatBD/38uA80sDnyN6SSyq+XBgQOte59fiVntf5q3pXfO
         sha4K50e5gf1H1LsWWR9iqp0w+ZmeAPk2NM/FeMccco+umLfBKZ9KpGL/pFBEfOwA8M0
         BDZWrGdEqsLmfhlV3EHwqkUsU15EG8Vx6mLWU1yZJOVeE5HjWoNzSqrRBXG/7XJsHs59
         Nd13NpvupGzbcwoFtG/8Qn2rAF8AmDrfECanQMHcwtISNwzDDL9ZtM34c/qUE0GPQSIE
         64rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498577; x=1756103377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3tkiOT20kGsUTSkgr+xHio85hrWrVQxIwikWx+eXEg=;
        b=QWRiboNnVBC1iU6Ix9XpeWkSY8pnk9K58jKs6qUIYiT0LR/obH+S3qovrogf0Ktg7W
         DPwn8hjQfF8R2MTRJKTAHMs9ogn+FIS7aMvnYAsyXb0diAlzo4k1nMhYxAK68PN4Iw6V
         i8yKeJIDq4yRJj8hZGKZRR4J7b264E9f9XGQdh8EkipTohB/jZ2PieFZoI6fKXIDk0uF
         zNylonuZxBL2DHTsLV/iMNpTxyESRphURcehsdGKmCN9m5aECRm65whlYUKfKJkyPsvQ
         +E2OwpPkOIlqFcQ4f+rivwI3rgzvjMgJVCy5Ok/lS70SIUbuQ7xrBzulMD9tyb5FFCx9
         XXlw==
X-Forwarded-Encrypted: i=1; AJvYcCUtqOxk59Pxi4ZxqtrNSHbIx8kn87ON/4aoBx7AVI06zPc9gCvgQGX/pHXMEISH8UExMDAhBnSQtsCrBiVV@lists.linux.dev
X-Gm-Message-State: AOJu0YxM9SUkPpDRNjckGjPLAY8qUE4ZdptoG77Fut50kfRgQjhzsxQr
	3DsjDa4qqF3A/uGJzHFql3C0Ixdnk+TvAUKGtOBJgauMBGUJilK6867GrOjDduYUJ2Q=
X-Gm-Gg: ASbGncuocz6jHHHHKAqGByhXY0cflJaCj3Qe8HrKBTbE9eA01sG+iJqu/PJ//cgbv1g
	UItqJ6i28EdOOnUDt2SQLOeaeTbv79GPRNlwHi5RrXwvxQaqO5e1K46e0K/LIZBx5cySWZ0LZpJ
	IR++BoAWbSxxQoGEeVX9ITfFyHzYawSfPH7aZ0IVhaJTSEIB+ewhMfEDF3pOguQI2r3D3AT8IRh
	L8RkJsVw6Hgef9XfjU3UFEK9TEG6VchIHVrQaD8XrgO1RYQpGdWqrTnse+nzMpeXXHXxEy9Oc0I
	PUcgL2pFbK2IARIOC+F5jONwOpYlZkJsRObVEn0EvObz/ykQoq0O+15jjt0Cjr1GxOq7J3Tif8h
	iZ/rASH1a155/Z5qDRdpOWcuTVRIMStGSGPQFNA==
X-Google-Smtp-Source: AGHT+IHndy6oVv4OJ+/MsKM5qa8MXzOeKQJV79th477YwHEuET0jW0JUWVhK0OGjN+EbNCIL5zw9Vg==
X-Received: by 2002:a5d:5f8f:0:b0:3b9:6e:5242 with SMTP id ffacd0b85a97d-3bb66567d13mr7922421f8f.4.1755498576770;
        Sun, 17 Aug 2025 23:29:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a223292d2sm123065385e9.21.2025.08.17.23.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:29:36 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:29:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
Message-ID: <aKLITYYTOkMpNkQy@stanley.mountain>
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>

On Sun, Aug 17, 2025 at 08:24:25PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro was defined with three arguments (str, buf, len)
> that were not used in its empty body, causing a compiler warning.
> 
> This patch silences the warning by explicitly casting the unused
> arguments to (void), making the intent clear without changing
> functionality.
> 
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>

What's the warning.  Does it break the build since we're using -Werror?

I feel like in the end, I'm going to say just ignore the compiler warning
since this is not a bug in the code but obviously if it breaks the build
then that's a different story.

regards,
dan carpenter

