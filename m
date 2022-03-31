Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA56A2D
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648747446;
	bh=uQyvWk8WVby12Khs4f9ZXuKCjtAh/gaIq5J8Oj1XX/E=;
	h=From:To:Cc:Subject:Date;
	b=lIm/dqqxd2z6VAhSRktl6iE8tnUenslzEz7NxbIwP+IUFaOW1cQsOzq1Hu4NcXqvq
	 n5GqiZ1jhas/45dhEWW7VKeJD771MYHiaET0/1YBvqvbXYx5KzcTE0t0cfI2Hi7Zj7
	 IxI/tnURxPGkNg5ZstbGorxkPV/dGZcq08cVddZQ=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
	id 60303088; Fri, 01 Apr 2022 01:24:03 +0800
X-QQ-mid: xmsmtpt1648747443twi3h0k1b
Message-ID: <tencent_95EE7F100488393717982391C22EBC526905@qq.com>
X-QQ-XMAILINFO: MtZ6QPwsmM9Xb0LZKzUOwz1UnfZP6lhahiHe/qeNuF5HEeIioIbd5VwhkSp0qu
	 MH6sAcpf8cuEnTAqUc+uMxaJEauzR3rj1Bi00euu5CeOe8zQaed0w+PgQQpIuDcnVpo5n03/2ZOP
	 zfLizwiVxwcehXEwi3un69UnyMyQ5GqDRO/ngeHlLtLWCcwdzJFhL3XCpbBtdYxVyW5PEKXNst4b
	 baripEtp7T3WJAM2O0fPhEV8Ng2U3SZO4T6STS1q7+X8tfI+VcNMKaxiWZj7tCd8p1qnGD+cvVfa
	 WAY7xwL9bZKF410M4td33jsm0JuT8uHXE4XVexrvAkF0ZIKPRbKVvQvKFcLCm9BleoixL7/Q9ZK/
	 ohaG/KMQylmS59Uv9Y4AH+9K3T4KdocBQ2UVZb9EL9I5yBsKSRz18KW1ahlnGJCBSOxvQNKehPda
	 tcq/0IwohYFes8l8slX4+NEANoH2+m5S3U2IHX7oxo4m1Xsp88/qcxTKYTG31LmQWC/xpfFIY3Hx
	 6KJccifIVzk/hnbx5/mXiBfZCLv+YIHLD4s42coRVK1x1PNbAjf7i9jJRpOSeXFeCm6BXO6eL5b/
	 0sg4D9LVfm5fabANlH6gR/EqZPzvBEdvlWyjcNk20bKOJXNcxujVZA1nC6aQKJX9PA6FOwlUpinx
	 44qipYd2537Yv2GkBjj5rA4RpyGSh2zcglhoae4uVuGT0RjcWlug53IialzWeS8dJPRkVaFFm2AX
	 csESjMPTIXLRxp7N3v2CqmYAGK7xI0d6ikk3mBolm3BPL8uncHqxaiyj61085lkrQt3Lty9cBP5d
	 Ewwc5F8kNwwThu20/8aBjG/2QdHGNTRhbjr0jM7KfLtfq+QfnYkuySttiYA/+j83xlJsFGBYUDdt
	 ZO4CvbpTs4s702xDVPE4mBH8C1pg23Ent+nNhF5N2aha5H0J/rdIxCb36EqUxUPmF18uMwszGd3l
	 Kf90gx1XxsYzSnB0Hr0A==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: rtl8712: fix potential memory leak in _r8712_init_xmit_priv()
Date: Fri,  1 Apr 2022 01:23:50 +0800
X-OQ-MSGID: <20220331172350.9779-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _r8712_init_xmit_priv(), there are two error paths do not properly
release the resources allocated by it.
This patch is to free them.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/rtl871x_xmit.c | 27 ++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 090345b..dcf3f76 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -117,11 +117,8 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
 	pxmitpriv->pallocated_xmitbuf =
 		kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4, GFP_ATOMIC);
-	if (!pxmitpriv->pallocated_xmitbuf) {
-		kfree(pxmitpriv->pallocated_frame_buf);
-		pxmitpriv->pallocated_frame_buf = NULL;
-		return -ENOMEM;
-	}
+	if (!pxmitpriv->pallocated_xmitbuf)
+		goto free_frame_buf;
 	pxmitpriv->pxmitbuf = pxmitpriv->pallocated_xmitbuf + 4 -
 			      ((addr_t)(pxmitpriv->pallocated_xmitbuf) & 3);
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
@@ -130,12 +127,14 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 		pxmitbuf->pallocated_buf =
 			kmalloc(MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, GFP_ATOMIC);
 		if (!pxmitbuf->pallocated_buf)
-			return -ENOMEM;
+			goto free_xmitbuf;
 		pxmitbuf->pbuf = pxmitbuf->pallocated_buf + XMITBUF_ALIGN_SZ -
 				 ((addr_t) (pxmitbuf->pallocated_buf) &
 				 (XMITBUF_ALIGN_SZ - 1));
-		if (r8712_xmit_resource_alloc(padapter, pxmitbuf))
-			return -ENOMEM;
+		if (r8712_xmit_resource_alloc(padapter, pxmitbuf)) {
+			kfree(pxmitbuf->pallocated_buf);
+			goto free_xmitbuf;
+		}
 		list_add_tail(&pxmitbuf->list,
 				 &(pxmitpriv->free_xmitbuf_queue.queue));
 		pxmitbuf++;
@@ -146,6 +145,18 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 	tasklet_setup(&pxmitpriv->xmit_tasklet, r8712_xmit_bh);
 	return 0;
+
+free_xmitbuf:
+	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
+	while (i-- > 0) {
+		r8712_xmit_resource_free(padapter, pxmitbuf);
+		kfree(pxmitbuf->pallocated_buf);
+		pxmitbuf++;
+	}
+	kfree(pxmitpriv->pallocated_xmitbuf);
+free_frame_buf:
+	kfree(pxmitpriv->pallocated_frame_buf);
+	return -ENOMEM;
 }
 
 void _free_xmit_priv(struct xmit_priv *pxmitpriv)
-- 
