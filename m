Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25893FC9
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c190-20020a1c9ac7000000b0030b459ea869so2410980wme.4
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=oSwabKuWSy4y7DFcShF6YMBpgJOZ8Mh/YPAUkSK5OrQDETRSoMs10VohCfH1m111lE
         Y9kecgdOKIpD0h2ypZRWKUS2CfxV/wAnePBoHcvHiOiPbzuGxtATSPtSlrQLE9jMYeaU
         XAiJi4Dh0N32B6rxMcRdS5wHFHJw+UIgauF2oVuMEpxXqwTqLsKKqv8o2cGw+HjJHDRr
         BAxBITUGKBLYA+nIxCjOO0NYtFfji6abxTiC2k+D1dMvlRJiOQOufvOX8C1RoYO02SQI
         gDAV00c6pjvQ3w12zoVzb2HUHrFeGj0JzfWVpwa0hoohgU60+qii3qGlb+N4DAnk/a1W
         i7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=kT/dKoKIc8sXO/f/68TTDCbfHiL3axQ68kJTg6ytFR97xR+tfNRQtQy8ISkbHik/iL
         bBWduL+nCwcbMt4ULYjni+HaBmcBJ8c4dnBk0dscUIXXP4Zyn+jFSYjLtlJWpYwpUHn3
         IdUE1OWokKEjpfKpe+KxzsDPmIJ6H0Wx1/lhDcM1YoQ5XRdQ74gzJPPqQirrEtN0PpMS
         WJOEYzFE7CKdfAreGEI3H193BdEgic6+lrGep8+4ChnIfZUyABC+Rw1DPV8MH2unNOTN
         tC7YVwYij2SGX6dc4u1Mcj7ZLszFibi3pk3k3kbx4fEByrgY5hVGN0vPPLXOfYrB79Y9
         cptw==
X-Gm-Message-State: AOAM530arDZP6Pad22r58Y/MUFPYl6WbC7yot2TXfs8xrjXLdSZDEgJC
	x26NJZssBMe5Tdc1OE61xak=
X-Google-Smtp-Source: ABdhPJxfnABk/yJnCwABRP7z/GDutthczw0QUfKNbYxwWLz3Kil9lM8MoEm8f4JE/R2Maj13wpIttA==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr12556805wmc.152.1631921466205;
        Fri, 17 Sep 2021 16:31:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/12] staging: r8188eu: remove _ic_type from macro _cat in odm_interface.h
Date: Sat, 18 Sep 2021 01:30:39 +0200
Message-Id: <20210917233048.31677-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
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

