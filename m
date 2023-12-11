Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79868180
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="jdOg9Rwp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="06zEXlSy"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 17FC13200319;
	Sun, 10 Dec 2023 19:13:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 10 Dec 2023 19:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1702253587; x=1702339987; bh=BQGlxsTyJs
	MMQ2O7O4GX2wwCyogtK8sOF3JBHF3NRM8=; b=jdOg9RwpMIyP2MFPAzrkZXC4wq
	bxNZqRxyZ312UvKBSgLIzHFVedsmP/xfTJ0D5lSPKSu7WYfzAxvozYSSuUjRDOIn
	Y9N4OqHn0yMaSW9px+hmHor4SYHgd10M/AXwD0QegX9eqGFjaQEJG5Ti8TrmD2T9
	vsRM04z2CLgz+2s7vVVAH8+w3lzgfcjXCAss0l4N7Wet7XtdPAXdxYHk8cd2DqWt
	VtqQEovuQ4clNfGa3bfDsUruaGisgC5Tkn/1F29ExTXIjsFPS/wC43QYw7W2VdpI
	CHr9flycN2p84qwGnqVKO/NHlNpHG/wE81KfewAYovDLXeGMnDTErj7yTUfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702253587; x=1702339987; bh=BQGlxsTyJsMMQ
	2O7O4GX2wwCyogtK8sOF3JBHF3NRM8=; b=06zEXlSy2dEv9DlZ90QB++yS1GyeY
	q6XwpbhiE+zjpmR1dWfJ2lOsIATPApzAEh0MohOIM0ST+Kb507SmK8tUakXoroYm
	d65md/VYmQjW9WJyQVecdmpO8a9us9freXftnCDFsiBKiaLAw1D0dGYBbABLQuMT
	jYhMbMa1GNjh31Ea28gy9TFS3jf8UVALAPaxPnRtpL3xtWHutmoolHubjD9Rm4Bf
	U6TsKFzhAzlJCiIDNrtq9gG2qQ3aXCYkWf5ljaubTftS8D+BL76FIAOYd5QWr7Bz
	hDI8U9blhIoyGOdI6dp/orVVNaHiDKoFhDAI8fUXwT9K9NySn+o5yjcUA==
X-ME-Sender: <xms:E1R2ZSq0ZN6Uob_XxiphmHlao8SE8Fr0OAaE3UN2RQik_RX6lr8cXA>
    <xme:E1R2ZQqObPXo9QKZfcoIWxcr57D2fIqP8Stw6qi1Q2EAcQCFRBIphf6x46SAODbu-
    0n3f3EfIVlhz0vpsOE>
X-ME-Received: <xmr:E1R2ZXPObZsrAKUToihZyslIXYMlSLMK3brYOddb34e3DgfaXGTeJabUpfExDlKwL_Qp0zZ5FDx_EawtW0yrH3HharVaJsBBFccQS_ahBcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgrrhgu
    sehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepleegffffgfehhfejge
    ejheeivdfgleefheeuueetkedtffeihfevlefhgeevvdevnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfhgrsh
    htmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:E1R2ZR6lIya25jDy75dAHZFFO_cr34b2jLviFwrxwhWJAwbOBf1mYA>
    <xmx:E1R2ZR4GcrurxzZCMhHy0tE8ioCiW4HX2B6VYE7yv3_SklO2V9F8Uw>
    <xmx:E1R2ZRgrmmkU8KL_ifWeVZv_5qj6-Ca64J_DgAxW51OosYiJd2kx1A>
    <xmx:E1R2Zbnbw2WQEJleKFMRKuYBkGMhroHB52JO_DRyXehswtb0c6n-2w>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Dec 2023 19:13:06 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 0/5] [Series 1] rename variable HTIOTActDetermineRaFunc and (4) other
Date: Sun, 10 Dec 2023 19:13:30 -0500
Message-ID: <20231211001335.26169-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
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

Patch 1/5) rename variable HTIOTActDetermineRaFunc
Patch 2/5) rename variable HTResetIOTSetting
Patch 3/5) rename variable HTConstructCapabilityElement
Patch 4/5) rename variable HTConstructRT2RTAggElement
Patch 5/5) rename variable HT_PickMCSRate

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>

Gary Rookard (5):
  staging: rtl8192e: rename variable HTIOTActDetermineRaFunc
  staging: rtl8192e: rename variable HTResetIOTSetting
  staging: rtl8192e: rename variable HTConstructCapabilityElement
  staging: rtl8192e: rename variable HTConstructRT2RTAggElement
  staging: rtl8192e: rename variable HT_PickMCSRate

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib.h         |  6 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.41.0

