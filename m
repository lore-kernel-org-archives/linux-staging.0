Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E842F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:23 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i24so23349158edy.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=raecQFUEAjTAcD0ybJYZtycHV2pUBEPVmwqvZ4TDTGTI2HzieOua8IkaWpPW7K9901
         SKqqnFiaKpPH7OCk5K27cXNqSgU93EE4B8rjA4yWnN4V3qC1cqAX0i35uHe8dMx+YvJ3
         OedHYWYSASS5NIY+2iCowFCYrQullQJktDi3h3+ldZ7uCXv/s37VZrnHHyXHhwsSyusa
         +O4sIFUj4AH4f+iK3VX40Ua15RC2xQfUPwx+rMitLBaFGAbgXcAKumU5f8RtTYDcHKEz
         f0TzuoTZjd+1NMHAo60AtD6rEn/l4VU9EotWt7CBtfDjc6pb9g/8dsluNk/ZFUUlAMvG
         OGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=IEHCeSXhMGhaNqc6iWRHNVpDpZYgkHe/rwE4mUjMWyjK+O0Jnxc4t4s1dA8d8ttBPg
         lAd+fNKcoHXyIrwBzC4j6FjINrbMvoW3h5OCiXW9rk0KZLxnFPGNSD6wlZY9MP6u+WyU
         kEHXToC/efoqB3XUfHXweDC9X4eSriOwd1JXo/ZPxwIb3iUDKlsnyp5HmKSnQBDvhTyU
         I3rzpJ7xubbXoILt6O8EtQHkzb8LRvDYBOFhy+oEd46GXBJ9TOnu0N6hRCuDGqLXN3Z7
         ZXcg0wyZMDnm3Cv5xM0tS/YFBmeH5yoQOkpZwQxXHpijPsZbT66OgWzbGeVV0tCsxlDc
         PsUA==
X-Gm-Message-State: AOAM533LcKbqgxqc+9kDlAl0yuON/B5XyK1B7sBezHdWGEtcrIzSmNZw
	gQ9ZHDUpq+MU8nwQLQDOu4XvihbLwFg=
X-Google-Smtp-Source: ABdhPJyEZ6kdOPP7/wc0uNUsUa61ZyHPQf35fwMkOK2mg5JbBIL1985WeE5Ry6E1yW7ohkDUxEwT9Q==
X-Received: by 2002:a05:6402:b88:: with SMTP id cf8mr6366156edb.227.1619793862648;
        Fri, 30 Apr 2021 07:44:22 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id c12sm1599342edx.54.2021.04.30.07.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/43] staging: rtl8723bs: remove undefined function prototypes
Date: Fri, 30 Apr 2021 16:43:35 +0200
Message-Id: <8a76e3dfd1fe754fa76b9bea91b2c7b672e45bca.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove undefined function prototypes.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_PathDiv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h b/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
index 7a5bc00c3682..de69d5ea6ffd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
+++ b/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
@@ -8,14 +8,4 @@
 #ifndef	__ODMPATHDIV_H__
 #define    __ODMPATHDIV_H__
 
-void
-odm_PathDiversityInit(
-	void *pDM_VOID
-	);
-
-void
-odm_PathDiversity(
-	void *pDM_VOID
-	);
-
  #endif		 /* ifndef  __ODMPATHDIV_H__ */
-- 
2.20.1

