Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E11649A8
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175737; cv=none; b=c7cHfINCL5fPGukNupVuLYn29E70NXBION5sg5cEOKR59LM5mKAm9gdUtWrI1RVjoOajyy/CkFOZYIWhrEHTJo2ZClR+Xb78GEtF4syTdNAN/vwUanc4aXrC2UEu7DEGnwG7G3V97hFY4a8oHpLehuz1Lk1+NC3nRUlzswNBPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175737; c=relaxed/simple;
	bh=cGHl4+EufxZ89LKo9z5dqDznyW+N/2shccJC6j5SQAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zw7WUlzn/PvotqwBPbUnNhuYylC0L8oYT1QlRcK3Z8QLdWqR27CozIwBOp9VWckJ+MI7nDzvAaEKaEiD3AuESoaWl8IcwWi1M7pSzSiotFD/uWLm9mVigCqyhNO5gGNU9LHB/a5o/Y9UZ2kIb2lGwh+KVFysp7DorrO337cxB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySWFUhBI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySWFUhBI"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so34027431fa.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 00:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718175734; x=1718780534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/p6w3+gNaauBQl/sapM4GKetZ/lqIHXGxcBTblLfUdM=;
        b=ySWFUhBIZ7ytJ5dr9lrA8Hhoc2RgEmiVwDfGxcSSqsSkjIvPDGt6cDqLZ7Vwp2tLoX
         v+4YpxCiDt6nvpeeHyJIuvfBPJbZ89jbWbcQlBHacG/X1l3+Gal8VsdD9D+Z8XRUf7ow
         +XoUx4Z/Diiy9ixEQInVu2e4bRUGgJPJ7XzpaeoBSH51qJDbMvwa7Grhz5cratzvLlqa
         vAUWDxXv9Pc70oOm5XibpZSSoURDBxYUUc7na1n4xoQmYQnpDCNGZZ9JzzktV2azpHt5
         gEpirPQnAQLHMJEd2Uyg1hrslcmScesxYjKr1orVf5meO2NPG3j79fZjKe2TvCwCpcEU
         dSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718175734; x=1718780534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p6w3+gNaauBQl/sapM4GKetZ/lqIHXGxcBTblLfUdM=;
        b=cl5jUBmtji6EPbtlhd1ElptX1W0lToyD4sXhWslJE2e+vfXVT1biWlsVWjbTBqQRWm
         pfLaOPJ9TRZYiZJEdIeNq+8qqBLrHO491jjZjC3rOBWyGRa9Fv2cr+MRY06R/cSiNOI5
         BQLx8WTYrX8yYvceWHrUsI2VakwWpxH6/TA+Q7fL/iu6TAfQEIBv9Eakg709OlrPzWoN
         iiZWOSOhC/f/N0wsvHW1UWKdmcDwaku+4rY4RkjZGTzBrCxUdEJz4vsGIHcNLyeDOpzx
         x8c1/pwT0KdKAWs/uIYG16WAWuMbRmLXOd7s7d20ELbVgmXO4WkjMPVFO7sk1Shj9klm
         05kA==
X-Forwarded-Encrypted: i=1; AJvYcCUFUCkFdFbkvv6lt05l4ojfboESG2lSuVhX+mShCEUBwSvRDI5BYDnlkVOENu121/FcpTpwCno3vITyRSYhZhKSWJbrMuwzspCsPSJh4g==
X-Gm-Message-State: AOJu0YwcV2qs09oOWRln88fdBjmOCNUGo91wGxGJyhVyXc+v5aSwMuTG
	z0a5Fki9HfCf5zmxKmMLhE7vcPjtXdsXN+lHSYrpoBKuIhA06ekAb+mHxCfhQFA=
X-Google-Smtp-Source: AGHT+IEgvtglgv6iIdEb9puho7aQdqLLatngZHdSOryv9giJK+UvgrPIE7Fc+aAbvQkmSndfNV7rPg==
X-Received: by 2002:a2e:9e85:0:b0:2eb:2883:2941 with SMTP id 38308e7fff4ca-2ebfc964771mr4719081fa.47.1718175734162;
        Wed, 12 Jun 2024 00:02:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eefa07sm13585325e9.8.2024.06.12.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:02:13 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:02:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/24] Staging: rtl8192e: Maintenance renames and
 cleanup
Message-ID: <7918dbd5-45e3-4b61-8bb7-eb8a27a8d152@moroto.mountain>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>

On Tue, Jun 11, 2024 at 08:22:06PM -0700, Tree Davies wrote:
> This patch series v2 attacks CamelCase variable renames, removes
> un-used variables and adjusts alignment issues found in
> rtllib_rx.c and rtllib_tx.c.
> 
> NOTE: Patch #9 doesn't completely resolve CamelCase violation as the 
> correct abreviation of megahertz is MHz as called out by Dan Carpenter. 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

