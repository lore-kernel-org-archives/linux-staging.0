Received: from cvsmtppost32.nm.naver.com (cvsmtppost32.nm.naver.com [114.111.35.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF528296BCC
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091791; cv=none; b=KcYq6k3f/aWBXKFd7SRGfafO6XQNs0w7c6RPpNBhG8JE9i7YXntOACLYokFsMTl6f0roAZNVba1qsLPxv8ETELl3tLkgBaP5UhQIXjfH49b9OrF5Rm4qmKdSuiot7mxoCqhCCJSjcR/huIkpc8KSvjkDUdOmubC1BrEgc1jkpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091791; c=relaxed/simple;
	bh=zkqiiEbMJT2fd5yzdXuOQzspgCg7JswUmez5O0NQTrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2+X6tHUqssRw4lH4DNzPT17d0d+fs9Xz3wtlIEsgHgbpUM5Kpzd7woK625Rhh8qSP/OvGznVIGeM8/faJtJofReYU6CtRFcOJKpLA1BJY7Z1lTbCTjK1aHTX9W2rywxqcfZGmmaRVg5zwbouuRRJlPzU53c3jRF445L8aNLcUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=u0t0cL4e; arc=none smtp.client-ip=114.111.35.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="u0t0cL4e"
Received: from cvsendbo027.nm ([10.112.22.36])
  by cvsmtppost32.nm.naver.com with ESMTP id Jx1Q2sW9Qqumvn+hrBKgaA
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 14:23:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769091786; bh=zkqiiEbMJT2fd5yzdXuOQzspgCg7JswUmez5O0NQTrM=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=u0t0cL4e7c2oguQg1YSdxrOjlJsGm9aPdx/BAqOjU5/QC/NYj/qHuLTL7nD9DSnEh
	 Bl7p+r+06Kd4zhMsaOthpk4OJBbSEiu1R4g7JCwswOmxEbEm8cmYvdkijym8oOhgTL
	 LJdkng095od9J140XaUjukLrG4MdOT0KTk3CHfxNJZ99CjjmhEFpNTJjj3Ov4k6o/Q
	 9S7XW9IW/XwfpbOt4jVbjD62f5TfZB84YNj+ziuqWNMuzwaO0dehHl2XuWCGo6GqfF
	 TM2Z25179kHw4D25VDEC4y8pXM3JRbQSGPjQIQBK/HGVHLda42k/29m2y1xXGkVRXL
	 pBV1qV7+LAYdQ==
X-Session-ID: GSGQDkW1QneM9ZvFP-UAuQ
X-Works-Send-Opt: 3dYwjAIYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: Y9n9KAvrFqJZ+HmraAKl+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp009.nm.naver.com with ESMTP id GSGQDkW1QneM9ZvFP-UAuQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 14:23:06 -0000
Date: Thu, 22 Jan 2026 23:23:06 +0900
From: Minu Jin <s9430939@naver.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: change return type of
 _rtw_pktfile_read to int
Message-ID: <aXIyypnq7LhdNHys@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

Sorry, I just realized what you meant.

You were suggesting to keep the 'Fix' (including the necessary type 
change for error codes) and 'Cleanup' (formatting and style) separate 
to make the fix easier to backport.

I misunderstood "leave the type alone" as "never change the type." 
I'll reorganize the series into the two patches 
you suggested and send v6 shortly.

Thanks for the clarification!

Best regards

Minu Jin
