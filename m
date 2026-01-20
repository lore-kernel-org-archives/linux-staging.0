Received: from cvsmtppost27.nm.naver.com (cvsmtppost27.nm.naver.com [114.111.35.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6B429817
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914602; cv=none; b=Hu9mSrl3Ig138iFDR+NH5aOnRk6KXAGz+GDIFUNpb/pq3Umz/a5DW69uiVGTPC1J0Y7lbA7jvpsxK7+cYfw+TGdgP+CGISnYjNH74qZVnUdi/UdmQJU29xJU5tA+8Cp7qCGx96T/VSg67BoHl/CaPNLBC4RudsELpMt1TvECJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914602; c=relaxed/simple;
	bh=nTteyWzisGF0yABkycFtI7/YPPviBky3/lp0h7ukNU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sUIs6c6vrRRRLY4QvTzJvj+Y+zKPvPSKxH8fgcgo0AaGiwYBqGCPYlBGg/Imab3d0eNmi+nB+6EKlaTnClOSbpxDpb3PjH7/+KCYnA8d65igJNtjlIn0dsecG3J/ENzb8xw1anp3q6jkP78Av0npqqtpkXvkGHssN2fUh5MMAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Rk0U5m2s; arc=none smtp.client-ip=114.111.35.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Rk0U5m2s"
Received: from mvsendbo09.nm ([10.179.34.209])
  by cvsmtppost27.nm.naver.com with ESMTP id jebWwyPrRAKm-dYLFlkWvQ
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 12:59:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768913990; bh=nTteyWzisGF0yABkycFtI7/YPPviBky3/lp0h7ukNU8=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Rk0U5m2slpX29D4IS4QhA8tUb1w+um9SnhYbdw3Y80dS/6PGpwVgZKZsMO7aw0/LQ
	 e6EpXDRq+bECT2jL27NP1Z+OrJuF6Pwt9Z7j7Cb2pPGSkmwiPfMPqeo4yWGNQTABjp
	 QeC3VrDznvxAYhZOS5usCjk2nVwXFDNfgYghBJLJQZ3NGo3hGbLaPyyXgoNAXbZL32
	 /5gcQINxWQ7Ux6rR+yxgw09mUUaWyKgWCm7ncG1DMpAmO23Tjy5rU7jsQCZUvYkxmY
	 GRsaRaoyE0rzGxqnMT9hyI25qH5LSES2NFCqGZRSnGcfHiCwLNXIcDBrko968Tfxyv
	 AuLFLGnGWRcOw==
X-Session-ID: xpnSNQmbR5+LQa2P4A19xw
X-Works-Send-Opt: M/Y/jAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: zdY/aA2rFqJZ+HmlaAEw+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp002.nm.naver.com with ESMTP id xpnSNQmbR5+LQa2P4A19xw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 12:59:49 -0000
Date: Tue, 20 Jan 2026 21:59:49 +0900
From: Minu Jin <s9430939@naver.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW98Rd2CgdF2zAlC@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

Thanks for the feedback.
I agree, following the kernel standard is the right way.

I've updated the code to propagate the error codes and fixed the callers.

Thanks,

Minu Jin
