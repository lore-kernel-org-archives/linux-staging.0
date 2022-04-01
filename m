Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4647C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 20:12:49 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id e22so2853218qvf.9
        for <linux-staging@lists.linux.dev>; Fri, 01 Apr 2022 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oZosTPYclzlc5poYKr58RA5wxMWJ95dZSkxQK8mQ7Lw=;
        b=jBwU+Eju1cxeknfoVOH9U665mT7GdgJWN3rqZEQvdXJI7xGpq2y0fCTxG/o0GtRnQl
         yHnaFIamVXVDs5C1aMm5Y3PYDukydkVUqVIB4uSDgYeDLAAIp4fkSfH7NBJusvIVEepJ
         GKB84vhcjm/s/VZGn37oJzlqfyrv4mHPTKWwzfTRTkLT35frUBctvmujuurNm9wK5K3O
         WEwkzL9JCDIOu6G6+oacKjv5YBo0ph2ZXZuQx+qEfVRFy8q816KS1SH+kkthZ0TdYhCH
         GOyEEj6Tq9o2caghZEHYmJLmz97XehYzY1Go2hx9AGezQW5K1itwkygtQFlz3IqJbpM6
         eWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oZosTPYclzlc5poYKr58RA5wxMWJ95dZSkxQK8mQ7Lw=;
        b=KFbhb9NT7b0GA71okKTwjeEpPVT/yyo6xn58MdtuaTlCiK/HfRMwVa04EiyauCpaJy
         ffF0KhKLRCYEDJzvwZT33YA0bNn4+2+PUD98bFPTTV9Kg8ow4dwidbX7J3a3xT9EJWMC
         E7ernoF/EAWEgklK5nRGke2z5p5qphCvQeu0nQFim4pZxwNAdrhyivPrgbk1hiE5yLi9
         HWYxK5ua4nKG8DxKi3XXZ0m0oEJK/b1o2VsbuilnkiPleFdqZWD46Mr9YlzG1Fs8QHbc
         ZVDju69htLoxUkRUOEtD2IEu07MHzy0VLGnBywk5hTTCgf74CabbMcZGTfLFkgKxlcVW
         i2JQ==
X-Gm-Message-State: AOAM530tbaBFPUZFKH6+Qv46yeXwKSiBRbkEzMLNXzPHvBjSnNqf1gcn
	Mr3N5eDmJSrLFTmsBNuxCoaVMw==
X-Google-Smtp-Source: ABdhPJxR3D2ziE1C1fU3A5e9Qo50x2v8BOfL9Sh2jN9dQDz+G6xk6+Vq9Q6sv113p7q3DFR1pdKGAQ==
X-Received: by 2002:a05:6214:cc9:b0:443:a483:3459 with SMTP id 9-20020a0562140cc900b00443a4833459mr6689045qvx.6.1648843968526;
        Fri, 01 Apr 2022 13:12:48 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id b82-20020ae9eb55000000b0067b314c0fedsm1857817qkg.42.2022.04.01.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:12:48 -0700 (PDT)
Date: Fri, 1 Apr 2022 16:12:47 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Fix unsafe memory access by memcmp.
Message-ID: <Ykdcv6Sm3oDE9IEp@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes sparse warnings about the memcmp function unsafely
accessing userspace memory without first copying it to kernel space.

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 7df213856d66..1cfac1b27eb7 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3233,23 +3233,27 @@ static int rtw_p2p_get(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	if (!memcmp(wrqu->data.pointer, "status", 6)) {
+	char wrqu_data_ptr[9];
+	if (copy_from_user(wrqu_data_ptr, wrqu->data.pointer, 9))
+		return 0;
+
+	if (!memcmp(wrqu_data_ptr, "status", 6)) {
 		rtw_p2p_get_status(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "role", 4)) {
+	} else if (!memcmp(wrqu_data_ptr, "role", 4)) {
 		rtw_p2p_get_role(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_ifa", 8)) {
+	} else if (!memcmp(wrqu_data_ptr, "peer_ifa", 8)) {
 		rtw_p2p_get_peer_ifaddr(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "req_cm", 6)) {
+	} else if (!memcmp(wrqu_data_ptr, "req_cm", 6)) {
 		rtw_p2p_get_req_cm(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_deva", 9)) {
+	} else if (!memcmp(wrqu_data_ptr, "peer_deva", 9)) {
 		/*	Get the P2P device address when receiving the provision discovery request frame. */
 		rtw_p2p_get_peer_devaddr(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "group_id", 8)) {
+	} else if (!memcmp(wrqu_data_ptr, "group_id", 8)) {
 		rtw_p2p_get_groupid(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "peer_deva_inv", 9)) {
+	} else if (!memcmp(wrqu_data_ptr, "peer_deva_inv", 9)) {
 		/*	Get the P2P device address when receiving the P2P Invitation request frame. */
 		rtw_p2p_get_peer_devaddr_by_invitation(dev, info, wrqu, extra);
-	} else if (!memcmp(wrqu->data.pointer, "op_ch", 5)) {
+	} else if (!memcmp(wrqu_data_ptr, "op_ch", 5)) {
 		rtw_p2p_get_op_ch(dev, info, wrqu, extra);
 	}
 	return 0;
-- 
2.35.1

