Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EB387593
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259543; cv=none; b=QP+YtSdeCAHJt/gTkFiQC8rpqVcYsquaSTqB+B4uKoXzK5ViBAbdHHYCVn8dwuw+9riFX5xo7hzC+fwmS6kXQ8y8RrQVECLXkpRNGXUMTGyligwAQDHDfyRSo4V+lalT79maqgzXtwdFYNOGF4B8MSPLbhUYW4Zud7xuG/YUH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259543; c=relaxed/simple;
	bh=I1tZmAze6Xf15unoGLuUVsXje7CwQALweEPKeZ8ZsrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKXm5fhsGwRwl3basusTC6LgoqaSZK7zRMPh5jD8Qc1uXoaUsLHN5xl7qaQLQoacX/t5r0VVCdSatetMpE8DgmDpoq1ADLSaj7L7/1rot+w8UBLVUcKGLF1dTENrynONlMpDB/XYECfz4TfzeTEM2wVjiiB4Luz6B2Lqh0/FQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzgzFfg9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzgzFfg9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so24818165e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774259538; x=1774864338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+r0oCWy4UJs+eW9MnPWD/rK7wMf3jx0NjNJxmMT6l08=;
        b=LzgzFfg9uu4KEPkMp1dTKHC4FEfnO3dEtQJvI6owrvHlysZrXzleI7DOwz9HJVMyBd
         2IpljHfZqMm2wNd3pYL0Sgf5QmcWAoR+nQUqaA/mIdMj/QwkhhYcMHFItF1xLetjwVso
         Q8GZ2l+jiVBN/ngzS8hNvyxCmza1kUdnVmErgc8L0Qyu/+9Vl2fnuBzJwh7AQY6j89fM
         amP2uRLn+/dEDUwUfrQz2//AQ+OPSjX5FE86cX9MGL7hOoqTwmuLHTTiJxSY/ttA+QKi
         6lVdSfFmLdsKnX8g9AbfbkyyN9vpTumz4BkY3r90iIXFQSyts2AVnWQhyNjoZBP8qwzi
         GGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259538; x=1774864338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r0oCWy4UJs+eW9MnPWD/rK7wMf3jx0NjNJxmMT6l08=;
        b=nXzMCy7CdnPA71omJallnRPgI/m0WfSIR0gMXmQ5e8Qv3z5DelNy9gLi4l4jN5XcXf
         50Kc9EJWqxnn/2R3PQ1a39RJm+IW0NiNk32EePdAafP27JaTi/IteA++qWSuzR9hk8Sf
         bX6FJehYsfft3RfMqULMW++FLf62Z6p7p3WgquF8iti0FlH3rLWh/JAoL9fk/x3Zkgpe
         er0wRTHwWI5b5+ftLnC+iAgE7Nz3MC7hFcsaiZzN3icrSQkOwSFZ98W98ki9fXA1XmtY
         SyC5zSKmI8u+5DbEVbCYw/BswXOcLaP8c80b0mOvIUpDAD5KJCasyWWCWSG/PtDaRAeG
         Okvw==
X-Forwarded-Encrypted: i=1; AJvYcCV9WHFjNk6Z9W56vlf8Vx/+rLb9LbOW7F2+Syb3axWKejlUOAECvpbgZc0p2OylR41k8eb2jkY1kPOhZnSi@lists.linux.dev
X-Gm-Message-State: AOJu0YyC2Ew35OGUlPA8TZr3AWi4tPfPrR5no0mD8cxzk+CLnYAWubHm
	SfgNqgMDINkcUmIFhA//2ewWCxfBUBgsO9iMX3itg280/R+UG3kRZwY14Ocf6hVKRhc=
X-Gm-Gg: ATEYQzy+sibW/gsOy/FwAO+L6L3imhKE+imQ3cJdR7KnNcL3zb/rrz82TDqJouxA3Pi
	r3TPQq1UJhieE0cPZdf+nNh59hwMVXHSCyyYDmhrLXJozlk2cOOMRWGAk5YiFkKaOUTWDFutOc4
	L+Y6lBisKEs49NFwvnHM2SkebSfHsQU+HHvF0PPWpTPl7rByBC6N1AauQcs8Y8Iby2ivJ1H0oac
	YKG7Bw+QGapNRdh8r2a9DwEQ5uMSMR6SZF9p3bDS7XHYXfq0f/n4X3JBJCcLb0bPEnBK54Bu8rE
	E9F/EkxqTkpvtCj5KWDNISRn1CvHTHp97rtgjg778hcYrbJqjthiJZOkiuer8795G7VPPWH8JW5
	AoSpdDNHQ5vnaWiaKw5uS2j8s62nD0MngWjUPr1ArBhHU92J3Ru3w6Vo0GDsnCGtKSMTBrmrylY
	R6CZTXKV8V+tU+WEtepbnES1LUDxZN
X-Received: by 2002:a05:600c:6308:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-486fee0d9bcmr161121135e9.15.1774259538409;
        Mon, 23 Mar 2026 02:52:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm360434745e9.4.2026.03.23.02.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:52:18 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: vf_1.0: fix open brace placement
Message-ID: <acENTtTMsD-xca2O@stanley.mountain>
References: <20260323093024.38704-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323093024.38704-1-anushkabadhe@gmail.com>

On Mon, Mar 23, 2026 at 03:00:24PM +0530, Anushka Badhe wrote:
> Fix open brace placement on function definitions and control statements to comply with kernel coding style.
> 

Line wrap your commit message at 74 characters.  Also run your
patches through checkpatch.pl.  (Ignore the space character
warning since that was there in the original code).

regards,
dan carpenter

