Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8F1714C6
	for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323192; cv=none; b=L6SFS9d7GEFbV6YFIQptUyEYML+R9Pvalho0kvYcoNF9HQKJVyGdP7NWgMt5Mc0K5NWk/WFD9xSapidxxqbMEbHngCkVdMicAROomL+6fabcMc63M6foCj23EVEz1mUUkiVWiP1JfOjOuUaQe+YFJeqFG+6BQbyw1w5+wdsm87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323192; c=relaxed/simple;
	bh=YVpDrrbLjosqOiJemaXI/XwUkJSAR47PXfNO0X1qwTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reOOUhxahNaLHyvSONchKEqoRWmQASthm7wYbYQb7kfqUsz3tUU1EY1KF9prKS9Qru227uSibBcyVd3BH5ZXHEaKyKDRoYvj4TAfADrQ7y5M3Fsr2bjAqwFtTTzZ0kIfTGkDPCqEWeP6eANMT5pwAyAfXItOgYCTUv239Ctn96Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgfhvKUN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgfhvKUN"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso719266966b.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323189; x=1731927989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9aWz+WhOAzJyTSPfnKTdRAQKoz7COA6hR2UFDq3mTBU=;
        b=DgfhvKUNJTNtGb3Ttf0AhIGvXX6+B3qvX/UHk0TjiQKp5VMlfzboLVLhIx88rC9Z49
         UJRMxikJIWCMuOH8pWOadA8FwLVPY0AIKrVrK1FsFW+wItRDGSYQfDo4mr+njE1kIet7
         Bk/dSq3S6c1j8HczrBRevjGIauNoqpMEVNjM/cgvSL1eLlhgF5r+DDaoVL8RUUlX20vk
         D+RcKQPH3LemrhnKo524gH5ZRU2EcjzjX7xP+1pq2cGprPgL1FwtaDoWW/ysx140001A
         rgIdSAbmyfyZ0wDQXi1cJbCJ/BViMVBi7zRjKOcJuYtEmGRQy54zUvbzidS2leRwjvIu
         LS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323189; x=1731927989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aWz+WhOAzJyTSPfnKTdRAQKoz7COA6hR2UFDq3mTBU=;
        b=AW/tDUEAKw4/GZvsbCGQq8qHMscXxSEDzYcQldH5ZeONVs265T9qUiz0k3VmeE2nQb
         sqNhs4BodYBXjIjPcOhaU8Gfm5XTRsL2glWps4CzwzFDSdL4MUcraAIMSj1nrTs9yBOl
         3mdRDh1eZGIjMbc1k6cXZUn2iANlF17PoVpGSnaVYLsm78D+txMR69bczn1S2Gx/0UkA
         Zi5onmEy2sJf/vvLe60cfMpG+0Hr09PivsXiOJd102LhQBNFHOuiqTjJxM/FqkUliUtU
         /Csnd3r9cJNpRzL2B24oli+BdrapJz5Qq6+c21qreZAStLFjxkCnTA+OKGI47OgQWeVB
         M+9w==
X-Forwarded-Encrypted: i=1; AJvYcCXI4A/lMtZLy/4kgzyGFoTHdor73PLzAbn9z/hvY+o1kLCH0HgZBmM8OinY9Y3t+nR16PWi7c/7P57ajbfF@lists.linux.dev
X-Gm-Message-State: AOJu0YwIy9PDbV8nGsrAkyrY/wsZ+Bi9+G8xS131uFHe/BW3Sx7WVSAH
	FiOXnOvEIx5+sYj0MthiED2EmiVr4LYpETN1QDJiZy92T47ud6Rh6hxrJ8QjLV4=
X-Google-Smtp-Source: AGHT+IHY78Ho8H+aECHyRGCY03B6SgH5qbBDzYmv3JCG9yAkwwkC6BABbchNzhKrrSKfpCvqEtYlvg==
X-Received: by 2002:a17:907:2d8d:b0:a99:e4a2:1cda with SMTP id a640c23a62f3a-a9ef0009b63mr1083909966b.56.1731323188773;
        Mon, 11 Nov 2024 03:06:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def47esm575777066b.160.2024.11.11.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:06:28 -0800 (PST)
Date: Mon, 11 Nov 2024 14:06:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: gpib: Change return type of
 fluke_get_dma_residue
Message-ID: <93396e67-28e6-495f-b428-7967accf282d@stanley.mountain>
References: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>
 <2024110714-scanner-apple-0792@gregkh>
 <6a97acbc-b4b3-472e-a999-fb4acae0e633@ijzerbout.nl>
 <d04125eb-8a1d-42c4-9276-eb3a5da908b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d04125eb-8a1d-42c4-9276-eb3a5da908b6@stanley.mountain>

On Mon, Nov 11, 2024 at 01:59:35PM +0300, Dan Carpenter wrote:
> The rule is that we should pointless casts.

This sentence no verb.  The verb was supposed to be "avoid".

regards,
dan carpenter
