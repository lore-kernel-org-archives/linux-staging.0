Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEFC2DC33B
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671101; cv=none; b=pCMspKd6X81218t5mqmWxeGS4LPNBprf2jBBCynmRlYvX/5XYU6UduJovlfKP+smXDFppV0FpaohpHh0kU8duEV737FSdFX6jb982uny3Gj52cn9dTCFBSeQOwC8viZrlQSk5h3dfmRF0MuWf7/qjlm9v6ZAK7w55snjHf5NxjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671101; c=relaxed/simple;
	bh=gfJOFbS/x4QwpaSLUg7POBdIrx191SkLHhDIcDPqUF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAn907JlLwB29QFeqWerg71hySBFcqKRX84OnSHnEO7L/hZW4fQhsuGleVKbhqIlUFnYfUm4mgpDBuKZkCfG0g9qDl11AlRtYIXJSXOI8Sqo26crsvs+tk7vmI4+TW3ZgRCBe93IUHdlxdToXOVXZKNgpFVUAioQQraA597SPTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kr5H3S7S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kr5H3S7S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso5777045e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 23:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769671098; x=1770275898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j67315wP/PAtOPAFcjYrzFz8uH0iEJBP84MIB/almH4=;
        b=kr5H3S7S3iEWbY6sQA45BjOzcCiHxSKmD9OMDHxX+vrfOqQ9RH88B25GutTaCtXo9H
         2ERY9t8P2U9IqN+PPBTEQCr6hVKqlML+Noft65SgjWMZuOR4MrikoQomijN7TKs1DplZ
         GSoTjoQfbOk47U2PzLbp+bNsMup5lUFnIevh17YE76I1IfDw9FAaS1FUNDCLRbXmnD0l
         w2pxQ62T3/pDXyJaZ/PLzlI2OqpGU1TY8NwzfhqMgphZslFtZehZtnT1mBRtGcCIqyBM
         OdluWRMllTkpWFGJZZNl1DeKGYDiPO1LKDvgMQ23qxjrZhiNat6Gew8nkmiv/iXRT8z5
         98uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671098; x=1770275898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j67315wP/PAtOPAFcjYrzFz8uH0iEJBP84MIB/almH4=;
        b=SNm65HWnPa/bbtAskJAaVitJbBnp3LPeVJzoPcWUabIEd6cRmiSYNrkxvb64bmh3ri
         f/xWK7m6qs1mtJVZ/7dLiH3SM//FxT2Wrf1lzOn758rjC7P5t9nVAoQoVF1YJkhKh0vf
         TzZOflYiMtcO4vNIFrC9S6WSW2kRCk9OVCZykaZizTmDthxy4bO8/n88zZejL75mcSzu
         Vmgo25bI4RAHbrtE1H0mzgG69SoY9eQhBm/gh37NFyWHlg5afLMNPT7Cu97MD/+Eszbr
         TozpBD/oaZz8nzFX57sNdUJT2X0T7oH9r1NTILK/HKbuEfzR/zraGmitJAr/KzJH2V87
         /iEw==
X-Forwarded-Encrypted: i=1; AJvYcCVzqo7CF17DXRJpE1+fzl93fdtGoM1PLHdV4u5u7c8e0RTU87kLl2QqdjXcqvjtnmOkKyiPRnbDAIDAlwbZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxfVlPoO9O22E1Olftp7RgmKNG/fa2PmWgK0XhdbgbZV5bhVrox
	33fK+8qUMdHryIyV6NyNJ3+V405PyLU93fnm8Ie6rEZ2GqF3WVl+2BKQyIQVkymrvh0=
X-Gm-Gg: AZuq6aLtbyAesMRQSCN+EfT/N1ZKpoFJ7ICdWRr9geE6VuwY2Vx9iVKthwzpIs0GTlT
	FBkIx6/zgzXH6yFkgN43dW8U9wFEV5lSdyBosk763zCswwGLU+NEKW5VIbIMt5MuZXQ58vhhCfr
	LU+smm/hTOowIbSSWcToBdCKmdNALNfi5bMNlzPBoaeMbhLfSWTrsT3ew2L+FpbbNmNdyV/PyN1
	JuV33itpxJcuQThxKNvlQhGnf9BsxSU+8qamkvMz2uEjfGuZCcAAjzmNegmAt4MQFb3ZncgiQl/
	LzBJtp+7ZhOL/RfFIsiDwNf80pA2b0N3KejXYBIIZ4+looNjY6maQz/qOfCL+9W31JXUfa7Zs8b
	ESMyhCOW3+1AtOfhixwmabrzB8gHcDCBmgCwkK89yi6CMLZB6L1vDgkZhiX9xRqZKmalLsyj3k/
	dx8VZMBJl3r63o+f3p
X-Received: by 2002:a05:600c:4081:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-48069c1b310mr68839175e9.9.1769671098475;
        Wed, 28 Jan 2026 23:18:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm12593628f8f.4.2026.01.28.23.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:18:18 -0800 (PST)
Date: Thu, 29 Jan 2026 10:18:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: modernize hex output and WMM
 check
Message-ID: <aXsJtk6FQYYMcf0O@stanley.mountain>
References: <20260128171635.39879-1-lukagejak5@gmail.com>
 <20260128171635.39879-2-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128171635.39879-2-lukagejak5@gmail.com>

On Wed, Jan 28, 2026 at 06:16:34PM +0100, Luka Gejak wrote:
> Use %*ph for hex dumps to simplify code.
> Refactor WMM IE check to use memcmp() and validate length first for safety.
> 

It's great that you are doing this, but these are two unrelated changes.
The "Refactor" change is a bugfix and needs a Fixes tag.

regards,
dan carpenter

