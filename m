Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8BD3FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:30:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 7so7429310pfl.10
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 21:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThXq/38kzog6YWsBoPcGtQqrTsog3IJpMTo1ZeSwCSQ=;
        b=kOHbNHP81KjALs3KHPR4QZtz/g+Z6/ozhPpsMWu2ss+Vj6xuQ79CW3ytwfryPkrLe4
         X/P+gYyB3tLOfL8Aa6X4EvtgD7Dfwgl0VvhCbJq89bpapbFFsPt392DzBMU9VrgDGDzC
         N/DN1G3h8cGeCRM1FZY3lAfG+Nc7LKmNs2/Rt/pb7d5HFFnfMN7WVPMMTdIsfhZYnM3X
         TR27mALAevEkq4tcFaC0xjGLtXShnYTGV82Pq7GeVEJvOnnIyqaMjhphoPEibZKThv8V
         POAjMEauU+4l5nUL3+BW1HiFHEkRk/3YjsXIC5I60sjmzc/kcbrjZPEXGrkGyV1rYQEZ
         d/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThXq/38kzog6YWsBoPcGtQqrTsog3IJpMTo1ZeSwCSQ=;
        b=BAJnyBWEqKnalXPzJM0QX2QIYIH/bfCe05GHEjU2AP7t+vSNuICAbD+nnMnRuy1GBt
         UEzp18yREVf8PHSRDsroLf1t4ogR8uv4epkZClTAogVIJYJntKRQXL+bRCkX0wfskL0E
         7mRWqoH2stovL7BCNiVsCEiJdf/g3/YFtROl/3BzygHtsijTQOZoLGV4Jmrvx9GYtBQJ
         fQ3AEvVi6dNQ3EnonyT4ECwX2uNO3hwFqziFlnHDGl7YOBstFcl/F7k7YyZl3TnjbdT2
         sOayD1pf4OWCrqM8o2hc523qJH7zLO9yD7ze2PNeTxSmyb0eLV6hs9LHgHtJOzqw0IMs
         FSSw==
X-Gm-Message-State: AOAM530v4Ysp1wC30iBP3d3azzWPc1C13WvbRCuRedQiugX8bPMNmDgU
	1OVijbZV8RiVsVS8I63EUns=
X-Google-Smtp-Source: ABdhPJzQ0qQ2Gs96Y2NARCplv357ZroJmAly06xqBxiLFM/5uBiJ/f1Ku2hHM7V3JSWGemA1djBczA==
X-Received: by 2002:a63:2242:: with SMTP id t2mr10476568pgm.111.1630124999426;
        Fri, 27 Aug 2021 21:29:59 -0700 (PDT)
Received: from xps.yggdrasil ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id 6sm7992463pjz.8.2021.08.27.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 21:29:59 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: fix invalid assignment warning
Date: Sat, 28 Aug 2021 09:59:49 +0530
Message-Id: <20210828042949.2276341-1-aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

p80211_hdr->frame_control is u16, change to __le16
to satisfy sparse warning:

wlan-ng/prism2sta.c:253:43: warning: invalid assignment: |=
wlan-ng/prism2sta.c:253:43:    left side has type unsigned short
wlan-ng/prism2sta.c:253:43:    right side has type restricted __le16

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/wlan-ng/p80211hdr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/p80211hdr.h b/drivers/staging/wlan-ng/p80211hdr.h
index dd1fb99bf340..5871a55e4a61 100644
--- a/drivers/staging/wlan-ng/p80211hdr.h
+++ b/drivers/staging/wlan-ng/p80211hdr.h
@@ -149,7 +149,7 @@
 /* Generic 802.11 Header types */
 
 struct p80211_hdr {
-	u16	frame_control;
+	__le16	frame_control;
 	u16	duration_id;
 	u8	address1[ETH_ALEN];
 	u8	address2[ETH_ALEN];

base-commit: f6bc526accf861728d36b12fbc25ac94cd057fc9
-- 
2.32.0

