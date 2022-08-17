Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910B7C
	for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 06:32:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e13so16213378edj.12
        for <linux-staging@lists.linux.dev>; Tue, 16 Aug 2022 23:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=O7B4wBks7f3hW7WkpQlC01sLwbVkWb1JQNhWXBvVpo4=;
        b=ildQPppwYAvHF58sp6qVBfuSOqFyw2GAlzItDHum6n33ZGyG5ULvX3jmcBG9ognmYv
         uvBSebwIkqpG4mAv2pGm9sbYTc2Oun/PHm+X2hWtg2tJUUNObKQUtU4O3kUTTzmt6EQY
         advDMaWHNCT3euDVccQSMEpSY/g0XCsLyfO+X5A1qPFPKazZzbHelzskJQCO5DABmWxp
         Z7MCnXymj6mKveALOdJNwdIPJU1XOyzcNwpecjlPWkg9UDMKlOWaekWjdo5gDR18Gtz1
         ROzOOsHsthV8gMAVJA6/umGW77xk2aIJy0I56MPC9LzBORo1+yy4yNUHGSxFizq8EaQb
         4BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=O7B4wBks7f3hW7WkpQlC01sLwbVkWb1JQNhWXBvVpo4=;
        b=Cai5GhIzzMNMQr1QUCnUYQJzrzBykNreFueKEWKUFpEJXFFd1U76K8fatfnmWO5Vhs
         0XcBdmBNbAxlS3iBv7OiUNQbnl4Ake3WY59TMOKon3ebQP4byd3tj2zIWgqTwsZcJgD+
         xuNIWtxHhpElDFBo4eEJWS6PcYz20stctko/NjC98dSsxyjdMQ8kjIkR0jVoEJTyIiFt
         TKTWmPybnFH8ZSDl2cYm5zaHkKVdA9B5Yb1DeulCPvv0+aACkVQTmi6mCSU256x5+NFJ
         yUTuIZa30qbia3zeQT8XNzIjhpuOfGyoO25JagoeOQG473iXq9Aw33AFZXo0AYBXa1VT
         +4KA==
X-Gm-Message-State: ACgBeo1lZs6nwWFJ5gHNkeEZ3gasdWfmyVkxbDVAwJUsnH6RFyh6MtcI
	DogBlk1R2KUKFJYH1k56by4=
X-Google-Smtp-Source: AA6agR76MIqhwqeBmk2Kc2Fxz0g8cfosol3AvUZRr716ido7lRt9gAkkUyNBwmTABb9Nzd5llVucXg==
X-Received: by 2002:a05:6402:4511:b0:43b:a182:8a0a with SMTP id ez17-20020a056402451100b0043ba1828a0amr21819395edb.410.1660717955239;
        Tue, 16 Aug 2022 23:32:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b007307c4c8a5dsm6291669ejo.58.2022.08.16.23.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 23:32:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove rtw_endofpktfile()
Date: Wed, 17 Aug 2022 08:32:23 +0200
Message-Id: <20220817063223.8140-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_endofpktfile() just checks for pkt_len == 0.
Remove rtw_endofpktfile() and merge the check into the caller to
improve readability and simplify the driver code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      |  2 +-
 drivers/staging/r8188eu/include/xmit_osdep.h |  1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 11 -----------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 24401f3ae2a0..48631ef56114 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -970,7 +970,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || rtw_endofpktfile(&pktfile)) {
+		if (bmcst || pktfile.pkt_len == 0) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 00658681fef9..130dc06efe73 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -40,7 +40,6 @@ void rtw_os_xmit_resource_free(struct adapter *padapter,
 uint rtw_remainder_len(struct pkt_file *pfile);
 void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
-bool rtw_endofpktfile(struct pkt_file *pfile);
 
 void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
 void rtw_os_xmit_complete(struct adapter *padapter,
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 91a1e4e3219a..85ef27735b88 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -54,17 +54,6 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 	return len;
 }
 
-bool rtw_endofpktfile(struct pkt_file *pfile)
-{
-
-	if (pfile->pkt_len == 0) {
-
-		return true;
-	}
-
-	return false;
-}
-
 int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz)
 {
 	pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
-- 
2.37.1

