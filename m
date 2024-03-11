Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF13B65E
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 05:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710135997; cv=none; b=rDsA5s6GwmYBoJ3EMf/Mi60dVs8nw9xC0zxCfgXif1pcvAKMSLSLI7SP+Ov5oHAnu9zZ+1z7Bw9ytAKFtqAtXbYAMMCl2GmhjQhKlUG/c/cRvgpgc7PS4E9OJ5UYTrM99QVKey7q4SfagkVgnwehqZYz7hiXcyibhDNInkrnqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710135997; c=relaxed/simple;
	bh=HVp+EabxrxXpNkPn3sVxMg9o3qy7Uyi/s4JAK6msidQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evd6+afPTsm7LizpUMBEe4QNO+sZn2zGzWa7IWKdlE1gB468sh0WToKWd7C8Mx7e8jajMEhhcHW0g68JPsN2PI+3MSuyDaM3cHTOaVJjjFGHt1/fwNq+zdgZJSQsRVx6ZjrgmcqjITJ8SIkl8UvsBAtkQGCruHG2kN8gdDzSQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HIJttopD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HIJttopD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e94c12cfaso667912f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 22:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710135994; x=1710740794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=327rl8h+DjHuml/taqaEmFnNyrej1zLzW4U0qKa0DiM=;
        b=HIJttopDTm5x/75y7cK1byJp8iVtq8/YWtlhudxZun/Ypq7vMoYQUf3ZJqHDZnKFpF
         bmgfF5PS+dVUQewhDzhnnRUFecqzXi/HsJOmhjFBeZcfhdx+l1hfuADg0VEqA0b3/zrP
         TSmDYNNR0NPjia6OALkqcUZ8JSc5Ar6YeOZXKYEIw6K4WdQRguyFT9B3EBXRNyTL9Nl1
         rdu52tUmso1L/VCWoDJtEa7BOTbHrazPt+IUe/8ZaGGbRo1al7swd/ZRv7A0Fpl+yegn
         SjkgxcelRNhu7PVRzMLy90RrPHE8JMFiVWEQ0L6hCzLCmWLMMVujovpjSECNyabYnygT
         8AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710135994; x=1710740794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=327rl8h+DjHuml/taqaEmFnNyrej1zLzW4U0qKa0DiM=;
        b=Ws3Gk0/rhGwimQgppZoF1Ps45Zxqp7IzFAR0Lcsbp4ns/vrcCjJYuGT52hAwGFmBiF
         GFrchIeP4ohE1HcUQ1dtffGPx+0czRk07H1MUfG3pUusLV1Fga7VRBJxR7A4ULIFMeNr
         v7QaXPs0IAFVPwdlCfufQzQJ+4dAIUC+UWUAeZgI9kZ1gKNlhDOzKF/EUIQr8BuGmWOp
         6aDoES9W8NpdCTP07W3fE37pL/UhjH9TBnrcYTRDplbd0IV1fcQ46AWrUk30y+MCqZNs
         +PciP+TEJRjn/ApfWmyZOPOf4qRVA0RkleAG3BHG1pgTLG5tUWkX5i0BaBIOq+Z5bDZH
         joFA==
X-Forwarded-Encrypted: i=1; AJvYcCVxONGEBwYNIddyGFxUDFUIZDfv7QLIqhwGbbslAtDZJMBQD6EPzkxljSwq1vJilQCDG2BD1+Jdd96/jDxjmZZpXBY9ekQ/MX8hxbbKxw==
X-Gm-Message-State: AOJu0YwPnM7+0GFjb5BDzlVOWNN+QXgm2gg7P+A827YdPWUouFeqogdM
	krd3HVeyVf8YiXG3izqS5w9k1/EYoY1BKJppGi8Rq3LdWzWEjP+VA6GB9erL7PE=
X-Google-Smtp-Source: AGHT+IHnjC0E1HyIX42cMzjALbNKWwqO+fEGxthhFEtaXWOcVHCvfqlABI2TddcoxQ4uXEjWkXgY4g==
X-Received: by 2002:a5d:6345:0:b0:33e:1f94:7aa5 with SMTP id b5-20020a5d6345000000b0033e1f947aa5mr3569534wrw.54.1710135993746;
        Sun, 10 Mar 2024 22:46:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j10-20020adff00a000000b0033d9f0dcb35sm5400569wro.87.2024.03.10.22.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:46:33 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:46:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
Message-ID: <7adf469b-0d68-4fb5-b923-6031c9e91afa@moroto.mountain>
References: <20240311015601.17428-1-dorine.a.tipo@gmail.com>
 <20240311035649.25043-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311035649.25043-1-dorine.a.tipo@gmail.com>

On Mon, Mar 11, 2024 at 03:56:49AM +0000, Dorine Tipo wrote:
> Remove RFbAL7230SelectChannelPostProcess as it is dead code.
> 
> This commit removes the dead code to improve code cleanliness and reduce
> unnecessary complexity in the driver.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changes since V1:
>   - Removed unintended blank line introduced after removing dead code

Nope.  It's still there.  ;)  I think you sent the wrong version.

regards,
dan carpenter

