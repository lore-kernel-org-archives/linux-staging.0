Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57414F9B
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="NCgBHoi+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0x9lrdp8"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id ACA133200A39;
	Wed, 20 Dec 2023 22:12:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 20 Dec 2023 22:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1703128342; x=1703214742; bh=S8kq+ZcQq3volLdHUggxF
	+uRhAbqpjv9oNMSix9Veq0=; b=NCgBHoi+U+f2VJ/AAbwSIvfIecPytdLSZpW/m
	F1tEIMtz4eVox4MqmTefDSc9wG36fJYkq6wGtFH+xB6+nKzooGIOjgIDfFE+f4wn
	P3Aaxqmsz4RoOgZ0Jv7GUdY8znKP/cyQvAubMVEOZ12llrX539hNoy9PFI3Kmrr7
	6MYOot4eKe9k6qmx6sRZTzxvPMGJ5yEy5pKXAZETLm3Y3hhM3nJ05MrJ/EiQHbSD
	/o8gFyuPQxs77XTfLxkh5OXrH6QIf/0b2Oz5JY0XuoQr9o9QYkhNmJQWmcgTl2Va
	+QKinPyKzcNbGCqPOqZ30EWrNqE3axFtueKEeFXa4h6q8wDcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703128342; x=1703214742; bh=S8kq+ZcQq3volLdHUggxF+uRhAbq
	pjv9oNMSix9Veq0=; b=0x9lrdp8JxRKqsifIOXZH93WCt8KFNS2QulYOwk6tgHd
	u8rAhlW0erQ1fs17tmMIQkMZuzutxuksOxUjpYQShxRgDcJaY6BxavTH8hk0Q2AC
	OBqBHSVjSJqZc4nwtQ8pH7jjGsHYHbzSXoqGFTWU3bUA4hcXQ3/TDq0/oHwk7Q64
	GjaAVPugbh/yKclzI9hmjakYxHb7E/ANohnOZAM4VxN++uXrTLp11ukDCw/FJYEh
	4CNRuZbAvgsC48sk9PPn489xlvTkCiEKO25Qy4kdEXfCSJvWGJbSyjDa10JpV+xv
	YaYlwhHwKuLwUYNrUMjRZTV8gj6pSywfXGv8+LwN6g==
X-ME-Sender: <xms:Fq2DZSWtRn6ZvEFmp0DMXdpsi69E5riIEcMcK8Q9zDWWOnBXJ0Uwkg>
    <xme:Fq2DZekSuT-Ma58UKs1-scFW0pgisNAPTVVOwepOHNuzA913feOczJlK5FQYfgA-z
    ynADFAHDw2mW0_RQrA>
X-ME-Received: <xmr:Fq2DZWa79tzMfkbVqTMeqxibHPcho1eRpXZP-6wnAvPXkf4YNYtxjY7cVcyZqz4UNkuC3WkGkOTKr6pLnAuMGdGDhafSyWZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgrrhgu
    sehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepleegffffgfehhfejge
    ejheeivdfgleefheeuueetkedtffeihfevlefhgeevvdevnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfhgrsh
    htmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:Fq2DZZXaVjw0kRPWzUZivLNTcMXLygYEkE_uvV5uLZH4xX8ELMpJaw>
    <xmx:Fq2DZcmz_KzyFlSdt9NUv7cDf6-cbIrvnEg_qgKLFhKIpdvR9vnKVw>
    <xmx:Fq2DZee-UT0pgHpllCyUL9RtHd3SmeNV3ZWWWKPm64OcO8ifV6OFIA>
    <xmx:Fq2DZYvD1Pbi0eDhXook1JpkmPy9nGo2Dtw6qvkLli4TKPgvpKVPVA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:21 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/5] staging: rtl8192e: rename variable HTInitializeBssDesc and (4) other
Date: Wed, 20 Dec 2023 22:12:54 -0500
Message-ID: <20231221031259.14853-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series renames (5) different variables with
the checkpatch coding style issue, Avoid CamelCase.

Patch 1/5) rename variable HTInitializeBssDesc
Patch 2/5) rename variable HTResetSelfAndSavePeerSetting
Patch 3/5) rename variable HTCCheck
Patch 4/5) rename variable HTSetConnectBwModeCallback
Patch 5/5) rename variable ePeerHTSpecVer

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>

Gary Rookard (5):
  staging: rtl8192e: rename variable HTInitializeBssDesc
  staging: rtl8192e: rename variable HTResetSelfAndSavePeerSetting
  staging: rtl8192e: rename variable HTCCheck
  staging: rtl8192e: rename variable HTSetConnectBwModeCallback
  staging: rtl8192e: rename variable ePeerHTSpecVer

 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtllib.h         |  6 +++---
 drivers/staging/rtl8192e/rtllib_rx.c      |  6 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c |  6 +++---
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.43.0

