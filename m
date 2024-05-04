Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876551B812
	for <linux-staging@lists.linux.dev>; Sat,  4 May 2024 11:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714821491; cv=none; b=KNMTNeih3Nft9/kYKl02Bnfge6008PutZUyEF7H4Sigzh2LDPyyr832q0WuPVazqo+T9/IrE+LDsjLwHBzk2Hdu5gSLZ+HmaBtl02xow6nD4U+gp3D7qVByICJvbhAQRlcqVzxakkiDGT5gdsU5hfzNk/uNq8wAaaA0YTonSbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714821491; c=relaxed/simple;
	bh=smELU36PpAU3prIkce0be7IjpSNr4t5xDRxPzlw1+z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDDewyha8aWnpdEacbXBr6lmbtyvee9ACnvxuzayX0gCRX5Jv0mbDTU6yNbAdqrQAx59+rOVdcQMdUO4gKF2sQT27IYRBWaSi3v8xAEWs45k92PrpmNrCk+3MGmXpg6p5bQ1O2NNDkCYr9K4MvDZfiw0TdC50MCZoIMyH10rddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPVzYb3H; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPVzYb3H"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so4771741fa.3
        for <linux-staging@lists.linux.dev>; Sat, 04 May 2024 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714821488; x=1715426288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yv9FzWOzBDzyrTcS40BSQArXvrw2k2j9CKdjQ6IcHqo=;
        b=sPVzYb3HououVvbe/Nb4Jb1TljNFlVzBw7DEefwdqK5vfmM8IFrr/fBii9sjg7RPto
         EoPYM9jCiOp1pa6tr7FJb8CqUbn+Az3zOM7Uxwa3nF2R8ugb64ufMBMYmrHjSwLaV14x
         YUDYEa2yciA5zsRMxVPQPdMc05HSqknm8pMWVeLEpFYReUhkj8jbczapoNCY6GhIekRn
         RH/GlYPrirA+4xq/3AZZMabMfu4idpKTbWlTq1JJECSFSTqxkD92LqUqjzI0hQ61u2J3
         LAzpus3XUE+O+g+Rbgxe0y7ow8EopWyQqIScvWl7CcAnZIrt6qQWWIoOPCDdfzCjZjCe
         0aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714821488; x=1715426288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yv9FzWOzBDzyrTcS40BSQArXvrw2k2j9CKdjQ6IcHqo=;
        b=XT+ebR1P7YuRczd5Ex+cjF4lQu1ph89xx6mVA1zfNgLIFtJZJDv6M4t0ox2wbVATFq
         garlVe0yXcoo/HmVkYkks/O9b7U/MfBnxqKInUjPNf3voG1LHiBQShsrT119+tG3Qr4j
         w4VYgYBtLpHkyS6sWHDTnRh1xMOEtCikSzdXHV+wB91vT2ygF36eic+p6kg9vRs4UjAl
         JCtNk0Zie3YQbVTKh2/KGFaMUUmCtYan4lmSxmk4Fwx8Iap+TyWsYEVh1ddVySPCgcF8
         MydN2XrgTybQ+mvFrIqph2hJqqDiIW6QhsoJnVVgVQJJS2bkDCs8o2OAUh6OlHm0HCds
         W/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVzPeoi5SQO6DK47zML0u9wSYmhmRQtNEIjlT+sU2Xk1KCiACwa/FSYXbEmmUjx+1ljTWjFTVxrQ5aBxKRF80uQ8rczeL/Ztq/ggUeZkQ==
X-Gm-Message-State: AOJu0Yw7YXfb9BGUU9ooOz1J1TCoqrNzQwqfKJ+WdBT8hP6D7hMmbX5E
	ml5w0IHiSyChAkdGCguyEC53CHqEhkiKmfINz/juAo0bQBfuuJ3hHw/PjnKLyKM=
X-Google-Smtp-Source: AGHT+IEggVHErInNqsEkGN4lf9Fm25s9yd+oVBzpPNb90IQ2CCo7mKtWyU3ysBaUz2WYQTnosuIkqw==
X-Received: by 2002:a2e:9dd4:0:b0:2e2:2791:9842 with SMTP id x20-20020a2e9dd4000000b002e227919842mr3499876ljj.44.1714821487428;
        Sat, 04 May 2024 04:18:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm8916105wmb.42.2024.05.04.04.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:18:07 -0700 (PDT)
Date: Sat, 4 May 2024 14:17:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ashok Kumar <ashokemailat@yahoo.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Subject: Re: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <45366e52-47e7-4e9d-a2a2-7eede9d3b450@moroto.mountain>
References: <ZjRDUO6/M+RDCcQJ.ref@c>
 <ZjRDUO6/M+RDCcQJ@c>
 <c8d24241-1763-f7b7-4491-2e5aa3ea3be@inria.fr>
 <1389558595.6771301.1714753224419@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389558595.6771301.1714753224419@mail.yahoo.com>

On Fri, May 03, 2024 at 04:20:24PM +0000, Ashok Kumar wrote:
> 
> Is there a list of exceptions to the checkpatch information that we can ignore in general.
> 

For Greg's subsystems ignore the warning about extra parentheses.
You can search on lore for if a patch has been patch has been sent
before.  Otherwise ignore checkpatch if it tells you to do something
that makes the code less readable.

regards,
dan carpenter

