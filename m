Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75771
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 13:19:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t18so16617361wry.1
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3j46dkNfpVyHXhEKxl5rI2FMjVZa1cAXULGLqC+Kpo=;
        b=bFTFNdPfvc9aGzbn6rnAzcveg/LTqRbIHFhriG9LoQ516Y5lOk2v0gqTeHvI7ECoVK
         NAa5C/A8LYkG/hDXPKoK8NfVincvDxGrVXieQULMa5Qqi5G5HiEzGgdzcxWSZtR0mYEp
         dlgtxYTn7+SfuNxaluwFS6g7YomZVD4Qvl1uVTzqa9IoS15bLZS/iDYXpChQP3Hnbsjk
         Q79j4hngLst8CSG/6VUgRKEbK1PFJh9KsWIHLHoSlU+Ixs9ErcVy84xPcdvV4uoXv7x4
         ifrAdiUeJTVVl7aAs//hCjKH2bVkx93nb5MN7O/ChbBud5hx+CA8r50sVWyj3pcZzyYD
         MSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3j46dkNfpVyHXhEKxl5rI2FMjVZa1cAXULGLqC+Kpo=;
        b=CalNO1nZ9YEWq/m4MHH/j7rAFE8dC/JJ7sjH/V2uSbocuQebocLgcijWAb/Vkdp8Xm
         6RqNjG7F8PlR2/xIclbVewmgDhJLmHIZPMCNHn5Ct77+CLEXpgCwRJ7BQyCot2Hxt9pd
         BP9GH6hduPtpOjUZnbkEjIbbVBhpzLcoghGIcC7BKnklR4l7w9Vb4cPPiEM04BqYTU66
         MF4JzptugQLU7/dOZT/bzoTTqvGfeEXOmvPkAIW3+Na+Rvbj38slLWCNHU+IF+NoZM9w
         hkpYRy1wMZWDksZztnDC9uFBVPd2dQ0AQAsmsBMRWVIjHKk6ZKQ1ZxFeZNcsB11f1/8X
         GV3Q==
X-Gm-Message-State: AOAM532x79xfDhfxq1HfWjZGMgZuVGSRTFt+IVIhsRjCGWASWYmXBl2N
	e2F2zMoVdzJHMASpc59JSxk=
X-Google-Smtp-Source: ABdhPJytFRrADQ4Il0+7UdW5CITzX7+le5CnVpbqQKsQYSgs7Hro1gib+feGHL8mDDOeMj3s9oHH+Q==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr30052832wrc.208.1620652779345;
        Mon, 10 May 2021 06:19:39 -0700 (PDT)
Received: from agape ([5.171.73.3])
        by smtp.gmail.com with ESMTPSA id h15sm1751427wmq.4.2021.05.10.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:19:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unneeded comments to silence 'line too long' warning
Date: Mon, 10 May 2021 15:19:33 +0200
Message-Id: <bb479715e3603ab78863576783dbbf49c5f6f703.1620652505.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620652505.git.fabioaiuto83@gmail.com>
References: <cover.1620652505.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unneeded comments to fix the following post commit hook
checkpatch warnings:

WARNING: line length of 110 exceeds 100 columns
115: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:510:
+					*((__le32 *)crc)
 = ~crc32_le(~0, payload, length);/* modified by Amy*/

WARNING: line length of 110 exceeds 100 columns
124: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:518:
+					*((__le32 *)crc)
 = ~crc32_le(~0, payload, length);/* modified by Amy*/

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index bee1b2e2504e..5ff8926c1865 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -507,7 +507,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);/* modified by Amy*/
+					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
 
 					arc4_setkey(&mycontext, rc4key, 16);
 					arc4_crypt(&mycontext, payload, payload, length);
@@ -515,7 +515,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				} else {
 					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);/* modified by Amy*/
+					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+
 					arc4_setkey(&mycontext, rc4key, 16);
 					arc4_crypt(&mycontext, payload, payload, length);
 					arc4_crypt(&mycontext, payload + length, crc, 4);
-- 
2.20.1

