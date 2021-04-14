Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1F6D38
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id w23so17006979ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xo+FKasd3gyu4aP2gmz/WdWr4BgS5HtGq4NGSXvNMVw=;
        b=M3eRDjsaWUxrp72xFWXSAcoZRztWJY1Sq2nrcqq+joRbBQwXyF5a8JRuPpnMFVsvyr
         YGhH3JpHdqx1bnzM5Pgrgz2NbxogVSFAcB/T/hNkaJL3mlVycskNHHxoTK/WTKq0JXce
         tAZODtydWNyT4uzl1rFdZdhCEJKMdKW1ciBVjGa3Z/617fAFlpWeU60W6H7UBifraXSr
         MG1UBUsXxhgaOSOmkodojpQgGztcmnAJ+0EFHsFfbV4ZPXyICUEMNrV1vkk2QqrXGMsl
         lRUonzKICUsYBP8ktJ+wxsjvNN+YJFg98E275EpBgBfvi8U32fmY5XnfizLSPi5OrbFX
         vREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xo+FKasd3gyu4aP2gmz/WdWr4BgS5HtGq4NGSXvNMVw=;
        b=jABbiZ3FE0ytNQtAzJ4Sqax/eeCHvh8hCBhOJmWYdsB7+3OAh0rK9gDuCOvOHIy5KO
         TURSrAsYuZbdKzQzcVzE9OJC+e+Sh0ewseGRNOI5I5dWhQlA9G7ZmhA5nZLfEpzQoOdt
         sGOiK5A+Q+CGe4+J7BeTJ1TSRyzvq1xy5mTEv2TE/5CG1PvvbEWkbIB6otTRoL5VocAD
         BO/J6vvRTvdVt8kGUaorCRl/qaF+OT7uy63l3LVQ7KOrykQPhUmmA2P5QOdyYb2mmRIt
         MEsx/LfnQkaXnCJKoDLBF8x33/JRF0wLuxyXCnlXFICycjX0HmgOE8MdXXxVkU5IUFwe
         VXjA==
X-Gm-Message-State: AOAM5300S3hn3wEqN06JFZZEkHjlY1a4xysQoy7oxSp8FI7MqSia/e16
	210z/GuPfhUsU/U+l2nqlGS3/Q==
X-Google-Smtp-Source: ABdhPJxjp9uvX4PC1R+SJpRYCTUUvvrn/t7fdrGvk/9TLxQ4RVKGvITHC0+F52asO0jZ9mASZpXDIg==
X-Received: by 2002:a17:907:2d94:: with SMTP id gt20mr149467ejc.552.1618423909349;
        Wed, 14 Apr 2021 11:11:49 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/57] staging: rtl8188eu: core: rtw_security: Fix some formatting and misdocumentation
Date: Wed, 14 Apr 2021 19:10:46 +0100
Message-Id: <20210414181129.1628598-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 from drivers/staging/rtl8188eu/core/rtw_security.c:10:
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'p1k' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'tk' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'ta' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'rc4key' not described in 'phase2'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'tk' not described in 'phase2'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'p1k' not described in 'phase2'
 drivers/staging/rtl8723bs/core/rtw_security.c:1937: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/core/rtw_security.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index 617f89842c812..4d0a23bf3f660 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -465,8 +465,9 @@ static const unsigned short Sbox1[2][256] = {  /* Sbox for hash (can be in ROM)
 
 /**
  * phase1() - generate P1K, given TA, TK, IV32
- * @tk[]: temporal key [128 bits]
- * @ta[]: transmitter's MAC address [ 48 bits]
+ * @p1k: placeholder for the returned phase 1 key
+ * @tk: temporal key [128 bits]
+ * @ta: transmitter's MAC address [ 48 bits]
  * @iv32: upper 32 bits of IV [ 32 bits]
  *
  * This function only needs to be called every 2**16 packets,
@@ -498,8 +499,9 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 
 /**
  * phase2() - generate RC4KEY, given TK, P1K, IV16
- * @tk[]: Temporal key [128 bits]
- * @p1k[]: Phase 1 output key [ 80 bits]
+ * @rc4key: Placeholder for the returned key
+ * @tk: Temporal key [128 bits]
+ * @p1k: Phase 1 output key [ 80 bits]
  * @iv16: low 16 bits of IV counter [ 16 bits]
  *
  * The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
-- 
2.27.0

