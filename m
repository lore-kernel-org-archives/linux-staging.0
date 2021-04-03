Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD76D0A
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v4so6512544wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SpB21ddvVB478zlEeuyOklnuQn3Gxt8QZHrAoTlf3oo=;
        b=SDZMm2e7we+84iEltYZk+/XqH4Pt+LlmynNJp2mNpgG6tRUkvABK5Mop/VJNg7cAQ6
         qm9yZ8A1bppobP6Z8hmGW/t+8i4o+dY/Hk6GYaLfy4tRAt6fTolhgaYmIJNmyHKJ2TKR
         d5TFCD9xmZrzqHlyX/9XaEYJO5eTni59hbaGR1i2vqwqnPoRMC3baGqNgrlrLV4Rf03j
         efwbz+Uvr+kcICCt5N5MtQOxEFEYpEXi9mnGE/DwrJHA6MV64FjnWfdwt366fy7V39Vw
         SvX325R1muMDi2vMZtmXNmObbCWI/FrGc68MVx/64D1FH6fG1bm6D4TrAP+joWqZ8GDi
         Vssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpB21ddvVB478zlEeuyOklnuQn3Gxt8QZHrAoTlf3oo=;
        b=JxC1G8Z8eLLCFrH7rCa/s+UZKvuRANd6/7xAsVzJ8ixcAuIn7WkE6cAr8HK1//nAUx
         3iJPc0tHwurI4Sv22a3Ok3c/2hAMNoCIOt1GyV3kqmQzcXPWQq/GuRLLPbkte1EOrjbl
         Ua0drek7VQpeFPlsA/kaPxC9mQs7pG7TVvqwLydVUciuAOFg9ed8W/L+qaLmBzGVP3lk
         ioS5tuGL1kJIbEestZg5cSiknef3AC1GNujKRuuCYoLYrvqgwMdUZTkwKwuCQGWDh9iH
         QcZgqcBz+FxJMF6uw8rYYWiz4FQUOHZJww1MzUbyEoeJlr7Sbk4VQrWCVG0rxYMHa+to
         tlFg==
X-Gm-Message-State: AOAM530OwBXcl5cDYI1rdxIEAXYHdCO8lNH1AWnjsUf/aCooMHNgNZt9
	O0icSeGsSidBu0La8lHNvtY=
X-Google-Smtp-Source: ABdhPJzqhjoJPGKIcRLcI2E+3hcSOOWJu7mF9CvazfsuiV7G60S9oBGPZsSLRBkJ8QDa7lIEyAdrwA==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr1347532wro.305.1617441262186;
        Sat, 03 Apr 2021 02:14:22 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id c16sm21684102wrs.81.2021.04.03.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:21 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 05/30] staging: rtl8723bs: fix spaces around operator issues in core/rtw_security.c
Date: Sat,  3 Apr 2021 11:13:27 +0200
Message-Id: <9143a02ae6959d4deae6c22bdba42041bf6484a2.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post commit hook checkpatch issues:

CHECK: spaces preferred around that '-' (ctx:VxV)
25: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] ||
 			                            ^

CHECK: spaces preferred around that '-' (ctx:VxV)
25: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] ||
                                ^

CHECK: spaces preferred around that '-' (ctx:VxV)
26: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:730:
+			    crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])
 			                            ^

CHECK: spaces preferred around that '-' (ctx:VxV)
26: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:730:
+			    crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])
				^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 663a8ea199ee..6c74c0444abc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -726,8 +726,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] ||
-			    crc[1] != payload[length-3] || crc[0] != payload[length-4])
+			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
+			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.20.1

