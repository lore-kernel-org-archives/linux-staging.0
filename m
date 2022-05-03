Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4C17E9
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651561155;
	bh=a8VkqhTbS4VV0BGBP7YiwpU3oywneHl1xKAIjgRkWk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nP2TuOtXfjVqrE2J7Q909uRTnswni4Ti7Kd7FXyCW3SR3Rirc/Zbpc0lIWcUDfRhr
	 n6xbLaFW/Z5Ijr6lGvzGwqaKr20RK6STu3Yp1pgDuBSQWW+2f5N4BQ/laVP8bQ+yoj
	 KiaDJpAdgqpxFvyPJZpB4ROtan5H4i1gzKRuEf/Y=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id ECCB5CD9; Tue, 03 May 2022 14:59:12 +0800
X-QQ-mid: xmsmtpt1651561152t99slzn8x
Message-ID: <tencent_280D048C193D178A239D222D5C54C9EEFF05@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9fiOOpy28RahsysLz46Fk0MHtJ1qIf3ooguRaYv2E2SEpDXdxdQ
	 aXuGsTh5C6I9uHZTwEmP2nTKCmjOAXyEKDZt+eo9gdpwkTWYkPgC1uyWU8w0wMxI89Cfrpmozxos
	 n6wH7bH6TzRU8abdYmmUcpAaFKfgG6n1cLWW3elYap1EVkQrhp9EuDFzm87qQp+bRJWJhW7sbHOQ
	 BbzbxEX+C5teAIfxVqzgFwXyhtCaXUBFwdyCpols2PVn65/8f0X2dMCA5cG60yQ4HUH5jfu7BCP6
	 XJ0MqHKzAPeShEG6Cvf8BBXeypPTrRAwX4NuF4WDOO7HQiTHrfiuSrYNsGcnuHoJkqXOP2pH+/e/
	 9eBfSqUhFjaA+sQb8Zxe2h4E15UtrH0Q30fbSNIA3D8hodHZmkMYHDSlO9y7u5aP4Qj5Xe6MygX4
	 Dby3HqxCSbv0Mp+5ebkwxqqJwvJFZjTch9GftsF2ed/KHPJY9FRorpaZp2G8lN5L/gBkTw/NjT37
	 9HjtPx2WmpYXJ10KgfOvd9etDJEUW8mUex5ipbvh4TOPkXMsdd61NRnBg1iELD6LTjihKBn3zram
	 Lkuq+LRU5Q5AVTXKybIpNz5sauibHQeQ6YzC5o9Tr0eVH+kXNUAIrpCFsJZCRBOVgiw/jBKxAYFH
	 mjr69wY4DdvoGayerPDh/QX5MpfoazyxLTnKk/Er8RNqWRswEeHPggzj0kNcGBPFopJdF4fYGh3l
	 Z+VQsSy+CkTkGKM/L8TkAkLTLBGfuzSVXPVednfqLf90WtcEzzFEJRb4Kc1TBlBNwCmnlVuLZTpX
	 0s5TJaX6BOLLWsvoFP7Ad+TDzKgITbvZNLVlcJ0QwUV29hNgHROALcrG4IAnm6iBBo6+MgChDU43
	 ifidUMT5GTWE43zLJKDhUHe30fZDFh4K+n6D6WhCGU1wXJpLd7QYKtvNjF96fKjMGAlvP/LWHwK5
	 t/CfKy7/KaYfAgPjlSPcT60BLLoRbx
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 03/12] staging: rtl8712: fix potential memory leak in r8712_init_drv_sw()
Date: Tue,  3 May 2022 14:58:55 +0800
X-OQ-MSGID: <20220503065855.3218-1-xkernel.wang@foxmail.com>
In-Reply-To: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
References: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In r8712_init_drv_sw(), there are various error paths do not properly
release the previous allocated resources but directly return the error
status, which leads to various memory leaks.

To properly release the resources, this patch unifies the error handler
of r8712_init_drv_sw().
According to the allocation sequence, if the init function returns
failure, it will jump to the corresponding error tag.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 003e972..43a7953 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -304,10 +304,10 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	padapter->cmdpriv.padapter = padapter;
 	ret = r8712_init_evt_priv(&padapter->evtpriv);
 	if (ret)
-		return ret;
+		goto free_cmd_priv;
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
-		return ret;
+		goto free_evt_priv;
 	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
 	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
 	memset((unsigned char *)&padapter->securitypriv, 0,
@@ -316,13 +316,25 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 		    r8712_use_tkipkey_handler, 0);
 	ret = _r8712_init_sta_priv(&padapter->stapriv);
 	if (ret)
-		return ret;
+		goto free_recv_priv;
 	padapter->stapriv.padapter = padapter;
 	r8712_init_bcmc_stainfo(padapter);
 	r8712_init_pwrctrl_priv(padapter);
 	mp871xinit(padapter);
 	init_default_value(padapter);
 	r8712_InitSwLeds(padapter);
+	return 0;
+
+free_recv_priv:
+	_r8712_free_recv_priv(&padapter->recvpriv);
+free_xmit_priv:
+	_free_xmit_priv(&padapter->xmitpriv);
+free_mlme_priv:
+	r8712_free_mlme_priv(&padapter->mlmepriv);
+free_evt_priv:
+	r8712_free_evt_priv(&padapter->evtpriv);
+free_cmd_priv:
+	r8712_free_cmd_priv(&padapter->cmdpriv);
 	return ret;
 }
 
-- 
