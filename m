Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D952ED87F
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062506; cv=none; b=gkLLNM+WUZO2+IV3tZV9oE+w5BIleD9Dtxqk9mCSm1nrDbKg4ECjYKaUndWsMn1Az4e6sp59gDagViH2uMlXT/5Vt7pIXsEZixGGvZBSaQTWV0TcU93939DeSveUZlCF3BebePWuBlii1t86e+BfYSve0vWZFRx7wqE508SySbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062506; c=relaxed/simple;
	bh=jNgUwMtK2RUmQMG3k47FK/HbS0lmCnI74aV7EWKk8EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTnhNdsW9GalaSnlEzgROn14WgK2JytsZZDOEHr+QiMV11Wpuqs011JQH+WxgYuP/GVz7ITq1rhHJZGu56vo1Lm4oIloh1/8bhAYvmTK83PuXgB/npN4hOxrhl7T9KBjQf1EAWDZlPXe+Z81HT7svshXnTfDkitIynZgU10kUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKaJtYYZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKaJtYYZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so38465615e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770062503; x=1770667303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hGFAoXoGcmWys+uUjHRPMoq6GYRS4Iplih/Yjd1Z5o=;
        b=sKaJtYYZ0lIczO8T6Ru4ORxDC+iWB+ubpf1Qm/HArl0biehjha981AkKKDKTVHPjDW
         pK4XDci6OU497Uzaedy4FjkblMg61jJah4lTzmSz5oXrCu7n1gsY9nnGpMj7WxO/JmuQ
         vJiHzqfASep0aQRyH9hlbKtDRBP6qbANTbF0oAUfpTx/Fb2yKj6H13GkFbd6OMmibyDO
         C6Bt754wfVFXzh0lXe2Dh2KLEEjrnXALcmmUsbx2CTt4bqTdlW+a4zA1ERVG9IK1j6zF
         oM2NTTPZaeJXWzI15h3TbBM1/Ue3nsW0tEOZOR+KNgQEdorEMNNd80csXc0t+TfzmDkO
         WgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770062503; x=1770667303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hGFAoXoGcmWys+uUjHRPMoq6GYRS4Iplih/Yjd1Z5o=;
        b=eoC6gkyR08fGsC4QbVbdvCyhb6jFAiHB0nD8DiHRvNTFA4Nb4Q43NUXvctTgP22+dd
         sTGasaQVqzQML2bfYjLJU5pxLu3jEJCP5rBrIvwZXWOa3ziH0ufed66lb7K41WYcHs35
         AXruSuYGOAfenOwv6OaFggs5ieR+XtB4qJUnjaANGMuKwYHvQCbXNdu8s4Y0JBYGLDTM
         axfYFhGH0Xrsf8+poCh6def/RNzj7/NYpF0lUgIBHbsfzoH/UKWlkQ9K8AZV04JpxaTP
         DfX+zqLrkTQn2p4AJuMIIVzpNgo0OG9/fT9DTFlNvx1f+gqSUIEGwNyPwpRNz6G+klCd
         2Fiw==
X-Forwarded-Encrypted: i=1; AJvYcCVYieBWoFns5FbstHaAEcQZ2CnDUG30zhjUIhlfMQ7oLuuhFwlX7JlGZCglqFtjAYx8bJjkR4WP26e4jXZw@lists.linux.dev
X-Gm-Message-State: AOJu0YyGMM4DaqXqajEbJguO+z52e7lqXK4ocysv+TzC+ri2x/z1FwzU
	omxVNp52PDI3mKqnWtj/t4YTPDivwlIGV3Dwe5uLCeSi2NOMMQxpTIcb77KKiFu+B2M=
X-Gm-Gg: AZuq6aJ/9JZwewbpOqzkiKQ3q72QLo8qNyoG9gtqjLr6eEiWr3h1l6lI/qiQwq8wBWY
	ho6fK7lGqhK1O4L+SjhsILcUGh+xwKn/k7z03P/vXZOQbrgCzzIAQY9jXKn/NoNz17M8mZ0h1ro
	6OIxkC+SMszQNX7P+fNpHUhjcKNHdi02HAT6iwpoXsoy+cDk95h8S3cgWw54cu8Qy/7tgrVXeRx
	bZfTwa2TvNRnUQKNgJISRLMJxo5JSeqYT4vt78ddjb3oXZrWXi/MNS5pa7b/gHdlCrLt3b8U4Uv
	/fFGKhSqlhClkS/f3nm6sFnQJA+DtKsNV/Bn2JoVKyzHYGZSu0/21jd3Mv/yu5xwPfSdWvhwipu
	1/Z3IWsYKjJPI2DD+vaEu0QCRdYUgYInetMwzbANAUrftxS0FTtCNu9w1hqlLFGMraMwt+sH0Ec
	MbsxnxOdP4y2qZGVsr
X-Received: by 2002:a05:600c:c162:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-482db4ac5bamr160582205e9.15.1770062502857;
        Mon, 02 Feb 2026 12:01:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051287cfsm19591905e9.6.2026.02.02.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:01:42 -0800 (PST)
Date: Mon, 2 Feb 2026 23:01:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro flow control warning and empty
 macro argument in fbtft-bus.c
Message-ID: <aYECoy7Apjwgzr9r@stanley.mountain>
References: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>

On Mon, Feb 02, 2026 at 09:58:26PM +0530, KrishnaAgarwal1308 wrote:
> Fix checkpatch warning by adding identity modifier for define_fbtft_write_reg().
> No functional change.
> 

This commit does two things.  It introduces fbtft_identity()
and it flips the if (ret < 0) condition around to avoid the goto
inside a macro.  Only the first change is mentioned in the commit
message.

I have see the fbtft_identity() approach before and I don't like it.
https://lore.kernel.org/all/20250718191935.5918-2-abronzo@mac.com/
The name identity() doesn't mean anything.  It's a real word and
it has a meaning but it doesn't have a meaning which is at all
related to this code.

I think I would be okay with this the macro were called nop_endian()
or cpu_to_cpu_endian() or something.  Or another approach is to just
leave the code as-is.  Or maybe we could add a comment?

Regarding the flipped condition, the new code is badly formatted and
uglier than the original.  I would prefer to leave it as-is.

regards,
dan carpenter

