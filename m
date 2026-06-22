Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5235F164
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110513; cv=none; b=HHhN04AXD5LQCtdZSq1SxSUXuB5r0lNLLiwggm4N/XhTPKObPQt0IxtjDLlWxp6jrtb9V92oeduhB9mAYZTiT+184VfuNMspwVu52OVx9+bcB16U89P2KNCTr0+ZfQXQ/KODMcNWN8YZwmABhUxARL8rA1Hw0sPGygIA+LslfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110513; c=relaxed/simple;
	bh=vQ6xhKYoAftcxf2KvH04/oLVDT42WFZqECxV7Zy2AUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tob+mFLpitbfPpLUvl60NH5mf1MJX9sYHtsfpgoaM22tPC+rJPm8T0b8Epy3qKqa++hHqNnFT4gaLq+3PgIJpTZAxkH5aYWXRhsAcYKldugOTlrWhpRygijv/pBzjkG7ZANlIP+e7R9d1Y4UJc101fS4fuSMtfCYbhBJhWB+QPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heRHSlVv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heRHSlVv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c68190ade4so35461195ad.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110511; x=1782715311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvnrQeko0bgK7dF5x6ZXImFfgAjfb9LH4Xo3II5/Qjk=;
        b=heRHSlVv01+NqJ8sJLw9RlMVemGUbZcruj8zp74hjPF70H4m4e//rPTJAYLZTp42jY
         vjkC+l1PZd5HXKDpvUdy+4JRSf2g/Wk9JnCsf7Eqm/ehCM12jnTVPLJyIAsGWTjp9foV
         RGaGnpD4szy4UTmWknsFAo+T4ZiZ7X1A4aKOKnqZexJfQd9c77+czZuKA+hrDSa9wBag
         xdvxxAdb48LB0BVZiNzZxYoXlVH8waQVKevOJx/1iGs/eeiEeUclBM1sBxUsgW90xJaA
         foLCm76rikUr7UCZ1Oo7JDgLyGkRmOOyfKkPkKkI5Yi6CA5M4A/WRP6P9ZiqBDv7VC56
         lLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110511; x=1782715311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvnrQeko0bgK7dF5x6ZXImFfgAjfb9LH4Xo3II5/Qjk=;
        b=TSQbb6R6T7etRCGuxdeeWpGlKn/uFSwxbD56w9B7iPZD9QfQkyYoXOyCeDZGAyRMHV
         9bYOu5nSXJfrctpzeHdiN9zn5rU9VasXCvjnWK1V56mTQgd5noVptYZsblG2W5btt77I
         Ci64k54Brq3iVoy0sE01/NV8VmLzPS+l2AzuVKMilV5F5dezfM04o6I+LMDj/6YlFXX8
         xVt52bnSLZNhBPZgu5ay627uVg4OOfTRH2OGT1OkJix2dbs7eNPYsfEBvoSMRWtCUsQy
         P11pemT0xblrDJ0WlpvRP2eZ5tM0u52OGy2rDu4PTjRkU1gqir4be4IL/pPiZq7F4TGL
         9FqA==
X-Gm-Message-State: AOJu0YxsZvt+0LTSmDbTt53xTCxTCLir4MBcKM38eBNDRyXOnj5Fi3VC
	M9L6d+wypYJ+m4r+FBwa8cGMOyqFc0br6tYIX2ZTHzXy8ueLXc8B+DzA
X-Gm-Gg: AfdE7ckE5NfsxbVu7zI1zHrw0QR4roX5Vfo1at+V3SKuDinnvHBUsUU0SKD1UoWtg1m
	S+wW/NHFg/drH5L8BInglYtKoJskELWlwYnvPjKl0lyg6w8Bq6Rndcqlk3iijhtMvx6+O1IJv01
	KQDdSwQNdSRKwPiwae59EIEdjPJd3ZhFBzIyWnqqvdF4gAropzrk/jfGGxBEnay/8gN4Y5O95Ub
	eTTT1sbVmUYYjJc34e5jg3QO/MxHx4RME6+1urefhbkCYdh6/xtY8ei5O5G7DHKZifQQyqRH2ML
	tHbnEJHd5oM3ir3KjmTjovLOw1S8lJBDknAsYB6RQiPd45iWnrmbkr/zYcT6kD2Z7SqNvCs4I6r
	xGH1wVRJNwCPDxys9GVmb/7EecwW5BVzy9826TgsrboHlcq/UvqKME/A42yquZH0zXjhRF1xAaL
	guwJEJNQcG1EE1NxDFfg0ljqk+TVG1QtpxpV9z7ChQ2u/l6H0OuJBtB3l1EUgO0vA=
X-Received: by 2002:a17:903:b47:b0:2c1:41f8:7ef5 with SMTP id d9443c01a7336-2c7195f54cfmr114122835ad.22.1782110511567;
        Sun, 21 Jun 2026 23:41:51 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c799749cb3sm21123865ad.72.2026.06.21.23.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:51 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in xmit_linux.c
Date: Mon, 22 Jun 2026 06:41:28 +0000
Message-Id: <20260622064129.10261-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
References: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' in rtw_remainder_len()
function definition and its declaration in xmit_osdep.h. This fixes
the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 5b351652e31b..ee6616880d41 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -32,7 +32,7 @@ void rtw_os_xmit_schedule(struct adapter *padapter);
 
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag);
 
-extern uint rtw_remainder_len(struct pkt_file *pfile);
+extern unsigned int rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index d5bb1c7932fc..960e82009699 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -7,7 +7,7 @@
 #include <drv_types.h>
 
 
-uint rtw_remainder_len(struct pkt_file *pfile)
+unsigned int rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
 }
-- 
2.34.1

