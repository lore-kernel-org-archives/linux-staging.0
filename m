Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D288497;
	Fri,  4 Nov 2022 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667586928; bh=0B53dwmxeG45YNVJ4Hk+8mn0kfMKjj9deNa9hc7yTfs=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Q2NuLmL/hfSwbeyuFz+iWBAaq68nrgoC1bD2s6wpXsRE64OVFSoLXo1VSpbdtg6ay
	 Ol7ViECLDn7J3NnGNkf9essCyBDaGwU4VN3jxtmijoWSmaECaJxjyrLfrVFT5j7/34
	 lDLsscIdjFmUNldKQaDsMVH+9QLu6wuLt2HN/aDY=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Fri,  4 Nov 2022 19:35:28 +0100 (CET)
X-EA-Auth: mgpYO5K4+REdUFPKKUYsnK0F2jW6dgwbxmTkgKC0MXpQOKCap7NNTWay5++oa438urRr3fiiYiRIkOADL6v0DdsQbIFDB4u5
Date: Sat, 5 Nov 2022 00:05:23 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: Remove unused member variable
Message-ID: <1b22e45254f7b8cafbf5b78d1e02380295b9ab02.1667586648.git.drv@mailo.com>
References: <cover.1667586648.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667586648.git.drv@mailo.com>

Member variable bBWIqkResultSaved of struct iqk_matrix_regs_setting is
declared but never used. Remove it.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index e16a769850c5..6891fa30c7f4 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -482,7 +482,6 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
 struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
 	bool bIQKDone;
 	s32 Value[IQK_Matrix_REG_NUM];
-	bool bBWIqkResultSaved[3];
 };

 /* Remove PATHDIV_PARA struct to odm_PathDiv.h */
--
2.34.1



