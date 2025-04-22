Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02411F461D
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316591; cv=none; b=jzh1vdu6pCja154gaXG7jDeEsnhkU/oNH6LIuiIjXBrT7TeOu5wgmiAOLHKvyR4aolH4IepYKS12vdfqdArFg3gLns/nvtTGY5aJJWJpvw63NhMbke4VUYTwZ4cDcrUXUCVP+zxxPPISeXGlRXROLu23D8xwqez0Be2kf+S9uOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316591; c=relaxed/simple;
	bh=gJ51U3OqINc8COkxIxukVEYOMtp81jpnzGm7X1OCfvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDom+iWlETcn6XgU2ZO5z2H+5COh+XZmygGwHWE/WC7AXpgxes9MJY1IUxNeFROXj+Fm1vaCqmbNnvVmQfxvk9xNeNfiW/x1p/FL6/sGPD57Y6gTi0G26Wt5QdCJ+ZidecVQcNgwX8PGIXwDliHFjyVX8yWr6I29aAGsxjL+fr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kIpTovwr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kIpTovwr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3299672f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316588; x=1745921388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=kIpTovwrv1tmy9xhQkZJ1ywVetwcJGl9DdxY8t7V98ToycConu5p+0TH9GGSutL0oj
         lvkAhHON4ChgcLFrVc+Q5XlCcLeoSrnsqe0Qz3ziuMx9FmVFngQkEviqpwWX69tU7Wyc
         qpUm6go742Dxdhd12KHqihb853ZiCnIyHNOzOTf4DOU6rxnW+4Jvgmk66aipDlp4nmU1
         geDtDBI9QKcjqOA8ubJha2+M/CbCnEgPfu4LXh4T4H2pmLIwtQ2NvlBol4S5vL7KGiFD
         nCDzkgPEr2m+PWK/9MNNazu/UqtXYGT94sZnPwTQ7vhL76EyE4LWk5p96Ycv1LXmR509
         Az3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316588; x=1745921388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=XRs9SrYOqd3OniEuksNYqoS6HBmn0qfrW1Bz72bG9LzYOdzgZjYdwJLhFGsSCOHy8l
         No/ZEbK+++au0JiBxc367oF0NTGMKMZC2aJ2CaBEhuPuKHyx7ccUgATkLi4RTmTFaO0G
         82NVLCody4+NhrjrlPKxPnG8dJcAhJWdX9fwDif/GALuWVaQ15WEx4CZhGNy9jlc4pHA
         2dkGFA3JkD7ien5Bx8DlJOKUL2DS+6Eb/pO5P48NunnrxEGvBdMmSE4eUJ4JtU6v/DrE
         k71L2eCa156bqUE4u/0/fd3CqRaND8a/5qxYvw89PL3TI5N3Lj/rlmehnG65Zx4HgTqa
         o4DA==
X-Forwarded-Encrypted: i=1; AJvYcCWFEZ3GnYIUKS1BFoQCB4C4H974QCiJg8CuVdMCjKkenmVNUPJE//hS3P3kiDR2nh6G78AD1qvI7PI++AcQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzyQLNnn8Nx5PhjQ4irhPwUf/d1d9QsCEVLJp1vh341YoWqk7EX
	r4L44hYRj3OmpsOFnGf9HmeiZS8Vfos8YYnW1m/+sXHmZvTby3dQSRX+apDJ/38=
X-Gm-Gg: ASbGnctx//ttDjCYMUSFFBMhHxONgQsukqbh00coRoLEh7h8AIProW2IqckvjHv16Ho
	HyYHbbFTFNuHXxn/l9OHVRVtlIwUL9f9O5jaUjtmz9btlO74odzkOJy0LMIILWJaHUPhwVwibnv
	bJdRhjOG50DvIrSrKYHXcDeB93QUzfNGVxXfcvtik+KL5zQwJRFjygDNOHjymHE536qQNSpDpRw
	zUWDYUzaH8OmFqvtcljLBUoHwQfPoOQ6337jW2feEzKPY8TJmKUNa930IB4+17spfMUd3iEuk03
	IKS/b3Iu+Rp3Z5K9dEHXl0LJerPtP6uBBwRBwX52KDxxySc35joZzowL
X-Google-Smtp-Source: AGHT+IEmHLJOQlOcSRcmVdEtr0KqjHjjJr7duO4pcXYqbZwwqR76CD1k4A3+rfbNuIehIKutY/tmZA==
X-Received: by 2002:a5d:59ac:0:b0:39c:1404:312f with SMTP id ffacd0b85a97d-39efba2cb94mr11712313f8f.1.1745316587993;
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43ce2esm14951548f8f.57.2025.04.22.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:09:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Fix and refactor output disable logic
Message-ID: <72fd8919-8413-45f4-94fe-277719192536@stanley.mountain>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>

On Sun, Apr 20, 2025 at 01:54:16PM -0400, Gabriel Shahrouzi wrote:
> Patch 1 includes the initial fix.
> 
> Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.
> 
> Patch 3 adds small improvements by minimizing the size of types and
> doing a redundancy check.
> 
> Not sure whether to include a read function for powerdown as well since
> all the other attributes only had write permissions. I can also do this
> for the other attributes to help modernize the driver.
> 
> Changes in v3:
> 	- Include version log in cover letter.

Please don't resend patches the same day.  Give us a chance to review
it otherwise it gets split across multiple threads.

regards,
dan carpenter

