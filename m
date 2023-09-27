Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9753D64
	for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 11:27:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CBD2E5C264A;
	Wed, 27 Sep 2023 07:27:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 27 Sep 2023 07:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1695814038; x=1695900438; bh=4m/PZKVdXY
	7AT+Z3heMl6Agfv+C6lZ2bso0+fIpmlHQ=; b=sThHNcQyRCqSCMOXATd9uNVzDS
	k3f4MC+6kNGq91j/enRZpqBP7KuyqztkeyCj5u7CGCx9FFHVv728V3tN6IESD/fy
	gPc0YNsZsxE+YbL094sy3EuVCnoCjJTgc0IiQmQ8n7G2Nbe2vPbPUREoLKsSvfmZ
	cGeqw5bULzYwOFyvC20U76ROEXPgtcfIg8sZU5+jYbTUFL/QiScaDvkhcG7RMEof
	9KsSK44GcZXDUwtLC0kND+5ah8hYhc2wVbTPe7N1rxgWoR8OJ/CkINZ2ffyDWwB7
	gcyJoRMZD5UUyYWD1RtxasPrRQEWZblYob4pwRmWkLEFoyo90Glu9bcFPWTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695814038; x=1695900438; bh=4m/PZKVdXY7AT
	+Z3heMl6Agfv+C6lZ2bso0+fIpmlHQ=; b=Dt60JR8Zn+DuPfQmEq10rin/jEg2N
	67zvoQQSpDUJU8iu07TZbhEpHz8cJT72FlZ3IeGlHcJiBr72GB9JCKyCTSyZ79tV
	muXIUinqu3hZ96FA1OQEJrONWubF4M6BERJWJmXEyMtWBZjCWJ+BtNymzflVUOG3
	03YetpCFPf+fSAhxhXPGk+K71J3fcJg4H0S5X5EPoJoggtkPw1DiFaLR3QK3BKjm
	w3gI4QWBfVutynmVcCd2bC1oXGLw+7iUaaMCM8uS8FOA/K1xO6yWNtIAWHZENH9H
	g6pnBr5qtgtAuiaWdS8KouMHF9OwqyWQUjv0j1VmsQsDFLoC9bvCIzRVg==
X-ME-Sender: <xms:lhEUZYahxF-ehTVrQp_UWBWr61m9xK7JvMoOzdmFfttY0G01NHPaIQ>
    <xme:lhEUZTZGVdOrZbQmUZChu8SYWzLo6HPz9VoLAqKOTQZWqg9Q57kZnbh9REYeT5td8
    wq-5M2dH-trpE6PV4c>
X-ME-Received: <xmr:lhEUZS_Bix3xsLuP51tFQrna6c4FRnJuLYNQJiIJILcZfo3ShFWNOksggRG0e674rNTOaGE_kucBLm9qY391Rx-oYG0tnUlrSC0mdvgPMlk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdefgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghruges
    fhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhjeegje
    ehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsth
    hmrghilhdrohhrgh
X-ME-Proxy: <xmx:lhEUZSrnSEITyi1iSVwVOZuMv2n1wWiTPeWpq732GbpgebIzJsUYHg>
    <xmx:lhEUZTrttXtGnQE8zIr1IiteEYMwZgXo9iBl7c0ywTUsSYCGi6crjg>
    <xmx:lhEUZQS69p1iV2rJeZiKOhTWM2lvYW8662GMHvmUKgwg6SAK5dMh6A>
    <xmx:lhEUZa2n9_ykiaWi4cQ70e0o45PezxPRwK1ybYdUKN-2n0jYtGMPMA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Sep 2023 07:27:18 -0400 (EDT)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/3 v2] staging: rtl8192e: renamed a variable
Date: Wed, 27 Sep 2023 07:26:32 -0400
Message-ID: <20230927112635.27637-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!,

This patch series renames the same mixed case variable in (3) different
files of staging/rtl8192e.
1) rtllib.h
2) rtl819x_HTProc.c
3) rtllib_module.c

Regards,
-Gary Rookard <garyrookard@fastmail.org>


-- 
2.41.0

