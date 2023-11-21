Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77620DC5
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="gR/ySh5T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ApqtVPLK"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id C9C9D320196C;
	Tue, 21 Nov 2023 13:15:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Nov 2023 13:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590502; x=
	1700676902; bh=hopG2M/LEQ0YkzvfYVZfqXAwYlgWV1Hj2Np8CK+F5ww=; b=g
	R/ySh5TOZ2cD0s6r3IFnbpB+nDDZ+U6i53mlyjhEuGLieJ4zK8nRonItdeJDjIm8
	VkmQ/EQBO0b1dzlhvvq3vpGtBTLQgiaQtv8gVkPXeKFRheRyvkIz8Q7/0xqv1WBJ
	Q1hlVLbVnOG3Wd0hOaJBtxUCpmCyEYnRLNWtLB3vJUjyhXYChwenbKxPxY8+ooI4
	FqSrHe8g8TqGX4fa3uE6EdyFp3bbI5B2rPjpA5EiNAo7HTZVYTao/AwpteFlTLOn
	FQiptDqlp3hFgSqHbgV7H/CL1RfTGbreBa04y6j1NgmAzRmRFlB+0O9GXew6UU/6
	RmzFu/cFrL2SfmjCQ4whg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590502; x=
	1700676902; bh=hopG2M/LEQ0YkzvfYVZfqXAwYlgWV1Hj2Np8CK+F5ww=; b=A
	pqtVPLK5EKbjVcy6HjQn57ywNYTt+xafH4V3TvLS5IAjhmoaIBFMV9k4Yqs+DuvH
	LU0GOLIlwcktsS9pKAKCwsM5mqVg2Cz1vkbbThtIFCq5UgdGtS/7Uh0RWdQ5LIEG
	8B2sJLP7rAoPwd9nYi5qvG+JQtFrXQ3GM/BfnXYCx4k5th7hfHBCzQu8gUyJP6j+
	tQeS30pbs2ksFy1ns+6CC4i1wxp9D/15e8cdomnKvGMr2EjY2uJB3UIVdmJ1KbbJ
	mnYq1fOd/GmBLwfhkNUsgpQQ2EB0YfpM8/Qhw7126Wk7fTAsNVkSOfwJFeCuuVhN
	3fhcaPZR5elJKDph/JccQ==
X-ME-Sender: <xms:pfNcZbYNrsVUmxMvBIxnvs_WlD5wqinMjSjEGdJOHDXFjzWMhO6naA>
    <xme:pfNcZaZ2K0scmmgtRjoUMjgFIXQWMD585Tb-dEIDJ-QgfBNQdhpVncPxy8Mx5VJSh
    o8sXteslIxl-tfx5rA>
X-ME-Received: <xmr:pfNcZd8Ag1pmEW8OrrCR2MALnKVwfKI08qdF600ksdQ1bD0cDtXfUkFUmXRS_-Ssd6S5uZ69POtWGFIdbsNQ-9_EkVwcj1nigDW92C6NrIuo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:pfNcZRolB7ERTNpn5xEN6EyxfkDsc9GLaFYKF-1plDCaL3UgMuHnnQ>
    <xmx:pfNcZWrsm8cE4BBJIfUE3celJOYncXuVbYyJGihVg_QUi7U8LmAYIA>
    <xmx:pfNcZXSBaXKMkos3P8nq_6p4HpwVSUShGKh-lEDcEercK_bxJQf_6Q>
    <xmx:pvNcZZUhbe7cLSiHTj-fqyUn0cBJycVX7OVnQX5vhsEXl0DwfOYarw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:15:01 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: renamed variable HTIOTPeerDetermine
Date: Tue, 21 Nov 2023 13:14:34 -0500
Message-ID: <20231121181435.9337-5-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121181435.9337-1-garyrookard@fastmail.org>
References: <20231121181435.9337-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed from Pascal/CamelCase to Snake case the variable
HTIOTPeerDetermine.
HTIOTPeerDetermine -> ht_iot_peer_determine

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0993263c13d3..0873c19ca051 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -164,7 +164,7 @@ bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
 	return retValue;
 }
 
-static void HTIOTPeerDetermine(struct rtllib_device *ieee)
+static void ht_iot_peer_determine(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rtllib_network *net = &ieee->current_network;
@@ -672,7 +672,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 			ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 		}
 
-		HTIOTPeerDetermine(ieee);
+		ht_iot_peer_determine(ieee);
 
 		ht_info->iot_action = 0;
 		bIOTAction = HTIOTActIsMgntUseCCK6M(ieee, pNetwork);
-- 
2.41.0

