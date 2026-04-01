Received: from outbound.pv.icloud.com (pv-2003j-snip4-1.eps.apple.com [57.103.66.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B53E92BC
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775048243; cv=none; b=dU0GWTvbqVqVrStgBH8xhCASXkoOOUJcDjZsgFhnTuRXd/5gQHmn3hO7xJzrNLsksmk0yt/FfxpEh5bZj8usJy8p3ZWnFUXO/cmxFsDAO5tZUJqA3SecFk98O+V0G5F9S70raKnJTZuqgqK6zugfhFOl/hM+fOMZ1MpEDwjOn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775048243; c=relaxed/simple;
	bh=Dmlf6Aerb9vaonhC8E2LqwRswFNQOGuVJJobPXjEv4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPr9gFW3KLzWsUrULdS0+XJ3bQS05H85+SKgWhVrR5DeaqnYwHhGGe7en008C/K2IhcP76OqXXmx6H7oYSYgf80+kFYXkoqdoGki7wtGm6edbrMAy/zgyS1nR8gs45F2BuXonGNnFyyP9IU3CnWTDf2mU6DrsJZFDGvJd6FZoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=d6Me2mgk; arc=none smtp.client-ip=57.103.66.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="d6Me2mgk"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPS id 1561D1800168;
	Wed, 01 Apr 2026 12:57:18 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1775048241; x=1777640241; bh=wgtdszrSGtBHrmxfWNeS1I+CHUblEXIUyM1IV226OlI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=d6Me2mgkbBQlLRdadX1Mv2Arny5QEVsxKNl5oay8u03GP2kAXCdhH9+9jC4GS/amf5b/qn3vunS7MUsEA9pNI3Sbg4qkd9da5t8m89tmsXe1CvBgwwCGCf+jSGPPGnk4nNJZmtYU2j38jfVdtzvUu8BBC/7hqFLJ5UhMUxvcejHwRVLUKMHMnf53a8bVOR2Ys7F62NdvAvjmjWTkfpXWUaIH4BNf8nt7/uw3eejsGe5URSiearmCc/DmNxKs72Z8yoPBUYBMV2jdP9IX9+vmkU0eVPc3VaHNXpn9gzXbMM/6XSzMNzqTgKoEev/NqHKDnY2cYR+kMy057YKObxVe6g==
Received: from nixos-thinkpad (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPSA id 099E11800107;
	Wed, 01 Apr 2026 12:57:16 +0000 (UTC)
From: Hadi Chokr <hadichokr@icloud.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hadi Chokr <hadichokr@icloud.com>
Subject: [PATCH] staging: most/net: remove dead code from skb_to_mamac() and skb_to_mep()
Date: Wed,  1 Apr 2026 14:57:11 +0200
Message-ID: <20260401125711.80822-1-hadichokr@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5gP-ecUdKzxdUv7-LdrH9px6qcYTT9kD
X-Proofpoint-GUID: 5gP-ecUdKzxdUv7-LdrH9px6qcYTT9kD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyMCBTYWx0ZWRfXxrVJz5H1SabL
 DqxcfLJu/BBG+N3p9dDPDzpk6Vtajw6ObiVLy7BhfUQ66wlspUTSNTrER2b4RlQa4aT7rSuMfKC
 Muw07QcOaM6u7m7PRAShWA5Jtm4Yr5FnR92kI+5l2BjniZdbt8mKEYjopiBMqUMuHEXzdYhjxlJ
 3mpdXa82pmt57lAmR98tsmOS3VX39d1l/SeIUXGmrqDKPnDVD8hLZ9VIkS44VWxEG00OZl9LrHh
 SDiWJOW+RcVvGVH9SmWpFZ8i2XlwQ9hbbGw/tEF0Q8bT57R6+MllrwciQ+AfO3FP3MQtagFeN2D
 B4tfvjGgLno8wGXaDG3zgIqkwLuQys4XpbvGvl9rYcafWWM5xHn0JhQzBPLWFo=
X-Authority-Info-Out: v=2.4 cv=O440fR9W c=1 sm=1 tr=0 ts=69cd162f
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=A5OVakUREuEA:10 a=x7bEGLp0ZPQA:10
 a=r945xf9LNZYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=xhEBv-n3a8ZqHk2sTh0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604010120

The overflow checks in skb_to_mamac() and skb_to_mep() are always false:

  mdp_len = (skb->len - ETH_HLEN) + MDP_HDR_LEN = skb->len + 2
  mep_len = skb->len + MEP_HDR_LEN = skb->len + 8

Remove these checks to clean up the code.

Signed-off-by: Hadi Chokr <hadichokr@icloud.com>
---
 drivers/staging/most/net/net.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index fffdb60cd230..07fd18e9096d 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -80,11 +80,6 @@ static int skb_to_mamac(const struct sk_buff *skb, struct mbo *mbo)
 	unsigned int payload_len = skb->len - ETH_HLEN;
 	unsigned int mdp_len = payload_len + MDP_HDR_LEN;
 
-	if (mdp_len < skb->len) {
-		pr_err("drop: too large packet! (%u)\n", skb->len);
-		return -EINVAL;
-	}
-
 	if (mbo->buffer_length < mdp_len) {
 		pr_err("drop: too small buffer! (%d for %d)\n",
 		       mbo->buffer_length, mdp_len);
@@ -132,11 +127,6 @@ static int skb_to_mep(const struct sk_buff *skb, struct mbo *mbo)
 	u8 *buff = mbo->virt_address;
 	unsigned int mep_len = skb->len + MEP_HDR_LEN;
 
-	if (mep_len < skb->len) {
-		pr_err("drop: too large packet! (%u)\n", skb->len);
-		return -EINVAL;
-	}
-
 	if (mbo->buffer_length < mep_len) {
 		pr_err("drop: too small buffer! (%d for %d)\n",
 		       mbo->buffer_length, mep_len);
-- 
2.53.0

