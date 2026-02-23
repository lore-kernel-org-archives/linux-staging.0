Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6584EADC
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 05:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771825784; cv=none; b=rQwhzT6cU4/kB9oEnrk8MtOtwyQU6VaFUj0HXhwl/9f7BhuA67uj7w4nZQST7utu9bwuMdK2/W1eZs88BRMUldrb6pQ0FaLD7XpAWEhJh1UYTkCKU3ZyGP5GqCYllL9aKPb3oswfgVvqmVSMhV4AcwJAe23HF2wQlWX4lJjo7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771825784; c=relaxed/simple;
	bh=t6+6xDXKV0IhnV9tSQH6Qmj1vn+3xQlli6S0Cp/U4OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsswYW66k4JupefOnl4pqWpE9sBnv/6pNtnHpMAGI35+F2uNiLhSaIhsYw3fcazbPBLgJ3u546Tk06t05SPSTgZR3TC1EcWvdNefuOifGXNdzE6vc/3y8977Ix2w6PlD+dkXhvgC/KyzGBO3QDkYzW0RZa2FsE/zPZCUYPEbAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLKcvXa9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLKcvXa9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-437711e9195so2479283f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771825781; x=1772430581; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HE/TDjGE8m4pnnf4NwEuhgbNnLZCa/wS800sDZmh3cI=;
        b=yLKcvXa9ty3R2tW1w5ff7fl6TFlTSrdumPzBbhTwXG/kfwvJbyM7tM2cutINm8lI/l
         CVZ3sduBuqPqkSm5zpxqnl1KHbQ29f0uCIAYOvPqjTbV3jRMpdu5goHItSLN8D/RMo8A
         KCEW2IJCwSORMwT4HSBs1OcN7xktZ4PvwtpY6ND7eAQ2N5Sru3lkB/BVkrPcVUCCBLm2
         OFnPwV8qv3uzsh6s5EtoYvFpfko8/l1fnDLre7KruRUKmAI6Hs/RJv0x47TIeT/4/EJj
         Vz4nkpSFdFh/1rjydqHyQUDFGLcBe/UaUqI+Kk/R+j58e9JYXjAKYtrTiV+c7ufBoIWP
         wTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771825781; x=1772430581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE/TDjGE8m4pnnf4NwEuhgbNnLZCa/wS800sDZmh3cI=;
        b=m3fZePckArcL8YpEyJtSstG9S2LOvwC47OC4chOnFgxs3KpqtX1xRfp9IY7/CmIs4g
         K4EddFQdYyId//jwyAalWUzQY5npZ9hvEltejxfXPPqIIe9WNBiyXFlqcrvmFalUiWmH
         eTJXeHmt1WRuCE0tCI/9UddjDpw6fOAQw157WUK036un+pm+oLDl2++WeM4aYFeeIaZp
         9WBgnqZDx3NpJJ3VEe8bVjwA6fpFEac2CwzTs1O8ArbXM5dP+gmn4L7DjkDA/lBoXaML
         yILR3fdegiPUnprpuHgtdnD8ZMKHzz0EH8w+gsr25F6tN5bkXZm7230I03dY9i/r4zk3
         XBMg==
X-Forwarded-Encrypted: i=1; AJvYcCU2fNbhAYnvHJnhvi/Z9pxS8PVSe5LkwvKYe2UuApiNKSoPE8Sa0/9S613TPdEAuna4wLHH/hNoMFChP9LX@lists.linux.dev
X-Gm-Message-State: AOJu0YzJPPy75p5uqbWI82WoWQ6GbQozGQQRJN+nxC/2dYqly15WaLia
	gWqOuTNjGdvjadZROlCorl9Uf7mRIjqniatIl2/w9Sgp/P8bBRmP+fIuAAoU4MjiftJTCiDvYDI
	Qgx0B
X-Gm-Gg: AZuq6aIgcdMKKF+iJtPsrVz5TvwG02c/OmuMajS8mgNKeSo5d3Qa1+ttc4BvGGTZqOs
	2Q8Y0nHpdwdjnGjq0WJlGF+Kp1prMM5PquAvGh8CW18A8nMCRq7xwCG6fvxkj7vVP0lspxFC9sl
	UBanD05Q6vmy8loupmJ37NnS/IuRs9PsGhO0eR0w467fBvs0UQy/vJz7SBjAFcRLHWJqkOQkl4f
	gjyO/x/ayfAA3hbxP72nzDScgYosFlf7b6XAnMb9Luh2F8CfhtbB1ZYVhI5Z0ng4hInyMFv/CwF
	Bpf84nbbFg8Enu/nvhzTirzzOgMwpyOhOZtN4BkLbPynCsT7+Al5Eou1ggUqS1EO3aYSjKYRpdw
	fFKEZbrNXyoLEnmKstg3TciIlVYlmqFABVe9TmowQ4S5mVErgoDp082hdebuvCKuFoSRdHIbfj2
	Jg1cwzDG5WPdgl9JRNIScOV45hmE6PgLJsTfAL9PU=
X-Received: by 2002:a05:6000:1acd:b0:437:6c23:3465 with SMTP id ffacd0b85a97d-4396f173e3dmr13868322f8f.16.1771825781101;
        Sun, 22 Feb 2026 21:49:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm16311070f8f.38.2026.02.22.21.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:49:39 -0800 (PST)
Date: Mon, 23 Feb 2026 08:49:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Use kmemdup in sdio_ops.c
Message-ID: <aZvqcJ7rEydxcEDs@stanley.mountain>
References: <20260221133933.336909-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221133933.336909-2-giorgitchankvetadze1997@gmail.com>

On Sat, Feb 21, 2026 at 05:39:34PM +0400, Giorgi Tchankvetadze wrote:
> Replace kmalloc() + memcpy() with kmemdup() to simplify the code.
> No functional change.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> Changes in v2: Remove leftover blank line (suggested by Dan Carpenter)
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

