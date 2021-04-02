Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2229DE
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v11so5287691wro.7
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1hZ4ZRFQMHL8+YaTqMG5bqkb2Pg0WQaVjpilg0+murs=;
        b=XokOpTqpA3OBVWwkdHxF4seB66ouB7G3LO3JSH6TTLCffW3riOUdvGCh12kFvX5IUE
         IxOPQn0CTDrn5KMzQra46ELg5vKABKq+SuK5LVyqbBAz3UeoIHv+gV9YmB76IOiHLrNh
         a8ERkMErwgbHSsSoTMl93My4Y9ZChSt2Ef81Hkj4iydtL0YzrhxPOayvo1NUONS1S12c
         ZTaCsEkD/xK8TLBUpH4h2TQTK8Gh3bUlX7wltYrwI2ZgvV1LIKD1cvG1QXZypTBu/EiO
         7XiyWIx/AcpiWLeQ+g4LOs8dX0F0IcXZRWafocNnE+dh1qfkjaBOa7rBLR3zwm7wuSpj
         cFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1hZ4ZRFQMHL8+YaTqMG5bqkb2Pg0WQaVjpilg0+murs=;
        b=Pvznse8Z4qLRGdhGV13zBROAT6eKGUQSWoSaSnvnX9RrfbSxDBJ7/kZSdQEl+NPSqS
         WR1qZpV9Y4utuIPvnah9mDofHd7DmyCx+0R7SUfYBwKa3z5FwwBEKu6OJNdflUhM2luT
         Ma5txrzaNg2wwMpWowBEBIE0NZTCKOExLpzwIgTSC1L5xbXQgWhh1/zZs55JJ94VWXGT
         H3/YDtAxLO5Pkx9TWIqWc1JWgv1sDuu+LqTNH2ZEQ/oO1hOQPNws/CbqHgYg/3P6dXjG
         3m+kgMtjJTepbR+6sJNQD6fa+kuiZ/Rqvm1Wi/rVNe5IyQv2HcFdS1XzjMpDuRKL1piy
         l8AA==
X-Gm-Message-State: AOAM530YDihCrqdJp3OeMq0HlqX58tI865FVJXuDKTyWVAtRFQ/sh0yW
	rU8pp45kEqa6jr3BdX8Ngzk=
X-Google-Smtp-Source: ABdhPJza3bgM3yq0XvC2GHYRZxCVdzkGPP8KGf21n8OKsIwLNKBB23BlCWhJncEv0GkNNCs4IeWWlw==
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr16553939wrh.50.1617384623799;
        Fri, 02 Apr 2021 10:30:23 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id z15sm15595837wrw.50.2021.04.02.10.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 04/30] staging: rtl8723bs: fix line exceed warning
Date: Fri,  2 Apr 2021 19:29:46 +0200
Message-Id: <20dec1b32f2e36a98f0e3ca7c88a3d042fc20186.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook check:

WARNING: line length of 149 exceeds 100 columns
61: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] || crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 689419a76d94..663a8ea199ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -726,7 +726,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4])
+			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] ||
+			    crc[1] != payload[length-3] || crc[0] != payload[length-4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.20.1

