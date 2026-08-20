Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4E4229B0
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224930; cv=none; b=IK3I1I6ES/nehuE0djmaXJginOUoCSun9biq14Qc2ZiveOOXCw8PhSBVSA3uIosjxA8aEl3R0V3LDmeQtFcuNE6VsUdia+MFNJ7a/TNIBmTy5S6zXoCOtGTBdSLD6kJNMyCk44RnQQ8zn5QtJnyznKHVSFlMlR2/0Wp2EPZ6WIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224930; c=relaxed/simple;
	bh=7hb95SRoH5hGknnZznOTCuoZROL8L4qLp7heu431108=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmIJ2bGkjuuFGeeCzUVKfZRgcY2R7YGxjcSqJi8pm9brr3QNymzZg9wAoNv5kXpf3fzwBOyE3fWSPTJwmLBw5ZwNaDLtaJhvVtJbFli7QORV1hUP1HnJUpoEMaFE0eLk/xIDtOgtHIGZsfDmHKyuw1sXXIihvShfrr2T3gIftuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPPfNEh4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPPfNEh4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1727402a91.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 04:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224928; x=1787829728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hb95SRoH5hGknnZznOTCuoZROL8L4qLp7heu431108=;
        b=NPPfNEh4iC6qXdedpVkxYxsntt/0YZcpl0pmbujHt5K3KpS3wn1xyVKSUYnpmwwRTx
         CGwhk37RMjDiB9yyJvKxzEKWQ4e6EWF+whP2K85KLcnXUqEp7VK4axHrKJ1WsoB6nf+v
         FDhESTGu/5sUWdMApQ7BrrnNTCXyCYk69n47zzuLqvr3TvY+JAyLXzmqaTVDZRE8R8bh
         TfAjk7ajoF78OGBdse9kRHbYh8sF/jl1Jx9uX3Pl9C8aG0nhmxqq/ELjrjZmgxv6k8ZV
         4QKt11pHUT+mJni5N/7O4lLdF+oaNzdr+J+3a5Wx6DN/yKqClS+oCu224L9voLGkqEK/
         0dJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224928; x=1787829728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hb95SRoH5hGknnZznOTCuoZROL8L4qLp7heu431108=;
        b=JwLN8zSxVG0RQmVSVYGFZY36yZ0VHVk/KjlUV0vmpUHxmHvVq7slSsdKD7yhFKPwSg
         1Z0GA1iME+k9QL+xtKHI8kBzh9gQ6VjKLTIu2Hr8lbD60NjZgfwxBrD5LZKDaoaaFYqj
         JXMKCAHVFpWW6lDyFbEywT1gsTqlBw630pgXS163IyjFdbJ2rWvDi0N8uKI3tilmLmbJ
         nSauqWo2O3SSc+tVmO9f4n388lnngqFwWR6L287rA4KUAER4wI7IlmI+/mGzeiQdDGIc
         6nzY+fMO/JC7uUtyDhUt5InkJUy3OtQyQCs96qfejB+3y+deIcE6eysWbviybuxH3HRl
         xFoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLUBjzMEzBwWwW/3f+bQU+A08UW3FVrjG5jFZJ0y2ZF1GIKz0hNxTsKPiec4NaClffhSBaQ+0EgmdLzAfx@lists.linux.dev
X-Gm-Message-State: AFuF++nQk1lIGRL+WON2rzVi0ssB7K1dkEfXIYXtQJOEQCOrWpL+VbMS
	i1XlNrDJJPUvdbxHLnSMeyd/8oFIvBbYatMemmq5Qr7e8pwH5rvHqS+H
X-Gm-Gg: AR+sD100mUA4hWXUp73ET80qj9948f+EFExggOtvrTeHv02emkM1eNfld/JH0QsqANn
	R9j7cfdz782vx22i6vxhr5mwqrFdsuCmBhzkdBgGaXLwSQ8REEyyg2pG2QlhYy5EWzYTb7t4+De
	xhBi6fFIZOp+wvBJH3zSFGsgVX4Fq0GFPPToMBAY6f0MXVhQBJYVhDJ5VXCnLxf4nVhHLvZSC2Y
	aYf5qbv3wEZNs1dx5d9+8wYneXYbbQDOJJGN7fU110TWfB6BAUz0o6fMZj9GVkJrozVTp5Xrzh5
	PjzHw8VkNHC6ECBvGiRfY2YrJ72O9PsCgGky+AGHbQYFiEr2SRvuHJLLNoBZDyTAah8HKQIzh9D
	SEf0grwFRRXliHRUWpJcnGu8brliNpPnYpCCg9/4xL2n6XrRk6v2QT02auWTVwCBCeqwYhGdJ4A
	1jOjIJ32f5pb3OlVfDJhMuqVznP5GahgmltTIjPzDGK+70pC/nrwkZFLk6Fw==
X-Received: by 2002:a17:90a:fc45:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3958106f758mr23854427a91.13.1787224928130;
        Thu, 20 Aug 2026 04:22:08 -0700 (PDT)
Received: from dio ([103.161.231.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm9488274eec.21.2026.08.20.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:22:07 -0700 (PDT)
Date: Thu, 20 Aug 2026 16:52:01 +0530
From: Supreet Singh <singh.supreet14@gmail.com>
To: Johan Hovold <johan@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: spilib: Remove the local unused
 linux-kernel@vger.kernel.org
Message-ID: <aobjJkvi9yXE36lL@dio>
References: <20260820103235.12306-1-singh.supreet14@gmail.com>
 <aobbFqlA31y0ilcM@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aobbFqlA31y0ilcM@hovoldconsulting.com>

Thanks for the review and your time.

Supreet
