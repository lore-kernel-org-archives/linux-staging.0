Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F98D23393D
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785114577; cv=none; b=MwYucrxxg5niPkoTSqOigws/YUtRzF++fqRX1pTwEhOHvuUjjrmSMB7gK39Y8Roeh8KMrV1IS6VuSCY3yjfLkwPg3xbt3p2uLLBGbGyg6sRgfIO8V4IdqceJoGJOAB4bs2s6qA4zV/k2ZEymLeN5gUYRCGZKh2SAitr5Kv5L8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785114577; c=relaxed/simple;
	bh=4Skbq9YOlNzNneKExSNK0BKhCih2K90idKnQTUeJyAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N23g2NhmEWfID1c+NTSXEm0OAeuDDggoxYrIH2QUqX4ZMAswU4lckemqjhSGMe77kqL6Ti1um+7DeGKYS2/gqOwINisU/NphLdUFjjOxt86qnoDnAWehNwOTIRn8LMq1/gHIyd4AUNYQQi40hNckFR5984CcCsr8IMoosGKhZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=HJq7XS2e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DYcW7NsO; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="HJq7XS2e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DYcW7NsO"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6F3E41400336;
	Sun, 26 Jul 2026 21:09:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 26 Jul 2026 21:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1785114574; x=1785200974; bh=koEaFn8/vGz5J9MQYjZWG
	nGOHXBzGq/g7bp1GKu75qs=; b=HJq7XS2ehO4D0waA3VRPYCAKO+NWFlKzxVb/L
	rCsrRf1CHhr2JSbVYLnmRnDGTHuor9DGuTVN8ECSzTcooCHoBPi37HfFZaJUBqYU
	wwzRqsj5pbsWGmfYvjpocNhRPxrSVucG6N5stes+J2ZEsmBf1GrUZ+T7KER3ZKt8
	vJweN0cJSkt/OjVJWtVifGV+GQyH0E4n6bHhMakh3HZJ6B3eZ0npSVgv/Xo0d1NY
	QywDdDoQdsg/vK5kWxYGKeiz+fpkslJY6hH5btghNAKWz1xNX1wyLimnrDWsDYn5
	M9bttdZgokeZ93Thn0hVc48FoxzXSF2sWLrKEfcpNaYzJ0s7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785114574; x=1785200974; bh=koEaFn8/vGz5J9MQYjZWGnGOHXBzGq/g7bp
	1GKu75qs=; b=DYcW7NsOFElfREb5pDiSYgg0fsG9jSNTAtP16MTRjo04LWvI89a
	23XD43+phqQqGO9jWqbg85h2+UxA78rDEXoJPFLt/vzXXID/jnJhpejGSyLLSrcD
	T7GdMcN41TmiBHxRQiywUiOcCpEl7tddeypD5pBEBPSXx+nUzRpeGvR2GUY8EPSQ
	oE44bi1QeaqrpkmMR9lyciBHrZ7RM3jcq40Wrd/n2BBRI3fuMdXNM2f73PFNUdFs
	9Hwd2PQ5uNUViQ2La23qpwpOjSBptJjSlBcn5+latg0L8N+ac297VQ8PKNMIWxIT
	sGCf3bdkcvKruRoz4deCbMmVMqqJsbdet3A==
X-ME-Sender: <xms:za9mavdBwRdzq1avE0Tds9Y5kpwC4BGthKATLi3FiRnsL0vVPWJwrg>
    <xme:za9marufriWK4NfVQM95yokm_jcw7ICVIXmX17IdhesQ3ZdnP-WFetsHxoN93r0aC
    q--S4ofF1isHBe86EpOthJK6qBpZGWK0jpob8zB0tlMWtbEwV4qcT0>
X-ME-Received: <xmr:za9mamgPKvKNL9pZYc1oYW5smvnnT_wEsd5793wF8U39xNAek2SBWq9rPWyBRFgC>
X-ME-Proxy-Cause: dmFkZTFw09+8cA4s5S8iuDhSPfdq1LDs7d2+/fwxQaTb8huAScvaiu9VHnCs3K+Sf0N2cy
    4ASfKAKMP5Sd54RmM8hV5oDDxGf9t3u+PId+u3Nred23EBYsYSBUN3/mwxnV3kUYGyorGm
    m6qreTDlv6j1Oi/xfVhKFlZfns29XHFYw2ULptQMSBzjmwNt5xn6N5Q4i9THmEMNkOiLsJ
    9eHO20c76Jjafrorj0xZf986Dc0Zgnur5bh9ZCUQLpTraf07j+YyVf0nLMdI1FF2nDOJ19
    D4Cccw5ZA4JfnfpkUpBFYWUrD6XWoMGMA5iXBtVTrMro+ezT9K7jIrFWAOBD0qNEhyqLJZ
    5POmIdwzire+TN6ay8B8V6dnmNx6WyUyh6x9A/1J2+kgyiaT7chqvMYFfVE+nQ2C10gCTl
    Ipnj2pU7bsFX8LqFDJ397GzwO7xOzIMgKzgkqc2bV2Tf/Bb2ZkOiIUoafQuviAQXYg276o
    2nwmLNCqVNuZer5fGRQpV/n1DKiznc6ErAIEJYN7IYr/tzZJR/O0IJzDVokNnejuVTy7DD
    PVp476p/MGPX1ClD16Pvrsm8dj45QOZwcmqBMK99oRfRn0IZR7xyWt5QmlRwElE4fVsFLe
    VZUepgIeagaw87HtfxKA51FO+wXjPNykqzuicuIzJ+AdF0PKMj6xRpvlZljw
X-ME-Proxy: <xmx:za9majtLSldQDBnskrGddZcEYKJTRQP7-GJ4wLhOJKr5wm6DgWJ0tw>
    <xmx:za9mah_tiugqK8xUYurw1IBMbwq8v2Q36hMMavZB1DNjc_2AdUIXJg>
    <xmx:za9mapbDiuz-Qw_rlbP75fYXQLIDe7Tb5vS3Wz8N4fH-Z7PbiDhb4A>
    <xmx:za9manpYjYz2A3gwC0YfE-kblXoO0w5pIQhlqRr8L-zy5bthHhH83g>
    <xmx:zq9maoqDiIv4kiRCiMkyFPG0rsK9eXROG_T1r9fSknbL0CR_Ir4TJury>
Feedback-ID: ice294775:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jul 2026 21:09:13 -0400 (EDT)
From: Diego Schild Smiths <diegossmiths@fastmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	matt@mattwardle.net,
	diegossmiths@fastmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: [PATCH]     staging: media: atomisp: Remove spaces at the start of a line
Date: Sun, 26 Jul 2026 22:08:10 -0300
Message-ID: <20260727010826.91459-1-diegossmiths@fastmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    Fix checkpatch.pl warnings:
    WARNING: please, no spaces at the start of a line

Signed-off-by: Diego Schild Smiths <diegossmiths@fastmail.com>

---

Hey, this is my first patch. I learned this at DebConf 26.
I appreciate any feedback. Thanks.
---
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 32 ++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index 76d76ca4401a..3d8e473275e0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -31,8 +31,8 @@ static const s16 chgrinv_x[NUMBER_OF_CHGRINV_POINTS] = {
 
 static const s16 chgrinv_a[NUMBER_OF_CHGRINV_POINTS] = {
 	-7171, -256, -29, -3456, -1071, -475, -189, -102,
-	    -48, -38, -10, -9, -7, -6, 0
-    };
+	-48, -38, -10, -9, -7, -6, 0
+};
 
 static const s16 chgrinv_b[NUMBER_OF_CHGRINV_POINTS] = {
 	8191, 1021, 256, 114, 60, 37, 24, 17,
@@ -50,7 +50,7 @@ static const s16 tcinv_x[NUMBER_OF_TCINV_POINTS] = {
 
 static const s16 tcinv_a[NUMBER_OF_TCINV_POINTS] = {
 	-6364, -631, -126, -34, -13, -6, -4452, -2156, 0
-    };
+};
 
 static const s16 tcinv_b[NUMBER_OF_TCINV_POINTS] = {
 	8191, 1828, 726, 352, 197, 121, 80, 55, 40
@@ -66,7 +66,7 @@ static const s16 fcinv_x[NUMBER_OF_FCINV_POINTS] = {
 
 static const s16 fcinv_a[NUMBER_OF_FCINV_POINTS] = {
 	-5244, -486, -86, -2849, -961, -400, -180, -86, 0
-    };
+};
 
 static const s16 fcinv_b[NUMBER_OF_FCINV_POINTS] = {
 	8191, 1637, 607, 287, 159, 98, 64, 44, 32
@@ -77,10 +77,9 @@ static const s16 fcinv_c[NUMBER_OF_FCINV_POINTS] = {
 };
 
 void
-ia_css_eed1_8_vmem_encode(
-    struct eed1_8_vmem_params *to,
-    const struct ia_css_eed1_8_config *from,
-    size_t size)
+ia_css_eed1_8_vmem_encode(struct eed1_8_vmem_params *to,
+			  const struct ia_css_eed1_8_config *from,
+			  size_t size)
 {
 	unsigned int i, j, base;
 	const unsigned int total_blocks = 4;
@@ -208,10 +207,9 @@ ia_css_eed1_8_vmem_encode(
 }
 
 void
-ia_css_eed1_8_encode(
-    struct eed1_8_dmem_params *to,
-    const struct ia_css_eed1_8_config *from,
-    size_t size)
+ia_css_eed1_8_encode(struct eed1_8_dmem_params *to,
+		     const struct ia_css_eed1_8_config *from,
+		     size_t size)
 {
 	int i;
 	int min_exp = 0;
@@ -266,18 +264,16 @@ ia_css_eed1_8_encode(
 }
 
 void
-ia_css_init_eed1_8_state(
-    void *state,
-    size_t size)
+ia_css_init_eed1_8_state(void *state,
+			 size_t size)
 {
 	memset(state, 0, size);
 }
 
 #ifndef IA_CSS_NO_DEBUG
 void
-ia_css_eed1_8_debug_dtrace(
-    const struct ia_css_eed1_8_config *eed,
-    unsigned int level)
+ia_css_eed1_8_debug_dtrace(const struct ia_css_eed1_8_config *eed,
+			   unsigned int level)
 {
 	if (!eed)
 		return;
-- 
2.55.0

