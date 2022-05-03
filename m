Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DB17E9
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651562119;
	bh=iygDSVmD2rO3aPLIauGKAEgow3E9H/+Nk01MuNwOB7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A461XtdFIaRJ7IAvFMtSR4GAUD7znJZ4VSs1AMRiHr9adyufFtVj+p0uXhZmkhz5h
	 hUwen8ozo4K9jXOHPsN2GvizKaaKyRxgAdpNZOz9GqVaO9UBMinfKMsuyaIGKYu5PG
	 R7KU+cCZGB8AQOSNTZIXiAK4yC8scXXhqm2J5Flk=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
	id EE829C5E; Tue, 03 May 2022 14:59:40 +0800
X-QQ-mid: xmsmtpt1651561180tckx37ojz
Message-ID: <tencent_F01FE1394A78FF022020CC24B9791C3E1408@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujr0eDvl4RIM37LF5WbctDAUAuch4K4VI10nc6BJWPdf1GGBbVmm
	 YfHC5WBMiiSWz6TjBqSJOlPhcxS2SGg9ZAdo93uTRtHmOrsXEUSciQ89cxJN/Amv6M8dph/P0y7e
	 m/P4pH4dJejfD3dciC+Yc38/cvWIuMAV22bicxfzPeV5l2LCOrAl7ay+OC33s2x5ixbrCfL7h4oF
	 TxGZVueL4Ea94ttGzA03U9/gRvsIjCqaGiXIQJvmMaZsb7MQmsMyTo8wHP7S3EwafEv0oED+DmaA
	 JQo9QOx9QJpb93uAK9zyGkOhW0nYHjP5MgPVnYvkwfDXCktSbts4ZbaIbE6tGAURGxdcbueUbpvD
	 5nzAAl9/YV5GuHHlmy5IJ2eJW8gnniz7XIw4XmeE3AOe75J+W5l0Z/cW7Tv8lcY+Xt8OeXHUtSU8
	 QRHsAQ+FW9zbVTudiZyxpzEN/pP4rh76wd7amiE2x05j4M1l1VifKs2ENlKxdz8Noemwp+rwEJnC
	 LVzFT+ADdns16EUUdwlS/VcmOLoQdALT1ESvCITYVfiJoJT+GdnNRe31PChhvuYo+FlLNZOUy8Hz
	 4ogfy3kEQNR8pQcgF8azvZmvRM69CGVmE7n9kAbxBR5tCdF+CuY30eVAFb18mbLFHfpF36v1HnH+
	 eLEXN/j0TwBeYVGf9twW+Q2XEXYIEpWA9hN1IBW0Sg42phnn0C48BcLybSB1+QvN0rOLJ0JVdEPR
	 j6lAEXyjLT3t1Ci0Y4N3FuEnPEMn8cCz/Cy3d/4aral3Yvtooqb9+rfQV2L3v61ud/cKw9VfqI8G
	 vPRxX46bLMojVtBzNKH4wNVJqbNBV0G0DKEzePRR+RH8mFHyZyqQ1ef4ALwzbTclLZ+hdbUXAnxt
	 kQA7FXcELkC8elYoPOMMuuPjvrjPK4q41fNCp03k3/b+MplsL5JNRPRADIFQAiqqB5RkWN3uuojN
	 ZyBdrLmN8OK3vMR4LliwFvL6FKLAAGC6RUqyjEKogYg0+NxeJcvjm83V/W1vPt
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 04/12] staging: rtl8712: change the type of _r8712_init_recv_priv()
Date: Tue,  3 May 2022 14:59:21 +0800
X-OQ-MSGID: <20220503065921.3239-1-xkernel.wang@foxmail.com>
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

There is a memory allocation in _r8712_init_recv_priv().
However, since the original type of this function is `void`, its error
status can not be feedbacked to its caller.
Therefore, to make the error of allocation failures propagate to its
caller easily, this patch changes the type of this function to `int`.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/recv_osdep.h   | 2 +-
 drivers/staging/rtl8712/rtl871x_recv.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/recv_osdep.h b/drivers/staging/rtl8712/recv_osdep.h
index d8c1fa7..f5b97c5 100644
--- a/drivers/staging/rtl8712/recv_osdep.h
+++ b/drivers/staging/rtl8712/recv_osdep.h
@@ -18,7 +18,7 @@
 #include "drv_types.h"
 #include <linux/skbuff.h>
 
-void _r8712_init_recv_priv(struct recv_priv *precvpriv,
+int _r8712_init_recv_priv(struct recv_priv *precvpriv,
 			   struct _adapter *padapter);
 void _r8712_free_recv_priv(struct recv_priv *precvpriv);
 void r8712_recv_entry(union recv_frame *precv_frame);
diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
index de9a568..e814c07 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.c
+++ b/drivers/staging/rtl8712/rtl871x_recv.c
@@ -44,7 +44,7 @@ void _r8712_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 	_init_queue(&psta_recvpriv->defrag_q);
 }
 
-void _r8712_init_recv_priv(struct recv_priv *precvpriv,
+int _r8712_init_recv_priv(struct recv_priv *precvpriv,
 			   struct _adapter *padapter)
 {
 	sint i;
@@ -60,8 +60,7 @@ void _r8712_init_recv_priv(struct recv_priv *precvpriv,
 				sizeof(union recv_frame) + RXFRAME_ALIGN_SZ,
 				GFP_ATOMIC);
 	if (!precvpriv->pallocated_frame_buf)
-		return;
-	kmemleak_not_leak(precvpriv->pallocated_frame_buf);
+		return -ENOMEM;
 	precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf +
 				    RXFRAME_ALIGN_SZ -
 				    ((addr_t)(precvpriv->pallocated_frame_buf) &
@@ -77,6 +76,7 @@ void _r8712_init_recv_priv(struct recv_priv *precvpriv,
 	}
 	precvpriv->rx_pending_cnt = 1;
 	r8712_init_recv_priv(precvpriv, padapter);
+	return 0;
 }
 
 void _r8712_free_recv_priv(struct recv_priv *precvpriv)
-- 
