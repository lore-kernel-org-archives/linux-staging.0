Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785F1D522
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 15:12:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 837013200313;
	Mon, 25 Sep 2023 11:12:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 25 Sep 2023 11:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1695654769; x=1695741169; bh=krYnmOsbAP
	xs6qAk4ZlOMlPB4un1LdmucZ+bnVoZKjc=; b=R0wJjBdzzoFK90XN14UH5IgV3m
	wOfhQabW+b8FSJ01WWgo2gTQbHViDoiOG+xWuaGesfslaFSD75ughfUJSyr4TvOz
	wRuyRDCIcoI1UNDWaPzTAop3QMl3iOXrkEs0/jYA5IXuDo0zUPDKjhAvzk1yZzBJ
	OPITVs3s2J89W6ByhJ6L+79My69VWxZdv3e0aLqvt2AprHcl+kLtgst6rdp86hu3
	/uPHSt4mW7J7jG+ZshImRupoVKSrRX3DOSYiggfQxtoc80goknQlu70wD38MbFEx
	58vAz4MLvxkJk5Cx2RRiOVDN6PoS0mG+43OtmBu1bTZdQco8nQcDxR9o6NTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695654769; x=1695741169; bh=krYnmOsbAPxs6
	qAk4ZlOMlPB4un1LdmucZ+bnVoZKjc=; b=l3XXlvO1mPzu9u0jmhbpk/J2Ux66l
	j9GjxK72MFqWSQNltA2qkXAlCuVq+qIdens1VhDbv8Ho91yGWynz0otq2E7q1ROc
	F5rh3RwnH1RdkV04iRPW/H1gIfmwBLRHl7FuMub9sPOn3rEln6FZecDsaHVxsMQr
	kkwLaG9g27Rr/PpzD+tFqJ9XmXMOLJ3BsIoKN158PlT0t4bZHZOEnvijreRD1jQ2
	3FLTJbt6tsWLRy1ru80C1ButD667wOuBOW3nN5bM00g8hogdphp//I7j3zU111YJ
	XCKKv394kt75MnI4o/ALdYqRx+9mdMcqva0FL1F8InuyrFZJJaA9gJ/3Q==
X-ME-Sender: <xms:cKMRZR1SQUMctdb_C5WaGiPXaGTmtyw6aTNJ0aWWjyRSyp2Ic4e8-A>
    <xme:cKMRZYEgSHOXoueMUIwbpj5RuvyBLMphN4o_QeO_PkdAVgDYKwxnngHkKVg-qytDM
    K9gSzcAIiVLjPE64Ck>
X-ME-Received: <xmr:cKMRZR4VNq862Q7AnPC4EyXOgXDA4TMsDwBEpkwDcWlSnJkwPJh1_5KbRLyhq5bl0aHL3IpqWyjIfRpIokzhcclaZ8yhiDV36oqU6vNSLmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgrrhgu
    sehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepleegffffgfehhfejge
    ejheeivdfgleefheeuueetkedtffeihfevlefhgeevvdevnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfhgrsh
    htmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:cKMRZe1di_EXtcUGQ3pLOZJ8m7BJ7e02m1CzU3y3zdq73M_SwjRCtg>
    <xmx:cKMRZUGweWcF5ccywYBfFC1KAMC_soNcVw-_V0tfa_0XIPYNZ2iLpA>
    <xmx:cKMRZf8N_b2GSJvPCCPRmW4KGDDjxiXQZzZWBnNyAyVGBu8QhR4DnA>
    <xmx:caMRZZQkWIARVHwpJZMlrD-P2bFjCh-T-BjKJn-0uQjJcB5rMgpixg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Sep 2023 11:12:48 -0400 (EDT)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/3] rtl8192e: renamed (1) mixed case variable
Date: Mon, 25 Sep 2023 11:11:54 -0400
Message-ID: <20230925151157.3893-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

This patch set of (3) addresses the correction of mixed case useage
in (3) driver/staging/rtl8192e files.
1/3) rtllib.h
2/3) rtl819x_HTProc.c
3/3) rtllib_module.c

Variable renamed: HTUpdateDefaultSetting -> ht_update_default_setting

Linux kernel coding style "cleanup", no change in runtime logic,
compiles with no errors or warnings.
-- 
2.41.0

