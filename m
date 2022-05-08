Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332D1859
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 18:25:01 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id a191so10279843pge.2
        for <linux-staging@lists.linux.dev>; Sun, 08 May 2022 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yGEwWPgAOFv3suN6nm6KEA8gpXdmMPjJNcqn8/i8d/I=;
        b=kPql0bm+gk1+YgYsHlo0ZyE8Zgdc39j/z7vVCXNE1Tc03WigZf+xdr6/JxyUs8LZnl
         cyXck4msvnCHexQIY2TfLFFQatrqP93c0yPw1G0hA0V5ceiWM5JPA+NFfgFYqGuRgqJv
         d8g/ec1hvcSlwOyrvIU1E/EixJ6e5Re75QFrMvMPAVUFJGWd4lacPRrFbMNjuvvMcE3D
         DyeGOCWehMG4c4V3HEU5GxC1wFA0b5oaAeC1s8USOGHNnYwNeQXj2oWWpuJRmSAZVGIm
         ZJDdjMeRzmJDTpaYYgppFI7LRlTXfmcZILyc+vMekb2pkTCiKE7FpK3aqeQhp4Lwqurz
         iOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yGEwWPgAOFv3suN6nm6KEA8gpXdmMPjJNcqn8/i8d/I=;
        b=JQOjZDTq/vSt2ML6oQqmBQG1hvR0Ex12vPZvgrWfWBrlH1KiSmMYrhCYgmRVoW6Rkq
         j1Cgd6sNvQEV35De1nttY+kS6AQy4z4DDwFLZSN+kqiGFXJi9ooSEsMgcjmLGCMdN+Ei
         zC6+DXL3PN3kU5OknMpV+hSR0I4lV9FPmWw7Dx1UeBkYQ9TpdZHYtmBnxvLjL9klbJi1
         dAcnQKpGn/8rlV7OyXeypwfVtWkuseCyrxrs5yaSAG4laYlT5Cj9DzBuZXvbdgl91vTl
         V6pp/MhZaAczDlWUHZNTaasYx2HNV/Lpj7bUs57gEKGde6Zd+NuSFyRgyg29uyyDC2Gs
         y5wQ==
X-Gm-Message-State: AOAM530x8XCucFNWGVfc02SiDcMdOpcMucE4MTiAE8h7V12x2J/IQtyX
	ftmkCLdxyljkk3KhlPwMyok=
X-Google-Smtp-Source: ABdhPJy0QzY0A2OvBHcri4IUIulvRCPLb54YMI48MHcGTQq+D+FXNhkavnPv8OITmWwAvtHnierUpg==
X-Received: by 2002:a05:6a00:181d:b0:50d:d56c:73d3 with SMTP id y29-20020a056a00181d00b0050dd56c73d3mr12613659pfa.22.1652034301383;
        Sun, 08 May 2022 11:25:01 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:26d8:8642:a5dc:edc4])
        by smtp.gmail.com with ESMTPSA id b187-20020a62cfc4000000b0050dc76281eesm6889258pfg.200.2022.05.08.11.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 11:25:01 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: drop redundant if check
Date: Sun,  8 May 2022 23:54:01 +0530
Message-Id: <20220508182400.22433-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for ETH_P_IP is already performed in the outer if block
and inner if check is redundant. So drop the check.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index d086812f8..9a99aa5e8 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -448,14 +448,12 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
-			if (ETH_P_IP == pattrib->ether_type) {/*  IP header */
-				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-				    ((tmp[21] == 67) && (tmp[23] == 68))) {
-					/*  68 : UDP BOOTP client */
-					/*  67 : UDP BOOTP server */
-					/*  Use low rate to send DHCP packet. */
-					pattrib->dhcp_pkt = 1;
-				}
+			if (((tmp[21] == 68) && (tmp[23] == 67)) ||
+			    ((tmp[21] == 67) && (tmp[23] == 68))) {
+				/*  68 : UDP BOOTP client */
+				/*  67 : UDP BOOTP server */
+				/*  Use low rate to send DHCP packet. */
+				pattrib->dhcp_pkt = 1;
 			}
 		}
 	}
-- 
2.30.2

