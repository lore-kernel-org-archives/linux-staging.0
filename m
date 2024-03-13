Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAD29AB
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330917; cv=none; b=IIDa+7+iCU9/IOmRuAipTzfYxpmQJf8a4cfEeRF6rb4IDY9Gme8kOBCoGoCML8YCteYTZW54yyR5U/8QGFyfNColAmkFgLbBKlQgZ3b6uC16beEb1B6kP4KSVGdfomRTqFXcOhibnDzrVMkRvgsBMJOvMrJHJkufPY6/D/hH/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330917; c=relaxed/simple;
	bh=xYQb+BQulrZxxo772iQeUy5dIlvaSIgJg4G59zCwYxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6QipWB36I4nt0Qw2FtXDFr4ABFUTamQvmMhOktzptVL4spmHfzBjhQxE8K3CE1fFAA19nEP5Xn7+bTbEiJoMAJgC+iCCGbe4QPqPNbm0mgric6qVELZfaUoxiiqE1eemfiTodIRKakbkYG06Gm4KjON0wfnaWSA6X0Q9XLsA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKJoNMyH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKJoNMyH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so970604466b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710330914; x=1710935714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XY8Gauun/KCCuJd3rvfN1BqCAqZcqM1FwxPVTr0A7jA=;
        b=mKJoNMyH/dopLQ1fo8H77tjmKQpJMvJ6JtmlMyyqGscxKhGz2tYkSN0euiOli2VSFy
         Quih0xUidx809scX4lSdDzz9601nwsJiekezAheDVywVZ2MxvRUL/y/I1mWygDAJWYp+
         0BOD5oAFVz4cv9JoFT1axWSvD4gsC6pwkntjp0Q1H47/xMU88g/ErAbxw0vGcb1BQuAY
         lvlRN4qDGRg7xtmckgORoI9vQ8teVqg5EoCaH+Oj3zjNdb6BpcCoT9QvAHiUw4/vbfWc
         pii8bngouINYrE+RPmbUjAlvAhxgWW6fda3rrYEmDnlgPnGhfoOsX7zjmzwoIYj9cqyG
         wj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710330914; x=1710935714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XY8Gauun/KCCuJd3rvfN1BqCAqZcqM1FwxPVTr0A7jA=;
        b=b34Od83XA8g+n+4eRpIdwLsxpvln469CQL/Uhc5WrU90Pp68aJXFqrGt22wwskzV8A
         308yzVlyLV07r4V4bqXIl5gUhjLQN6NYxyKnBhOByuiahKoBJf9ia8mzhjY67of4NEYR
         1awq2oj9oLedTjFiHWi7pr52rszbkNkFDjdgvRtJ8kUhz69FuaCPR4sipJy6R1+5uddq
         GB6ehTXVMVSb7/tuByyRWCYhd8bC8dy2UjxHDVkRcsCwMyfHTc9gy6NwsAKtPsWWEfAx
         D687Xzw6v4UQSs6DrNPfOzHH4INtx0KE/nngNtMIpt1B02WCJ09Frrn4Qb1kpCklP7tp
         L/8A==
X-Forwarded-Encrypted: i=1; AJvYcCUPBaw7/niUsajVuhkuBNwz1FxtfJSAxwrIou0O2b4F+0zroeHL2+6jJqT4i7aLzYL15g4z1Yo87+3xscIx0kGW3upIEQq4GX6kZuPvsQ==
X-Gm-Message-State: AOJu0YxYCfEF40+ity18nciYfZ0ECrOjcaT6THVBzAE/O53sg+L/Q5cd
	wBVHV63MrysbqOtiCHuHloZ+wUEAXnGVCV2m+74/iMtI/k67pJU6TAsYGUym/fY=
X-Google-Smtp-Source: AGHT+IHzBdFBrOL1CjRXO7Wb5LRYPoTHhkJHvpPJm4Lz3kGYGnrSb0QF0pr6U7kKl6sQkdlibLujiw==
X-Received: by 2002:a17:906:c784:b0:a46:61ef:2846 with SMTP id cw4-20020a170906c78400b00a4661ef2846mr622937ejb.66.1710330914218;
        Wed, 13 Mar 2024 04:55:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id be10-20020a1709070a4a00b00a461d2a3374sm3442380ejc.47.2024.03.13.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 04:55:13 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:55:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prasad Pandit <ppandit@redhat.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
	rjui@broadcom.com, sbranden@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH v3] staging: bcm2835-audio: add terminating new line to
 Kconfig
Message-ID: <15b3644f-f83e-4c7a-8b58-9d4b87f5af1e@moroto.mountain>
References: <20240313114126.1418453-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313114126.1418453-1-ppandit@redhat.com>

On Wed, Mar 13, 2024 at 05:11:26PM +0530, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Add terminating new line to the Kconfig file. It helps
> Kconfig parsers to read file without error.
> 
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> v3: fix typo and note about parsing errors.
>   -> https://lore.kernel.org/lkml/CAE8KmOzcD+__7xdC7tegbHO9HEP48s7=reA4j-tvqVDwzHr+8Q@mail.gmail.com/T/#t

Normally this would go about the diffstat but no stress...

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

