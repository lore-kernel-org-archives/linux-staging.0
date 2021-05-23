Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43A70
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:30:48 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id k14so34617695eji.2
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBAmfS6PKS/xwLOxXt8MXYcwgBRtrB9cCwZG5JJuWuo=;
        b=pWKJ9jkReUcYGTkJhChBR6VDg/WbBKvuRX/z16/j3OJzUT7QV5da2irclljTNnHfDW
         7IyAhF3jXRAjQNGMGl7jkAzJGvP+Drc8a8zbykIZbFW1H3I43ZyRQ+WS+fva0TJjXZNC
         EXA+2BFugDTNncvJ4VHblEUAE84aHmPrNrZQm0gtvgHDD+8YJCLwkYCTYQeIQldl8jtH
         ks2gLvl7su9vNzsStzatoMujP3UDPWmVOhPWMjG+g/yEdCr+E4y5qxJpNj97r4UzZgls
         7HztFKB8278bVttcRIUlFJj0979wnQRCaTDFKzHSeHVMkPaXj4/uSzu5xyJnj6FQLwab
         3W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBAmfS6PKS/xwLOxXt8MXYcwgBRtrB9cCwZG5JJuWuo=;
        b=TUm40azUfAAg2YXz4xxGv+kcRFrdEDRdjtJGMCqOIzquCJzsYVncFxrS0j6jwOPdzd
         XnUkDC52yjD2Z1fm2oC5I1umWFxCo6iFD+dF+VDmPDbDfL1q47+Sr2L8UypLws+3b5AT
         OrEMmp0eos9nbT10JpjjR0xLWvOpWqLxLEKtkiEOOe1XtxMT/xXgkjnTmFV/b5R8yxZe
         M9z4/f7Sbe9xPRCeCBens2txjyBWx84qFJPGTRG/V3C1ObEWNbHy8eyz89bduH3EZ9JG
         5Yqp3O5KyG78VUoLWNW01hN1Pze+hve4bmISp+MjmSbm/uFsrjnSBGp9sTt1S21NrAne
         W/+w==
X-Gm-Message-State: AOAM532vlYVHvgBQBLXnN2G2yVfR3PZd0LGKOZ0/pSn9O0qJtrqDyq4B
	s6rS4CFF0UktHM0bG6gZfAI=
X-Google-Smtp-Source: ABdhPJxBrSNb6YX4HaUN4IcxLUpB7KHrFjGRlT8UFmsdkaqU1Em4UJgCBLaohzlC3b8wvowoGKnfVA==
X-Received: by 2002:a17:906:3949:: with SMTP id g9mr19782007eje.7.1621791046757;
        Sun, 23 May 2021 10:30:46 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id d25sm6807650ejd.59.2021.05.23.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:30:46 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: core: rtw_mlme_ext.c: Remove set but unused variable
Date: Sun, 23 May 2021 19:30:42 +0200
Message-Id: <20210523173042.19785-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused 'reason_code' variable. Issue detected by GCC
running with the warning option -Wunused-but-set-variable. Removed its
use as a storage of the return value of get_unaligned_le16(), which has
been left as is because it has side effects on the argument it takes.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9fc612fb736f..a13b3ec42bc9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1721,7 +1721,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1791,8 +1791,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 				psta->htpriv.candidate_tid_bitmap &=
 					~BIT((frame_body[3] >> 4) & 0xf);
 
-				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
-				reason_code = get_unaligned_le16(&frame_body[4]);
+				get_unaligned_le16(&frame_body[4]);
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 
-- 
2.31.1

