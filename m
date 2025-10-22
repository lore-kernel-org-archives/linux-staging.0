Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AF2F28E5
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117179; cv=none; b=c/EEINqX35vzvEidV8IFQ2xqqxVjtQh47HMx+VionNhQ93+fYh5o3iIOEuC2o08BpJ07U8NFxJtXeq0SBvAFDX7SWJZMUAJIhgq7W36BOEF5SadfAjEnSWz28wfiV0tW3zxYIf3FkzAuCe5X4KpnCNF4TbZXeb4ApoH1evd8vq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117179; c=relaxed/simple;
	bh=niR8L0B0ebeD3jWeVrpUNWKvsbMtCYLVPoMhldvBRao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXEkC0xvJ+6a5PD8NzAkWzequ/BIrU1yS9ZGqKAHWYS5AMi4xqR1e8YdfxUjLzanWMERQTGMTW6d+hSnTQOECYjcFHP4mwK/y72keTdAwpu7OjicmVuEaIWvotAx36vY6xMva2+/EEE0MMOkKzu+zvUs/7O+q79VB1lFahSq24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZzqVY+I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZzqVY+I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471b80b994bso47353775e9.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 00:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761117176; x=1761721976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8FuFZcyK53qXEMbS2MEWVkcIXMCSeL2ZRHm6P7mAYA=;
        b=QZzqVY+ID9fYmgxgtC8YR87thdBNayTl0Adz9iZpJWwSFMHP5e4Z3JO8TSbQZlrOAd
         NBqkqIB2wMohXmbRyYfqnLewiG91jwhoJHqtxhjmH6aRaYMl3LH4uJuUy+IX4bEXgFmi
         yQFUe5vdtVWqX+k2471FMgsz7MtsQcDikjZG3TmNeqD/fcxMsZpzBZHG11JLdp28CXym
         zHaJdTHc9xyaDqCgbFoKO/Gf+HGxUPEcd4AHKzAQ0yPI8D9QnKUtjfX6WKhd24F0eVlT
         WkiFjZkK7pH5dAmGD+xMRUjyRzOcCDagTdNRwBGhXTIvxCRmhIL78lF0FugOdizHFpFy
         iixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117176; x=1761721976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8FuFZcyK53qXEMbS2MEWVkcIXMCSeL2ZRHm6P7mAYA=;
        b=Wl5NVeLffmSq/Upe/eKbGQf4SV4maApWOWo9kkiwXLvD6iYYJkGviw6HqW/xuvwOnB
         beQpuqvx/2Ftm28vcuLzcdQ83op+8oawDELYu3L+3H4R0g2oh8HRLTfSsVZj6e8P/GSf
         gKpu/s2EP0ojs4h77XzwrghyfsyIb+kagSg77+ZZLCkRYjCQPsrejU1Q1AuM7vjiO7MW
         NtNIh1UZYL2B1JnA5tXsVDIyDR1odmGx9kCXE4eeJ3IvxZOU2ggoWK6t0j4SmNoPf2/c
         D88MLtBS6ESlxzbZTw8NkAkUoZeOXXR8q1Y28HCqVC0fRlm9su1OAWeevw0zURYAfN5d
         3qSA==
X-Forwarded-Encrypted: i=1; AJvYcCVW/uR4oguezhqZklqp+DdS8HdcHFXfb7HSAyBfdpRIVFboruLiifZRF4gRxiQ6ni3OSX7e4Nd+BFcgqRMv@lists.linux.dev
X-Gm-Message-State: AOJu0YxJbxMXMpMI9ZOc4LfIMcq3r1pe0LUThWmihjdw+A83JHVy/2Gl
	fxTez85CYnw7UOHAIr2nkkEa37qVSZIjB5fmMkWMXUPSnj9TgHNJPrCyNAkJsHqJiR4=
X-Gm-Gg: ASbGncsQKePSxdPXIConL5E1fUCyXo/W6OJBzLQsbJukcWn4aOweJ7vc4h5mfX5suCb
	1/o52LjnJogkgdB02+7r2qjAUey9ch3L1s+Lh64QPGIwaCAI43uvpeFzzrrAdaxVfy9wgUl+yDE
	JXvz5b4Fz3z2J7vBgUak5pCgxKsX+A8hS9zZY6RKIn4Vcd6EzI6+nso/NAcY6m8qewauo5XmbKT
	O+nQ2etDe7fC3JpQnKLLG0mDWs6SFbxMZ6oqfVJoWY6D+ho4v3T1M2bqaZtZ/ItaN3aZbxPnBCg
	BN/UEl6dlVDeD0FTiSuIPJPKZme/RATRXpFt758i+w0xn7Qzxk/koLa3LxP+6BmrBX810cAgBu5
	P2pkCxdNskijWtmUw98wV0zJW4cyLeuBc1NDPmVMOGi2Xne5BrYOXf7U1/+4uXD3DwudfbOeGol
	Nqbz5HIm5W3E57F+ZY
X-Google-Smtp-Source: AGHT+IGzkwTmLcc2KkNeENZZLLGgyzoMctz79oFjHfSSuACqYt7ECDP1Ly1s8ldQhVqAEFUJBX8WOg==
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-47117925171mr198145255e9.34.1761117175610;
        Wed, 22 Oct 2025 00:12:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428c62fsm30048915e9.8.2025.10.22.00.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:12:55 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:12:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>
Subject: Re: [PATCH v3] [PATCH v2] staging: rtl8723bs: use ether_addr_copy()
 and simplify NULL checks
Message-ID: <aPiD9BF9RxhcJiPM@stanley.mountain>
References: <20251022062304.4061-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022062304.4061-1-dharanitharan725@gmail.com>


Subject is has "[PATCH v3] [PATCH v2]"

On Wed, Oct 22, 2025 at 06:23:04AM +0000, Dharanitharan R wrote:
> From: dharanitharan27 <dharanitharanr05@gmail.com>
        ^^^^^^^^^^^^^^^
Wrong email address.

> 
> This patch addresses multiple checkpatch warnings and coding-style issues
> in rtl8723bs:
> 
> - Lines 120, 212, 215, 249, 255, 256, 261, 262, 263: Replaced
>   memcpy() with ether_addr_copy() for MAC/Ether address copies,
>   following kernel best practices.

We don't really care about the line numbers...  Remove that from
the commit message.

> 
> These changes improve code clarity, align with Linux kernel style
> guidelines, and fix checkpatch.pl warnings.
> 
> ---
  ^^^
Anything below this line will be removed from the final commit message
so the Signed-off-by needs to be above it.

> Tested by compiling the module successfully with:
>     make M=drivers/staging/rtl8723bs
> 
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---

We need a list of changes here under the --- cut off.

v4: fix subject, and from email address tweak the commit message
v3: something
v2: whatever

regards,
dan carpenter

