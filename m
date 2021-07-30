Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55270
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D0D661057;
	Fri, 30 Jul 2021 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637085;
	bh=TTcst/I0bc0rc30MWZFlcPxaAptitOFTYxNJglyKMoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpX244VE99mguBFLukD0WVHzQaT7eihg9htgTViga7AL+vTYnCNlI/Y/A721JMMIR
	 jzMM6Ccq0+XbJ1XqHkcHtTIhl+lt09m1rbxEZzLrvG0wsZSMRgUyqvRGxLgs63Fyj4
	 wMAaeofvSAvMYG+Qsvluh3DdDT44v3F/KoWJUNTA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 09/12] staging: r8188eu: remove unused enum _NIC_VERSION
Date: Fri, 30 Jul 2021 11:24:14 +0200
Message-Id: <20210730092417.1014392-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; h=from:subject; bh=TTcst/I0bc0rc30MWZFlcPxaAptitOFTYxNJglyKMoQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx12FF95WjUzlX1mtbC6xbpFsxw/28iJZi5ulas6nWVg 4JDVEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABPZysKwYJuplWRI9TmNctV815Lla1 RWTZ7yk2G+wwuZ516P/TNPyn5+rTXx0RvdcsHLAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

None of these enumerated values were used anywhere in the driver, so
just remove them all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/include/drv_types.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index d407d9274a78..d8faea4f6045 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -40,13 +40,6 @@
 
 #define DRIVERVERSION	"v4.1.4_6773.20130222"
 
-enum _NIC_VERSION {
-	RTL8711_NIC,
-	RTL8712_NIC,
-	RTL8713_NIC,
-	RTL8716_NIC
-};
-
 #define SPEC_DEV_ID_NONE		BIT(0)
 #define SPEC_DEV_ID_DISABLE_HT		BIT(1)
 #define SPEC_DEV_ID_ENABLE_PS		BIT(2)
-- 
2.32.0

