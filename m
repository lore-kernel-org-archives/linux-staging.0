Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4F17E9
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651561270;
	bh=WUuXmnaF/R6rnyYX09RCsMehb8Gv/6PLDTINxf8HBCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tGe2+E0DowlIL+AI0DxEgnHtBza9YGPmMviJBXumhWIZl6ux3xev7wt1NUtDNHmpG
	 sXT7ezLYT6eSijnPDcpJYerk75tU4PQlxx0siuQ6d1IR6S6azi7LQyeCvzmU0ZIScM
	 M02cZSpE4w+nrXAzC/w1FMn2RTV1xtOi8FuG7vz4=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id EFB38681; Tue, 03 May 2022 14:59:59 +0800
X-QQ-mid: xmsmtpt1651561199tlfdp4ine
Message-ID: <tencent_49C483592237812380A228DC4089EC3F0D05@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujs8ai0G1RB9JQjHqN5g5ZrifwohCLIhVyMafDClFi/iYqvRl2W2
	 bRmU42XIdbD1t6rVfnUvoBZYV5a6laQpbODiVBKvuBSAH1CaKPeHDT/8qL8+KixO03cKG9fEnsHy
	 r6Ttz0wNfG8xc8VNhyK4SHARPRxYfbovRhn7J8+7EKCg1fXn/6A8UwnQsfyJeUmJqKISPh+7Srck
	 v42KUpKKyWwB/Zm/YfNuhofKzU3uPbcQFFMFDRCLY5fZL7pPyE2If70Lpt1pdLZn1KiPEcfIO+jA
	 wh/umjpsEB013CdrP1cdL+ts6QrhI+YTLx3g0aVut6muYijrukDk4/v6wCOpSuejMcr4cgOnXROY
	 sQDsNfg3nSwrDgvXg75m5uTfscV2DbrY4SzLck4I4JqwM8pw71Dp76CyXfAnUSZELkpT3u0/3XNb
	 DMsVYEv0eIrr1WoARAZ771HOZZlmtiVi3OdKGeGaZDboWafwvKZ6/0WhSxzZ59je8IWwYcfcj+A9
	 trvsd3I0wtAIN+hSrlfldVZsgxxwxbuxHnm3SwENJj8D+ewaOEVfSqtlsVu5RjyXot0X/LojmTXy
	 SWhdVD4UAkR0a0mUzKfj6HvZ/KpxS5au31SMYV1x6VwNSRgCwBnk/glNBX0IXvqpM/bZlh0kZBcG
	 wixFBIEGQhO0iywmakRr3Df75E7iNHAYl6hH83hxSC8SH1gM+eQY3PL6bw1ZXEyx/58+cwJXe38y
	 WMpJxDr2w4tV1iwkzJIwf4sLazDRx9xbOL0E806YhHTcnFLei27nLnsOtodE9r4gEo/UhYod/yzd
	 TqrGWmJOcUFc80TKQyjfH/YyWRHkma8R7dNKW3lpWUyc+ct59k/Ps/jHziVMlFEYKUDC7pn4Q3Z6
	 3nLbgS7iq1dJ+UnO4552SC6tOMUUu0TyhuZtRKoso5P82ctjV3hY+YEFPc83AoMBgkZbwIJNvoG2
	 upb5t888D4pVF15l1kpQ==
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 05/12] staging: rtl8712: add two validation check in r8712_init_drv_sw()
Date: Tue,  3 May 2022 14:59:49 +0800
X-OQ-MSGID: <20220503065949.3262-1-xkernel.wang@foxmail.com>
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

_r8712_init_xmit_priv() or _r8712_init_recv_priv() returns -ENOMEM
when some allocations inside it failed.
However, the caller, i.e., r8712_init_drv_sw(), does not properly
validate their return status, which may lead to potential wrong memory
access in the future.

Therefore, this patch adds two validation check for their return status
and properly jump to the corresponding error hanlding code if failures
happen.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 43a7953..3d79d24 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -308,8 +308,12 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
 		goto free_evt_priv;
-	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
-	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (ret)
+		goto free_mlme_priv;
+	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	if (ret)
+		goto free_xmit_priv;
 	memset((unsigned char *)&padapter->securitypriv, 0,
 	       sizeof(struct security_priv));
 	timer_setup(&padapter->securitypriv.tkip_timer,
-- 
