Received: from out121-51-6-26.mail.qq.com (out121-51-6-26.mail.qq.com [121.51.6.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006E168
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1640599913;
	bh=Eepn7RBiw1+dxgtGlokKiuDZy0zkH5DSl9DtXiMJUWA=;
	h=From:To:Cc:Subject:Date;
	b=wRxLZmV/Ca5aq4cAkkeOEGSLGMocZVe0FHzUBX6Q4EBvFNp0xYrk+aCTvaQi5/Fil
	 nxbMhR3TFvQAeYhvMo80GpqOQZS49W2C6xO4+bDrqIR/SGLroPD3XKTFEFFKfa4g2U
	 iP+FAuwdgLufwULJYnE/iRxKnfkcE4SvOVjOPsT0=
Received: from localhost.localdomain ([159.226.95.43])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 1EB2CA6B; Mon, 27 Dec 2021 16:07:43 +0800
X-QQ-mid: xmsmtpt1640592463tuohenfh3
Message-ID: <tencent_D7DF0257121D1A21F136595372ED101BA10A@qq.com>
X-QQ-XMAILINFO: OQNQM5UP8StMWQnf6hqD/QFrzE8RTB6q77b9bqAM/1KICSn+CEU5oZSDxzohbj
	 JnrpN7h43Co8dYZa5/uRVevwPq3/LgcgeiEMPUyGNim1fKdB/eK8VsgfpeZj+vO1RVAwf81+i9pY
	 QdtnU3UpTEN+NW97TUmk/fhExRbDIO97HwX2zlsSfSZbzwJLG8EBDUnvSb98F91FLYNJAoW+heEA
	 eEAMR2q7DD8Sn/AF7xHeXMZ9gqFIEN6xxBCgpJNVYtD8JSpkhUeW4DHzC39L+ZVrf0PojN0iVkxF
	 SWXJKtI82H90M3KB4/hpR/Ioz6e/2PVLbUcHvf7yqXatfLPq9zte3DcaqCfJCJJvXsEDbQKpsK77
	 pCgp3vFcHGvtnKkQCfRoDYkiKkVSVy3ptgAXj6PkeUy/J0orJ7bZlqxDNJqk/lB2Juvg8TkJID2r
	 EfrAxhZT8zwl+nNUBS5C6HzXsogN1At3kWVQoQUZmz9QOliZLlZDfPyzqjub8K0bQsR09FEzayyE
	 rjdZhvRiMgC7pcasBny68hBU+ewrybjo7pKA0Dpno3UO8vVb2mkk/RUXPgDcV4dv65xzsDdB8YZr
	 7arofxySN+Tf///GEqU8yWcV7AVc2WP3DOKAreiGFsJB3sY/BxdJdfXZJhJo24EysnxaIuy+a9k1
	 BsmJj32iMeoC9VB9TjK2pxWh+jg25UhqsCnxX70MmLCXpgrXSNY31z+oRtjFTC37oNKm/9R0Cg7w
	 dCJ5Vunu10NDN2dezoejquokli7p4DQXfmd7DRQNEHIdlELcUnD0jwfJVrOftORXRxWPCysOz2B3
	 3kL3VQn7sNUzCjz8pYsqZB407qGiuxOgheMPX3ilPztM4sq7+S+1LM6S07gPP3xOfebvaEVHiWWr
	 zZPXXE60zfSvACEpD6vuZHYpDEwthYDdYqBar0vEtB5naXIeujgfg=
From: Peiwei Hu <jlu.hpw@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Peiwei Hu <jlu.hpw@foxmail.com>
Subject: [PATCH] staging: rtl8192e: rtllib_module: add free for error exit
Date: Mon, 27 Dec 2021 16:07:01 +0800
X-OQ-MSGID: <20211227080701.2647286-1-jlu.hpw@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Original source code of alloc_rtllib returns directly in
error, without freeing variable dev.

Signed-off-by: Peiwei Hu <jlu.hpw@foxmail.com>
---
 drivers/staging/rtl8192e/rtllib_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 64d9feee1f39..18d898714c5c 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -125,7 +125,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 
 	ieee->pHTInfo = kzalloc(sizeof(struct rt_hi_throughput), GFP_KERNEL);
 	if (!ieee->pHTInfo)
-		return NULL;
+		goto failed;
 
 	HTUpdateDefaultSetting(ieee);
 	HTInitializeHTInfo(ieee);
-- 
2.25.1

