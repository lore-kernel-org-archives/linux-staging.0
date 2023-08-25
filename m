Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09265107AA
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:31 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68bee12e842so748522b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972391; x=1693577191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FGGGv73VeY42LvPjIqtiS9blPOkXId6Nd8Sz/hLLOI=;
        b=TSvgwQv8y2plVGg5I306gSi3HWoOuVr08FkLnvvCUq5+u5vC3HY+v91i9Rl2QKdmAN
         imRStohI9RCO36oYx+s1dTs/+d48deUr/zFyQ1JNt95xjjl1b/VF7iQH+pfnmOGpBILH
         Y7qdZcNT69wbd2/gd7+c94PG+SMgVBRRJmTYWbHCPCcoM7zI7H1VucOEpEkrO2g3PPy+
         ZQJs24z812snoD1c7NIZ3R5wCL4vjSwSokR/P7YHwlDZwIYSObHZTvBHTUzA7Ykd2SOg
         U5bLXSrSKrfsUzZgv4ll0yw7A3a6XTFFNINAfQJKBshSbZjleyfl0brDn3G1J8VsuEAP
         eJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972391; x=1693577191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FGGGv73VeY42LvPjIqtiS9blPOkXId6Nd8Sz/hLLOI=;
        b=MSoImvMsTv37jjX3bTZZREYk4Gxe4aIdE6vJr9X/eY5l1KrZh9px9Ah+6MV+L71acd
         LP/NChx2pq4X7OtQFizzhgWU/IpuOnE3IvCyKGksyw+4nD66FJPWrRy1Ssk36VZQ4Qr9
         o4imcA3t2F09id0NS2R+M46YtfLOFAeB9DRTTjAf3UlBdz77IXhPIAE2g4WKFeER/lwF
         2heq2GYuImG2LTJFIie9AhXCFZTNfuqr4VfO7SVcEXc3WMIQlcTi9lOGXqHv1/gOerK4
         7/FlrjwdTcQVOA4GNOsOFULLThhe8QKqTI8JGwqvm8FBDxC0xVU4V8WLD5YT0h5qrCuA
         tfug==
X-Gm-Message-State: AOJu0Yz5xB6C1nKOM5xTLtlfp8OTMPZxv9cyUn5kz5oAGIofvjz3Y5Q1
	anQimbZGLEYhf0x/MLo7bjQAKMTtZhkc6sMICeBIGtCh
X-Google-Smtp-Source: AGHT+IEwyB9RpdgBZjRX6l2F02nupL7sUgtm5kSiukh2FirApgxjoXhvdm+ae1v+Zvcd/Ezh90SS9Q==
X-Received: by 2002:a05:6a00:cc2:b0:68b:a137:3739 with SMTP id b2-20020a056a000cc200b0068ba1373739mr9927201pfv.4.1692972391319;
        Fri, 25 Aug 2023 07:06:31 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:30 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 15/16] Staging: rtl8192e: Rename variable pRxTS in function rtllib_rx_check_duplicate()
Date: Fri, 25 Aug 2023 07:08:46 -0700
Message-ID: <20230825140847.501113-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pRxTS in function rtllib_rx_check_duplicate() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index e97debe6a7d2..491789ebcc08 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -922,15 +922,15 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 				return -1;
 		}
 	} else {
-		struct rx_ts_record *pRxTS = NULL;
+		struct rx_ts_record *ts = NULL;
 
-		if (GetTs(ieee, (struct ts_common_info **)&pRxTS, hdr->addr2,
+		if (GetTs(ieee, (struct ts_common_info **)&ts, hdr->addr2,
 			(u8)Frame_QoSTID((u8 *)(skb->data)), RX_DIR, true)) {
-			if ((fc & (1 << 11)) && (frag == pRxTS->rx_last_frag_num) &&
-			    (WLAN_GET_SEQ_SEQ(sc) == pRxTS->rx_last_seq_num))
+			if ((fc & (1 << 11)) && (frag == ts->rx_last_frag_num) &&
+			    (WLAN_GET_SEQ_SEQ(sc) == ts->rx_last_seq_num))
 				return -1;
-			pRxTS->rx_last_frag_num = frag;
-			pRxTS->rx_last_seq_num = WLAN_GET_SEQ_SEQ(sc);
+			ts->rx_last_frag_num = frag;
+			ts->rx_last_seq_num = WLAN_GET_SEQ_SEQ(sc);
 		} else {
 			netdev_warn(ieee->dev, "%s(): No TS! Skip the check!\n",
 				    __func__);
-- 
2.41.0

