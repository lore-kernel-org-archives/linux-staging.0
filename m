Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A91A08A3
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753034614; cv=none; b=MdGpiPKv8Y9QqnAdInUYrS4s4lnsOBFoPH3+wwa3NOjeQhDTrV8hUYzv2kxwOUkGotaWF1SlBrnw0oS/KjmFGktLBsyoBmXuCYAZFy8v9L2J5AT5CVc9Q7NvaQahuW1bYVEs4Yv2+AK62RgN4y3m4MKO7gH7nNN3LzZrsI5HBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753034614; c=relaxed/simple;
	bh=bhtDgzKsiFjwXyxsdZ/4h48cFPpB3WRr/3arOlv70uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngeG+6gUeqCUWpnUn6AT5mNRvSN0PAUDJnMsXNxVl/zWtrtX3s3bbL0/ZMN4NgPb3hqXK+5xjebarE8gWeoSENI7ZmEbqJc+IkvdOL5KzUzEiNmtEJWTPnZpATB8fNgGJ1jJ/t48QtQYx6UUUooj/QdqTqlu5yjWlWIpNFEfoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSrpv4Vr; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSrpv4Vr"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60402c94319so1738174eaf.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753034611; x=1753639411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1fiTpYldSHzYxGLzWC3f8B8z2BwRBsV2K6tEBNsuDs=;
        b=XSrpv4VrLNbDlr1v01nwWSyV/A/vzvEe2YppuX4zPuXxREGZIfcb6UqV4BctwP8rY3
         O4II8qKF8rNWmcuvkLzF/eUApFVXvORuvh70+akkj9WG+sPKWelIlOh5vENJpZe3uAuC
         cOl86I8mXJwqrKZSFaUn9xB3MxNAkXCFznRnzqGs+c2iGiRuZ6SZTC/kIPFDOIQrik3e
         pvd/Iby2vFduhCvXJb1PSOPsYkltie4m/SdQwgEwJvEDgzcU9EhCrdp8oNBlxsKL88jS
         q3q5GVVPDcWScFv5zAuF4Db0eCsa+2G338k2U4K9sWnb0hMVpGlSDytqit3KOAuvtXTo
         rf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753034611; x=1753639411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1fiTpYldSHzYxGLzWC3f8B8z2BwRBsV2K6tEBNsuDs=;
        b=QpNB7+J+rIsUn6o5kL7dLxwFHgDz0diW7pkIebHQQjEkIC8mOyxGmbKQNIxyjVg9x1
         f3+NmVWeBc2XIO2uWClKh24TaBTX+1L/eoI+ytQ5OyhB3TJitiAYjSV+TZ8X+vZewgt2
         wTzPxEYDspDz4ZerYrbmGqL/y6x2nFgAonOmUmLLJqdG5c4+0SUMgLrjynxI2DeU4tIw
         8XHAiyANVMi2xjUl/uGic9ssbM4MFt+X9z8SuHzw9mvlU6GuK0CuMAMDnwaLkDYCSpmx
         q7KvPBylDf8p37vBNWYP5Wj9f9/uGl8VVs3Yue0NuUDAKjc0aSIfj2OOuE3xh0iETZlL
         40wA==
X-Gm-Message-State: AOJu0Ywk3v0ZVHT9JGM9CVUO/DURpFwYhF+7g/2VtfVCeVFbegP9T868
	V9EWWocaln+gg4x1W7Q/9X5R0sIZLdMfq/b7Hib7nMxr8UzNC0E3EChKxg65iRAyo5GjzsH3CsU
	F5jB/nn8=
X-Gm-Gg: ASbGncuzyFsWKbxjuA8Mq9Z8YymM5uf3KGC2sR3xrJpz00Lg1xSH4fMKrh57PswUSXC
	XXbQpSrMew0bbaoojYcX6aX+KjA4O0ZM7S+jIk9ATAM/+rZyAqCltunBWy24f5pLAclD5DPF9ZD
	wfvUfQqokaYU0FafVnrOHR0Do+lywjSQv34DI1H5w+6hlr1LF87UpkYCWmmCup9YiH5hMkOY58B
	0re7ScD2PUoj6TNduhVPIJk/4k086oF7ECmEJ2yviCrsLtQnZe0cLDPZQZKwCm/Fi9k20uaDk6b
	UoTZaJlvnSBx7Xu7JJ/R/ZZLAe27s0swE43nSHNQKBNYgB68PPenVOCIDe+OdGc3KPMT8z48GAB
	m3UHPBmrOhNU=
X-Google-Smtp-Source: AGHT+IHtyPmRdW+ZxMT8HYDvH7uiKoz3hDXI6p99r4O9UHXEQkAF6dlxkNSdIENOt/+CmTUNtnlwhQ==
X-Received: by 2002:a05:6820:1e84:b0:615:c779:eaad with SMTP id 006d021491bc7-615c77a0d18mr5159784eaf.7.1753034611515;
        Sun, 20 Jul 2025 11:03:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8369d595sm2250474a34.25.2025.07.20.11.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:03:30 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:03:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-staging@lists.linux.dev, marvin24@gmx.de,
	gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Fix incorrect null termination of battery
 manufacturer
Message-ID: <45476946-f717-49f5-8d21-34ea146bd624@suswa.mountain>
References: <20250719080755.3954373-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719080755.3954373-1-alok.a.tiwari@oracle.com>

On Sat, Jul 19, 2025 at 01:07:42AM -0700, Alok Tiwari wrote:
> The battery manufacturer string was incorrectly null terminated using
> bat_model instead of bat_manu. This could result in an unintended
> write to the wrong field and potentially incorrect behavior.
> 
> fixe the issue by correctly null terminating the bat_manu string.
> 
> Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Nice.  How did you find this copy and paste bug?  I guess we could write
a static checker rule that if you do a copy followed by setting a NUL
terminator, they have to be the same string buffer.

KTODO: detect copy and paste bugs setting the NUL terminator

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan capenter

