Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927F6F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c8so3915279wrq.11
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dBEZ37uTqJC4bFtCgm5p0RrZ07rT1fRVGwqQr281YQA=;
        b=Yw88wyIxQtThWPX5pRg5EH1q6Qf9wYy1/nZz9QGu+cbfq4XZ9rI8CMs5/As7QHQUOV
         xTwlvp4rhgoyFBgRq2KMS9rLEhJiumlbHgrPYA0JI1YsPZYEQATy9rB0lZIPHI1biLpm
         ZUNnHtdKcpavvS4xO2x9Pw7JTz4+9cI+HLBftTVVIPrIpCwMobiR8wLXAH01JrJY+F8E
         vn2G843qjDRZqZ0R3uFBAT5LwvGNni6h+29eiihxw4E/8NmTdet8crikN2iLc4kALyL2
         Aa3gY2o5khkxUUIK8jmvE4LzQ/M3XIRLBhZr7qYekp/xS7s7vHIjhIBS9AAXEubxmAn4
         skgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dBEZ37uTqJC4bFtCgm5p0RrZ07rT1fRVGwqQr281YQA=;
        b=EEKAJpPjQnpcc6GR656/g093w6hEIKxbxkyow6og4Gax2ncOgSSSabdU641wq4nPv5
         VWvtLbNUfLWz5wlJKqHsIF1tkO1xqhbE104cBIIA+GKCRRuY7FJ4zpEY624PwIBuqeJv
         n9nMq1RR1OpQSGkZptmph21axlqvQaeWG/dJJaf1hgRZyxmj1VHlA6GK3+SX/w93cmz5
         zesTHwDBHKwim9fUTnuX4QEQ3S5UPW0HcbQRujxnbvqSikbS4L8a86UWBvGLA4qkKNcG
         mpItd59Rh/bjdGGN5OzPhiv4W+XsxjDlYqpAwtcgcnuzk9OkWEshmXGTjIw6UFM5dgt/
         IUow==
X-Gm-Message-State: AOAM530YazE5flfXL6ej+UcRS/+KgJD7NmNupwOnQFFjb2neMGOWreFL
	5MbnwfCqKmFGBRHFIxBHS50=
X-Google-Smtp-Source: ABdhPJx8A18H25mnFGqt4TmObaw3NH5tDqflekn60hbJvcB9jVrrBTs9lIz7AkLrg90NXfi94prQdQ==
X-Received: by 2002:a05:600c:1992:: with SMTP id t18mr15952463wmq.125.1616420242346;
        Mon, 22 Mar 2021 06:37:22 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:22 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 14/19] Staging: rtl8723bs: remove useless structs in wifi.h
Date: Mon, 22 Mar 2021 14:37:12 +0100
Message-Id: <20210322133717.17797-15-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/wifi.h:

	struct rtw_ieee80211_bar

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index f9815411321c..efef549bf811 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -435,21 +435,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 
 #define ACT_CAT_VENDOR				0x7F/* 127 */
 
-/**
- * struct rtw_ieee80211_bar - HT Block Ack Request
- *
- * This structure refers to "HT BlockAckReq" as
- * described in 802.11n draft section 7.2.1.7.1
- */
-struct rtw_ieee80211_bar {
-	__le16 frame_control;
-	__le16 duration;
-	unsigned char ra[6];
-	unsigned char ta[6];
-	__le16 control;
-	__le16 start_seq_num;
-} __attribute__((packed));
-
 /**
  * struct rtw_ieee80211_ht_cap - HT additional information
  *
-- 
2.30.2

