Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300056;
	b=NkdxzdAZbPRCRO7WyVIO7tReKtUf5C1xbeGMaySzcQsIVC8uPyyKF4l8RAAr0uEdehD4
	 mcJxKKt2D3JLU2XW29sEbc7g0ZW8MAM518bS9YpaulsEcsxgjI/fZ8DZb3SUs90cHkWTc
	 A76VvBO3DHsLxmaXXRwRYOAC5DDtZAHYpxuSkDOklsvzHkS+D84vFoVBijkep6sIa3+g7
	 vYMkA2/VmBRALydgScEQRdHfRs0Bc0Uli4NuKq2BEyBS6/Qc4sO53MiSfLdZ6Srw8b29s
	 CJSvJ1K28bzYkvFKcEgtVwlyojJ1BCim0WSDmdQWWtgXbQYAd4JXXMocKJQhsBNOd5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
	b=rHyQiMv5pX/JAZQwTNkWLnqTSfDG0AhJw5GivZJFczaVW1qLv1McM62mCMCsLfzNw6g7
	 TrOwodlZdzvyHCTtApap+cer2uBOn4UHfRB7MDOVSwjinM3JWYIL6EJjKvKTqWoA3HKD4
	 +EjKaAwLl46baIKPoGpuQwQOJCj2Or2p3XLQ8CwVZRv4oPseDhZsHrgEOmPeBBKH9JZBa
	 xgwCbVcLJ5/0Jj4EgzFpV98gv0DO1LpD/Su7P6RdkRsxoKLrNIS1ipCZGfKYebKUVA3TX
	 lnV6ywfoKW5mp9SUIYm4PiuFyT03+B429oJxJ5jcfZXGLL4GlnXb6Y/2lz/7tvEJEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTJX89JY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A26606A31C
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 18:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTJX89JY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19643695e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300054; x=1793904854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
        b=nTJX89JYTjl/F+5jzm+fiUxC8+fKendtTEH/RLWq3MErdp4BgfYo9RaJMsBAfy7JYc
         h3Nth1Qv6VOmlQGIYfJInKG9Y80KQzQkSznM5iUxX0vsQIO4ynysSBL0wrqMh/RRIwh6
         bVNHJ7jEZSSqZjvDsHmyucY/J7gNcHjIWs4s3wUEbTsCcovhkFG8fxceQz22InPXAwYK
         Zkz3NGH2Bq41ijbVISrChA9NYvQE6ro81dm01qtAdy7FGY6YyS+fhDXEPmcLRoJ7foW2
         NtNIEi7OHzOgDkjAOk6lhhTLwUnybZHokwqUklMqKmfkxTEcT+cbUDZXhtumvN7nVSRJ
         g1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300054; x=1793904854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
        b=L4XfM7v5CRFVyLwheVWes0h2NwaNyHxb2L0vmDNhNln34T05XtmTjaLG+e/o8r2NSB
         HyZf9snFNlGa+zcJRhdNmdxFiyiFCpUQlMaJQm5GXTehLTOTmeTfBPhfWi1oD80NYYXX
         bzbwhPIKEoa6TJXb4e1HdBCBf7fPfzczvvgMQfSl9L3rHUD3vJajatxHdhlC7ePbDTQI
         /x6XOkY7tA2TkrnxOkzWuAWkxYAOshFfGl0mZfzlaA/RYrp9lukel0frI20nRoYeMCqD
         4NJ2JdAir9V0i9RxchG6oG0JuPbDeajr17zI5IBLMWqaWlVuMdKsdDxZCyxSCvTWKJD0
         lUEQ==
X-Forwarded-Encrypted: i=1; AKwUvByIfcK1raW8N9GI+dOqjWyl9h2XbSbPIAXIyaTOq7vFfqvqd24TtoEosDjjczKOKxFRakFL4sGH5c4JYgsv@lists.linux.dev
X-Gm-Message-State: AFq9FYJaNAa7S22lZBIs5tzs5EPar1PVVDHFG6c0jl2oWF05WDKqfFA+
	TiyfpgDMrsS8BBVbWVHYB0Dl4hzcr+/pT2Fld5phRCHFzs+vEWC0mQFU
X-Gm-Gg: AYBFou2EXyf40/9M+72a8yqgolIdLbvBPjdf9TDFUSqLwM4HolCvDBMk1JTxNifND8b
	iJkr0ofyP8VBCtyTxH5A3X1gvelt2NwQhPhhD8ag0zMvonwG8lkFRk8VMiZdrHs6kfPgCZhhi/f
	tiXjmYV8iCtP+ScKTqqQWmcdAlG+UrLqVSriOo9QHtU+iKZzUS5S0FdySt1+jOmgwc8I2T/yshS
	u2TUtRhcBiUJaS1tRseYEz88m1IBfhoIMegQB7Nq7XlZ+Kv9u712/06dtvx0+JO1yBgGL3rmBLE
	C3E+LTtP8vNWWEzVCJY8DUBX++7GzEmND9CN5l58Ww5+kEVlhAepKGKYxm+nEhsYfRnMw6rvfdP
	mnNKWep4rdaZHtcSriXBd/D27Udh5gI2pMoKQxdjRlCyJDF2WHcFtLv8xjFdJNl83dE/Z/OCUC7
	mygDTFvLhyM9F4E2BMqRihsQw19mRUckjVesTshLs44MrBTjOgpAprrdG+QoLubJp7C0WOFqAJk
	sHOVEOnvuZ0g+qneZUANFUPb/0Hp25dgWU2Ga0B3Wu5s9LLIxVozWZJ/CFdc3kbkkmWABora8h7
	/3KRhtAlsF9MsuYLV018nLMcqorO5GKChzJ4eMzwa3ezI1XqnEb5SrlVxd7lH3Smo8Q54ILnvoq
	XJN/QQAMEDm9FnlDIjP7rJ3CJ0TubDOe3IQQdfROzU6/PREGSXlvZhYTCQzKMNtuulC7mWGUfBM
	m+r66+Qtg1SfWX
X-Received: by 2002:a05:600c:8b78:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a9672fa52cmr143011705e9.27.1793300054062;
        Thu, 29 Oct 2026 11:54:14 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm79436125e9.2.2026.10.29.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:54:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:54:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Odin Mirdamadi <odin.mirdamadi@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: fix alignment checkpatch
 warning
Message-ID: <auOWUsL9nt8d6T39@stanley.mountain>
References: <20261029182244.173276-1-odin.mirdamadi@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029182244.173276-1-odin.mirdamadi@gmail.com>

On Thu, Oct 29, 2026 at 09:52:44PM +0330, Odin Mirdamadi wrote:
> Fix a coding style checkpatch warning where multi-line function argument
> alignment did not match the opening parenthesis.
> 
> Signed-off-by: Odin Mirdamadi <odin.mirdamadi@gmail.com>
> ---

The original was more readable.  Search lore for the function name
before sending a patch like this because maybe we have considered it
before.

regards,
dan carpenter

