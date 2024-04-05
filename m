Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B816F27A
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330519; cv=none; b=lFNzH21AtfMTHRerBIvijgLcBda9wPjkrltVDjAQInl+H4sUAybNKpu0w35h1m6/UkUlvXL7To5wOSwKv2EgQMl/lBtzvZQTut3++O4DcmExEPgUsXz83wN1ndSAMux8/sJwM+pXOaT0Hyep+x5iRks87o8G2/LDRv0ncA9aHhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330519; c=relaxed/simple;
	bh=M+C6kB8COCugWtBVJQ9w3j4a/ALFlSRuRh2dv+HgEXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJAZmmBM4e68JcrbJiWGqbAUVfHWiHt1lRM6K9fhwcc3ToRJ3kiCzfLrRzqRF2MGlyawCU20Dy/c9p0b7SwZZ3MZDQw5aqAFS6dglOArqFf1mHcEQwg85iUjL0NYhAbrq8/yaw+5/MIXDOVqKUObvM/wzTa0rZ6trCxPJdOAn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4hzOLlF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4hzOLlF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c404da0ebso3496033a12.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330516; x=1712935316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wk3aJOuT9jJjnBQJ7S21VBi6MvBUeayUBXb/L6EPJ1g=;
        b=P4hzOLlFtNXYhqjisKlO1lZO9wwCHHIrVOYrrOYpzxyFbrNHCzJMe7WhCOmpCEI/8I
         e8VmRpRff3LjWScGp3ZIUhWLsoCcbvQC1emNG607V0edyJBN29TY1JTP7IZdwsYi2/2y
         GYQ0osLqdo5bSb/5qZC7R4QDmVSBPCxLps3gbUyqXlyfIjCKFyz01c0zo40Jx6UalawJ
         14oMofFQRDLUOcUZ84LdWsb8lVLJElCGFUcWtStUXSPU84GG+0psebl/vqFGkpZSFdgh
         G23+Q7y3bu2B3GThiy7dBfwAsvWUr+ZJpnsSz6FqQir5TuUcxdtuRWcFC/mUWUt77RYA
         78Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330516; x=1712935316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk3aJOuT9jJjnBQJ7S21VBi6MvBUeayUBXb/L6EPJ1g=;
        b=USdaMmzUD4KxEevMJOY1Sn4JZZAwVJ+mlpfUGRvTl/r+PDkPW5/WdHSW8jk3OBiQmr
         GH94XkLis2uJce079ADWZxWZrlPLEsThqXOw4gp7f0B+PbxLaXleBxgJcFFunHreRIl9
         7m/oPqNWA/X0lOfOuSSJ45nkNQSLxctd2120wa1JL2hfJrNw0PPhiHk24IpYwRiEQetL
         CrU6NGaGvRv19ZZ5NLOSvB2mnwPQp0r0E//ktA37+Ke7xpszflrrs7z0o7eiMF1vr/p8
         MY1gXC92poh91+oIm/J6t85CHedw6UaLRG+/iVsWBhH5BQifMCFR8rUdhg2A4+OcNtpG
         8hKQ==
X-Gm-Message-State: AOJu0Yy/Oy7QANWWJWOhFgDXX/M6reuLsgxqO3fY8fG5d0oQNB3UmxY3
	1kKd+udZc3Jnq77F21JWBK+etjqjOpRDq9KOuf/Ny/xU5q0kAYpaHsku1DABqls=
X-Google-Smtp-Source: AGHT+IFeW8SGAccDZXSiMG8bevZ2189mZMzmoSGN1nz4sPYc1a2++KWM7JhjHkLHCa1sSWe+qrbKmQ==
X-Received: by 2002:a17:907:7ea2:b0:a47:16d1:113f with SMTP id qb34-20020a1709077ea200b00a4716d1113fmr1785649ejc.47.1712330515736;
        Fri, 05 Apr 2024 08:21:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906411700b00a51a676c596sm804886ejk.121.2024.04.05.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:21:55 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:21:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 3/4] staging: nvec: make i2c controller register writes
 robust
Message-ID: <f213c5a3-6a6a-461b-a4e6-a8e768e8ea4d@moroto.mountain>
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-4-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405140906.77831-4-marvin24@gmx.de>

On Fri, Apr 05, 2024 at 04:09:05PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 39 +++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 282a664c9176..9914c30b6933 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -565,6 +565,20 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>  		(uint)nvec->tx->size, nvec->tx->data[1]);
>  }
> 
> +/**
> + * i2c_writel - savely write to an i2c client controller register
> + @ val: value to be written
> + @ reg: register to write to
> + */
> +
> +static void i2c_writel(u32 val, void *reg)

I'm not a expert at kernel doc or whatever, but this comment isn't in
the right format.  And delete the blank line between the comment and the
function.

/**
 * i2c_writel - savely write to an i2c client controller register
 * @ val: value to be written
 * @ reg: register to write to
 */
static void i2c_writel(u32 val, void *reg)

regards,
dan carpenter


