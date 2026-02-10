Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BF30C348
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750822; cv=none; b=C9Nbk8KJ+p82vi+5QJEtnpxnWLp5w2LEq7b7K9gn46wtmsnL53dZVuQNbAA7CsN84Wmj0J2aTlY7V+t+c21wQC10H6+X+PYaq6G/mnTpAD3bxtoVHQyQlSsBp+NEf62tuozsd5RDCbf61kLhwLhHPR5BaDucNFThCVRVufauzJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750822; c=relaxed/simple;
	bh=wUKHWDwiph8x0iqiZqlppNRU9bYC1Zxkxsdms4BX7So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmVP626/RVRAPxBYth49ynU00aszAiAnS163WQO4atpd25l4Oh4kcGZvXOjM/TlnUrxeC0Gx3nC/A1xI/c4NKL1gaMbZvevsGo9cNkHC6qhLnqEKqDI/s3zG8l4KixZrh0znKyQIOXjfAfa8NEcumK0/pBI9MGmB13Bzb8JjBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rM7pDDny; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rM7pDDny"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1680846f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770750820; x=1771355620; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQVx32sLRFVm7f0hXvUHJZbKlucpQ9ttWA1EbgNPPAg=;
        b=rM7pDDnypA62/haBO+aWEFLsiktqfK3Cf0NER44T5cU4vSuT1yHgZTm5cXncmAPupj
         ob/dKu3DObUMeoZsaOgKLsNqoNcTwQZgDNt8pxa6mbWBaCpDSafExyldMNCSBv6RAB1t
         Iu80inVzJRFQgvkdPqzA3aETpJESxtxxyz6HauRswV720KyRYRAH1s74Nd8tMtXUFADv
         Dd3C3JX6OMFoj/eN4WLlacHeoY2Wj+0TR07GUWbQy8W9DpPbI1TCU3uu+nC+gbyh1Rg4
         FffHRPp+zkhOWF6xYSESkU+JPsnBe8OOV5a3/0DJjPx5e5NvGfqRkigMVi4VNDfbRpfE
         T11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750820; x=1771355620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQVx32sLRFVm7f0hXvUHJZbKlucpQ9ttWA1EbgNPPAg=;
        b=w1v43yIaNKqZB7zXhebpRVik7Cp2Hn4Rya79h6mNCIThWWys2uaCUKw34HbMfdbZGW
         XUXUR4qYiNE0iBH9WxMOcfdgfly2yXZCHJLh4aqCKhZKIct6prS2XICgKHygjX7pD4NK
         oYGpIT3adtVqqvIb5AZGAkfQtvmohBxhkofl4HsITnctjrvY0gpuzkQvQUs4y+hRgqat
         hraGfuLDcAxClyC1/E33OcbHSJ2w7iCt92pB5TPak6jMQhM/tOItEkPRHhTrFSMYITbg
         PBNr6RjeOASUEx+HYPEBeZ/aTuTH9+1H8Wwd8guFGbyutSr8DGc810QXki0YP8BAAcjN
         ZC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaq0YHZHHqGPOSDfz3U1BMJrTxZZsUGEUXS5GuucC3N9oxJZF9gUHq9e5ZYMTzBytdnbpdtPLVzH7O75KL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+HVhO9HhO0lbhQVS0tTc2UOmk6NLeUW11QGhlmQCe15iFRvTM
	CI5CfVJyvWuYk3VYJ4FYPS9oEB9Awu9j9cCdx7h72dNtTGK1UoIbFJW0QJRffaCDfa0=
X-Gm-Gg: AZuq6aL8bYvZCIpQrVgzmKjmtKF77w/UBPV6IqnIak/L5cZfNHF0OADIb4LU1Fv01S2
	rQkdPqQaI9yFKvS/0JL0kAegV08ob91oEPgDxDh+q4GV7tHCfm/LVX8dwSzudDmluMCskXg9q/Z
	wUSxs0fsS8Pg1Ei11nADdX5L6fOKcvx9+n/3o3mqUj7yT0gIKa6zlXpn/Cwowjb24hXGSwIZQsN
	g04S+oMRStXoU2fiT7CDFxUJ6yw+/Fp2tFKOcA4rRryanKeytP4ztdjwmbePlC2X7rRM2YlKKHI
	Kb9YwUpB6zA2osWnPhSO38jTj0WxXZ0I0VU4rFdU1hY4gro1WhiXN7svp6QRHgGKXOaNO/0rrqF
	mLXsWxSpOZBRjDXkkL4Bne+lPWRnFanojKmQCvp8k31xbhENs5mvGN3UzVnLFmasySOr1GwryjF
	fbyqBknRDSiezdIO1XGa4DSgHu+wmx
X-Received: by 2002:a05:6000:3105:b0:435:a83e:88f with SMTP id ffacd0b85a97d-436293f516fmr22024546f8f.0.1770750819756;
        Tue, 10 Feb 2026 11:13:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376bd5a074sm18489059f8f.11.2026.02.10.11.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:13:39 -0800 (PST)
Date: Tue, 10 Feb 2026 22:13:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Azamat Rakhim <azamatrakhim8@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use u8 instead of int for
 bssrate_len in get_rate_set()
Message-ID: <aYuDYCDYyKGK5BGb@stanley.mountain>
References: <20260210165437.24550-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210165437.24550-1-azamatrakhim8@gmail.com>

On Tue, Feb 10, 2026 at 09:54:37PM +0500, Azamat Rakhim wrote:
> Replace int with u8 for bssrate_len in get_rate_set() and update
> all callers to match. This addresses the driver's TODO.
> 
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>

What tree are you working on?

regards,
dan carpenter

