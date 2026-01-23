Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A02D94B2
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158632; cv=none; b=k4kaoh54LkYQahV9j9P+yFbgAM2mmCGMl12eNX1JLTGwsr0gWNX1Q1R2cm6fY77ArCik+JrAEf08tBP3ykGSBpIBPx7YUIuER8o4DJak6oacq2pxs9k3WD5DQEUIegBO8aVam9NdjLw5hooYNnX+BF2c7dW7FP0Qx8SfEXwo8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158632; c=relaxed/simple;
	bh=in2+HbXL6vJZGvl/5y1AduWFMILMPmL+sKkvSbTV0hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHuLr3fGImnR8OT1rsw/OYK3w2D2SggaszMKdv9cnyWpKhEY5Tp4HnlV2U0PbSexzCP+3OINRUSgehwe1Cc+Cx2RjJr7wV/EVyw+BwPNclNPeVItmE6zgsNOU+nE3Rc5TevrQezW6tqvSwAFidbL+4IxqO8pc2cV7fOlL1yPrbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMHDBbTo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMHDBbTo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359108fd24so1154122f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 00:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769158630; x=1769763430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OpGV0KMqhrPi7c5LKp7937Xrcab70gH+N2HXs8/3ITA=;
        b=xMHDBbToObvuXKgP57hBoLm53fm000M4XADlRIFXL6ZZ2NHTWuTsbao0XXSQPCHxBw
         dHda6ICm6VIrqJMoGBaCVWi2Rsg7rRADQFTCEosK7ffV52JuQDBMRHD5ouYdXftBFIYV
         rGOHcxNU+NLl5kBxvbFI1GnqWR9xYYuq4xKuaqF7SaglyPZh2qY2DVj6Um2xVV0cXMLs
         RZWWYsMcy6uBjwZm1LWnS31xgW7hSVZHekb8nNmsj0UGfrkIhiSUQ/XO0hCN5tjyJmHU
         tIxL3CBg2fVsryza+nQgpkXM026+t6WYGTXRAnDv+KeZXiCgBykwxVeqRj51S/fRLzhA
         giZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769158630; x=1769763430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpGV0KMqhrPi7c5LKp7937Xrcab70gH+N2HXs8/3ITA=;
        b=Vba0tCCl35bePUlNYhXTfFxowTWJjS+YpTS0wBQo1osTBnwSl92DSgmy7m6dlRbaBy
         m7nX9QL7gvUzvACpAskEvU3WlXEQQNSYTfJyLmyhSbA0h8hUGQFHgzOtdNesTuLuQ1T1
         97TZYBOQR4avkgb+bgyRD+qV83xVCpiJbHUTlxjXiGo32YkA1TCzNk6i+dMR+fKJPQQn
         tS7O/PYdhJiaznIrPyv/m5U5BHBgCaYS7sAA7C/59IzTQy5U8JDqGi8YlplOhHXJ1dj5
         BrbIDgCrEibWuQ/ol8N6Ik/bhMtk0ZD62+8fI4r4XLWllKfsMFpyq9JksteQImy6cSbO
         zGbw==
X-Forwarded-Encrypted: i=1; AJvYcCXRUGoaVRuRxpH7QAdzxjBz8Fx80kT8Z1QeePD6nx59Ce3yK4tQrKJtf95tBM+6MmQZJvRghN7GRG4l3+85@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Y9wFOg0OkW1z4+Wqncvqd3hHWx9NcxX1Z7RPAtgfuX+zaPCw
	3MKxNh1e8eOpeSqEsMvpTPO5+Uhdl+yapNAUQoYrIFLvWMvMpyu93Yg3+D8K4nD+skE=
X-Gm-Gg: AZuq6aIjY/38Cnu/uFZlyRwmasocXvRReWSz+VjpSqnsdQ0d9HrHpqgjFEHXWeBBBjG
	yIneQENEguY7iMZGJ6jKzazD5Fpte+XjpasFj68bXEvmckx915vF/nCaTef0rbpZFYDpJNEDGE9
	+WQy/p93B9r1kDJBoIWiABsYCH5CYgf4TLg9rI8tP3i77mQ+/RIiFwH1pks8aSwINabYIE7tBto
	MfgjppVZZpkK6faBfEClukGxGxKvx052ZNDalYxtkC2PQog7mhZRSGBWSHr+TjvndQ3yNBxKMGr
	r0W3sIVsiF1ogg7T4QJK9R3lz8imENqXAxvizIXm7kgitzgk1rtae3tU+9wXpOLJmIa0qTUzhY1
	Grc+kkt/U6o2CjyF4MXqorkOAXtWEzv6h+UfBZ219FinDivVhAW6tXIEz4teWmvCqak8TCmtf4S
	yUxQYvLBqMKwq7GZd0
X-Received: by 2002:a05:6000:26c2:b0:431:266:d13a with SMTP id ffacd0b85a97d-435b966a659mr869750f8f.48.1769158629521;
        Fri, 23 Jan 2026 00:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm4865119f8f.20.2026.01.23.00.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:57:09 -0800 (PST)
Date: Fri, 23 Jan 2026 11:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in rtw_mlme.c
Message-ID: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
References: <20260123003205.33898-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123003205.33898-1-tehsiu.huang@gmail.com>

On Thu, Jan 22, 2026 at 04:32:05PM -0800, Michael Huang wrote:
> This patch fixes several checkpatch.pl issues:
> 1. Remove redundant else after break/return.
> 2. Remove unnecessary boolean comparisons (== true/false).
> 3. Fix trailing whitespaces and overly deep indentation.
> 
> Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>

Split this up into multiple patches.

> @@ -1560,10 +1559,6 @@ void _rtw_join_timeout_handler(struct timer_list *t)
>  				do_join_r = rtw_do_join(adapter);
>  				if (do_join_r != _SUCCESS)
>  					continue;
> -
> -				break;
> -			} else {
> -				rtw_indicate_disconnect(adapter);
>  				break;
>  			}
>  		}

You accidentally deleted some important stuff here.

regards,
dan carpenter

