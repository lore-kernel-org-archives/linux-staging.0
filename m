Received: from cvsmtppost31.nm.naver.com (cvsmtppost31.nm.naver.com [114.111.35.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B93A35AA
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487387; cv=none; b=fgW97V1eYK6io2mIkdBWdxLpj/2qahyTZyO4wd0+bHtt8JS0WBFWYGpYiojtVEpKIqWcAUOyg6JlfGCvvyZih7DBFFvaM/QMdh/6YteERkkWI1UvE6gbzY1mUPbirXmGNeHXlH8HgLyNMLKI1DOoI+GkcfykRbKAYlTeApdH81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487387; c=relaxed/simple;
	bh=x+/2eZnGD1SbQ+jJf/aBJWFkfzjxSAADRBz3uRIEwro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=or9Sr5EFjVwxcK1A8pC6N0hUNghTMZz9qiQ4iufRa5FNMW+eZwshXrtaAkT1ghUv6/mNDLiKzDNUXoLjvdQ1xz0mbCZAmO7q0fA7Idm4O2Rj+r9J2MVZdFHN45m46TgU/bkEt/1yAjMM5yR0pRflmaw8PTTFLbAnFEb9rZnaiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=rTP2niKC; arc=none smtp.client-ip=114.111.35.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="rTP2niKC"
Received: from cvsendbo022.nm ([10.112.20.47])
  by cvsmtppost31.nm.naver.com with ESMTP id 7J+sHUPNQqGhEbrZvHHDfw
  for <linux-staging@lists.linux.dev>;
  Thu, 15 Jan 2026 14:19:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768486775; bh=x+/2eZnGD1SbQ+jJf/aBJWFkfzjxSAADRBz3uRIEwro=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=rTP2niKClB/KwHOuIgp5k0zXfJuHdZ6O8Q6AHM0qA3e5aBq8TOwimsZa4ES+yktC2
	 oeEUxl1E+gBc0pP1Gj19C6MpYx7CLoQwDkYQSMAsB8fXao2iHIqjOepRNAHL+JGBuX
	 My121BBM5Aakpez+95xM8Fq6j4Kxq67qg3pto+oNcKgm96zCCggCSR8Gw83q/s+yUw
	 9Ymb91ljgLt3TgnduDk8EgjdRKd+s8P7sR13XNRK7Z3Cn/S/t28f6zyIis46L6gpng
	 YiOw1CWO2KRgDlmqa1MESeUPktaP3luV0bl3ox/vp0zwKn0GuGr+bbL5RHXS2MWQDq
	 RkpTB0/cIRqjg==
X-Session-ID: 7tfCv-Q-SgaWTWUYPpYo1Q
X-Works-Send-Opt: 6/YrjAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fqY9FA2rFqJZ+Hm9FqKd+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp002.nm.naver.com with ESMTP id 7tfCv-Q-SgaWTWUYPpYo1Q
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 15 Jan 2026 14:19:35 -0000
Date: Thu, 15 Jan 2026 23:19:34 +0900
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 1/2] staging: axis-fifo: introduce helper functions
 for register access
Message-ID: <aWj3dgJvZ313p1wo@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Right, this should have been v3. My mistake.
I'm withdrawing this series - I don't have hardware to test ioread32_rep.
Thanks

Minu Jin
