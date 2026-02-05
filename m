Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5131A2C0B
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770270323; cv=none; b=FzSLCltPrakis9kRsiiFtUtA6d1W3GKIRZxwqgQ2v5k2//VpV1x4aTbfpU/wHJhM9FT5DXuHuhWq6g1j2+fdNpbjrOcM3VefIKXNiqFPEORCGW617g951OxC0cvtsPMPvkJvvex+mOkZChdT90V7sO6IwuEbL7wXnVi+oalLXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770270323; c=relaxed/simple;
	bh=BxHkQnWiZGK8SegJF00wGZb6bJ+KMssGsjb6bt6VFEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFAiIczfdKUHZyxI0ZNMEwvc8pEgUigqN9BNt36eh/LikRxbJvfpnh+M6RtC/0ELCRDGG+2wt7eL0QZWNDrsawJwf7KE6PvDLbh4lqMeRrgfoLg1b+XY9RKRfXgPvkVrac/GGjwrCrgYkAHADaUMOpgiG4R7pT88McXduWXfLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlyNlW3U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlyNlW3U"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bc32725so4773995e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 21:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770270321; x=1770875121; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9ZbjIehz2HbPNy+4HYnVCfD5OADW7ZHwhYE+qzHtDU=;
        b=UlyNlW3UdYRlbeWWhBA3AHoXzKy6keITYP0GKWkR34t6TpdMdUA46nVRqPifchaa7P
         pRjiFXjwGHiulCFvwA7TAN7d/7XzBHaQHJR8wTdi/uFXd2nOnG477Y0C5FTjvf5E54bs
         Ysju6JgxzZ+ylg395NK4sJTSIvvTyhG39saIDQEXCH46lRE1V4HcPQ3dbA4KTVYDAMA+
         w/iU+H18UnjopWpGjiocGssWXGK2uqeGjNuPLwfNDuxtdijL5Ormjm7STDk/8zEVu96g
         EyN0kGipD3PwFq12jejXjUC6u7lUogIM9fLM3zjUFx6vhlPuZcPN1qSQD0WpvTyF1ZxW
         Mn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770270321; x=1770875121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9ZbjIehz2HbPNy+4HYnVCfD5OADW7ZHwhYE+qzHtDU=;
        b=fXonljJfzxmXIUZRf9hwLrpGRmIw3R0jlsuyV29hXKRMbk3EO3ZnSUh5mt0oCAmzl4
         1jNkuOlCoZqOUli5PZphgzttQUrysvvx/4yqiZnxkS6srLBupYGIaGEmc40PPvQOCG+w
         hlJWdGLHyYGed10VLXZi+CpJZ/Ks6iKqguHxaakazKrF7TnYwGZ8MxJo5AUJ6u/4oWri
         tnhVHKMlk76nlWWsePlFL2M2zM+csllKBIP7g2Y4lShJyM8zX/aH1hMyOPzUd8FtGSFN
         +AGNNVdvSq8adJxcUacDVvtKFsUktzkDqIL3f30sGHXt45vkETi79KxOL7Zg9VJv6L4V
         GRCA==
X-Forwarded-Encrypted: i=1; AJvYcCUYdiVz26uLcMwRlYZFJRMtr79Mdrh02eUpaa4KpWQCKYYNtC4nC0IfDNPakVNow1Zq9RPS/ccUJQfzSXaL@lists.linux.dev
X-Gm-Message-State: AOJu0YzquY9zK8HJg0YyupJa5U7teyB4TBB1UXCF8TmaS1LUhZ0uHIH8
	220A6oxpdigoMAiCjdJQeHct03gN2lWFYkYLGpc0ZcNi5gVgYF7Xt98aRiuhupzIvGs=
X-Gm-Gg: AZuq6aLUxYK5prnVadmMYrGysghSQJeJWnLNKH8DW0lNIzX71gmM8X4lDzSyYvn1eU6
	r8fiBm35NCORR3CiH6Xezaw/GCL3sUDHWQhE5LjCMqRcDa2Pb986yAmK9onkZFfG4mM1OzOjLCC
	9Km5IjJgu208/bJQEsnzf576Ng+xBDv17wu2xBEm9bAd6XgdHnySceyZ/QJzs2nIcvAVkWdRWlx
	vC9PhPToFcJ8DiKifGbCDwML87B4qO04umxqUeQhQq0W3j5qgPJR2KNVwB6CVR7yeWVoKwmC512
	rn01DfETWHexFD/tlg6yCQqeXXgLt35hpIzPuFGqIlgpy8LUDVjjQsyvPTiRQKjBieotrj3/JVn
	ux8kHNMnbRh5wq3RkIlLy+F5OV59aJ94Eio7hQQK8nsbkTuSdmjBqNpylnnNqHwKjxObbSl3jpJ
	rP0XePWUPFhwSqkmmbwSkNudBBoRs=
X-Received: by 2002:a05:600c:46d2:b0:483:885:f0b0 with SMTP id 5b1f17b1804b1-4830e99d428mr73842535e9.35.1770270320777;
        Wed, 04 Feb 2026 21:45:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec57bcdsm62695735e9.2.2026.02.04.21.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 21:45:20 -0800 (PST)
Date: Thu, 5 Feb 2026 08:45:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com, hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: video: fix potential race in list
 iteration
Message-ID: <aYQubHP2hsTUNik2@stanley.mountain>
References: <aYMS_9xQ4LGgMS-j@stanley.mountain>
 <20260205021620.1165137-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205021620.1165137-1-s9430939@naver.com>

On Thu, Feb 05, 2026 at 11:16:20AM +0900, Minu Jin wrote:
> There is a pattern in the loops where the lock is dropped
> to call a specific function and then re-acquired.
> 
> The list can be exposed during this short gap, creating a potential
> race condition. This patch fixes the problem by replacing the list
> head with a local free list using list_replace_init(), instead of
> using the lock/unlock pattern in the loop.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Changes in v2:
> - Use list_replace_init() instead of moving one-by-one.
>   (suggested by Dan Carpenter)

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

