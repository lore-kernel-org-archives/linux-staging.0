Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A98634F
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765778038; cv=none; b=SwHtZZZbBNUVqCYHQc+XpJkvUMADuD75t+F8pEWH9zucrkAC2M5DUKTANw2ky05AJoYFqBYj2uH+OMnEtPXIbP5pL+/MM7FMxfD6qfORZrrQBNyBUr2A6QfrcieiwbzOYW/mgRpS34UpyYlbjnBY3iAkSOmd1oJC8kiZKYisvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765778038; c=relaxed/simple;
	bh=y2Wz4iaq7mfAPBXvzAzHwsJsn9opQ47W468qJAl9crM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=CS6LhOslrAYrfVYDtqdRUL8x+L78WS2RQ2yTILWXF+/hJgFytSxpNftHfVvJCfsL9w0Wh3XfFa4e8AdtG/Rv7mKeN/1PEQa7/kJ5aEkslOujSHgQRa34st2HKAFpe9b2VChE+Z80vPxTqecfssMYjcvdpyvCmoWEvT2oooM72TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=WDi53+QN; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="WDi53+QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1765778026;
	bh=fB/z3spAkF5Iput0ekKl/sPzMaVVWo2fip3V1jbPxmU=;
	h=From:To:Cc:Subject:Date;
	b=WDi53+QNNWLGhCoLTdUvAD2PzYUsOaudlXYmp8GLnEoUPGcqJdAeSp+pc9Wr2l/YX
	 JekkFO4VJBJi4tS5PFdX3ErXe5a7rshinkNTxKsBdQ0T/FBQ4G83Dl++r2+nAgnuOx
	 VmfbgCdZYkE1asZsQzRP+HeKh5obOUysU66QnCn0=
Received: from localhost ([2408:8207:c5b:c860:9ec7:6e84:86df:b3d9])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id D6C31A72; Mon, 15 Dec 2025 13:53:44 +0800
X-QQ-mid: xmsmtpt1765778024t7lo7eyvh
Message-ID: <tencent_C0328035BC37187FA2BED4352C504E3C5607@qq.com>
X-QQ-XMAILINFO: NmYPxqSo4aXvNy4x+OVgmKYVTu3q7c5EaYLPotbxHZp0jCoGi/DJjBbLnooj/S
	 +D2TJF0PTknOf6UZRPgH9kUxCvCo7SR2nda49yp2cymGwr8+TYYZ8p7uAaYHptLget0pCDq/et4w
	 HUbAQg1DYuI6aS+yhisqFEHAd4kt4kkEztwN3mgKRr4LXdVQxnFrOFjYSV5zVzeoewc+A2jwDO4e
	 6nDkVU2Ff15XNk8YpUU9oMksxG8TX+T9EF3ojY57pzhi3lS4jqHLrR4I8tgcZLNvc7Smejj0f1Lx
	 WlJ49HVgzotr4kL4hjlhD5RRCno2BCkwStsOhTtcZuc0BJ5U8SuwTF0Md4yHzSbiQTIcZvpSQWnt
	 stt7ibO0kOtggLzu5qYnWIuLlFjKJwtBarVo8emor+yt7DprEJvwQz5aVNrSmhQ2IScZ9o018las
	 FTKYLe+UD/U0wA73JoOjCkRQaFIx79XsjOMz2OBhX2NOBtAm0PXbUKXQgdYXEKgrFfvBwNWFJkGf
	 IiL+oUkbFbM/XTYWQVqZtL5NPGhdxC2+UKpzLoa9bnKns3dcRyfDEVCx65ECvAC381WI30FrGmGB
	 zUalstqiHl3NV8tkGeb1VQXw/5hKQidV8i6Gg9nkCaiChg+iBXwAdGP4SRXKyYsOPJ4EtDSAMKqV
	 9+Ao/UfV7fy2bb241R7AfDMbDqLK1SsKm4dL5QM8GFnvmT1xB0CBGCqJvByIJBDcHjTHwUBGncRP
	 I2hdJu2Xw3xDZWA4f/TNSoWJ5tx4aVA0ixE0WHYIw+wjRlPDV93LwbHldAN5lCGe5h8lTN6g2+ZU
	 6fHSfVute58gzhooszV+IftCUyZU8ilh2J2N+fKWiHcnRVuoOi2/Y0C0qrsO2LYGLfW44w6fti2S
	 VjQCAl3NVFnzF9UTBG+R8sayampy2UMOJJ3sDWP3OFpfrW/CnL6VJpEZMQsv8mc9dWqH9VmH2Xkh
	 H7IJktR5lnSeVhtA6B5caMJBC0p1VVklyooKZr0KY/75hFyneZq0tttfq+/dDRWfWRwXdl/EG4dZ
	 TGOnYv/cURLE4Y1un9GxLXWBkEl5Pq4lRk40v+jbVd+RrEChaSzuqdTvE/2zXN4wh7jrzXIunmSw
	 UTWJUfGDwZMtLH5bZt/u/MYP9arOGqTanb4UQK
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Zixuan Dong <dbeidachazi@foxmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zixuan Dong <dbeidachazi@foxmail.com>
Subject: [PATCH] media: staging: atomisp: remove redundant OOM error messages
Date: Mon, 15 Dec 2025 13:53:32 +0800
X-OQ-MSGID: <20251215055332.69660-1-dbeidachazi@foxmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocation functions (kvzalloc) already emit a stack dump
on failure when GFP_KERNEL is used. Printing an extra error message
is redundant and increases code size.

This resolves the checkpatch warnings:
WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Zixuan Dong <dbeidachazi@foxmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..a3cd9d3e9ce7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2961,11 +2961,8 @@ int atomisp_set_parameters(struct video_device *vdev,
 		 * per-frame setting only works for the main output frame.
 		 */
 		param = kvzalloc(sizeof(*param), GFP_KERNEL);
-		if (!param) {
-			dev_err(asd->isp->dev, "%s: failed to alloc params buffer\n",
-				__func__);
+		if (!param)
 			return -ENOMEM;
-		}
 		css_param = &param->params;
 	}
 
-- 
2.52.0

