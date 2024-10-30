Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363F85931
	for <linux-staging@lists.linux.dev>; Wed, 30 Oct 2024 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273933; cv=none; b=fTlWgcjvYfcg7Fe7uFBTMu/C8dn8kFA42xD+5pXAoQSxZLcP0sE3bObszl4qIwRX2iIi/RQ+w8+FcY3HaeC0YYl49bSLdPoi4hnsM3mRg3o8eVwDmAv+runasWLfdXHyof0UvxWiFpqZGk132Y+VR/mzoNMWsZ+BNN/ERPju9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273933; c=relaxed/simple;
	bh=CIfyIWKyAZopCYXAVJs0OQjdB+bx4WxORWZhQJacI6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOJpOSY+sZTD781Zkf2U6NSRg/c27CrTgAgOgv6sKpooWknQJtELbWU/gKTjR+MQbXCqxiJuYidP9rAps/NkGwzE2VGPpCOa3hhd4fws26gzAnlgj9bUqPgRbcK8UQyOn0BepBbr91AF0ksjJVOe0uX9VPJ43Tkkqn7k+0xoa20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUDxwJHb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUDxwJHb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so4044163f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Oct 2024 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730273929; x=1730878729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LhuDhEZJkU9JsxAhgAFW3kJci0MRgq1vPLOeXgFWtYk=;
        b=zUDxwJHbZbcQ8OwTaq6/Nnyj2/dU2hlwkooRLMUzb4qAOuHjf1s6M15S9/aTS+URs8
         svxUpiWgggPhUPw3uT3iIPQJtDCETYLeny3npnV5zbEOFsiDrqJHA902j5SKvlVYGZwb
         /HMLamKc7uG8CnnwqbAnlmlI2xFYNSG5AYzJPI+7v+dyI5Ki9a1Gyd8Lqef3SfWbT73v
         bKyoyd2WMIbeTjeDtdEW81ZxB+ipMNr4xzXi2gAQpbMWur4QI4EU1YRtrsHrIAsPK7N6
         FbVPjLXqQ9RvCulcViQ3TBXufHKbm6pXwqEHSivWeYtmX53QPaiFmFIytEkl+nOHMcbr
         8//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730273929; x=1730878729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhuDhEZJkU9JsxAhgAFW3kJci0MRgq1vPLOeXgFWtYk=;
        b=v7rXZYqTUi+46rsmegaxGcVaJrOnv0UGaMzKeAplkBsMCXGv4oQQBXNEg40NVpgfQj
         xt00Huo33WGP947rcVrSfQSkb2i9oDC5/582wU/0JpN3olQWCtKpkENgEovZOBjVwyvh
         nnmwBjwT6bOep/SbMiswVVAOtmDr7rM0/lc+ZvpkPh37KBxEBwam+/TU+psKxNQ/hxLH
         3wGmJYRAOZBRDaGmB0l91A3CgJ10kndbKInasNdLTDe/e3/1B79uYKLrfxbwwi8jeYA0
         WcYiqgSKnEUlWG0QmmHpHldtSPwvbmlqHUUvkMLP9Gj/ZQgHfNDR34MmR5Gi2xpc6QqW
         Jq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVSzWLaxZqYZSAGBEfzFa8+WhGd5EPfpQzWlLjwimO7Gb3kaCANO4P6esZI2nP0cljgZt+tQoJAZPTUhFp@lists.linux.dev
X-Gm-Message-State: AOJu0YwdQpeyHKBSSeiXWLf7GmS9QetY4047HAkge5bKneVkP1qMXRda
	TUCyvTnv+pj1tCtmI1Hb2E9RMWlRdCF9Ekj4QCYc2uLm1ylB2wE5D3b83CtqMbM=
X-Google-Smtp-Source: AGHT+IGI33jQx6+cHtP7k238HF/+0YJfRR/AYslQCtaxx4oYHXtWzKb8smj2QVp0Aloib/BJCoOhMg==
X-Received: by 2002:a05:6000:1f06:b0:37d:481e:8e29 with SMTP id ffacd0b85a97d-38061159039mr9314149f8f.25.1730273929282;
        Wed, 30 Oct 2024 00:38:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9d008sm14509226f8f.107.2024.10.30.00.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:38:48 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:38:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: change remaining printk to proper
 api
Message-ID: <0d397004-0bfa-46a5-a184-dd85f15f1533@stanley.mountain>
References: <20241029221544.112800-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029221544.112800-1-rodrigo.gobbi.7@gmail.com>

On Tue, Oct 29, 2024 at 07:15:44PM -0300, Rodrigo Gobbi wrote:
> As part of TODO file for future work, use dyn debug api for
> remaining printk statements.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---

Looks good.  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

