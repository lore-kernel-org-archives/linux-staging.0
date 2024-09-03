Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B53B13D503
	for <linux-staging@lists.linux.dev>; Tue,  3 Sep 2024 02:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725329135; cv=none; b=nzpBx11FkrK8iG+k666QurlmUikq2yyXDSoVRgOve97rez3AWwPOkJ7eIaa5jO9iBX8eyZhYvsZdgyD6wQeYO6ooj7Ck+0zusoAS2Z/XBZquRHCqOj389ToRJc093mypuR07sg4RJMHxDX17dMUbtTVSvUhZzR9hRZajOI3huvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725329135; c=relaxed/simple;
	bh=Ns+E8hrjd/ghEa5DY5olrRcrI4vwyq4CJUUyyiR/4Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qHf72qBH+xG9KERiGI1Q7JhD3Wh2gPzQ63FIpYWu+aX4EXEfu6AUF3XgIFhhrvLnSdOSlhdDcuPeb1nng1VQ3Lt80EmATGkDiaGQOnaIor7QtFSwKl070FmQkF7DzioGWIbfBlnVHx/ExEgXMBTgVNlr2RnFzSHRlELSS014TXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Zqj48fbM; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Zqj48fbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZyFV9
	yQfBbszpp7tI1HamkYKcyO0B0xhk9UbvaXQsOU=; b=Zqj48fbMs5WiskT7LadhY
	qqKDC+gUtS/beWq7TqFYl8+FwPq73vsbonwk4ggaPl0eCRUAT06XuJx3o/Mdkr/v
	tMp6SSjz3PbR8LrbUJlfZFTlJ+ZGTHp/OIyaltJqwZDjNqog6Do6LhMZL6Jql6VB
	FjPuGwOtLeiNp8zZQsUSgw=
Received: from debian.lan (unknown [36.33.36.240])
	by gzsmtp1 (Coremail) with SMTP id sCgvCgAX3z3NbtZmpC5_Ag--.62293S2;
	Tue, 03 Sep 2024 10:05:02 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] staging: rtl8723bs: Remove an unused struct in rtw_cmd.h
Date: Tue,  3 Sep 2024 09:44:02 +0800
Message-Id: <20240903014402.170750-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:sCgvCgAX3z3NbtZmpC5_Ag--.62293S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr47uFykZF4rCF1fuw13XFb_yoW3Wwb_Ca
	y7tFn3Wr1DArn7Zr4UGF18AryvqF1xJw40qrn5KFZ8ZFsI9F15Jw1vqr47uFW5Wa17tr9x
	Z3WFqrySkr1rWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbLSdDUUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYA5PamV4I+SUPgAAs7

struct getcountjudge_rsp is not used, just remove it.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index fe1b03101203..cb44119ce9a9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -516,10 +516,6 @@ struct drvextra_cmd_parm {
 
 /*------------------- Below are used for RF/BB tuning ---------------------*/
 
-struct	getcountjudge_rsp {
-	u8 count_judge[MAX_RATES_LENGTH];
-};
-
 struct addBaReq_parm {
 	unsigned int tid;
 	u8 addr[ETH_ALEN];
-- 
2.39.2

