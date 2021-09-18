Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A853FCE
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:08 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i23so19197436wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=qSnMsioDq4Lb2uTMVPD//5zjflkgCOqUx8Hg4quPioYvLpBylNQkHpfVHhnOmplxV4
         CNTAQZpoycE8mZLZr6ZZlQwA6pwv4fXwc7dj3j91rItWTJ3B9CD1UotBcUzL2I/hln0p
         v1sIOwRrQEeyp3RI7Gtg+JqEtajmHANW43AzPeAJ0YTJDi/GrWtQuMnqJ6yC0n/T8sBq
         qUMH6mxWbn/HviiCOR47InU/6ekjLDJjD5DTPQ20Olt8SGnntM+x3tI5YHmiIreZVST9
         c8H6A5uZOvPM1mFgm5brOA1p9rqzPgkRFH2vwYzedGuxrCBBol5p/Pc89v+6LTdvIIaE
         DTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=O3EL4j5XUaknnrfUCYJ9zYnJINM/AK1U5DxK7fMZtKgeTsV1tSUFsVI+hnIvYHZtog
         YcYXjA5pGBiesZgETTZAW+DiED6KSxr/yiJJ/sxq/UX9BT74wQtYIzoJqoKQG2p7THSZ
         3dZXc7niEMOFuG2BIn5wz6DewY+2TgNM9jK8phPLcp1wx7BNOCsnJsdj9tImpl3H499p
         9l+TGmbXfy6K2G3iqLZOyC05s1JB9sCsoj6cXjXHmqkJ5iCJBindPIhcRGcPftBxQ8YF
         4FlTnpOYHkmscsEhQDZbGM1XSnL85Re20K7Piv9BgqdUTjJ/SQaLhQkxWDW0Ca8Nl/Lu
         XL0g==
X-Gm-Message-State: AOAM533DtBIcPVX2GooEns0PszhfzA3D4IpL7Ex05rnL5tYJHa610/CW
	PbX/x6auSSJjozvBKbOR7m8=
X-Google-Smtp-Source: ABdhPJwWhp9wEkEI6v8ORTthLI0ZVRN/xx9CJOvsSiO+hLPnfE7il60MOKvyl+iJBuFoo/7DfIckzQ==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr16773864wro.401.1631957106925;
        Sat, 18 Sep 2021 02:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 03/12] staging: r8188eu: remove _ic_type from macro _cat in odm_interface.h
Date: Sat, 18 Sep 2021 11:24:34 +0200
Message-Id: <20210918092443.8724-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

((_ic_type) & ODM_IC_11N_SERIES) is always true since SupportICType
is ODM_RTL8188E in this driver. Remove it from the _cat macro.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index d3e46b2a4cea..4f35dcd0bf49 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -5,18 +5,12 @@
 #define __ODM_INTERFACE_H__
 
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
-#define _reg_11AC(_name)		ODM_REG_##_name##_11AC
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
-#define _bit_11AC(_name)		ODM_BIT_##_name##_11AC
 
-#define _cat(_name, _ic_type, _func)					\
-	(								\
-		((_ic_type) & ODM_IC_11N_SERIES) ? _func##_11N(_name) :	\
-		_func##_11AC(_name)					\
-	)
+#define _cat(_name, _func)	(_func##_11N(_name))
 
-#define ODM_REG(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _reg)
-#define ODM_BIT(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _bit)
+#define ODM_REG(_name, _pDM_Odm) _cat(_name, _reg)
+#define ODM_BIT(_name, _pDM_Odm) _cat(_name, _bit)
 
 enum odm_h2c_cmd {
 	ODM_H2C_RSSI_REPORT = 0,
-- 
2.33.0

