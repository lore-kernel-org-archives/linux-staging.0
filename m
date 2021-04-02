Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA886D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so2675226wmj.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ySfXnIkKD8gvPDA0SbkHqU7mZfNhHmlaXFfQGBVJ8E=;
        b=QK0Slj3XAn445fWELayZRlHLvJqu5hVgK1SAhWwG/VNzS0ZL+TegJS9g2EZp4iH6Go
         BWVpluj4Qf85amBhTOaYId4JqKqkR66wO+z/8C30U31wdseFp8y7HAEPwZ78NzIM6lWd
         S9xFUS9CuAR5rpkFNYtOtJCThUGn9yyqzJDK6cvbCDP9Bl5nXFqXOExKYbtK/jyQCsXH
         oHjfLTKxHuEjwkz7yQMHHKxXbH6kL2McXac/EU302Zjm61ILW3oeN6KWdkZ4L7uwHpVz
         h8yX43CIRRzaG/zWR/24L1p6l4P2APrZBsRelDiCWbSOWWHrOxMpxC3/HK1Q6YIMWKqf
         PyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ySfXnIkKD8gvPDA0SbkHqU7mZfNhHmlaXFfQGBVJ8E=;
        b=ufQGT0evsbdtDJ+YEtZFYEdi4I01tU1bQNGJ5Po8ROkLoOOD4RkMcsreaxDtoKS2xc
         AhOMx9VWIEt68SjzEBHRW4Iza9a3M/Ei9e4I2zD4Fk4I+KVqKmkth46MM8XiuTl7LLen
         oq6v2dn4kE/q0iwOT+6zCLVniHA3bhzY0UpzhZvly5MskX1HGtc+Zlpo5ohoNLWKruPy
         F+37776JOLUYCAhBxlooEj6Pl0P8OOjEvWlRYAYRIi40+wMzrcqddd8/l3oI6iLrL59X
         J7FFcsLIfG4qqvFz14Ccp1rwHsixCuFGyV7t6afWpSKChjps6bDylWs7TeMkOUPOymwt
         3xBg==
X-Gm-Message-State: AOAM533c1CzEM6wVian4n8HK+Ch0z1VksS5qlwoNz5j5wR8Gp55s/3jf
	FFq3bgGzrrTRHZoP4835iH/3uXSLX+U3kw==
X-Google-Smtp-Source: ABdhPJz8DYYs4ecjV8Qt8/lxolNA5DoEmsOolEMORDuzAUxIkvO93E0LOXHuxPJ9J7MBdgZFtzYNVA==
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr13455631wmi.167.1617384649861;
        Fri, 02 Apr 2021 10:30:49 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id u2sm17002674wmm.5.2021.04.02.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 20/30] staging: rtl8723bs: added spaces around operator
Date: Fri,  2 Apr 2021 19:30:02 +0200
Message-Id: <c472f6ab91c06b5b2a7b65e54ca0a5640ccd7676.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook issue:

CHECK: spaces preferred around that '+' (ctx:VxV)
60: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:359:
+				if (miccode[i] != *(pframemic+i))
 				                             ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 2d749341d47b..953351f896c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -356,7 +356,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			bmic_err = false;
 
 			for (i = 0; i < 8; i++) {
-				if (miccode[i] != *(pframemic+i))
+				if (miccode[i] != *(pframemic + i))
 					bmic_err = true;
 			}
 
-- 
2.20.1

