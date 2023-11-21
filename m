Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD982206F
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="jayD/vE8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xb7ua+Jl"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id E2DB432019D8;
	Tue, 21 Nov 2023 13:09:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 21 Nov 2023 13:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700590195; x=1700676595; bh=WOeLWiP92Y
	AALIvoUWrF5mqn2TjAV7jRPHlqWL9lWBE=; b=jayD/vE8GU3iKmkRexrSlo/FzP
	oY8/HL0iaZBlQjGsejNVPZzU+rOQ5Y3xZc9lJ4PobmsaO9bZFv4nH7m7hm+Fbe5w
	QsLu8lEI4DJyfTKLk+bg8TqbGrBZcdfKLitOOTdXmJ8fUxbXRF/0A+c4/egvuGo+
	Pb+PAE+Sa8mA5N7GBmjBcHJwymxOWTmnETDXYAV5gnfxE3s3sanpUmT914V1fIVY
	kyNXTbxSomj3ByDFad2XFprFdrHRwkNe4o1g6IHAQWcpflZq9szb2k8oeMVjx6l8
	PpjGQfq/DTrbdUHOb8xQtD1Ol7r1bkBNMGn07niM9rFjryYCPwUrNPFTPJhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700590195; x=1700676595; bh=WOeLWiP92YAAL
	IvoUWrF5mqn2TjAV7jRPHlqWL9lWBE=; b=xb7ua+JlfWG447lIHFEqs5XIgYe85
	vAs/Mk5DWzhfj+/SFFo+RJggLKzvu+Qiw9bH56LazyXIs/y7Hfzxe+mbSSXgRDmM
	Ekvh4KKOjFU2djYIlQsUuadHyvLsGVzRDtw+kyUEmsWNpXYmEQ4zUfv4jEwIHHkc
	/p4P3CvQ2QXALYof1yguHRemsXPodhKKhqCI+c3ShUxGdRl5qrmmTAsWSSwgEI5T
	4a+eQ6Iv1Q54OOWMUrHE/2fo38DlakRbeQMc3le12ezF5pUkwLqvTdsaas7wgiCl
	wNHvsawvHUaqEJJ2sg/ayLaAv1w9FrIGo/ZyB6bQhSwZWuId36mQGkICA==
X-ME-Sender: <xms:c_JcZZTKHGVJdzObeH4uUcRmwLuhq3nizl5IvLRjt3jgndWEBT8HIQ>
    <xme:c_JcZSxVqUsH8lTd0R9yRvERPCsM-hFwGn-m3KNkyb8OKBo01h4kYuiNhDoZ0O28x
    z8z74wQafB_Ru7fiuU>
X-ME-Received: <xmr:c_JcZe0jj_2yfR6TCblKTnUGQs7bFqrgrYW0DimCVBlegCfD_74Cx4EJwRp_wQ0yVEcAfPqPOknn9McocNCM8Qc9oz_GaInCLHAlE5FsmRzP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghr
    ugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhje
    egjeehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrg
    hsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:c_JcZRCmmHm9faq5ydYVjRQWlP9m539a7cMlwcTKfMhTWx5TxUW-7Q>
    <xmx:c_JcZSjZNB7RV7zvopoUMAGj55kawDnwK3dYTgAFFI2knw6ValCiLw>
    <xmx:c_JcZVoCYbmdXZUl5He_13FTwGT-omOeOM6OSwRHocLA1dh4qulUlg>
    <xmx:c_JcZTuZoUgYMVtCrUhGwqwmBDxJb1nxrFzIpiOFI168bja0OlmEGw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:09:54 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoudation.org,
	philipp.g.hortman@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/5] staging: rtl8192e: renaming of 5 different variables patch series
Date: Tue, 21 Nov 2023 13:09:42 -0500
Message-ID: <20231121180947.9223-1-garyrookard@fastmail.org>
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

