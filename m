Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DE33CB
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 11:25:44 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s11so3728236qtc.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 04:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=q6Ao2x264TUuXRgjmNEOpLHsRTrAHzD0yaNN8nRTx24=;
        b=njmvVKYihT1RCQkDsfwJcxDQ5hrQAokIdNT4iYCY7YdZYuQV/2QHaxoFav7vgscxgR
         GU7vm3TjVuKnRN9YGtfgKvLxmtcA22Ml7a7P2uYXFOlH/n4jSANiidycUu+UiDb+ifaT
         z2W/KwIuJ9XabHI/wP8RxrT7RJesCc3uzqO+ihfmZNpLkotMdDGP0YciD3yMxNqXe9TG
         rnCIF6mixuez4Ti3g2PkmGDRQQQLnJd/QPswDRig31mlOOmVIqTRbBzW4PAaXADLKBwM
         l85U11q13H2miX6uvXSNi1Z7717Qr+bnSyqDod7dPg1G0RZmiH2wDE6ZXZs6Hd/GME6Q
         MHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=q6Ao2x264TUuXRgjmNEOpLHsRTrAHzD0yaNN8nRTx24=;
        b=3ZJbay0me4tppuJgNon17L2WibI8ys00h6t67ClKHR4cz+XpInIUZ+mYQ5ma34JkRY
         5EO25/n7Z8Rrzyf8VBlaeGgN+LWCKv5ZDwg3ejBKF/jDYYTpEMIndO8OQD3r3RmqSwsZ
         LkIx8CSFiHzaTopoHQoQxjp92IBqq/27/op7RdrCoGU4L3Uvct5lc9EGwkZS3gFp8AZt
         xMT4bpZU/5yeMqCkn5FUk5OVek017pSiYP+UzTsnQNBRvcSTXm7ju8A6J1UFmgRd3OLD
         JkjxE3zI1jzvkNS5K/ioadxVbd87g8mvwuCz7WxiWlshcJXcP2LUO8IcNtrc6X/UCx2O
         D8LA==
X-Gm-Message-State: AOAM532R1CzGJyom/3m8ASfqFgZJyEQ1uZ2N+ZHqU8kILp7cRr6VPcK6
	IBKSwaLsNlOzlTaxAZv21Xb2oA==
X-Google-Smtp-Source: ABdhPJxHViamNtf0QgejhKNAmZKKRWhl4+iap8uIfRlYuirDrIAVzWYkzo12oIxcVryHgb0okFUCBA==
X-Received: by 2002:a05:620a:17a4:b0:67d:bb92:f56d with SMTP id ay36-20020a05620a17a400b0067dbb92f56dmr5087900qkb.276.1649244343892;
        Wed, 06 Apr 2022 04:25:43 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id o6-20020a05622a044600b002e1b9be8e6fsm13119618qtx.36.2022.04.06.04.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 04:25:43 -0700 (PDT)
Date: Wed, 6 Apr 2022 07:25:42 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	paskripkin@gmail.com, straube.linux@gmail.com,
	dan.carpenter@oracle.com, fmdefrancesco@gmail.com
Subject: [PATCH V3] staging: r8188eu: Fix unsafe memory access by memcmp.
Message-ID: <Yk14tpZCOFCsvtup@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes sparse warnings about the memcmp function unsafely accessing 
userspace memory without first copying it to kernel space.

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---

V2: Fixed checkpatch.pl warning and changed variable name as suggested by Greg
K. H. and improved error checking on the "copy_from_user" function as suggested
by Pavel Skripkin.

V3: return -EFAULT from the function when there is a memory error while moving
it from user space to kernel space and fix incorrect subject from V2

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 21 ++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 7df213856d66..9f2182b8e451 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3233,23 +3233,28 @@ static int rtw_p2p_get(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	if (!memcmp(wrqu->data.pointer, "status", 6)) {
+	char wrqu_data[9];
+
+	if (copy_from_user(wrqu_data, wrqu->data.pointer, 9) != 0)
+		return -EFAULT;
+
+	if (!memcmp(wrqu_data, "status", 6)) {
 		rtw_p2p_get_status(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "role", 4)) {
+	} else if (!memcmp(wrqu_data, "role", 4)) {
 		rtw_p2p_get_role(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_ifa", 8)) {
+	} else if (!memcmp(wrqu_data, "peer_ifa", 8)) {
 		rtw_p2p_get_peer_ifaddr(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "req_cm", 6)) {
+	} else if (!memcmp(wrqu_data, "req_cm", 6)) {
 		rtw_p2p_get_req_cm(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_deva", 9)) {
+	} else if (!memcmp(wrqu_data, "peer_deva", 9)) {
 		/*	Get the P2P device address when receiving the provision discovery request frame. */
 		rtw_p2p_get_peer_devaddr(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "group_id", 8)) {
+	} else if (!memcmp(wrqu_data, "group_id", 8)) {
 		rtw_p2p_get_groupid(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_deva_inv", 9)) {
+	} else if (!memcmp(wrqu_data, "peer_deva_inv", 9)) {
 		/*	Get the P2P device address when receiving the P2P Invitation request frame. */
 		rtw_p2p_get_peer_devaddr_by_invitation(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "op_ch", 5)) {
+	} else if (!memcmp(wrqu_data, "op_ch", 5)) {
 		rtw_p2p_get_op_ch(dev, info, wrqu, extra);
 	}
 	return 0;
-- 
2.35.1

