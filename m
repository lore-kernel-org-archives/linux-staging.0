Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329FA2D
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648750315;
	bh=wn45RItVLXLWXANc+t8C2ZSMFmtM6wkn0DriGaM+lMs=;
	h=From:To:Cc:Subject:Date;
	b=k2XOKs0YTRcqszYgpsw8ZuYK2ojrPQOaIdNTc+Kr9xkX46eBbb3wXdfuN0bYnA20l
	 7oU79P309lZEcmayiTe5HRl5Y6h+hsMDp05S43u4Xh4nT0IbIbTsTZk1dezRMwa9AZ
	 WhsYDeO5KOq9FbWbdjJ2CQbMcb4G0bSaBKx9Zelo=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 2F40E022; Fri, 01 Apr 2022 02:11:52 +0800
X-QQ-mid: xmsmtpt1648750312tvpa0vkk8
Message-ID: <tencent_35C87F0B0813734E6E3DC7100565789CD206@qq.com>
X-QQ-XMAILINFO: NKv2G1wnhDBnTrTyLpsSIIqTGYsnfA2L8f8T0diFi2gcGjeMNwM1yWhKu2y/IL
	 GUcg2scRgjI2ko6NDLqsRlZar7h4KGvzZKMII7QgAcMqcEVAXdNn768iI6JiYjbtOa6/+UJuBxsA
	 p3ALIOq74OKoI81bPAZAIdlc3UKXq3RPOsP/Obbl+YBv4MlBAxRz1Xu5LwR4ADcBu8DEfOhzYQRa
	 NyRVy06fFdQJZ6BcJ8y+dWasvxQuTogjNwquOCX1QorMlkeNh8iKGOu7wTHVX7AitwdDDJlpI1TV
	 K+Q/WDgKpq8jTKKf+JoSY3oP3qPMJSHvkShYg6NaBIY6ppgR1k6jMVd3W2/Lst2YJK0fVcsd12+1
	 9vVCLyIeTNoHWubMp9o/3i5LfkmA0X016bEwZEX01VN7iDUffp26E4mnogLsdNct5Po3ahfICBp3
	 eDSBJpj2+2SJjot5708x4WkdEDBD0/nomOEGJYrdu9P94TBcfiRKZ5ac5kCJuT43sCyKzaZ836+S
	 U1vEJzAE2smqkEo4K5I/P72dN2wMqcOaiBtH02zqUdfnOs+YD6NdCG2Y69pRoJ0xmJSpm5p3XGQK
	 ZNqAUljTr2GzilzW/lm9K+CKft5HDTBcxt6SiL9jCD2/5KkrTocS5EdddK4nrKDOHHZyooMcvXkc
	 L1kb/moqhiyrCew8mnaFWZFC94UuUN14HdiS4IAtMwX0IQ9JLQUY+mm50TiBBbgZTHSgTYhKDQ2s
	 1vMaa3zHvi35Q67JszxW1eZnN2yYCKpwTgEdjQjG7EG7J1aYopf0Q4wEjJzM3m4k4/89WWacrNEt
	 bG9BGm0A/7xKdzzRj1EdoI7ibqaTTv8WCYfUihqkyrCIJnGRXmjOJnvTZGyKjSus2x5hdgMBCNiA
	 2623vv2aOk8ZhWVVabaiZt3rBPG7nnBepFuXuT3MZ7pHbcmgcjhaSPKy2Of2oJNehdUK+/AIQmtO
	 0KQAt0kzfJBzi+Dr2ujA==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: rtl8712: fix potential memory leak in r8712_xmit_resource_alloc()
Date: Fri,  1 Apr 2022 02:11:41 +0800
X-OQ-MSGID: <20220331181141.10172-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In r8712_xmit_resource_alloc(), if usb_alloc_urb() fails, there are some
explored items should be released before this function returns.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/xmit_linux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 06283c4..1bfa204 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -113,6 +113,8 @@ int r8712_xmit_resource_alloc(struct _adapter *padapter,
 		pxmitbuf->pxmit_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
 		if (!pxmitbuf->pxmit_urb[i]) {
 			netdev_err(padapter->pnetdev, "pxmitbuf->pxmit_urb[i] == NULL\n");
+			while (i-- > 0)
+				usb_free_urb(pxmitbuf->pxmit_urb[i]);
 			return -ENOMEM;
 		}
 		kmemleak_not_leak(pxmitbuf->pxmit_urb[i]);
-- 
