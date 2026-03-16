Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFE418787A
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648986; cv=none; b=IriwaYV2ajbAoiNqLNksAZhhKZbdHlztAiyzjI1c7hapnQxvaGQsgVvR4L98tl27U3q7owz4gFhdGahDV+ZL/mQzkzc+Z4BkARuuVj2pr0PBggZPHTO4KrfT2DL+fidsU5johieplvyuOPLzzRTvjQvYh7RzLwskqP6f20lAiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648986; c=relaxed/simple;
	bh=6yxPsBtSI7gjxYRhPngZL5ULLkIwibtmuf2ualfamXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NASxP9GkoTroAxk0OO5HVEPZ+41+65xqFWK3sRQUndSjwP65+pWH11P6JfKN0eQpOcPi5Us4nzwBNv2lzALlozlMrOvjqu9cPIWHYglqhoW1tk73Kciwp4rR2jRuyR1FQ5fpQ+lL/EwVZTNOEZM1gzZ2yIgJhP6kjUvVZdUaNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYVgmPbb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYVgmPbb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534237460so47256485e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773648984; x=1774253784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTDMme1UesrkQRhxTDLYXu8os6DlnnNeF6zTJ/uFHQg=;
        b=eYVgmPbbspZ4Aa7uY63dozyKyE+nS5/61SxPVxyhImBVxopeoeE3M+QJpn+ZBU+jBv
         egFD6yBeyPJcdZb4N/+lyXNVdXVrI9FYIWwcMMfh1/56gU3bGAh/lgTBrFLU0atGE2/M
         ODyy02DZFIVNa6oNlJRugkenMGLz9Qav4h2FVz8pVooZnarlJzePbDMgyRFOAHgigjSo
         /u92xVtLizD6zqdx5l0I1P1A5rDomvwsXzsGWORdFz6J+JQLDa3wApW3SS0iomnnMMJh
         wfiPZrMZj441MKC1vGGn0RbvcPwRKf6GYQ324dy7g5JFyKJuQ/B5NaRIDQkcd8ebbGPA
         HSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648984; x=1774253784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTDMme1UesrkQRhxTDLYXu8os6DlnnNeF6zTJ/uFHQg=;
        b=KYiampmXhWBYvXNOg2barIx1+LnGPCs2U99lIrsiTOdUj2+Lkxqz46wPadXB+MDT8/
         dT2PTlDxUEPPhUimoHvgyXWSnENo63CGVxGsrulM7DrMS05X5zXcj7MWFVSJ11gggV6L
         aRtdaluIZKsT63T4vqUZ3f5k5rI0cVY/xDUgIzGyFjoCwy9svtGGqILFh82Hf9FwssKu
         pWXl99wBe5gRkqjl1LOXd+wFq2TR4BvGRx2Mxupxc1tLaNcB5IWke2O1mdyN6dliKwdx
         wbZ+J+ELfKPn46X6M46lEEE6DBTkzunWo8i+bhrGBYkI63UYS3llN+KKjcD5ziGjQZWx
         FGmg==
X-Forwarded-Encrypted: i=1; AJvYcCX/siMV32DSFn/zpAjVBEZ/rSF6z4CFgrV2hwZ6PBGM+qfhitTGzDDv+SOVbwT+emq9qcfPhguO3cuCIcSP@lists.linux.dev
X-Gm-Message-State: AOJu0YxFIsR9YGEFFBQD35KSb8Dl/mp1zAXcDrxWpYvZRCu+ZUJcgD9b
	GSoytDbadrcTHm6pXF/orO9PTl2Qe9etCIWwrLSlJZYDL3ue56Q93kpyzNpqROCtHOY=
X-Gm-Gg: ATEYQzxkTvQ/KHyhq/7Zq3p2k9gaIusnmmLKQqwhhPkZUbLpvXct7eKFyyq85ulyKCk
	g8AI8G+Fo5NgTlm/G74ZoZNSuug3uesksOtYkEGE23zUpN29N6a0isz6J1/FcyD8+Sr/NtOxaOe
	tRRzlkJ3I5Y5N7JZZis6E2J4aAnJryMC1xX3Y2/27Fjgf9LUn9Mubi6H11Pl1WLL6gx+GXzJQM6
	8IbRbBAwgbErSNM+mWazDcbTocD5C/l86e5EwC7/Epcb33ioJLn9UGkrJfC/GBQxEzw6ct03EVT
	A0g8DT1dtF57IfYxqkNedkNBVur6pRyXcn7/9XMUUqCca/xVZ3RDw5pZTlEtc1LU4YvF0EsaT6P
	EcQjvGVEK4tys7PkDXD/GM8wmISW2shFhtUgtsN04gWofNqsIjjX0VfWnFA8CUT7noq/Zca9U2f
	ZDnGYEHlQeFDVaJZTiUJlIf1qKurxf
X-Received: by 2002:a05:600c:37cc:b0:485:5812:27bc with SMTP id 5b1f17b1804b1-48558122839mr177343465e9.5.1773648983623;
        Mon, 16 Mar 2026 01:16:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c7c514sm88166225e9.32.2026.03.16.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:16:23 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:16:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: av7110: update FIXME comment for
 signal strength
Message-ID: <abe8VIVob8HDcZ59@stanley.mountain>
References: <20260313-staging-cleanup-v2-1-31074aba2688.ref@yahoo.pl>
 <20260313-staging-cleanup-v2-1-31074aba2688@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-staging-cleanup-v2-1-31074aba2688@yahoo.pl>

On Fri, Mar 13, 2026 at 08:39:07AM +0100, Tomasz Unger wrote:
> Update the FIXME comment to provide more detail about the future
> implementation for computing the signal strength based on the tuner RSSI.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v2:
> - Fix subject prefix to use 'media: staging: av7110:' format
> - Link to v1: https://lore.kernel.org/r/20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl

This seems like a pointless change.

Somehow I guess someone told people to grep for FIXMEs and try fix them
but this patch doesn't fix anything.  It just re-words the FIXME and
changes it to a TODO.

regards,
dan carpener

