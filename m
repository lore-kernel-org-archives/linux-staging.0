Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FA81F5E6
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726430; cv=none; b=RteUqPPK3mSg2DAQIddKl8C11zzYHOyzyqXggbiM6MgNcSzu8VM9o1ZH+Xvr3TR/ck7PBK9rdFRgLzdNFNYplgD26DPzQ/u1ux/epY1kEJMC0s1Kfal4tzAge0vW+dwgQ7xd7qCQS+rKFPXhSdgsurYqZjUlsQDNImesYZ+/Rs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726430; c=relaxed/simple;
	bh=MDU8qJbap1SIhGGyge/vVxPPo+c9g1a/1ysXlb0Y2rI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hrZ1Q2q69827Z80tyYv/PGtbb9YLf9v7rk6TFfKMvJ7I26bWTbhaXz8BBJhtBWHdCMTZ5MP0loIr76fsXtT7kwvbCotfGB5AYdQHYIXBdMLXf5YjEjtHsZu7hb26ydjjD6BWISS3fXP3s4Ju/XI8BU2NmSGJ2xswue4RcmVsH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7675690d828e-f12b7;
	Mon, 09 Dec 2024 14:40:24 +0800 (CST)
X-RM-TRANSID:2ee7675690d828e-f12b7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee8675690d764f-a6ff4;
	Mon, 09 Dec 2024 14:40:24 +0800 (CST)
X-RM-TRANSID:2ee8675690d764f-a6ff4
From: Liu Jing <liujing@cmss.chinamobile.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] media: atomisp: fix spelling error in ia_css_sdis2_types.h
Date: Mon,  9 Dec 2024 14:40:22 +0800
Message-Id: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the coefficients spelling error in ia_css_sdis2_types.h

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
index f37802878528..2bed08435755 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
@@ -19,7 +19,7 @@
 #endif
 
 /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
- *  arrays that contain the coeffients for each type.
+ *  arrays that contain the coefficients for each type.
  */
 struct ia_css_dvs2_coef_types {
 	s16 *odd_real; /** real part of the odd coefficients*/
-- 
2.27.0



