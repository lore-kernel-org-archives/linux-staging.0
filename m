Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F51A53
	for <linux-staging@lists.linux.dev>; Sat, 25 Nov 2023 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="YSPFqZc+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J5HfZoWZ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3A5525C0117;
	Sat, 25 Nov 2023 17:34:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 25 Nov 2023 17:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700951677; x=1701038077; bh=KnCK38yghL
	XpfPI//VhpUZPJx2k0OfYmOLCMGIkrUlU=; b=YSPFqZc+LbsZm6elMFL7KwMN5a
	L4Ev9M9FetEYaNoEDBksUS/o+lxA6tpDZljXPvx5iAavtG7nFMyg4UCM5kFx437F
	itKiYvBEElJ1bNR+3JACsOJOT38Pi1mXsGmg6xB3rf3ivkoeh82xCqjLgjgD3mpX
	/ocUiqgfuEsH+FufhJzIBCQNrp7imxrquQ0U7LrBtBiAsuHa22IcVnQOrMP8PDbr
	dljwC737dM/R5OU3FG/8iXv01NmFlpKvaaSYdAvi+iUk6DYIt0d+ybppDfR4gcG+
	qQWwUWsq4E14d5DtANDTLA4UsqoMqjRczYk4X+zJM7fK6Yis1zNuvTjy+GpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700951677; x=1701038077; bh=KnCK38yghLXpf
	PI//VhpUZPJx2k0OfYmOLCMGIkrUlU=; b=J5HfZoWZsQUjK2nLpVFQD1rsxSjtq
	z9wjCLs+GivTHBV2O0Wvf7t8GcO8EPkdy1xL2zY1sa4U7e1qx8+WhLYqslTfnpVI
	x/BeDP0wdFmN6/51r+01U2gZhid3SfdBx8GSvgUHSd/0k8miZUMNyXFkUsIUPoqE
	izavYlNkScKo2rMAeI3blNUaN/hqOjientqLMsIlCWGc+w8vosFSRNZoChXCsx5d
	bnfMcLTnCeDUH7V2kzNWc0FnHz5c589mrS3zC7y20rRTdvkTVhrCqTBkj+szHtrR
	l1tse/O+gTyDO+P0lEtqJyBv37ciynwH1WqpHObQMhbWJXbOrxLPnlOjQ==
X-ME-Sender: <xms:fHZiZbAoZ7QJVSuXxdagbXtpDorpk0ZdWdN5xSU7znJvW9ePdHXAeg>
    <xme:fHZiZRiPsOiZzUBI4F6air9-T-L8EBQDo0DRiTSTD6UsU52X1p01C9jlJyGx5oU2P
    5E3vxJaiIF0kbtIMxc>
X-ME-Received: <xmr:fHZiZWnVPGVS5j999fkLypFJoBWQQjtkQtj8poTkliANwOvki6v29E9FVNOmTtlCRmE-KlQLkEIQJiAYeda0jKbGiXJnY9eGkyKnSebPomqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehjedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghr
    ugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhje
    egjeehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrg
    hsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:fXZiZdyfUtIUxi2F-pafjqz9jNDulelAhUN3Oqa55ycQtdUJm5yGTQ>
    <xmx:fXZiZQR94Svm2rZx4mNF5IUT-ij7PH3i92hypRBqJhbpynf52g_TpA>
    <xmx:fXZiZQZv6n0Zj6AEQQsXhp_HO8AQO-BVfat7TZZPJ14AzoThrfbOsw>
    <xmx:fXZiZWdvs4F-wvd6Y2G59XuytIkbs5aTVplwlQIjhCxldkSxdMDBvg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Nov 2023 17:34:36 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/5] staging: rtl8192e: patch series renaming (6) different variables.
Date: Sat, 25 Nov 2023 17:34:27 -0500
Message-ID: <20231125223432.13780-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series renames (6) different variables from
CamelCase to Snake case.

Patch 1/5) renamed 2 variables nMcsRate, mcsRate
Patch 2/5) renamed variable isShortGI
Patch 3/5) renamed variable bCurBW40MHz
Patch 4/5) renamed variable nDataRate
Patch 5/5) renamed variable is40MHz

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Regards,
Gary


Gary Rookard (5):
  staging: rtl8192e: renamed 2 variables nMcsRate, mcsRate
  staging: rtl8192e: renamed variable isShortGI
  staging: rtl8192e: renamed variable bCurBW40MHz
  staging: rtl8192e: renamed variable nDataRate
  staging: rtl8192e: renamed variable is40MHz

 drivers/staging/rtl8192e/rtl819x_HT.h        |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 66 ++++++++++----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  4 +-
 drivers/staging/rtl8192e/rtllib_tx.c         | 10 +--
 4 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.41.0

