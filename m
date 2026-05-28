Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B93B6BFF
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963659; cv=none; b=oIuFUb1t01nZcV8W1NLzz0mGOnYxBo94/2o4rL8Oz387bibr7XwDoUmQAJnTT9dV52+hAA6iCMigNvtb/3vOp59FeDXIpP8sCV4AhdnC6FdPEBvpgqAy4uB7ThJzSvLRaJmNlsFxnoYjMcJFtClQmxNm5bAZzIFS4iycrup516M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963659; c=relaxed/simple;
	bh=62qjLgq1oKM6QYwtvkJtRjfY+z8djIogWp3aL/Gpas0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DKC1CiIsZUHnW7qYJxvMAsWEeCEvxBG4y8G6a7FX2wSV/ElN5OcJi6jCbCc2256/YDml2BKBkjudMpSh0le9g490pCEoT3I1lgts1zfgBQ9W1U5z5q3WvhmxmQmN0LshJSFJzKrV+SJSS73Z8pVS6l0s0knPqmt51ub2G9n0oS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=hf2UkpOi; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="hf2UkpOi"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 402d03124;
	Thu, 28 May 2026 18:15:42 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	omer.e.idrissi@gmail.com,
	hansg@kernel.org,
	hi@josie.lol,
	straube.linux@gmail.com,
	xela@viard.dev,
	ethantidmore06@gmail.com,
	liangjie@lixiang.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH] staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()
Date: Thu, 28 May 2026 18:15:42 +0800
Message-Id: <20260528101542.2395619-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ahfvCpI6YOA9Gpyh@stanley.mountain>
References: <ahfvCpI6YOA9Gpyh@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6e152e5d03a2kunm1d63080577846
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk0eVksfSkodSUNISxhIQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=hf2UkpOi3frLhM5+YMBnuRHRvJnZtPyomka90RTF9EUef+4rGlKuBKkFKGmwNgs80lcLAOnCpX/wYcBSEkAOvNHzlndKrwefHORJBs2e9MMYhBNFgm9S0rBVUUdWUOZlkPggUCYdiiNijuFqp/sZlIRWVutTpk/dw1fYULrkyMU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=cm1IXCghAruZxMXm5ndJwzdSK/e/RcJeQCV3orZya5o=;
	h=date:mime-version:subject:message-id:from;

On Thu, May 28, 2026 at 15:30:18 Dan Carpenter wrote:
> > Manual inspection
> > confirms that the issue is still present in current mainline.
> > 
> > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > suitable RTL8723BS SDIO hardware to test with, no runtime testing was
> > able to be performed.
>
> to HERE should be put
>
> > 
> > Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> > ---
>   ^^^
> Here under the --- cut off line.  We don't need this kind of meta
> commentary about testing in the permanent git log.  Otherwise
> the patch is correct.

Hi Dan,

Thank you for the review and for pointing this out. 

The reason the manual inspection and testing commentary was placed above
the `---` line is that we were strictly following the example template
provided in Documentation/process/researcher-guidelines.rst. 

In the researcher-guidelines[1], the example explicitly places the build
and hardware testing disclaimer before the Signed-off-by tags, which is
why we included it directly in the commit message.

Please let me know if you would like a v2 to adjust the position of the
mentioned commit log details.

[1] https://docs.kernel.org/process/researcher-guidelines.html

Best regards,
Dawei
