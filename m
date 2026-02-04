Received: from cvsmtppost36.nm.naver.com (cvsmtppost36.nm.naver.com [114.111.35.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E5A2773DA
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211249; cv=none; b=IVcbclTp2we9wHwl6Rjhdj0FZj9/xq0R6LOJ+mBs+lru6AT/Ub5B56ILpcEOW9cPL/2EDB700w6i8XocWlvT+9gOt9LJwgq40G4aWH8+2xLuP+ZIz0yy8OEQ+vB6lvvSTfNDCMt9Soo5OIVkONrlbIDkSaRU3hL2rvn0dOnzjEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211249; c=relaxed/simple;
	bh=e1B3kkdss+qupQYwBJgaJGdtzIdfUnSFu6v+u47JJf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVqM+6JdNA2QpMQFzBI3jeMxE1iRCIla2jBdMCy5xP3Ju47JqsS4Z5W0EHNQHpECOZyx0XWro24bnYwAj27lxonYjTFMAN7uPwTgLEutGcox7nDPv79EaMHTtQKSpthCc2PhYeKbe+Ygcd8Il+hPYdi6fKq4Qhc5dIXhVX0D8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=ZZ5MIYkl; arc=none smtp.client-ip=114.111.35.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="ZZ5MIYkl"
Received: from cvsendbo026.nm ([10.112.20.48])
  by cvsmtppost36.nm.naver.com with ESMTP id zXS3QVCtQ5KvgQQhhes7CA
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 13:20:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770211246; bh=e1B3kkdss+qupQYwBJgaJGdtzIdfUnSFu6v+u47JJf8=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ZZ5MIYklQ/GQYeeZBmAIpSpuFsEY/Ndgg9y4Q2xeWaGhJVtUug6QGAcSEkrP0LTJs
	 qAxf24fwOTQ6Qmg8KoBmKzs38DkRA7F/Khc+xSgw9Bk02VXUsTIsAyX67357bVJkl9
	 +Ei8gNzOUi0RT8BDmraXxA2xc+zZCNKmEJZ5CPQGfc6ht5wRdlzfqTA3+0O8sloaR4
	 f/nNhJigwhni+X0++YBvRGteBELIASNJeoGdHJOfkAdPZRXlChsj6odfyyDOjGw3Ag
	 AxbIRf+dV5HHwAafeFHaZSL3dLa4l/6K2jhk8qfIofMBYg+qlKAbemj5KHkeJoiUmM
	 PhUrbA+7oqeOQ==
X-Session-ID: ySAgXkaERlaBZvkTlbPTVA
X-Works-Send-Opt: M/Y/jAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: X9nXKxgXFqJZ+HmrFA2/+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp003.nm.naver.com with ESMTP id ySAgXkaERlaBZvkTlbPTVA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 13:20:46 -0000
Date: Wed, 4 Feb 2026 22:20:45 +0900
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org, andy@kernel.org
Cc: dan.carpenter@linaro.org, trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6 2/5] staging: rtl8723bs: replace rtw_malloc() with
 kmalloc()
Message-ID: <aYNHrXRGvWyJ82cB@JMW-Ubuntu>
References: <20260204131347.3515949-1-s9430939@naver.com>
 <20260204131347.3515949-3-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204131347.3515949-3-s9430939@naver.com>

On Wed, Feb 04, 2026 at 10:13:44PM +0900, Minu Jin wrote:
> Replace the wrapper function rtw_malloc() with standard kmalloc().
> Call sites were reviewed to use appropriate GFP flags (GFP_KERNEL or
> GFP_ATOMIC) based on the execution context.
> 
> About GFP Flags:
> - GFP_ATOMIC is used for allocations in atomic contexts such as
>   spinlock-protected sections, tasklets, and timer handlers.
> - GFP_KERNEL is used for process contexts where sleeping is allowed.
> 
> Also, convert error return codes from -1 to -ENOMEM where appropriate.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>

> Reviewd-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Apologies, I noticed a typo in the tag.
It should be:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Please let me know if you need me to resend v7 for this.
