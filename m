Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447235B137
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769881317; cv=none; b=pSBjGmEYsA1Nztr2dnyn5oY6FTsvkkXhIQaTLGtgAE2PhC2GcsWIDnzsmdq2tQ0p3IbdswgZV3dHzaUnkiAc36m1hoV/02BWftiFCZ5SShv43EcRSQWNckDSmnIDFKeZFfW/ur+UFDOZzR5wlFSaFpDKwP0o5Us8XISMsA/MalE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769881317; c=relaxed/simple;
	bh=ODh0YEedDQQUbtZJN2ZKA3UJ2CNO5pR4RtNNOetaKas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX2/KWrussdzNlTj1f385iQvw8LY9jrWsykjSYDuT9WK1Ld1oYw/9ZE+irJwqmrmFpkWq+28+VlnpfnMo27ktdPHyjB+G3U/K2VA6tC/C9URgtiH/oIW0/xm253hTVnYWxgmpKViJzihjJe97KkFrHyUEqZOZNcT12Lleiry7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbzlo1Re; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbzlo1Re"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2505260f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769881312; x=1770486112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87lYDd81b43I1hI+PrPeRJ33ugJ/zNqt7MOoX7PXG6w=;
        b=hbzlo1ReRITzzQXXNhq84F+6zT9/DlDs1oEPMgc9JEtw5NWV6cxU88DEhXMluBs5aw
         zKTjagpa2qJy2iA6Q5616fbPaTTwE0SeSSHdmzT9Z7BgME6CGs4vFIWcuJ7tONujG6W2
         82zxCbDkEwa/zObskgY0iW1dfZCvA4BRLsVBXD6c/c6I3OOmgWVx3itWM0VzV8HbIpol
         NH/koaxD9NetbeeG2RMNWfZ7JByufu5f60DjOwJM7rIFgTnWVZqPw9fqLkPz9sv3TpQi
         KKgjGtSUIdbswhcOq+IgwE7tCb/lhqBqEGF8GVitxVUKgYNQ978lo80zPneEDX8/IFpv
         Bwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769881312; x=1770486112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87lYDd81b43I1hI+PrPeRJ33ugJ/zNqt7MOoX7PXG6w=;
        b=esnIOqGJyc7o3rj/6vZkeSJTlWtPviwFuysHxPo3O/00UCAegSiS93PtZQuNYZWnkf
         /BCCIgpTQXQVylr5Lh7JL3pqkESfHBV7U9ZUUMyiMvNY2DjaILcXWTgWvH06eFTFqPjw
         BDRIKOVItPMX+AKZmqOrgEC+EMGQEeOgar462rRV2ZNVIMYHRckMd5g3eR3MVgsVGzBE
         F6dgtmLXZfQGGfmdo+BtERHfMrGk/ooQyuDS8PLnVAYPmAylAimZ6GegTI5vG/RFHXYc
         6vZsktC7J2NxIDJklzD+c85VUSuBTgIxsGA5qWxsA4XfdK0GXc/WhHgEqww97/0YHUAq
         WGxw==
X-Forwarded-Encrypted: i=1; AJvYcCVEjxhCl5i8iD46Y5YOySjvOr8LyFjbQ+nBG+/XLxWvBNyB2QPa3uE/a3AnFMRZ6M0d6v+NR4C1xXdq6XiJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzVi4DCar1pfxfqgNkSyhLUgmoh8GQvWXgoWuwjLw7S74B0Xj4u
	izVLKJ8OZeY3BiKgkyVCJRe71MSlJRmnmVyd9c6IxY97XQIjvQZ/jzoZfZEnwO3ZPmo=
X-Gm-Gg: AZuq6aKrN6Q1nEmY3GEwSio0h2UgRG67hwz4D0qk3nYTlq+n1BzBVMCb4sHuhpFBTF/
	xftG9XQewdf0/pgIvdR07T2n89ePByFEegVRTAfSJP49Z5d6Igcj0S+Ss12Kfp+02FUfpwHLfR6
	CZrvMD81iF1zGId5URjDIeigHY7YKg6QNewHLdV1H6JS9SRIkI2rIjA1TNw6lZk39p9Fdy3PXjc
	5M9fHqD6Z+n2z1U/6SuPGZXIbAyHxFKt01KhyTzpdW1nWyQ9ymMDDSZNu9ZkTDvamAVh5CcuAi/
	QWUkU9eSTmUuM9CauaWdaF30Oj8xrNXY9Lc7OwdlIX1MudHpecS/hBF3ZVC77QiiJt3NsTHQ8vn
	etq4lQrKj2kjHkOZDfWanDz6osk4n/09zAh//HRU61IhBAonV/jGAxdlfowEut+pHaWBMl5DxwL
	zzOwNGcZNimOROMMYl
X-Received: by 2002:a5d:5f83:0:b0:42f:b0ab:7b48 with SMTP id ffacd0b85a97d-435f3a7c047mr9092414f8f.1.1769881311595;
        Sat, 31 Jan 2026 09:41:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353f8bsm29884522f8f.39.2026.01.31.09.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:41:51 -0800 (PST)
Date: Sat, 31 Jan 2026 20:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: axis-fifo: refactor device tree parsing
Message-ID: <aX4-3KP0BqHqaiO4@stanley.mountain>
References: <20260131155630.41587-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131155630.41587-1-gustavopiazdasilva2102@gmail.com>

The commit message is still not line-wraped.

This patch didn't apply.  The first one did, but this doesn't.

On Sat, Jan 31, 2026 at 12:56:30PM -0300, Gustavo Piaz da Silva wrote:
> Refactor the device tree parsing logic in axis_fifo_probe() to reduce code duplication and improve readability.
> 
> Create a helper function axis_fifo_get_u32() to handle property reading and error checking, replacing repetitive of_property_read_u32() calls.
> 
> Also change has_rx_fifo and has_tx_fifo types from int to u32 in struct axis_fifo to avoid pointer type mismatch warnings, as of_property_read_u32 expects u32 pointers.
> 

I don't understand where this warning is comming from.  The existing
code is calling of_property_read_u32() which also takes a u32 so I
don't see what changed.  I wasn't able to generate a warning on my
end.

Anyway, the u32 change needs to be done as a separate patch.

regards,
dan carpenter

