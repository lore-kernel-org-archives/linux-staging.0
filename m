Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98029DE
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so4607586wmd.4
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YIXmba9GZGAqIQhah5BMvewcGrBpfMrXUBmt8lWw17w=;
        b=A3rCmKO2FJGVEjrpXsrA4PoCCEKBWX6ejliH2nlT6tG7kE8aC9+Q8AXE56fOBWZ5+E
         JYzPkhoo4dt2IrUREcd6K2AlfBMh7J2Z3AMaUUxMCxPXsCaqKEYe2UIAb+aiSp/hxgYs
         NwyVIKGgkzAdKPbb0R0VH1KOGxoBm3SU/wO416iDmU9sOLk8h+TM/S6+CxV3e0u1VJaf
         QZXQX7J9ytaQQp0Ugh0+mc3DTiBcO9kPiaXcZybKu4ZfPFa3M/IEu+pzzqcWwyjeyaUb
         3evbORs1VlQXE/oVYVbpk+czlTe71NKuaqVj34EuLnJg4aRX8PMoHojHEij/g9X05igC
         dZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YIXmba9GZGAqIQhah5BMvewcGrBpfMrXUBmt8lWw17w=;
        b=Rt5EkV/NX+LaCxcKRCj3o681od5Bso7rKI8o9iSI7+Qjco0dOSgeWTB6jXgFb0+et4
         B+9/CoMQP+W/MFk97ML709U9fSDyV5NgWYkkYxzIBhmvPzrS3AdEtVuXgjtqcelI/XSq
         OA3+gSKqxO5ZPYdgmzr/jaDIGLwKRLRty+NAuqngNMnk6WIBKqS+MlxuVpXtTC7XMTZa
         62pYemphwim+Ero6onTf7GeGQWnSPXXYBSE3tSSAOGpFsY/a1JsLTkVA4i2lIRMCUFqs
         Sx/W38oMB5qVJRYKaHnTaODoz+Au9Eex9DDLumQ8GHePi6v3v0qjEYzv8sveR+Yvyztg
         74hQ==
X-Gm-Message-State: AOAM531Jsmgm71m3sqz28FQouKlk1NQIYshjOrSxpgeW5M0Y9L+c+jpA
	P5yDLqetkcIEM5uOgK2AUIs=
X-Google-Smtp-Source: ABdhPJyKilVZloozLFMF40OIjSQJd3QTektX2EeRE3GvoyNan2Dx6v70abmJYGed/QnqZE8HN3VC7g==
X-Received: by 2002:a05:600c:2e43:: with SMTP id q3mr4104128wmf.68.1617384625287;
        Fri, 02 Apr 2021 10:30:25 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id p10sm15635935wrw.33.2021.04.02.10.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 05/30] staging: rtl8723bs: fix spaces around operator issues
Date: Fri,  2 Apr 2021 19:29:47 +0200
Message-Id: <501f33cd47ffaf9f7b41dd01776516f333e5de0a.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post commit hook check issues:

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

