Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC072BDC3D
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002414; cv=none; b=pIogxKmGhHnyJCTKmiglusIBZ9gi/kmIyMvX27So+UrfU6qi75TwrmR4/B3J6CYxBoO1mwInWI0247379bLKRqaFH6gUSGboa4pgIUyRG4Moq00dxU25rmGOMsjKQueFOadYtjHLVus8Q4IX0fPgd4PhD3IMQie+Sk+pi030/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002414; c=relaxed/simple;
	bh=Axijv1qPN7+I4/UPpXeuHRGqOcgrI+tslmw+JYfvhDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtNuRYp6DDUn68Y8pkktFbxjBXk5s+1Tu89MLe28wnFNgvrqbHpOe41EaFd5UDjiCYWqEN84xO/iD46TsbJLWwzt2+hYuO/AaK+IS7XMqHoxX97+13W4dOEi17cuSNiJQpHyYu8AUH1WY86BOO5OoP7Oo5kFfZVy1DWZELdC4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zk5lw8Yz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zk5lw8Yz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4398913af88so1047336f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002412; x=1772607212; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Cf4XuodvKlHx5tBOcl7alArfwF4yx2d9W6p5NT3Rs=;
        b=zk5lw8Yz18zsFjCFoj8Fa6FxuHuD0uF4qgZd4AiTznEUx1QjnUhLH3KSWg7KcXNFzM
         cMbliuZQT0omBoWEe4TRjZ6J7A4Ck4W9PwiHFLRdRDKdVQxOcLp8GgOLMQAqYeYW6NuQ
         7h/HBrhHxPBXS8Q5iKzjeWlrYoGSNw9CQfG38WW6To3F6En8M4wKfTl0FLRFI38rZMIc
         0uX7cnNfFm1sQD6oDFliyfC1E2pE4RD4ia42Zck+/+xjNt06/okR1CfjPaQh3Gsp6drm
         lRUDUgkkUg4nYZs8I4zQvA1UhS1EPfPkfKEsilaaAXzADl41gCO0AE3j41smAkTYYUtX
         r/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002412; x=1772607212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3Cf4XuodvKlHx5tBOcl7alArfwF4yx2d9W6p5NT3Rs=;
        b=M5La2Euk1OFwMdvFzFRYa+gntFhLMF0OojrZSjmpfZ39+cpVjPXUqnLQStTymx/Zjs
         VdfMgh81KAjaRAjGc4d3fyt3mfaQuzQjK1l3h621hJfAjoHKCqosZvoWhMuVApu4LRj9
         ISpvpKWsdYdMTk7SD2ZJ03iBVlioUpOy0xOaUoWhhHA+H+DUdTxskFFZCvu+lBeg27h5
         /SOcxgYgp94i2YkDN5blxOdcaO253N9ES4aeC1Npd6jF0P1F8Zgw8nm9jBl6iwb0uH+A
         g2mo+d7kP7+IcM2EpEEOnpSI7Zwmj7G5ZOr8FR4gnjXj0zrsa5qUtq1Lel9/mI7BpOR2
         Lujw==
X-Forwarded-Encrypted: i=1; AJvYcCWVnByROzmG5fko0XTNns4lyTys4tb1GWeLO5moi0TJk0WD+HibaEVMhc+bRNA43oCeD8jRXt37nke4L9y2@lists.linux.dev
X-Gm-Message-State: AOJu0YwnTGkFrMeB7DXr4v/If4Vv7cGCE4v4FZ59zmHiPxp8CzFZ2dQ4
	wOmq8nRuKHr0uxDKa59cwM2zmlpFcTrzpNop/nsf3sFvCap1y78ZExH9iq2MD40RhXY=
X-Gm-Gg: ATEYQzwNApUMaJASKsMg6+ZaR+Jzna7DCD+TeyPpX5V5XCQy1nxWc1HZpWV/EwGiWcE
	rCFLgZzlDfUfofeQqzeZ0qIsKY/ddy/MuNxv8yAif6DYb42gbH0LbBmk3Eixax1bgSoKoorxJln
	SC51DE0Ek7hcCjOsKlrMu/4ttPTl6nuEGDiLnKGroDPy/oU0fLNY8SjbPx7obw0vEJEEphEC9hg
	bnX4D1AFzDCvQ/lEiA6E29ChR+5umJKNWbLVxlpJzooGM1Ms9Xn1eYPhfsYmPK145rSbyjjIf/8
	OK/H4mH0+YFaNnm9V1d9z0zh4zzzp7zZS2ebZI57aYiXyH/y2npysHtYD6klfPCboBQOUERuY1p
	G4QMzX9k3jyGBKLrPp+uL8X5izg089gUyashyOeiFjjF6lnuQM6K1JpBnSpIvjkNggCe2aWGYLI
	fY0pOad6atumXHB0C435mOwd5mhRId
X-Received: by 2002:a05:6000:2689:b0:430:fd60:940f with SMTP id ffacd0b85a97d-4398fa8a061mr1920928f8f.14.1772002411835;
        Tue, 24 Feb 2026 22:53:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c977sm34016791f8f.32.2026.02.24.22.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:53:31 -0800 (PST)
Date: Wed, 25 Feb 2026 09:53:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/21] staging: rtl8723bs: core: fix line lengths in
 rtw_recv.c
Message-ID: <aZ6caIL7h0P-Op14@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-9-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-9-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:35PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Break long lines exceeding 100 characters to comply with kernel coding
> style.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 120 ++++++++++++++--------
>  1 file changed, 80 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 337671b1211f..b71f3495d773 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -47,14 +47,23 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
>  
>  	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
>  
> -	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ);
> +	{
> +		size_t sz = NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ;
> +
> +		precvpriv->pallocated_frame_buf = vzalloc(sz);
> +	}

No.

regards,
dan carpenter

