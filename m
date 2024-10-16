Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E20C008
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089142; cv=none; b=Hjy8tYJh9M66esweoZ/X1KJyWI0AK8tWdO52+kO8rrfKHc/b0XvNGMZt3QGUmRxzYsAmPDR6mv341hCCmf58kIxlFKpoBtcxP+f7zT09m9QKu42P6Q6etDAnUqkxDyC3n2y6tz1+W8qXn9xFIjUroVJuyt32zvbDd2N9oUEv6Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089142; c=relaxed/simple;
	bh=Pe6pya5tmH/aqEVYdV2YLrlAtz8z5ZTN7xtUBZQeigo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv8zkkLxcWii719JcH7QHgzkVJEU/yEdLQGZUOIU52U7eo/a6s3dkzQpcW46DpISPe92ovGevas08OtL9vvCPIOAm7T1VksYQkOCOT4P9rQYwjiZY5m8gWsxuY5vtkpTnuAPByBqiF3UznyT6o9F3wVPhikKtu9lZGIU9lKnb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQZBtwJ0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQZBtwJ0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99eb8b607aso554004866b.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729089139; x=1729693939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUSQ0jx0OrUaFOZ9fWbsyJzv4hhwxFB5XSlkhS7QTY8=;
        b=tQZBtwJ024I7NpyfF7fww3UqB/Ubu1OSpvEWsEPBDHVryHK6FlYWcHIZxCapYvbUK7
         6W7LB2LP5vkrPPEfY0AraP6BsifoJWbOIzftzgR3X8j+kEw51Mk1ATHDFHclgHC76TED
         OQebjVtoWyYdTfGN3bEA9qICyOnboaoRhTpTYIb3gpUID9f5fUg98QEMwYarV8ZXH5n8
         AfRAHHk8X+MsTUSvvqq21Bupe1yGOi3+xUSMIzhpAC2srfw637dFnWAxY+VsaZ29Nh83
         af47pUjA4Itv3sXbdkYq6cQap821hCFvatP2DryaVFnSuf5ILnSAOp9IE6IK7KcMF04B
         dghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089139; x=1729693939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUSQ0jx0OrUaFOZ9fWbsyJzv4hhwxFB5XSlkhS7QTY8=;
        b=dHJAxKnMatJSjRbzKq/M0ePNXa8kmRgMfNrBIu379UfldtYHaeBHYNuKgogQBRrPvd
         vT3El2sweA3oj/avUPpFRAyJABlOQVpqRYaCUiGausLKGix3V+PWiEwt+Y9Lc1g90uxd
         1oac3DV4j+0l8GHIBZ0xwvk8iiY1almk4fKjdABwMy9pq76fjUN0WAN7efcGLS/bWdtx
         06iIW5EvH3oYu6E+HQj3Qu1isT5i/BiYh8Nq42KZOsmVr2n+MBJU/SUnQFgUQ4VmUK4x
         ZlyvalFMlchrLp1VGX0f/S49QI5GuwyYY62QV5i3tPSpnEuNgkjryFAUZ2NTIZKNUciv
         r/8g==
X-Forwarded-Encrypted: i=1; AJvYcCWWwBvDw/8e1lw6DFjFrUd1DUZL6tyaGnaxXXXu+3V2aIwoDPQs+Ll9Ku1pL/e7RRdplVR4Q/kGk15SXgvv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3ZMMVg+5irfkM6FBg1Y44DG2pKe4ByAtjBHLNQpoJJ+1ea3di
	jvGBY8MKkeIcWj26yKbYbYWeA1SN1Ua4PEJJ6J7Xa4VCsOiYABK1lkDiWbmvL2k=
X-Google-Smtp-Source: AGHT+IG099JSsxKSETl38+EaOENh31VQQ7qh1mTj5CPHK0lkMtQOReYpuviFzivdm+AZ+51P/ctesg==
X-Received: by 2002:a17:907:d843:b0:a9a:1e4d:856d with SMTP id a640c23a62f3a-a9a34cbf70fmr341898866b.22.1729089139298;
        Wed, 16 Oct 2024 07:32:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2976f44bsm189043566b.97.2024.10.16.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:32:18 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:32:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/4] drivers: staging: rtl8723bs: Fix coding style
Message-ID: <8668dcbf-42bc-41ed-9253-0313614aa5f8@stanley.mountain>
References: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 03:38:26PM +0200, Aymen Khalfa wrote:
> Fix different coding style issues that generated warnings when running
> checkpatch.pl.
> 
> changes in v2:
> - Fix cover letter.

You basically never need to send a v2 for cover letters.

regards,
dan carpenter

