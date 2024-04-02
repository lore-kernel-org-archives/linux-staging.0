Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270515A482
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076608; cv=none; b=pjbf3/Qmkh/s7J28EHSi4+PjdGhWVTEfbZPA/7l0RQDBGcCaDGfAI1OwHmag/Ws6VqDEBsuulz384vWSo4rrv1xoZpipTV6WZz+glQPYb7ngO6/oByCaeL7WPO9X6w1FzvBfPzSU28YLrFTvONt3SaH+zkFJCUeIMgiPkc3/IfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076608; c=relaxed/simple;
	bh=a5VC7rpVvraZunv6Dwst6lVP7+CUM4jij1XoG9GZ/Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBnVY2IQAU2N8H02e/Miq4mEATm79G287/rB0re0bwN5xejoBmblOmPzTaxmjaUKccBPB3p8/cd89y6bvu2yUrztXkCJ1HHke6Cz0cYsUr5Mo2Z/0Ov7e1M55mcFmvDWco534P+ZJkaU1yj0IyA0CAUzfsXJL+27t9jnp+e9RVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUQbax4p; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUQbax4p"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a4a387ff7acso655645666b.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712076605; x=1712681405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odERAu60Ug6RsmH7NPCr90WTw8RZSM0Nag43RhUfhM8=;
        b=ZUQbax4plaajqhOuHESZ3xyIzdXZUbffu5ZB5uG97oS+7a1Avmc+7eUFu78wPHm1It
         ZqD89ZQvecvfYPD/2ZPc7+EvSQCTBYD2cM2DX7E2jOvL7bfG7VlnlB/uh7L7m7rI+mPV
         QH5oIHZZHMGEWtbpUlnGcbZq954J2HYyLQUN5k/Yshqqo6PnyfXb1h8YMPKXkKOAQHCc
         1DvzeXjvgUH3DkzmMKQskXzni/LSPx3iI08Lyi9rOI9LwGV4C7wYuHCLAmHbcJxQIOMp
         KOMSPDEJVTxKgAE3wPAbNWjf0zp/s3UpD7QW7Gq0xm+XHTrG/8n9mm2KBviXsnUqKMn3
         kSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076605; x=1712681405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odERAu60Ug6RsmH7NPCr90WTw8RZSM0Nag43RhUfhM8=;
        b=aMCjBr19iDV9CGALGRqlKETLQ3TPKnn/lDNFglIDig02vw1IVvWMZTZAHvTLIdNVrW
         bER4h3Dl8eGLEPs5L2NZwmHhXS3ODZbk1OJmG3YAK8m9SHyhdS4nRAi1uVJ899VPxlIR
         liiBonD4DaozJfo4bqC4eCtmx+F+hcCgQRkiMxVCAQLIO92YB3cRvMwaTcMH4Dv89v3i
         Ev9pYQCsZd+GvPq00XMtAKKa7PtAm0o20RkTJecOvGzftWJxAHWB0ZZZzNa+MzXnlEN4
         j61XFtd9jHLLRORlubUDq5dM05yG0wshNt42npUNwO5rweND52ph7tRFPvPpPE5nTPKC
         dRLw==
X-Forwarded-Encrypted: i=1; AJvYcCVkd73qMgNJYNOJAuNV5Ocz3XHiFNvH37HyRPdWGNIhz+a90kp3bEAnJrir5JylBYq4ph7vComVpfrSVAPhimFCRtW8TARhPzz8j6WJBA==
X-Gm-Message-State: AOJu0YxI0hMVJiw2YNaF4xNNq7T3Z5MF7B/f9JVMMJjb9YIN/GfvD+gz
	V6Nkl8aL1pqm3N237H0/FVywneLPyvLUJTSjo5AqDW8htK8vhrIMJ5/+aJ79pR5tXP28xqOWHkG
	G
X-Google-Smtp-Source: AGHT+IH8OA9pcpehly5awaPgXOENbA8rXra2anS24UXloU1zSe9/5QM+mSIWTveOmI1kpt9iwyCeJg==
X-Received: by 2002:a17:906:39c2:b0:a4e:7f22:cfc2 with SMTP id i2-20020a17090639c200b00a4e7f22cfc2mr233199eje.28.1712076604896;
        Tue, 02 Apr 2024 09:50:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bn1-20020a170907268100b00a4e6750a358sm2897610ejc.187.2024.04.02.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:50:04 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:50:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] staging: pi433: Rename return value from "status"
 to "ret".
Message-ID: <1f1572b9-9b0f-45b4-94ec-7f79467a7205@moroto.mountain>
References: <20240402111414.871089-1-ikobh7@gmail.com>
 <20240402111414.871089-7-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402111414.871089-7-ikobh7@gmail.com>

On Tue, Apr 02, 2024 at 02:14:14PM +0300, Shahar Avidar wrote:
> Drivers init functions usually use either "ret" or "rc" naming their
> return variable.
> 

status is also fine.  Just leave this as-is probably.

regards,
dan carpenter

