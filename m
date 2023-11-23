Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE733CD2
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="gFw9Gi+b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UZmVjoem"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 217753200A3F;
	Thu, 23 Nov 2023 09:43:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 23 Nov 2023 09:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700750624; x=1700837024; bh=cgnoYwRE5B
	w4bpd2N9NRzphlxhDcZURP5mr6c1AXwWY=; b=gFw9Gi+bM8QeN1GROlZuroEHnp
	azEu5gtoDE/Pzvp1Q99e4JP1dSTGsfPyi4/u1k8HmlXleyAs656b1KwtwOGSHeWh
	7tzE9AwbhLCjvydbUGz7hqjVkKxITFEGZhb9PXJVB0PxhMYuvGhsA5TGJIZuU0cK
	PvT2wJUG1OHkmkOYwAZiiNy3/hCUbJf3dy6nnAhPdmmDL6d8wituRUtu82ubb0+w
	gEwQ4dJoDXXoqM9Nb6omZzzngmoBjhGrIQCh79CG2g1PuyaIRW5zRQu/9QeKm7IS
	Ryi3F3oQ0nKN/7D5Sf8i95CfQxx0UA75qLh+n0R3WyKRgvJaberi9ys2Fetw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700750624; x=1700837024; bh=cgnoYwRE5Bw4b
	pd2N9NRzphlxhDcZURP5mr6c1AXwWY=; b=UZmVjoemZmwkBHRGPRMlCbPX10ZTC
	9iJmTKAvP+zPCiPUxVC/AjjJaZua7QtvhBWxwnJX2h2imSUXkv/FMlqRD3GVVqaV
	fNp8lpdaTT9I1IcJuJh8fS7Ltf5GCvdisTJNS4y/yHuM0VY2fKMM7sJTEUgyQ7mH
	ENMlJEMO2CeBzRxzpdZ0kYKaPh7o/DrmTFbTtZC7kn8ALsSkPOSgGZ7Y74AkffDl
	eAmcDKQdPNEX2yhhi5V8d2PN40L3ESG7TMGCYoK6nt7L/sW4OP/0N8SD5tBcUAmS
	mQoXH1kzwXWg1WNPUVBSSYrtpN7xi02bdKbOnt/RFxo5dm9EnjHXRuXDw==
X-ME-Sender: <xms:IGVfZdJZM8jpx_MWQTEqb6DZzOxfy2RaHggB_XIPXYJjYFCoLfBSZA>
    <xme:IGVfZZIGHpKNTMUoW-CUPVmzHaMuJDZDKNpU3XndZ_4T0S5q67RIrspmEcnkj2LTk
    pDQbhwMltkvd-sMIn4>
X-ME-Received: <xmr:IGVfZVtQqNI2He2HyRMsMJmbhyF0q7r0sEXnQfQhmX4EbHkXUGgzeJzjbvFkibA8RZiH8kfnRkA0AMXsvXr9lQ-nvDGfIZGCGMfsaKwM8Nz_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgrrhgu
    sehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepleegffffgfehhfejge
    ejheeivdfgleefheeuueetkedtffeihfevlefhgeevvdevnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfhgrsh
    htmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:IGVfZeZkoywdkoadZt1oDfSyIwR9BK-Ch5vimcP-AN6wPzQf3q2pfA>
    <xmx:IGVfZUZehIJK6-gSEC7t2_qwKjTEeJiqHEmGwV31g9O02N4fLLfjyg>
    <xmx:IGVfZSCkfZyhKaIpvxisaynSHOteNWPo5wU7odWwrXiYeFso-nXH0Q>
    <xmx:IGVfZcFtarNIZGOxtXqkRaXg0EgTl25OR5mLHSi5hTl2e2EhLpx6dw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 09:43:43 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v3 0/5] staging: rtl8192e: renaming 5 different variables patch series
Date: Thu, 23 Nov 2023 09:43:32 -0500
Message-ID: <20231123144337.13112-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series renames (5) different variables from Pascal/CamelCase to
Snake case.

Patch 1/5) renamed variable HTMcsToDataRate
Patch 2/5) renamed variable TxCountToDataRate
Patch 3/5) renamed variable IsHtHalfNmodeAps
Patch 4/5) renamed variable HTIOTPeerDetermine
Patch 5/5) renamed variable HTIOTActIsMgntUseCCK6M

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Regards,
Gary

---
v3: Corrected versioning from v1 -> v3, includes change history.
v2: v2 was skipped over..v3 corrects this.
v1: Style and compile issues, asked to redo.

Gary Rookard (5):
  staging: rtl8192e; renamed variable HTMcsToDataRate
  staging: rtl8192e: renamed variable TXCountToDataRate
  staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
  staging: rtl8192e: renamed variable HTIOTPeerDetermine
  staging: rtl8192e: renamed variable HTIOTActIsMgntUseCCK6M

 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 18 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h            |  4 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c    |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.41.0


