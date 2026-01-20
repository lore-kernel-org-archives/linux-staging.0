Received: from cvsmtppost04.nm.naver.com (cvsmtppost04.nm.naver.com [114.111.35.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701AC33B95A
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928688; cv=none; b=iy+ecMXCfLQjjyLkbY8/DdwXOv9KHuzv76w0WyZ4zdF75y+4A0OUujTiecnhYi5IgEBF6Lldway3tIxfUA6HtyAIflh8x8LVtUyW28FGc3mCKBu4rqUzOEuU6Aw+jiQiVsSoK0thdkomj+KaR6DMWzSX0q2VrK32RV8yR1siC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928688; c=relaxed/simple;
	bh=poqLO9/Gyvqbn9oWXC8fF6e/3PMvf0JZwyZo8crbKSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjsFJ1YEfRBPTLJ1/4r5oiYKiUBabtbdYAbe27v8bPLIYXWKceJ45uqLToKsye/Zd87e5UwP+r1TWbJkFWz4j5Jb580llKFRE5s5K4zOUh7qGDrReE41aUELMzFFBZ63SpqDEhJfyL+XeJgHdiM4kZ4v9H/DhSoO5SfsBTPVos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=PCJFD/4A; arc=none smtp.client-ip=114.111.35.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="PCJFD/4A"
Received: from cvsendbo007.nm ([10.112.22.31])
  by cvsmtppost04.nm.naver.com with ESMTP id KAgom9nhSVOqDdxIi5cSmQ
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 17:04:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768928678; bh=poqLO9/Gyvqbn9oWXC8fF6e/3PMvf0JZwyZo8crbKSg=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=PCJFD/4AjsUoE/7GlG9AYq0hCGCDzheto9dkSfPA8f4RGLhENE6y7H1yPpWBV4vEt
	 5aAwVj9jVGstMmkxQkFnTEEPDDmCmS0YJ69GQFxcKpcKbhgiuvbVL1J2y0qLejAq+6
	 cosiGlX9vLYxbAyj8ljZq3dFrulbJVIWkDIedKYSTHw6EswWKKdVRp/xDcvTtkh/gO
	 hyVVdsZHOxyIq8mlftmIsEZrLeHCEC7XCepr2nNthFTwTxRApXpJxwFBZ2FQw7rCaR
	 AQGEJfqlwzm1NA5khQRNdTtDf2URELjRZJYvauZulvavHHfqm9O1vXwcRUTn2AOZIS
	 pCMP4VG4dOz1A==
X-Session-ID: a4KWAUlmSM+Yf-d0rTtDbQ
X-Works-Send-Opt: M/Y/jAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: HdYlaA2rFqJZ+Hm/FqUr+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp007.nm.naver.com with ESMTP id a4KWAUlmSM+Yf-d0rTtDbQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 17:04:38 -0000
Date: Wed, 21 Jan 2026 02:04:38 +0900
From: Minu Jin <s9430939@naver.com>
To: andriy.shevchenko@linux.intel.com
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-1plrzzwHv9AHw@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

Thank you for the review.

You're right, the assignment to 0 is redundant here. I will change the 
type to 'unsigned int' and remove the unnecessary initialization in v4.
I'll also apply this change to the function parameters for consistency.

Minu Jin
