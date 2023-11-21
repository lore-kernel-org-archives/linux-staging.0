Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EB20DC1
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="cW6FUYob";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b3Lt+CD4"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 1F97A32018C2;
	Tue, 21 Nov 2023 13:14:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Nov 2023 13:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700590482; x=1700676882; bh=WOeLWiP92Y
	AALIvoUWrF5mqn2TjAV7jRPHlqWL9lWBE=; b=cW6FUYobdfXKlUWtvo5xmXijey
	T1XsQZSmW7MtAzV68lhlaQelW5Z/Hqi6cfG3ffDI8RsXIaZi9SkcHTubMemjL/y1
	pq/IpA/v0NjiImdpoUUeNmOxpVYuhpDxRxaaYiN/HTRP0eiuqX4lq8P+6sFg/B9I
	xEje7fOwFAnDr4n+YCda/oP04BhKDOmdOUPsEJr7q1Uor4UHAPzcuGPTCyQ3JcCy
	frIyVRqOAxgpMi8l6+3N1EnnQinXnotTOrpQdv1TthQS8sr/UDDWXABG40MP2s0Y
	EWjX7YuNgTgTRfY1I2h3CAUxBcABln5M9TLUBqUEAdvpX7QKTnz75tETLsXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700590482; x=1700676882; bh=WOeLWiP92YAAL
	IvoUWrF5mqn2TjAV7jRPHlqWL9lWBE=; b=b3Lt+CD4npiIS+UcVLBCIPuoTzWa+
	aBihdex8HddohJ1d4XqUz5LIKFw0yYGgkIxGEssa+6KSo/zYuJGLY39h9qEdVaH3
	72NC3O1QQeHcgcfTchpmzNowPMMNXgqJN5PXhfepICcJlMdcOl3nJ9fom+hWP5JF
	Vedptn2i4hOgMTdfWnm5seFHnC6AiadOJDOWFd5vInKbh66+yYMesd5wLmk2nqoH
	p5rORvrPjFoqdvox2kLjK+UOb1dvXCLLG8crIPTiftTmyLxZlqdpz4dnQpzndGa+
	OOo5GXdb+YeUZn2DNcJ4lBQr6Bjd/9RVK7HSKWM8Ne1JFeG9loIAFIDyw==
X-ME-Sender: <xms:kvNcZSwzLYdH6JLYl2j37KTGxOlO7yhFQukL7qpNCkvjjnttCH3P7g>
    <xme:kvNcZeRtvsZ31FjJtxcJnE5toKjRDVLoBoamHEo5n1In8RcSgHtFGQ9-cwQ_F8Sjs
    Wjp-gqUUTCW229CAaI>
X-ME-Received: <xmr:kvNcZUX6X7NginfoyaVG24ODurrQhNcW5XEsS7yaZ-8N3nH62rQkj76i30pH6HM_ZW-07bQD8THWDlE0QgbBTRe6SnBaIQvX4p5ljbeUIkkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghr
    ugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhje
    egjeehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrg
    hsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:kvNcZYj5Nm2dFyO9aXdOe3ndA3DEZJ9FEjqp8E3RKoVMOv8zmX8Fkw>
    <xmx:kvNcZUAzPBqBIqwu5c8EPwlyOFZJnw4w3IiJiJmA5FaqEazKe7sWCg>
    <xmx:kvNcZZLuk4HWC9l-iRRCH9osHqODSEwRHp5-VvUy-ijVjp7mrfVTLA>
    <xmx:kvNcZXPUAKQzWs4AdZwx4bKheMQ9Isp9qhvXh0bER8X1nGCDGwO3VA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:14:41 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/5] staging: rtl8192e: renaming of 5 different variables patch series
Date: Tue, 21 Nov 2023 13:14:30 -0500
Message-ID: <20231121181435.9337-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series renames 5 different variables from
Pascal/CamelCase to snake case.

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8291e compiles.

Patch 1/5) renamed variable from HTMcsToDataRate -> ht_mcs_to_data_rate
Patch 2/5) renamed variable from TXCountToDAtaRate -> tx-count_to_data_rate
Patch 3/5) renamed variable from IsHTHalfNmodeAPs -> is_ht_half_nmode_aps
Patch 4/5) renamed variable from HTIOTPeerDetermine -> ht_iot_peer_determine
Patch 5/5) renamed variable from HTIOTActIsMgntUseCCK6M -> ht_iot_act_is_mgnt_use_cck_6m

Regards,
Gary

-- 
2.41.0

