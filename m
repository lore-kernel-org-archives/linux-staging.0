Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378028E34
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313278; cv=none; b=M7RKp5OUFQU0csHGZz/ynBwgvLBY1xHclkBBctPX3zObqG0tmHEYQl1UoeFh6QAYUDQfFZCadgqFM7rYU5mvWRF97vMiRu81nAhQ3byCVRXrEjWpsQDDCmkm0KQnSbLO37R0io88jpvpz4ut8VYng5RAr0WxEApLR872LFIvxw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313278; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFw33kj43fam3lCe1+Cf/Eas8D2qmLjAXwjQFB3448qZwvp1uE1iUDkwpICQaALDzgnOOnNxKe1TEE19YIpn9YuB+BNbo4s9TO4mQ5bK8WV8AD7OW0rFy3seS3+HP+mECuHLxN0I9hzxagGuxoDfW0NYpnhH2ajJUPpbniaOwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vED5nZEA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vED5nZEA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56e2ac1c16aso1186676a12.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712313275; x=1712918075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=vED5nZEACQ86e16b41/4sVPVndK6p6UBwTPulYlDwbVtoyJ9q/mIbadMHaNfy4mf+d
         054Idft7xvKRlAbFtkBQsBLyeLY7ia0xrLck8vZQmbIfcZZcXYrdrkzrCz3MoKfPozJI
         jvnFZMC0Gp+nX1bXmp9TKoyk4wdWzRRdytlBQaws5beaS3FR9qKrc+C41Vwz9o/4Xg7h
         j6iILefH8vhXD+Ub+HADqCkZHHYtVS1pBDP5lEB7a2qPUJ15Bvrvbk/bPzqIWiKSiKhV
         mvb/0KBr+aXjQ+v0J3qGEzzFyV63qs67lrdCHjLNFE/mK115T/0LEeFI+E8TvLpalprv
         RtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313275; x=1712918075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=ddelK1EmRyq3cv+0ZKDFjyw6dULMia6EyCcF/djSwgBr7LW4jhz3asKEXWH8BT5Nxo
         606b0nAXSCZjRlR/mUXo5SzymWF41mNyQofBQOuxfYTlS0wUZhuMnNCQB+naQUCvUs0o
         TZoQQM+OfIDHLoW2Kpx7rXDfJc7OhrNpO+VL49VvLy/TrEwfsGJ7wBKFlXHPtZnO42vL
         q5YOfeO7bxV1ssZnw9Y7QsATBbAEAWhNEjVLEaQf1fOEuPL67OvPeTT0cC1/IaPv14Mh
         q5yJTMFz9ehgyV92bEHybXmupzdF26wN3ZaKMYq3RezkLGE6+PhbyJjkgLLRMLIKy7p1
         Q6mg==
X-Forwarded-Encrypted: i=1; AJvYcCUpVIhAzoPmXUxXyN71vZnKWkadJxcIpwPHJXEVVZu4nzZD86wHF1Wq7URRw3R10S05VisDAXrGo2Fmb6NmWr46ak5NP82QVMtNGgE1zA==
X-Gm-Message-State: AOJu0Yw1BNRSbYkV4orKPxAIGtnzgk3aWAmpjLTj+jcZ4d/c44fqPhTK
	FeMaXfZcOoRZwOMUuI9qqqRmBzl/qxd+d0JsgYZImbk5RPsOjI3FDLKJGHUGDpg7+PsxziCWhph
	+
X-Google-Smtp-Source: AGHT+IGRtQuOF6VxMAza2Cyl1XCPnfmisCkY/idqQHtJmUn1wqBML60U9vGFXtOnfI/sNbHots1E5A==
X-Received: by 2002:a17:906:b849:b0:a51:9f3f:3042 with SMTP id ga9-20020a170906b84900b00a519f3f3042mr630592ejb.1.1712313275194;
        Fri, 05 Apr 2024 03:34:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p25-20020a170906b21900b00a46c39e6a47sm677153ejz.148.2024.04.05.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:34:34 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:34:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] staging: pi433: Cleanup & fix potential resource
 leak.
Message-ID: <a8dda2a2-0dc7-4f44-862c-f282c1856af4@moroto.mountain>
References: <20240405074000.3481217-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405074000.3481217-1-ikobh7@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

