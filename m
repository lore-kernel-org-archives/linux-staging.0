Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD26D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 10:51:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p19so7141855wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9jWO01eQCvaSALTaYkYaRpgTZuO0r7x7rAnN4myhxg=;
        b=B3Ep+wExrgNMtKa8EakKLL7kSl/7DSbnkWpxxMYEK/oxjgbZMOvAqWvKpIsing3zxu
         s/npRS1/OSQ7QHLFmo9WBHjnBYyR/bDsGAhqJl7QNr/Sud+rYToJarxr5T8+Hc4ryr/0
         9AZsOP/HlHrK2zB4vfvN7ZYFmAWuYqdBNrlh6aXuefzF/G1/qxOorPfPT0Oq2TDETgKZ
         D5iWK4t92EXRlKNVBANM6GuCqsNBiHgKYIjxXaWt72JFg7Zn/OMDc8608cOa2JzREgMb
         k8+6Aa09jjGL/mcik6of57bEFbKnArDko3tnTriMdAtAsHG9HFcSqdrOh7j2md/tvXQe
         GoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9jWO01eQCvaSALTaYkYaRpgTZuO0r7x7rAnN4myhxg=;
        b=J3wtqhRObgxJNyf4usdyofRL9NFM2N4PFfF5uZd67ly3Qk0jI7Q1KVQMz3OGegEI00
         vC2DJQw4enP+VOmlA3HMXZrkJwsV4kVQCjlL3PulA9Nu7zpUmA7hDLsqZX1s+0qALCmg
         aXh4uOZ0T4Ku0yKpUqUrQrIBM9YIJ8D5z0ZcJgXc3cVDpnf5QNULowxGroV3eV6pWiJ+
         BE3d74bV72ynOMzUyRRLIec5F87iLglkYgpPnaYlkmgnRDS/bNv8uu5ieKDjc4KAcBOO
         XVhj9EyDi+ahJpLv25kIYFSSk0VbQxxTbWrnL9NGbPnCBeF4xHTlYLUAN0w3K5KDRW3Q
         i5bA==
X-Gm-Message-State: AOAM533mCTUEPayoh2e4U04uYN1Mx1P8OYvsEdZ4f95ue1arNG3BG0Bp
	9sxKDNGGcEnxmUk6F6VcI2Q=
X-Google-Smtp-Source: ABdhPJxQOjyaK8Qd7dD5gHn2A2Ngxdpd7HfM815L2u2CG0SAVMPtVYJI53J97KTVwnSCHf9CetMUcQ==
X-Received: by 2002:a1c:4686:: with SMTP id t128mr3467097wma.156.1617706286497;
        Tue, 06 Apr 2021 03:51:26 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:9a5b:98e6:2174:bf29])
        by smtp.gmail.com with ESMTPSA id c18sm5044229wrp.33.2021.04.06.03.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:51:26 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	driverdev-devel@linuxdriverproject.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH] drivers: staging: rtl8712: align arguments with open parenthesis
Date: Tue,  6 Apr 2021 11:51:24 +0100
Message-Id: <20210406105124.78498-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up checks of "Alignment should match open parenthesis"
in file mlme_osdep.h

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/rtl8712/mlme_osdep.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_osdep.h b/drivers/staging/rtl8712/mlme_osdep.h
index 9eaf94f072ff..a02c782588dd 100644
--- a/drivers/staging/rtl8712/mlme_osdep.h
+++ b/drivers/staging/rtl8712/mlme_osdep.h
@@ -22,8 +22,8 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter);
 void r8712_os_indicate_connect(struct _adapter *adapter);
 void r8712_report_sec_ie(struct _adapter *adapter, u8 authmode, u8 *sec_ie);
 int r8712_recv_indicatepkts_in_order(struct _adapter *adapter,
-				struct recv_reorder_ctrl *precvreorder_ctrl,
-				int bforced);
+				     struct recv_reorder_ctrl *precvreorder_ctrl,
+				     int bforced);
 void r8712_indicate_wx_assoc_event(struct _adapter *padapter);
 void r8712_indicate_wx_disassoc_event(struct _adapter *padapter);
 
-- 
2.25.1

