Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9F72
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 11:33:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ja3so18228472ejc.9
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 04:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNqCBvfTc2uOfgSlghFo3TISsBCbOPttLe3KTxfSIXw=;
        b=vF1mxLZjy9Jdw9QxXGSMl5pJ59QItWKtIhNN7DTHEZz0NwgJbMkZ1hVqyuARSfAoA2
         MK0Fz1QfyyLfPXPgZntgSbuEm4cq9dsZSwNePMYTgoGG9FYagCoLkYqLZzORcDvyOl9g
         siTjRJ6pD+YaxBkB8SmVlxVkmXoIt9kmRPS4zogc+OGxxvJkRpH8bvr2kK96m12yEHNX
         yinPbhcA69W7UTCYm+w+d2+4n6JbjIM6qmAKyxC1ophpA6Jz5rmo/H7Jx47SM07h/o3t
         8SSpVNS8FLC0SF1T/F6Irj3ugmu2EgRgV0/13Atc5Cx0YMuoVuiRRYgFuvoBLvppjawP
         1vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNqCBvfTc2uOfgSlghFo3TISsBCbOPttLe3KTxfSIXw=;
        b=OiaqVGlTb5ImcHg8n45vnJHn/lSuCrmvp8v71Q7K0W9S3f1wZTnEiZpWHCezyXq8Gn
         QflNMhuVf9YBqAYPzn8xT0MwWpaJKkHDVoUv2Y8/9lwTsOBtnhovq0V2Z8B3Q7uGZi5v
         oqgfuWBQ+gFog/WolvdN7qIV3jcKLVTxCev8OS894qHsPZ8w/dBcdWnDQ5Mx8taDIncV
         xbQFWVovja4JnbcMXhyUb4xVnleBCFKS6e7Uyho25ldXFhPyq5zxZUA5EPGbRioXAqBX
         YNZViFjAdsMUImD7dphGTnqHGJ02GAaqZ0qvXuwa9KTfmT30hMaNWWJZDvGgXmuy05vl
         UalQ==
X-Gm-Message-State: AOAM530OO1+AKcAAQojfAXrODYE5u90kHByiEy/TB/ALvJUtT79Nlh4Y
	IL6euUqe/V26xztN4gYb1YCT9DcrvLolqqFi
X-Google-Smtp-Source: ABdhPJxWIlZEw1Kc5Yc+Sk9gMs3YKyTgcqwrxxTnuUIKG8A8G0kjUKWJWakc1C0D0IhZl8OwkQYr6Q==
X-Received: by 2002:a17:906:4d02:: with SMTP id r2mr16801792eju.464.1619609636163;
        Wed, 28 Apr 2021 04:33:56 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id u19sm4677187edy.23.2021.04.28.04.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 04:33:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 2/2] staging: rtl8723bs: core: Removed set but unused variable.
Date: Wed, 28 Apr 2021 13:33:46 +0200
Message-Id: <20210428113346.28305-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428113346.28305-1-fmdefrancesco@gmail.com>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variable. Issue detected by gcc.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a2fdd5ea5fc4..b0d2ba5ed129 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1019,7 +1019,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	reassoc, *p, *pos, *wpa_ie;
+	unsigned char 	*p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char 	supportRate[16];
@@ -1040,10 +1040,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	frame_type = GetFrameSubType(pframe);
 	if (frame_type == WIFI_ASSOCREQ) {
-		reassoc = 0;
 		ie_offset = _ASOCREQ_IE_OFFSET_;
 	} else { /*  WIFI_REASSOCREQ */
-		reassoc = 1;
 		ie_offset = _REASOCREQ_IE_OFFSET_;
 	}
 
-- 
2.31.1

