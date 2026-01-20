Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFD42DFEB
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918329; cv=none; b=bZbyZ1DHKjBQPTqvEHSQJxOhtMBPc/9d3WWHZq/b5Y4n5pf072YLJHuoPfbzMvjAHzzlB5+RcUY5kGy6jP0o4bxUkcm0hb9TGGLI6FEZ5HnJ2ILeV2yoJDjHliY60rWIIZgpwD30aoxrktXpo26eR1H7FCvmIzGzAbcr9ZSA5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918329; c=relaxed/simple;
	bh=sBkecimQhhs9mzMrVWNbPGcQzbvofTgzxW2cLv96zxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBIywKlxfx84Hfsp1QIBfdTa6YM7/vPvId29maAgozvcYPGEgwBSuxpAiKym1YOhwhazigZ0jph+XVTFeQBm+W6XcJ3QwR3CkDOFZ11RulJ/fABVRf4JrDpbQiHJJAwPxVTIARofTMksFTtp5h0LQflUmirCpIyEIoaSTpdP688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz8t1768918293tdfadbebe
X-QQ-Originating-IP: A9UaOz+BCdHZ2GGT/NwDw06O1k6l5rI95HFUbSLIaq8=
Received: from cjz-VMware-Virtual-Platform.loc ( [36.143.144.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Jan 2026 22:11:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2936667498266073773
EX-QQ-RecipientCnt: 6
From: 2023060904@ycu.edu.cn
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rtl8723bs: Refactor continual_io_error check
Date: Tue, 20 Jan 2026 22:11:25 +0800
Message-ID: <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026011937-snugness-movie-9e32@gregkh>
References: <2026011937-snugness-movie-9e32@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: MGSlRwRrdVfIx33BfjmbOEE1pSLfxcxcJ7dEs1OHDxstjtDcQbzID8UU
	YeNgEevpUbiaqvS9nI5ksosUNSTi1IXpU/18LAvvjYpJtbjr2w8uMfwuYLbbO4iHbT3YgjK
	f05tkju5U7MG9TAZTpqXdolqtGWYSIpuB8IUavNzJqU5OnzjrJl+TSv4f3sX+d3xnASbZXA
	sW1aVYmX3vxzBlRq9Q9hWAHzeyLjfuknB9+9MdPQi4QPVE78xUB26ZO+/wXBK97NdFVlK52
	9PiRRBkY8pFi4rztvkyN8N4ORCTtRnyIw1y0YqCuTH5qyflm8zPTjUI25Fv+jMtYhObmK7T
	Cs6af1reBL+YBAMonVFP4ftVEynG8wlAuK8Ai7tp+/zlxQRsMMRo1T3nZaY7+pCrtIFwjLz
	McdVMRYOcBVmbz69RbhEncqgIlnRcwuIL7wWPy2V1/xkbVnv4I1IzTJob5CxWrAYdaRicHz
	U2c16RsL8YXe3IgstgZQsrp7hHMTBf7Qb7bLgK6VAUVFsjdA9UT9COLOmrisfWLZT0DKX0S
	nAFIFbLH2jFB9eUvt2MpKrMR8t1Je126uxvdhkbA86plJ42LHz2+JY6kxRqMdeK5sPb7/Kn
	c+mJ0dch/YyQ2/TbqGvSFSgfpHF6k5+YDwBkvW9rNcoRjS6kf/NTPtOX6lTZbV6hVJ7zBQr
	YcrQc73qU9+7F4Z3AiXPZjoMUTC4II9YlRYOGuhhzN4tBIdF9dkxAByUDvSinf96AydcqCU
	W3i49PAjXtERzWi6tpqK+Zm8ZAuKLFd4zfRexgJySBNhfmIbU1VMhYlDd+d5MLJ/K6kEHML
	6QrfnFGSYM5CQb/euKu0YjFNnzQQOpXOpI0MYvfz6ZWteybCrK9ZdEYNFm0wnPj9WFC6XgM
	JpWPIQfxMkDvE/ImVCo34MOjJC+YlxuVPyU5vTr2MdQArxQm8lw2Z0qjyF7/BobqrwTK2ch
	JFpIDQyXSOkfj7WMFRZZ6/hDYAHTGHx5jKtp0BnQG9o92nutLznXUob2z3ygUFLn8nwY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <guagua210311@qq.com>

Refactor the error count check logic to follow kernel 'single responsibility' principle:
1. Move the increment logic (atomic_inc) from rtw_inc_and_chk_continual_io_error() to its callers in sdio_ops_linux.c (line 226/302)
2. Keep only the check logic in rtw_inc_and_chk_continual_io_error() (use atomic_read to get current count)

This change addresses Greg KH's feedback to move increment to callers, while keeping atomic operations to ensure no compilation/run-time errors.

Signed-off-by: Changjun Zheng <guagua210311@qq.com>
---
Changes in v2:
No functional logic change, only refactored increment to caller side
 drivers/staging/rtl8723bs/core/rtw_io.c           | 3 +--
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..0c450d6cd14b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -139,8 +139,7 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
  */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
-	int error_count = atomic_inc_return(&dvobj->continual_io_error);
-
+	int error_count = atomic_read(&dvobj->continual_io_error);
 	if (error_count > MAX_CONTINUAL_IO_ERR)
 		return true;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 5dc00e9117ae..026fb4963d06 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -222,7 +222,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
-
+				atomic_inc(&psdiodev->continual_io_error);
 				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
@@ -298,7 +298,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
-
+				atomic_inc(&psdiodev->continual_io_error);
 				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
-- 
2.43.0

