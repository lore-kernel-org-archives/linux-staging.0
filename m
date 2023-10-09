Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950018043
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FdcGx4u1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1696861185; bh=1EZti6Xmzz7btzZw1U07lpCENF7oZENG+QoX/D1H/bY=;
	h=From:To:Cc:Subject:Date;
	b=FdcGx4u1T4CCiCiPWzEBr3VluvXH2Y6tD5PaalWQbs/gJOcT2cxkDBwQigCTpauBH
	 N2plnx/0aQ68d1EBtKnbs0pWsHV1cDBh5ByDZq1F3TYipDrsouAZ9b/sqpaV6D9oLk
	 4JuNGl2zrV0mPkCoqCSKLSJiNqLTa8AZk3DfOUp8=
Received: from pipishuo-VirtualBox.. ([123.115.145.13])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id 4EB9966C; Mon, 09 Oct 2023 22:19:43 +0800
X-QQ-mid: xmsmtpt1696861183t659x4pxw
Message-ID: <tencent_2E8EE168437721028C6DAB5A25532F8E8D08@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8zIJ+4HCIaVfoBSan7nXJg8h3tbzM+NY9/+6ou17V04crVt7C4S
	 dRrARapBOviEjUvXjfqaHrgsw8QHhvmXvDpiQQcUV8LlAvMDRJ+cR2IfAK4/z6toQkNXB2wetr2a
	 zjFIPee3u6UapUNMVJOHFmJNokwDnSbFmNMWz7ypGGSg7WSaYENEQHDf9VqdhTxsf2SR2JSkE/gu
	 Wa1CkwN6Eq9+TkV1oeCAIhb04HimoCS4+iBnhtixp0h271HSfWVEF9+5SRu9djWZM3hjuMs/oOUE
	 dzONBA8thEMT7E8Yns1pdLVUKUhK/9jDDLohjhMo57/FI1HAEW9OdQskvB0OKv+3W0O/BjuUXqYX
	 IyhD7z5IphbrOYOUUbcnGQ56SEI6jgZlpDxOYFYe3RXtrV6HYK9pNckvndirlyeJFEpDlG1YTXsm
	 R3+EOQWkAzp16HaJ4U6NNIB0gpSL3KruTjrzkz6cCP6zeAETE9dvAZ1BzxvQhSRWV6Ve5PryJUbc
	 voyfFeb3XornU6s30ibVRSOKVToSkK9uKhISM21oVoPUfEn9lstytN4QKOzO0oMpXa630GVcLrQx
	 pSy561SFZx4pSaLBKuK3iWJHwxb8sUwbaoeFlAhPyQO+qXSTj0Aq+o47kKqgnEXjsi4pZuAqw5HY
	 iPC0B7AqBZlGMePgIFkaUHYgXkM+jXAwOO21wBVsrFrPxlxoD3WNBL/pq2y+7/2Cscjf/VYgX5x2
	 99mNPJgLuV4JCqSaBrL2g4kD6ozY4LvBSM86wHNUN/RnI6j+/cVHS/1OuySV/zBwvgLc4OxG1ZqN
	 Z5WlmXLIcDc0LNfBPz4WNOjOWfWzo57I50ImuAMZASeSh6Pufc7zz+19ml0PgKshnbxF1ouaKuKR
	 qutCCdNgPICrygAKR9p9jNGkHV2NnrW044blrFcZVNUlB5kwP+xYxf09faD3DOY7M4JcWu2yPCo/
	 f6JCrq49Btzo7OxyzeZX1NbQBiSyqjXtkc6S8E8swsl70MxSN1RTulaOM7Q6XQtHHzSjaYNevMgt
	 kr/o2xF78F7q4fnDiwaqlKmWVGz/hWRBytuAJ5tfx7Z/WMqCup
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: pipishuo <1289151713@qq.com>
To: linux-staging@lists.linux.dev
Cc: pipishuo <1289151713@qq.com>
Subject: [PATCH] tty: gdm724x : Add blank line after variable declarations
Date: Mon,  9 Oct 2023 22:19:44 +0800
X-OQ-MSGID: <20231009141944.30988-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux Kernel coding style.

Reported by checkpatch

WARNING: Missing a blank line after declarations

Signed-off-by: pipishuo <1289151713@qq.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..15c246d3b1a3 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.34.1

