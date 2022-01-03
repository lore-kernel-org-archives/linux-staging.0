Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19897173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:54:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q14so132001806edi.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J729v2YTPLSMP7LVTWvLHEzUt9xmZs65s4uXAGemIX4=;
        b=HglwB6ouSl894iyJ6P+NA61EGF0kA17qpR8jFk4Brsg6fRq1SCN0FWKWtcgXv6NMU4
         VNjEDuQa9qP5vxbDDyeYpbfk8tSN8R1n9Y00hXJ2EvgX/eizoYbmsUfO+cLB+JRizMNO
         HM7OVjWKcG9HuyKhSB1pP8H84vPI0v9A1wPoI3Pb9800kRsX1WSZMUWd1hfFQPJ/VoyP
         sGKG+v+eDj9inLyD6L1Guo5JwNbJtNbti88yaqo7Uq06V6yEAfLET+vScx7pxj+7vULS
         LDJGc8e2vyS5695aO5uSAQ8dEpPcpqS8qnrvhKY6LzggtrK80lOjxtELIMTXYXciMqoB
         e/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J729v2YTPLSMP7LVTWvLHEzUt9xmZs65s4uXAGemIX4=;
        b=emuqxwLfgvdAuN08lvh6l/8y3aXiNtTMsfI1yOTsSbxtSeFq6XywQGq2Lj/jUM3QUd
         VZQyWjEikBFZclXf4OzeOva4WSLtth3hAkjwNzShsWRmM+nIvaU5f1oOGeoYgKXGYCys
         POCGeZZV0xUNDEmCM5hR1MKXo1BvlErQEsV2Qzbl4e4a7K3VqsQYWZs1ozJk0FFKZdNz
         X+Nm5pWPJz0DYrhyX+UoRunl1godr6T/ndIPDdZS9mLYlDz+Fp9oNZZ66n1jHA4A+t9y
         vHhVBQnCUHYdVHfC4ixEgObsRiImX7QGo3naD2fEyrAXx7/GwGAWl6NGWUChdtbVmB6u
         ZSvQ==
X-Gm-Message-State: AOAM531u1ZEJxinRqkhKlP/MVBUjQnET+G745WAt06Rlu9ijWJZ4UlR1
	SzXxW/5LZ3PzlfdflZh/TOE=
X-Google-Smtp-Source: ABdhPJw/2B1BSahBvseSt+FMdhyn53n9c0J3gBrXahp2xMWgky2PkzOpzvt1uElI1RzdXazFOAtTHQ==
X-Received: by 2002:a50:fb03:: with SMTP id d3mr44638458edq.123.1641239654528;
        Mon, 03 Jan 2022 11:54:14 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:54:14 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 52/56] staging: r8188eu: rename camelcase GetAid to get_aid
Date: Mon,  3 Jan 2022 20:02:27 +0100
Message-Id: <20220103190326.363960-53-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename camel case macro GetAid into get_aid

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 81dcb482ff22..32e0bcce65a0 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -832,7 +832,7 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 		u8 wmmps_ac = 0;
 		struct sta_info *psta = NULL;
 
-		aid = GetAid(pframe);
+		aid = get_aid(pframe);
 		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 
 		if (!psta || psta->aid != aid)
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 63f1b0a974f4..061d1aa18eed 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -248,7 +248,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_a_msdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
 
-#define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
+#define get_aid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
 
-- 
2.25.1

