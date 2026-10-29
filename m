Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282866;
	b=wIR4WqOfvR92cXQdKfk6TQ99tKI3+E3kyXBBiYEbSgLRbQWgBU0JEY7H7ei8ktkpCAhU
	 f5MWN+KGf0pFd4lo7B7CGjQcq9LF0uApmUqLOTdytMhEQQ2zTtM4J6PYPLvfJPWSquo1B
	 N7pqsqYpXU6o4rSlbo9uYKgkLy2AECnfU2EdJE+HhV1GXsc1cNf8OdOqyGw7zLBOAdUOs
	 dMZBcNmHOmAeHKaal9q9K3rFhEZYg7/H89fBM9bPdtkU98vQX4zKz9a8LhlWcUXumrQZb
	 Q3p869hIEWLhNjXIxlng4HBHR+6um6M8c8BbsFTchRmA/bdBL7ER2xJDh80HUtwRQ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282866;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=szVDTVMoBrzo+8gOA/eu3lrdUwW+vlQh8WYKufnmZdE=;
	b=k/d4KzdPChEw3Pj1AHsA3cS/ltlNiP9wihAfITKN9lShHnMIfJT/x2GqtewgUbB9ve1r
	 2aqJ3K1/hGuOw7GwGlfcmTlaRuu53S6Gsa37MWuLu8sVR6bIZSlf0AnhljTC2qkR/yumc
	 XlE6AVOToA8qN68jxULdvfkXIFqCXR8GKOEsvi9+LQw/e0og1HrSzF39tg/av/Esur4l1
	 F1klveDHsJG2g8PTq9xWmrzVTRcR3INjGyHV7/gKtnLE7zHegn2n4FVQHMjvmnI1O2JeO
	 NS7r68hk0vG28HPr5iPKhzVwmraBxi91rSZ3KkE4XqJWPP8I91PZxZFVblOxvXMwQxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="ZZ6/50eP";
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1213606A31C
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 14:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1213606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZZ6/50eP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=szVDTVMoBrzo+8gOA/eu3lrdUwW+vlQh8WYKufnmZdE=;
	b=ZZ6/50eP6t1GsTidDd9rm4HpNhHivlubiJOa08tlsVDyYr5RidshMBymjo3uiH
	RZw+K7bMON/Ht98f8ij+6zXfsuynNMsphiB8tjnCbx62cqWmXGFmbBLAdxFjo/19
	lbvoT9Rj69CEN9Vx9t6GpREiYSXrfm6edTOqhFzlWhoKw=
From: linfordWu <linfordwu@163.com>
To: Johan Hovold <johan@kernel.org>
Cc: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix loopback Kconfig help
Date: Thu, 29 Oct 2026 22:06:58 +0800
Message-ID: <179328281884.1789021.4493185936400503751.linfordWu@163.com>
In-Reply-To: <auC2LiV6564Z1zFg@hovoldconsulting.com>
References: <20261027142258.1720002-1-linfordwu@163.com>
 <auC2LiV6564Z1zFg@hovoldconsulting.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:QCgvCgAXPo4CU+NqX9goCw--.34937S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUv38UUUUU
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbC8gNoCGrjUwP70gAA3h

Hi Johan,

I found the incorrect help text while reviewing the Greybus Kconfig
entries and prepared the fix with assistance from an LLM. I should have
caught the earlier patch during my pre-submission search.

Thanks for pointing it out, and sorry for the noise. Please disregard
this patch.

Best regards,
linfordWu

