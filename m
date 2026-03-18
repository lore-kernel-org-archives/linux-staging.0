Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89F73F0750
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862080; cv=none; b=vCPcJ0xUJh/0jWvYZ62HWDzWpOzReC9KMYI/paJG8PLgYCbAk5NF0RyphUuIUr5k70i9ssvCjBw0f60ON8M4QMAsiNVj2MVSgih/D4HMKZLedqi+hGvHOW/qhEiiPTOkTdGChnjIbCovcQQLdh1gmW/Tlq0tDtETYWkzYPJjubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862080; c=relaxed/simple;
	bh=/x38NRT/HoTCT+GKHqqyyM0ugkHD3Z8LU/B8tptdNRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu/sN6OTxNMNtyimVetayla2plZW+myBpvNhFgGfiIi39MSboAfpzlAczQeQR0ReoQAkB1QCkowKSKUknurHtHr2roKnET4roqWRn22F9LTRIMkw5539OFviiuYoT5JYlEuQEiUlpK5DgH74JszHt+uANvUpNGPpJawyG+Q4I6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFyRO7uc; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFyRO7uc"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64937edbc9eso363730d50.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862078; x=1774466878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fbeEBg/MPJCVPtJV0u7ZQuSkxub8iatoBssGH2TFZqY=;
        b=GFyRO7ucCsuGpPsvMmI6lmK5nJ9CX088Hxr0+InvBFqrneTyNBDjoBKl7GwItvKJ8O
         nboROj6HngaAgGb29aqIrnd34lbrJpVH1+XhVKwjhRkV1grWKXNxqwcCsMeP1Q7KLvaY
         idfXyFs0XxGGbSbwDojTgSrjmdIiHyMOl5MHCKIUMjx/mVIYLXJa3lnECnR6LwOjm7zC
         EyNoP6sUv725CbjdNfiod4Oe/COaJkToQo2flStohpZlxz6rgr7wvFfiYhhKNwVUhWwK
         sMKsYtmTBZkgq38T+v0GhCP7PgtSghAeLtu/QU4QeTuCNhD7Of9UCQOGqPjfd7BTqptd
         Opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862078; x=1774466878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbeEBg/MPJCVPtJV0u7ZQuSkxub8iatoBssGH2TFZqY=;
        b=bXonCFDxB+W7cYBFJyhCShnKgh+h+lezzp9AN1c/4uEikk7AwEIlnCwWX/ZJjro/Fk
         vhfO25YjacKiq+x80eVSXNhUttatcXNQOybDAs3QgGj8hyw+GIhy9L3CtzuGPVcq82jH
         TIg3oVfh0o+SRGtDJgNSKhwoEqgFi+ilWy0v1PM1SmbUV0gGEUpMbNzR+wwkjQJZCvw+
         z8adu+Eni3HiA/u09GRlvH1+rU2MXm2xtG39U3Yd0Bb2cQofyDf639p1axUMklhqYNn8
         +6AtcBrb8kVUlK+I+ZINt4sr4T2j3GIYphU26BMIOussz5yFlQzAcwYdVwF2iPTDNDTE
         2DGA==
X-Forwarded-Encrypted: i=1; AJvYcCWY2W51XJuIe92g3j29GFGee5sRR8pERRV4e2q9oFnCvuK/3TjrI0R1niLR63ZkJOhYmbj+bd2LwG1aUobQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwQNb4cNrGcd7SoNljeUfq7w1v47rcnTh4W8+n96Y0z3XXO43dQ
	iTfCrQPv/LJeQkkIW6H3mvu0TZpVfMeRoyYMGdae1FejuiwbE0EDanK+
X-Gm-Gg: ATEYQzzCPpUzHT4/SuPqJg15Qh1X+5HU1mS7gMEoT5Y7CnCHNscm/V4Hwo7JKX70tNF
	9m+LzLTxVfRc24qppBsbHBZS7OU9+drkzkF9pL7MWCsO/GqhzE8vq2OcLOYfy1i2wr/9KBOCPhp
	a5rpJdTnKbPfNV/nwiah5AX45ajsXZYth6UAEv1WADnboV6BWAtnNHdbd8TPxNe1NTyl48wHuIQ
	vG2kdZ9YmTUI12puiV60WcgfXRoDc6X5RU6Pz2jhnJJTCZSVyJIcTzHPRCxTzVp6TnTjoFFE6Cj
	ni2n4MkUinHl/Y2hP0xxEd6JxgwMnjSoH1NsN9Y/hXfUqD7rYk+jI6zZL9oi8QNWWBRfqaqAfcw
	wvMhfS1e11n4ebrvEfIUoJYatV5vN80/GroR5rrKgSQQXxiGHPqn0s1+Z8+JJbIN1assXEk+yXE
	rkQgCADH8m0c1mxBWWRxTSMQ==
X-Received: by 2002:a05:690e:a4f:b0:64c:c616:c349 with SMTP id 956f58d0204a3-64e9130e9b9mr4540610d50.31.1773862077818;
        Wed, 18 Mar 2026 12:27:57 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a74dfbsm2185856d50.7.2026.03.18.12.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:27:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:27:52 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Malavya Raval <malavyaraval@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: coding style cleanups
Message-ID: <abr8uGw2qmAXLVX1@archlinux>
References: <20260318174516.847-1-malavyaraval@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318174516.847-1-malavyaraval@gmail.com>

On Wed, Mar 18, 2026 at 10:44:46AM -0700, Malavya Raval wrote:
> Renaming CamelCase variables and macros to snake_case and fixing
> formatting issues in the rtl8723bs staging driver to align
> with kernel coding style standards.
> 
> Signed-off-by: Malavya Raval <malavyaraval@gmail.com>
> 
> ---

Please submit one patch with one change. In this case, each variable
requires a separate patch.

Also, always check your patch before submitting:
	./scripts/checkpatch.pl --strict path/to/patch

Thanks,
Nikolay
