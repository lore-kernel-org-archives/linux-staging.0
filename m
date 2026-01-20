Received: from cvsmtppost04.nm.naver.com (cvsmtppost04.nm.naver.com [114.111.35.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF4313551
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928800; cv=none; b=lWLgMkdjT+OliwJlGuM51+yD8Noi6/t0JvCnPGgE2XIcmZr84l5LEE3bTCbr/CGlQhMNn7CIvKi74XfhdLLYnwbPLsZQA0xly7M4HexGc6KRsZKNidt4VBshGtGJPtOLZB4CPGw2K6rrXtAhdGVobgiQBB4TznGtiA4Vc6c8KwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928800; c=relaxed/simple;
	bh=Sn7g9zWx1eFAH/Ajlkv51ziiDU+k4QvjPCrtTuwjkWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGMwvIrG5Ev593BGGc12JIwK+amhE4Mk0eyRH88s2yavCsUkScvYulnnEsVrBLV+pFB9DUln7OckGxDppugBda+AZngChgwyTzBuMwyhNonVfpwhpLQnbVrOPJ25oRHg2+J3myZqap8iD1WvWgZn3CNcRTI2j5BkKNzbEFYa6yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=rphywJtt; arc=none smtp.client-ip=114.111.35.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="rphywJtt"
Received: from cvsendbo018.nm ([10.112.20.46])
  by cvsmtppost04.nm.naver.com with ESMTP id 89c2dP2rT5+Kt1rFMpaeEQ
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 17:06:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768928796; bh=Sn7g9zWx1eFAH/Ajlkv51ziiDU+k4QvjPCrtTuwjkWg=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=rphywJtta9gHIuNFdqwjnLnUaNItSG5Nbu3y4HZ+vgok4YZ+wX5P/44WhqqFbgIOc
	 yk/Gb21R2W/tf6tW4M6i2pLgyJlt6Y9m1VLOSefRzl7y2oWw7Em/8QHlX2lxPZw7UD
	 ZplKmDdln9XKxXHTABYe2VJO9eaTKiJRiyzWiPPmCOE2abprM666Mu1z3duohjanL/
	 DLb9wZLf4a6SsCAj2NemgTP3TK8wbJ6q+OJ2DDwCx508bWI6gbcKl5GytLkRO7+SoV
	 XCltRRLwbPnMRD6G47a523LFnplIKIsM0JNKJnNfvZU9IyvO4A75eRWGDY/+S/4//I
	 0D3d2kgnioYxw==
X-Session-ID: w1p1sCh5QmWD-RvIS8BYxg
X-Works-Send-Opt: M/Y/jAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: HdYlaA2rFqJZ+Hm9axKr+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id w1p1sCh5QmWD-RvIS8BYxg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 17:06:35 -0000
Date: Wed, 21 Jan 2026 02:06:35 +0900
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-2GzHg3BfMAnqK@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

Thank you for the hint and review

I realized that checking only 'ret < 0' is not enough if the function 
reads fewer bytes than requested.

I think modifying the function itself is better than updating all callers.
In v4, I will modify _rtw_pktfile_read().

Minu Jin
