Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43912E73
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710309692; cv=none; b=fkG06XCdmhh2iPZcBWJo6E/qyq4j6ZQv7RBcSSbJvjhs+u2H4AehxPBsfaI8ZfXamWnBRcOijv/Fkp17QIFG4Ixqjhnl/AIvQtf3+0PwdgLgkLIbKt41KoxsUj24rQF4U1uBo0GIDmN6QwUKPGe1RRQdPGOPqle6vOkBD/4oTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710309692; c=relaxed/simple;
	bh=O7Ld1LYQuGJ8RYWCmpDuJpHzxK88sA4/+eP0rB/C6NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvRgMJQA820PzeT2bmSpMHLbCVRoL1Tr0weLZVMT2BESrorRYqB3qITqSYy8R8NQ2554MbwQrbNdlA2w5lVivbSDLlylF9iaq4ttfiNQjS25i/gYBPmX24V3szz4itBDzwuxHioWTJRA2slBTckS4QQzKot3jaXCtfDripHxPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z63HKsWT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z63HKsWT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d46c99eb07so2157931fa.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 23:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710309689; x=1710914489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4s+BaYXL4bYNZRyKaIQNGvRcYz7+hEua7FGBCwivZE=;
        b=Z63HKsWTvepfOiCArl5zPHsrgFPY2Dc539ld/lSVTw34Yc2xeEYHU23pAA/p75J/P+
         9o1c63HlxgRHJdqIEO4glqH52OvDW7HB7AgGHcMij8kMQbEtOkFtnRyo/PXNH9orllE/
         o8iGRP0IE54eacixxOnG+jcY2Lg1w49VC1iaGALHEk2vKapnQlO8rRmseQjyLo+89D+J
         z8xNvg+cKSD/bEQzkR2VaYLVivtGYBysQI70h6x0Uc39zdRHy23BPcSgrREWw8tyvyj4
         PgfEZgdY6QDVi5HjMcbagAtxmbUx3nuxJFor2OeUH/xQWVqS9XTM9rTZV/j3GjH41Vm/
         aXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710309689; x=1710914489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4s+BaYXL4bYNZRyKaIQNGvRcYz7+hEua7FGBCwivZE=;
        b=c7WWinu5gRUaQJXDrt4ZaFaPfFkW9gXE28m2s+s5lVbP6hcWhvbBZfHuO7xXvJMPIP
         9e7m4S4mtPx0ElZsBxjtVgQFHmqLUf9UfLUeOypf7KDD9TvFYci/6QaimDGaUdPJvVXJ
         PcBasB/OQhuGcQpnO68dU2JaLrrObTIGUqhS21aO3ujXrDIKy5qlldleugWQhKC0o0bA
         uz/7hUQJNZDCwX8751l0Q9RsmBLzJER5L2X2J9EaPq/IOc1V76Gbx1xdSwRsp8aky6Bk
         QGl6bOI4dJwN7n4FfE4K30XDfcW3HBJynqZUnxJJDmjpnMVTScbOiHoZaXIW1QrmucLl
         V/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH5PfNBhDB5FFPQKcahN7ffWx5esc8JNlqOpQ1MMDxprBz7ZPT6nZnJNEG9ctV3OH3F6ouqQrNIZerzZgzREPJfKz9a5rDrNxtK0bMPA==
X-Gm-Message-State: AOJu0YwQP7v0LvUb49vUvAI8Azf85tr9CRpScZ81MwT78/FlIjdSv/Xf
	EBQH7d+1x8WcKsxTz3RunmDIMODgs1Hom75ZUAXTKhQdNkhdLfiuD0m/b7CyeCU=
X-Google-Smtp-Source: AGHT+IEsF2Bab0mR13jcWlh7GpMxPMJz8ZE7X/8KzaIBQoi1e1xTiA0OACTSdu6jXnwx+9HSN3+V4A==
X-Received: by 2002:a05:651c:1255:b0:2d4:6df2:12c0 with SMTP id h21-20020a05651c125500b002d46df212c0mr138246ljh.34.1710309688367;
        Tue, 12 Mar 2024 23:01:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b005687e17cfc3sm731893edb.11.2024.03.12.23.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 23:01:28 -0700 (PDT)
Date: Wed, 13 Mar 2024 09:01:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [v1] staging: media: starfive: Clean pad selection in
 isp_try_format()
Message-ID: <2bd3995b-2625-4874-ab53-fa3bcffb5f28@moroto.mountain>
References: <20240312024520.11022-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312024520.11022-1-changhuang.liang@starfivetech.com>

On Mon, Mar 11, 2024 at 07:45:20PM -0700, Changhuang Liang wrote:
> The code to select isp_dev->formats[] is overly complicated.  We can
> just use the "pad" as the index.  This will making adding new pads
> easier in future patches.  No functional change.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---

I'm not sure that patchwork will find this patch if it doesn't have
[PATCH] in the subject...  But otherwise the patch looks good.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

