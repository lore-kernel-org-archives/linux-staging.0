Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5673624D1
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039223; cv=none; b=WXup/uKfye3g0u++ykS9GsMGg4HRJ9L10llqnSQKvXecDy5v5z9K+zo4Mj6VwyUxC8fhMvB4S+PmV+Qj7nNeGewbVllRefFJK+HzYGU3V1sw6vLkztftOf1kfkzCEMSlPCoAXphV8sozthkdpiddhxWXujp+k8OC3wv5m67Gas4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039223; c=relaxed/simple;
	bh=d77lpdHYI6BZO5Ek6N61AC/2k1IevRIG9eQzE335WVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OT69DVR5SR5f65mUp81xBvAPbPcmO90gkCmwYSphTkukqWbWgHmYSrexVo5I/eL/RJIyBNIwNvkT6tMPRE7eZA7oI2I4kid8UBIAxS1rJLCOjYd+CIbyJZEcVKvhga47kJu/yFF/Z1MEyjKMSLPOlF4HItwSAO7Qz7rohyrvylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmYPYSp0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmYPYSp0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439af7d77f0so7143614f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773039220; x=1773644020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q54G8rOxA+fYkoCVLiwMyoRn5Djkfr81+r8BNhftRys=;
        b=XmYPYSp0VgzDJpNbd3mxgkqZ2szF3YUJ1M/dBdqD2rp4ZQKbGrxopd/TZ9QV4LTnGH
         XEkj3k78A2bEzPKRiv1vC2GGTnsq4MCK/qq7l8F9PAT8eRYwpBQhZzUesvwbmW+cOv6C
         2ZwPwgIWOWs8k2nDmeIoUyOzt/QVXx7vrBlS6tUsbbHHpg/aIg+mKD58RDZvPUJvRdBi
         m+psioKpt41YdtrYjHWo6kBdAhQxLK0RLNmIzVqG1SVhnVpo9pbYHxhL/UpkMT8YbJL7
         Ct/46e3l4CuWsSgerzZXxtmIBHmAzkVfSajk+aBlU22wWE3X+zVTDo77JyoSItDAbHS2
         MEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039220; x=1773644020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q54G8rOxA+fYkoCVLiwMyoRn5Djkfr81+r8BNhftRys=;
        b=ArcV37tBXd5wQUBk1Z5N7+3YbI9GkdSryC++JElaA3A6z6Sbfnu35zY0rEUM8o/+dq
         T93/O2w3vLW36fTnJHMuRZQwLdJ9Zo4YNHNx/5Dm6Y6q/q9Gw3llP9Gse2PFO60E+9AQ
         +RsGs7pOfqPJ399LMF1ei8dDJxR4gW2LDjazwoYFc2qbG+hEU+3YpTT5vSSCPFuU8U4e
         XIwRgvhaHEBYX/UUZUI2gmGUjVHDk8jeIrb/YqU/MyI/K103xZG/PWnGgC6vgwehnPRx
         WbGZRwMO1qpwD1dsAooKKqGCiK+WrXfLl7ebxTMMS/LeHKJJQOCyBkK9ev4n1+wFwqht
         /z0A==
X-Forwarded-Encrypted: i=1; AJvYcCVyHFoNSylEWJ7zPrwgS3VxIcjetjv33blduyk/EiwXU/HsYEzjMYxktodgk2ylpvql6VtzMDKggfEA7Mve@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3modOYtgaZh9KKuIr1rhMcC9IPJ5pdczy+ILTkz5kS7HoDiIR
	SaOQcw5Hl3O4sggUcx3gf2Zim9SWfbKkeLWL3BMrSAMx560/BZeoa6L94GOKRzNurNU=
X-Gm-Gg: ATEYQzxq1+LrIM9bZUh7nd3fSGWB2Qw8mKVAmIELA7uVj8sNeudy8TQf4Ij4VITmNLg
	f4WXV7fQATK/1MBaD7ImDrW75jerr6I+t64iKWHrILw2yfVzQxZ4y/sDpaBL6bHSElhwHp6psAZ
	RKqqULC3evv15SzJm2UIsafkP68ACT8tJZZiEEqDXyFaE9A/URIv8fD9ACHtNA6OupveiBE+pn7
	95+w8IVBfDg0kvkviPmAkAmIBCNVqmF3qYH5sjrdNiyXFQ4gdUs2v6tmYm+Rl8dLTQmn9mUfnSo
	EQ45OtSPlup/WKT7AQb7rVJ9QW/6UpHXTQy8Pv1Rr4dDCSEdYyt/jaZ1Cj7szyPVA/yNWuh/U/J
	o58spp6uWuK/b4JFTw9WT7u1kpKgTNUp0r8s8FWWRcD6NuDASpEB8FYr5t1lzOHb0X994fg06KX
	gbUbrp71QKN+kr7DYWSMDsubDmrq44
X-Received: by 2002:a05:6000:290f:b0:439:d242:e8f4 with SMTP id ffacd0b85a97d-439da871003mr16674092f8f.47.1773039219953;
        Sun, 08 Mar 2026 23:53:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad977f8sm23767840f8f.9.2026.03.08.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:53:39 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: circbuf: Fix function
 argument indentation
Message-ID: <aa5ucAclySPhW2_2@stanley.mountain>
References: <20260309054410.10107-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309054410.10107-2-giorgitchankvetadze1997@gmail.com>

On Mon, Mar 09, 2026 at 09:44:11AM +0400, Giorgi Tchankvetadze wrote:
> Format ia_css_circbuf_increase_size() arguments according to kernel
> coding style and keep the line length under 100 columns.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v2:
>  - Format arguments according to Dan Carpenter's suggestion
>  - Keep line length under 100 columns

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

