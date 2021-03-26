Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7B70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x16so4889433wrn.4
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jmSO/BQjCtFc+8Wa4RmTfHsYvqFzvyXvihga913X5Ts=;
        b=A8vPDJMwLCdYkMzcOBzZxeA/iRkfPQ2ddmgMD/rsQCD5Bg2nV7uzeTrBiAYe/vQFJ1
         tgnPuzq1rXhJ7zRIxUTXOHVkWwUB4KmYEYMMRJe274Am1W6S9jRd0STYvLqed4vyOYVl
         OP18vEVVhjah0uzpwD/G03LZubZAvcovVSORsBnjsSUqs1tlffLrh6POVN5ueGNDu39w
         wNmPZ+uSRaUPsAO9ZhTCscSfauvbcB9iBMlCAzb6ib6rJiuLF2htys9wQm4svhiwcEjX
         SKmANLLTEom3TyP7G1C/P8/nt9bNidvq/Rae6/AO3k+wlhElwP9OAlFExgh4hYGrxoBL
         d1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmSO/BQjCtFc+8Wa4RmTfHsYvqFzvyXvihga913X5Ts=;
        b=EmcqXJRZdNKXT2TNKBc/XUpJRkKoL7AytvtjjHBQibyny8+bHUZil12nSDkQIrSFr/
         1TrZRLYBRluf+Jbpa4FEgYloVUL/yyFvk8GXKEk9Mub3AIOLiojMbbRQcXv0RjBULNuh
         QBRDtpvsGP82cE28EAtNuBqa1UUe2ZBYtaZ8dqKnVuka9ht2kVt2EFn7zFm/FU1YmWQJ
         G5eV9M2bIYkJr4KVVtl9p1Moxn7r1MwVh3aQnDGOtRURT8KlWG4y5g+/BGw9/c9YVs09
         0ton/kLAq6CAZyIIKCF/cmlJ0WRMGRnZne6EyzukyOtwClSIm+oQmYS+YCkZEh6q2hVj
         YsQQ==
X-Gm-Message-State: AOAM533q5eyd9vb3RFzPwif9fp9y+xGAdeAW3pPm+90DjhQk/ah5PeEW
	SzAbIpnIfVm6QluQzphs+7E=
X-Google-Smtp-Source: ABdhPJwo1tHNtq1ZBWqxd+4pwlbMe8/jVZF26EUNkDqIO2+Ytv2vc6jQXTJuAEJi0zBFa/h+3BAQjg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr13422471wrt.203.1616749790732;
        Fri, 26 Mar 2021 02:09:50 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id j123sm9761878wmb.1.2021.03.26.02.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 06/15] staging: rtl8723bs: put parentheses on macros with complex values in include/hal_com.h
Date: Fri, 26 Mar 2021 10:09:13 +0100
Message-Id: <afb537f2865a76db0c071eaed3d0fff41f730711.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
187: FILE: drivers/staging/rtl8723bs/include/hal_com.h:187:
+#define PageNum_128(_Len)
		(u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0))
--
ERROR: Macros with complex values should be enclosed in parentheses
188: FILE: drivers/staging/rtl8723bs/include/hal_com.h:188:
+#define PageNum_256(_Len)
		(u32)(((_Len)>>8) + ((_Len)&0xFF ? 1:0))
--
ERROR: Macros with complex values should be enclosed in parentheses
189: FILE: drivers/staging/rtl8723bs/include/hal_com.h:189:
+#define PageNum_512(_Len)
		(u32)(((_Len)>>9) + ((_Len)&0x1FF ? 1:0))
--
ERROR: Macros with complex values should be enclosed in parentheses
190: FILE: drivers/staging/rtl8723bs/include/hal_com.h:190:
+#define PageNum(_Len, _Size)
		(u32)(((_Len)/(_Size)) + ((_Len)&((_Size) - 1) ? 1:0))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 28451385dec3..0bc0e1361765 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -184,10 +184,10 @@ enum firmware_source {
 #define TX_SELE_NQ			BIT(2)		/*  Normal Queue */
 #define TX_SELE_EQ			BIT(3)		/*  Extern Queue */
 
-#define PageNum_128(_Len)		(u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0))
-#define PageNum_256(_Len)		(u32)(((_Len)>>8) + ((_Len)&0xFF ? 1:0))
-#define PageNum_512(_Len)		(u32)(((_Len)>>9) + ((_Len)&0x1FF ? 1:0))
-#define PageNum(_Len, _Size)		(u32)(((_Len)/(_Size)) + ((_Len)&((_Size) - 1) ? 1:0))
+#define PageNum_128(_Len)		((u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0)))
+#define PageNum_256(_Len)		((u32)(((_Len)>>8) + ((_Len)&0xFF ? 1:0)))
+#define PageNum_512(_Len)		((u32)(((_Len)>>9) + ((_Len)&0x1FF ? 1:0)))
+#define PageNum(_Len, _Size)		((u32)(((_Len)/(_Size)) + ((_Len)&((_Size) - 1) ? 1:0)))
 
 
 u8 rtw_hal_data_init(struct adapter *padapter);
-- 
2.20.1

