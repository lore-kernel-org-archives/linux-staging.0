Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D4C3A1BA
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862920; cv=none; b=boCYOxHPc7thDm9pCw/GH+QBaGw45SQ2awcNY4qogDlT+/S47Rtr7r2HQ6dAYoipydF6ldplQX3lzhql4mFOm6UN4AZ4QbrMUXo4R4ZRUAdnSS91QmMjtQK5WBoCOG4dc4lYC5KSLQgKh0elnIcagGNUjeRA0vdZQCe72h9Cf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862920; c=relaxed/simple;
	bh=Kqp+8zjqVnatfeD8Z6voyxBr0VEzpV2CX4mgWJKUYd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrDhZ+Hy5euo0xuQCzGPi4zW3wdRd0a3ec42ZJTKmzQklav70eHJJAFUYZbLGt9dP7yUQn0uO7uvEOxZwU78z+tGttyaWmAU6XiQpXx4OTpJWVXU6AChmE3qydtc+AiDRJcf825bk0TCm7RcLexNsN5ww6ezjZhgu1FKe9PoPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2ymRDn1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2ymRDn1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2490495f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743862917; x=1744467717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93RytDVxxoOt/6piPIaVVVkdD4eQVw9IESIfWY1biAI=;
        b=X2ymRDn1fP6q7izZvucCgxBIw9NQZD8gSkMsULmIZIYcX5TvBGDbeLCMpQBmL/quKP
         he1z5tbssggGOHbqJwdWB7ludBIpJsc4GwA3NOGlevq6b6QF+PUvAWH1ZdYrRB+zLqkf
         dCFZ/n31T4UAuhkPk1/g1M98CaAWza/V+Gaz3Gb1E3YMon3sv5Chsp3rAyp97WUvjEH+
         WqYEmKJBPfKkXr2wfvEFG+g8tJR8aa7Zy88G0u+cH5QShbu+CI4++pzdqa6hXg05/aGF
         HaO5LN5efS8DpbvfLrCl68r8zkuUtdsJiwbcro0V46EVibWp/hmQwRHhYLS+zo9jyD6M
         jq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743862917; x=1744467717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93RytDVxxoOt/6piPIaVVVkdD4eQVw9IESIfWY1biAI=;
        b=fGiJTDSuc9pmclnOl1Gr+CjbePfh6czX2wScmahQmv7k2oyjc8TUOjGSpDHupNFAL5
         Psd5DS5fy4qXLYNf29pqYM6FdH9QNcWp46qG/l0RrIYcZUNLiO9DRJ2sI1HdABWai/vS
         +e/FFc8UZUrls0Y2QxMYQjT9lXoD3ttefglVwp/sxFcEMBkemOh7cqhfsy22x3df7mB4
         JHtPWtuHYzKg1OQQiJnJz2u8GMp/SeVxFqfEJPm5QpMI3+Ss0QP75ClO6YFQNnQ16DJY
         8CNHEdPsdlpGXU11sUqUB1ZFDmtr4tAeivyYvOIP2jge1q6CtB8OBQAUgXWwASlYHA2f
         jXdg==
X-Forwarded-Encrypted: i=1; AJvYcCU5V4d2pLm5ZCfbhu3czh8hbabiq/LUGgshijUr4TJ4reO+m+5uODeSrrAUOoYjBBHfDX09kjzGdXVT/AOp@lists.linux.dev
X-Gm-Message-State: AOJu0YwTz173EO9Ng8wjg0NV2iN4mqtM5U7jfQgblkebaTErlCsLagVK
	aV8hXUtsCbC4aNYj817Mh0YxDSwrsOeKm7WSShIv2crp6hR1/s7iOY2/AnGQgjc=
X-Gm-Gg: ASbGncvREu+xBzbSE+j19yUylGqr/nwABZYfT1PTz33IdMIt+mWNYEHbxAb+i3fz7jK
	iRbUng7bkdZ7crVC32ZtFLacMxg9B9usELLdQH9nCzdzAp1oeAjThsT+72b9jmz06+UHNdV3kaY
	If9e/X4lEQIO63uLU/01zSuNGRxnDMnkrYWgR6XHBQ2rjYYZKeBuOOEvuuAglxfUVWm4MBlktBa
	EbGrDLWR2sC+A6OaqTYRhM8FMdsZVvPiALRhd5YE7As/7xXtyz7pauTg0EgMKYKxGouhsJ/9IIk
	uAa67jWS6tojQE3jC/UFV84QgDK9sBPMV8tTfs7qn5l+qNyZ+g==
X-Google-Smtp-Source: AGHT+IFocO7znkSY17jMn4AasMtMECTj12lcuX1S1TbaDW9YfQuYql/afhbu7TkfR9L/L2OMBpFrjg==
X-Received: by 2002:a05:6000:1844:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39d0de17bcfmr5308898f8f.20.1743862917467;
        Sat, 05 Apr 2025 07:21:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d16049sm89484755e9.0.2025.04.05.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:21:56 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:21:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at
 declaration
Message-ID: <aec43d5d-8f9f-4951-9ddb-03b66b1ce859@stanley.mountain>
References: <cover.1743820815.git.karanja99erick@gmail.com>
 <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>
 <2025040507-attest-hyphen-5dae@gregkh>
 <ef088d6-cec1-9758-cc0-55fb66ca952@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef088d6-cec1-9758-cc0-55fb66ca952@inria.fr>

On Sat, Apr 05, 2025 at 04:41:37AM -0400, Julia Lawall wrote:
> 
> I guess the first change above would be ok though.

Here is the first change:

-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
  	u8 queue_empty, queue_pending;
  	s32 ret;

-
-	pxmitpriv = &padapter->xmitpriv;
-

Yes.  This is a nice change.

regards,
dan carpenter

