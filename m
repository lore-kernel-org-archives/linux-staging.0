Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835370
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 12:29:06 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id w14-20020a17090aea0eb029016e9e0e7983so1930640pjy.4
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVyb5GJd1/eOOTzVnEFYfGEHURKljx+p9YMnSFodCUw=;
        b=OXW0VIQrWkWFSxR1BBI+69VwFZ3jzmEoUd4MBJ2+0cGcsznqOhekZfbDPVKUcO8pm5
         F3wMyfCHDQkY62k3vmHGDB23xeo0epPsaUwPs6FkhZq/r/6ELe5R5uTonKVjXFoWeBsH
         Oq+p9q1dRGv+TMXTX4yV6o5uzDHPTKsK8OdPDqGHZYr9V9u7wXL7kSN3tuiWxI9bFwgY
         nQPuYp+ylGg0Da/J7u0xDKlg3dsHKLFBWDJGycbVA/RTQ1/aWcrari3dv7ifFnzsRkKB
         Gtlyn7aK4tWSTkF6uMAlYhesBtnHuxKyYVBynuLOn0bPLU95R4hwPLnCrWzLZzC+Z/3n
         cSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVyb5GJd1/eOOTzVnEFYfGEHURKljx+p9YMnSFodCUw=;
        b=ibx+7Sco9+qF2Al5gqyQSDvEMe7Cg7Vi81ImpcYy/jFZmDmJBdJSlZv+D3OmjItVjB
         NQxtBZXCX7DaXXyXSJZfowr3KinQ3qby3j212PW4DxUmGW2PWmWjXWPETOrTnsD7riP2
         tkYHBBZXEILpC+7lElXnSBab/IAa8vljwu/ZFR9a84Ryp4AxU4a0VWfGPLWy54mKa/MJ
         /QC/UILXdKwsjWMcnAXSDb8+cJqmXZ2kQR6BMnMM44Ow/V3jOQ/+Ve17md5X4hZs+0E8
         eQCrxgctubdKgFBdLyiF4TuCoj93Bd1bEgFUagwGLc71saOApHcln8XnlzeBXQ2wrizG
         ndyA==
X-Gm-Message-State: AOAM5339yfBhZ/w4uQB2W3YFXBw5rvvsIT0g4kbpxWdHMRmZRdPGgd/w
	EVk2tj9kiSj9a7gGF6VOrCM=
X-Google-Smtp-Source: ABdhPJwZ8craB1C/0/Er1m4RiA5TSl2CczVZdHmrN6wig7NEtvx/QMk5Cg2c+52kVvpUdVHhiXd82g==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr12431881plq.42.1623587345706;
        Sun, 13 Jun 2021 05:29:05 -0700 (PDT)
Received: from jm.lan (1-171-209-173.dynamic-ip.hinet.net. [1.171.209.173])
        by smtp.gmail.com with ESMTPSA id l12sm555022pff.105.2021.06.13.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 05:29:05 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>
Subject: [PATCH v2] rtw_security: fix cast to restricted __le32
Date: Sun, 13 Jun 2021 20:28:58 +0800
Message-Id: <20210613122858.1433252-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the sparse warning of fix cast to restricted __le32.

Last month, there was a change for replacing private CRC-32 routines with
in-kernel ones.
In that patch, we replaced getcrc32 with crc32_le in calling le32_to_cpu.
le32_to_cpu accepts __le32 type as arg, but crc32_le returns unsigned int.
That how it introduced the sparse warning.

This patch uses __force to fix the warning.

Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..2f4da67e31c6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+		*((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload, length - 4));
 
 	}
 }
@@ -618,7 +618,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			arc4_setkey(ctx, rc4key, 16);
 			arc4_crypt(ctx, payload, payload, length);
 
-			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+			*((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload,
+						length - 4));
 
 			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
 			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
-- 
2.25.1

