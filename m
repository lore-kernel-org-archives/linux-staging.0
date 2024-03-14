Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC125B1E8
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710415187; cv=none; b=h//upEZsDEdPaepA0q3hg0h1sIjhZ8IRkmq0iIkY2Djv0wHS+flMgrddOL+g5U1R5x3QDY5PGyaqR3Ug1giz4giSfiitytiy9L8pNVbtgAUO5XCga3YChw9T8MQfiD3fWYDUzk9nFPMD+bWpNdDc2hk1/HJSDPK/GMQaHSEMF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710415187; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrH2m9LxDLrORbg5lPJ/QJwN7Cyb/TlOSLuFqYQ04Jd1aZvbb9v5M4qlhPHoSorJ8vp3/MKI3edx34zoo46+ynpwT7vMMC/j0OSNAorw8tmqhLJnMwsPKn08d3Ab2mWwyRPpjXwQBN1GVixTuEAXMvsvvJtboYFpnVITaUCWaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reDSiWuG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reDSiWuG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d38c9ca5bso455359f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710415184; x=1711019984; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=reDSiWuGiqqkn47ZmKWpo0WMs+9vtfEdA9eduKu1AdHLeAJ2a7s0uf9H2w1naXdBBp
         yyD+Y3t0DeOAlQtz8mZFrAfCnzcsGKwTqDAPhSFWJLReaP7icXiwpYgaBf4xb7ZDVpxU
         nQLQAlR2RTUQiapWC2yEML3KeUQqm4C+LmVeT9OQvskWctE0L2k0ltBWqYQ1I2jQzEPl
         2XqxNIpmGQ1IWG7N73GAc4cB7zUoJOX2EcdRMbxeudgYksCKUgtiugEUCpVx8BgAsw5y
         2vWKcp2jFXz3gk/Cj1mPzUCVttp8cmkJfn2UIaBQRup/o50EBCjIAvqHYuYL0NS9AV3m
         PDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710415184; x=1711019984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=YP+VZpW3U1ankeY6s9P8D0u+HVYeiXM858dbV9aU8hQf2m40NFMfISvTiiO60H6KNw
         SjATsoFYfmTcQq97XiBrlzPhxn8rq87ZFs5kaR36vdynoMieTho5TUaZFfpRdVywYCR9
         ca4P7DpzhSZp/m74zM7O9nSN2GtylEB4dE6JjCrWNnXLK7aR/6TceDV5jCLo5WZNMF2s
         48Jd5QTHJ6AWnAOmNXyg1QtqUrLrnNdJWRvpe9hspwtZk6OqNM3/MVbLXwx9aQ1LfwQK
         2LUFjz1h7XtoQkeQn1R+lXqXaLmAGTtHpoIZfmX3E8ppSvVOswl68HQ54VarWAPM7GNZ
         pvow==
X-Gm-Message-State: AOJu0YwxJwlDU0CkxZB9fbLUyaxQIIl5jKb3PyudwKmvPFglUOA59xjB
	uwjl80RPKh0ClC0LTKcYP13PtWFRcv+ibhPtOvw7kgUChMYV0Eblv+yjnTdMOX0=
X-Google-Smtp-Source: AGHT+IFVkW82gSBYlCexmg+Gy5h2aW3PVKhjpagbq4tsBirnlY2lt8NqNmIe5ovV6PPt2j7UscWg+A==
X-Received: by 2002:adf:a2d6:0:b0:33e:76df:4038 with SMTP id t22-20020adfa2d6000000b0033e76df4038mr935811wra.39.1710415183596;
        Thu, 14 Mar 2024 04:19:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d50c6000000b0033e891d97d6sm509353wrt.107.2024.03.14.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 04:19:43 -0700 (PDT)
Date: Thu, 14 Mar 2024 14:19:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 0/6] staging: vc04_services: Drop non-essential global
 members
Message-ID: <4ba0d745-fc8d-4886-b71a-1f19962e9103@moroto.mountain>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314100607.336009-1-umang.jain@ideasonboard.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

