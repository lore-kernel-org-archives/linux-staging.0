Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA618EFD5
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323366; cv=none; b=jdhjwjyX3rOeV4FzPOjEIYM/6Ht/WxvL/+hBvdZt6pSGccnxfx3BwqFlGp0bPu2n8Kei81qaMwNjD9MxVE4vE2vcz8+jMJ3pFTkTRIhF9QOgNxZT1knxxZsDmBcAOkhLUiT9zIjucFvwjO/XofO7soOZX/zfmMxBtz04Nb2G8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323366; c=relaxed/simple;
	bh=kJTM5OSjqQG73H22CuzIYM1jlcdVej8ovXRYaPLd3nU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lIaDLHDO2nTcrwdIukqOZQ7AymuANW7UzY1o5UI9rDiFsrUFDihJc2ytmg2eYRIt3VapdiQndVPOFBvyp+bboullmdnqYCud8B6k40cnA0Gya2yIqXKg2krR/8vBjXwa/DJwQh2VJ+0fRMxIMFyTXU/Df8aKISVmzMwT+fc9uQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tchadelicard.fr; spf=pass smtp.mailfrom=tchadelicard.fr; dkim=pass (2048-bit key) header.d=tchadelicard.fr header.i=@tchadelicard.fr header.b=AeAC7koe; arc=none smtp.client-ip=17.57.155.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tchadelicard.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tchadelicard.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tchadelicard.fr header.i=@tchadelicard.fr header.b="AeAC7koe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tchadelicard.fr;
	s=sig1; t=1722323363;
	bh=PtjiLJz39WshI27PtYqJJc6smMxXeB8+aRNl+TPayjA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AeAC7koeT3b51WqLGTM6BRJB1npuynCRb+PnzpZv5Wp8utjPksKzsJIakJ/16Opvk
	 6RGk5mI/X1HfVClapyfpSmkNVlq/rqMPbxkTNmU0X4PLbqdyW2+1TKhh2MeEZ3YKNB
	 JrhrYKv0Vo5AQkGNthuhG5aJvvPs3HBGPYGkgHpdmV4lqWiW4tPQhNzo3uiuuPuWWf
	 eLa9Y7VhSdfIQqWtnMsC0BzZn5YHjmzDhAaWoNGSqqSdY4hw2Yj6Coi3FIVyoyHehb
	 0ecdiLkbGuh3ZGXFRiO9liAq3kZz5kHjFQiOuSNaE0JvqMVMCSFH2lrT5SOcgQSwOH
	 DKKJcK6Daw3fg==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id C739D15C02AA;
	Tue, 30 Jul 2024 07:09:20 +0000 (UTC)
From: Tchadel Icard <hello@tchadelicard.fr>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: rtl8712: Fix move '{' to previous line
Date: Tue, 30 Jul 2024 07:09:10 +0000
Message-Id: <20240730070910.34996-1-hello@tchadelicard.fr>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zu5NxvG3f28LtPYCsDGI_5Ix_Mt-21AC
X-Proofpoint-GUID: zu5NxvG3f28LtPYCsDGI_5Ix_Mt-21AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 clxscore=1030 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2407300052

Fix checkpatch error "ERROR: that open brace {
should be on the previous line"

Signed-off-by: Tchadel Icard <hello@tchadelicard.fr>
---
Hello,
This is my first commit.
It fixes styling errors.
Thank you for your time.
---
---
 .../isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
index 5f186fb03..15386a773 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
@@ -65,8 +65,7 @@ int ia_css_iterator_configure(const struct ia_css_binary *binary,
 	 * the original out res. for video pipe, it has two output pins --- out and
 	 * vf_out, so it can keep these two resolutions already. */
 	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
-	    binary->vf_downscale_log2 > 0)
-	{
+	    binary->vf_downscale_log2 > 0) {
 		/* TODO: Remove this after preview output decimation is fixed
 		 * by configuring out&vf info files properly */
 		my_info.padded_width <<= binary->vf_downscale_log2;
-- 
2.20.1

