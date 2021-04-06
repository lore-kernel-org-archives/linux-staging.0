Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6866D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 10:56:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f12so7736681wro.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1OdVdRoE2zhBD6rueqcaxE65GfvXBrF/yJr7/CuoJo=;
        b=hH91VRw7grrA/ma+05HwprBB4SWH0PZOL2v6GaYzgcar6w8RimAebXwQ0r1WqEbU3F
         2LqKCCbqWQjEokmMQnzjO+k1KIwE3JhktahVYlWhKxIQ62dqTYIE+cirsW1MbpHs9que
         o94nVwOMtuN7jHkOZiA63gb2nere09fid76p6MaVjNI1G2g4GbCn3nZbkln7vZP9iDwV
         Lh5w2umCi+tjzA8XvAk+vbRn5+pa0aaQvxSEbSNir9qZjaSVEPtTXxR9iybi/Pp0niLA
         QbCYWtfk9oU6ElBYBTmMw4mRZQmDpJMlC1LoAhwH60zEQ5aNgZHTITjFNUk3LP70d+0U
         OYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1OdVdRoE2zhBD6rueqcaxE65GfvXBrF/yJr7/CuoJo=;
        b=pBxS1B7zM18G4D+atbtlXhYAPVs0//MKfNIkFzape8B8Bc2Uu1Vzz88KmDGKvXcF5W
         C1N8m7bBAOnjFAGojej07PvlP4k9jSNpdSbUlaweo/mTSkxCU3JGNli6PCKvlTS0PoUp
         LPhKhPLWqBTTSeG8GLz6cpyM+ORUPfC5Fb0LaSaMqSy0+S2yAR+td/KLbWeS4qPFNtkC
         Do7OFv5uMQdny+Q7o9AOH0lX30tiRbXlE6HGtR50Cyx3Us3AM/kf5mz0RqHQUbNEZgYm
         oTJx2diPUNqoa2tbDPK1SHIRtOy1HXlAqgM3fC2Z3/bLV2pQavA1ZzAcdtCbjzPQ2Daa
         kiHg==
X-Gm-Message-State: AOAM533GP6U86c2dmusmbjl+ry6UbijVvcv8PePY4hSVXjvkwfwN3ndy
	nmBCxwTh2Ltywc0OBiCOqjwb6Q==
X-Google-Smtp-Source: ABdhPJxrLzBsqhvzZyPqBM+u3AzvgfmTytgOO3UgoVYMi1dwP3EYYqHD4fx9yq+TjIxfwAEfUYinXw==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr34278705wre.183.1617706569128;
        Tue, 06 Apr 2021 03:56:09 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id x1sm20673504wro.66.2021.04.06.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:56:08 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: ross.schm.dev@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	insafonov@gmail.com,
	marcocesati@gmail.com,
	pterjan@google.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused variable from rtw_os_recv_indicate_pkt
Date: Tue,  6 Apr 2021 11:56:07 +0100
Message-Id: <20210406105607.1689292-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused 'ret' variable from rtw_os_recv_indicate_pkt function in
drivers/staging/rtl8723bs/os_dep/recv_linux.c as nothing is actually
done with it. A function return val is conditionally stored to it under
certain circumstances, but nothing is done with it after. Fixes a
warning from kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index fbdbcd04d44a..f6a9482be8e3 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -98,7 +98,6 @@ struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_L
 void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	int ret;
 
 	/* Indicate the packets to upper layer */
 	if (pkt) {
@@ -140,7 +139,7 @@ void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, str
 
 		pkt->ip_summed = CHECKSUM_NONE;
 
-		ret = rtw_netif_rx(padapter->pnetdev, pkt);
+		rtw_netif_rx(padapter->pnetdev, pkt);
 	}
 }
 
-- 
2.30.2

