Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98A51D556
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299061; cv=none; b=VLMaCK5hqm5SEDO6dSsno5lxJ++eLKk9re6o2JyllgLwebW4Fb34R47eeuwv84Eb45cVZXSplgcUAZUM4Liu57XnHqYae8sKy5IGnmqpTmlapVrIurXFPJTtHJrTcBzre9JGtlZsovpulIQvuqtSrhnVaWgyFSwWAZLrN0X2Lrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299061; c=relaxed/simple;
	bh=bgDz6g1gPJNOWXZ0pJtwEJayVj0AbYJFB6CCr4Jz4Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ5YNAZsQr4c0YkX95IRl2lbNNLuWUkgAIETcrk9qqtQv+20vGIJjrhFnQ5p7d0bGA1XANzmLoOmUeS6eugqvA+Y+DOX1xK8skbJ6T3cJDS7CbX+tJNLNJYHpPSW+VTdn+96AZIMuYNGN0I3ystCpGjlpjhbqOMiVJF9qrHH/+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6Gmcffh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6Gmcffh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so2648733a12.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Apr 2024 23:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299058; x=1712903858; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqDAdsVeoyL+xrVeF88k7hXSD8XUa1tRXZUSMSa9TIs=;
        b=B6GmcffhL5N82g3olCswHeCCTlo7MVI362hnXe91k4Z4v4aSB6ucwJQD95vtTqlV4h
         m+FypNqhpqr/0eGw/avZnywbDu3NRBm7EPjimHhuA5lmn5Ep/ltQdhykoL8THfpGa00e
         vYC7C1JIKzWxtRTJi1foRbUe6g1d2PFxjjhVEhbVzgyaZ7zKOxZRlCtDsJ+Nblw7jfJV
         wARAzHsefRnfKLzxciBn9IclygljqdFz2AEkqScXV24s6/ja7CM1caH6FrinF6jbHKq+
         NyL142d4jSY2z7mo3SPHDGpYoF4I67UH8DNJG0u3yuhVLI5osz1Spy7/c4MoMSg5dT0J
         bXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299058; x=1712903858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqDAdsVeoyL+xrVeF88k7hXSD8XUa1tRXZUSMSa9TIs=;
        b=GcPT4oSGjQQeiN5PhDfc5kKd4kKc7pTtJXa7xTInxp+IO0SwYES1rWTlcn2bgDC06o
         LcdFg0r6LH8om+fKlSCRBUx66r9AAgugSccl42SRgkrJ17y1VreTQhMHDSVfX/Emu9WF
         kvP/btN3ZWBipBu8DHTy6MjA9ALZSQG6byhcG6CCvwimFSiJd6YVv+CbqpF9ZzsNhKIH
         MbpH8DZkAk58mhytss952suK3t2TVDXiFQtqf41e1IaOUI5omnK6ooyQ0IsX5CRLKBoV
         QmwYWhOP3NxTgwQDawUtScpftjYqlYjsJ2DWdHF5IdGNQzS2PGmGqP3McJedZ7Kh1hJu
         FCsA==
X-Forwarded-Encrypted: i=1; AJvYcCXbBfO8Ixdp5u/o42Z204B+1HqgarhPtSkr+IDVXgyfDxqsIm86MHJ4XIf2V6O2SnlqtGs2VHtjrlgcaU2cOb6P+ku5m++TiLnMTMv6BQ==
X-Gm-Message-State: AOJu0YxYifK9jVN9+rbRRiztPadi5JyxFw3a24Kp0MZlgDPtRE061vL2
	EtJI6wKGEm8BZh6mVfReMu+5PolWDHgVB11YxX0Fm9L6fX2Pc3rQRiA4YvbPqCI=
X-Google-Smtp-Source: AGHT+IGRBLADwlM/3DSugja9cczPOJ/v278LOwFQQ9RMre415HD7loRF8XDyKXmJQQvheswnKKB18w==
X-Received: by 2002:a50:d599:0:b0:56c:5990:813e with SMTP id v25-20020a50d599000000b0056c5990813emr364888edi.13.1712299058070;
        Thu, 04 Apr 2024 23:37:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h13-20020a0564020e0d00b0056e34297cbasm72015edh.80.2024.04.04.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:37:37 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:37:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	forest@forestbond.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH] MAINTAINERS: vt665?: Replace Forest with Philipp as
 maintainer
Message-ID: <cc0b2d25-e9d3-47f0-b22c-24f748ad8ceb@moroto.mountain>
References: <20240404202450.GA23408@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404202450.GA23408@matrix-ESPRIMO-P710>

On Thu, Apr 04, 2024 at 10:24:50PM +0200, Philipp Hortmann wrote:
> Remove Forest Bond <forest@alittletooquiet.net> as maintainer as this
> email address is not reachable anymore. Add me as I want to take care
> of the driver and I do have vt6655 and vt6656 hardware to test.
> 
> Link: https://lore.kernel.org/linux-staging/d599cd7b-a5d6-4f2d-8744-10254b75f7e5@moroto.mountain/
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Thanks, Philipp!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

