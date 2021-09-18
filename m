Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855EF3FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:23 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z94so42819030ede.8
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=JVoCDYXUpxi8Wk9N8fMcengxzsM7RqrOLIbcq6m5uRRtvep4IIuWCRdKFrlvqFUrgM
         k/cYaBZNdQWLQjXE8g8NBmB3+uJoEtOwzOOoK3Vqr6ClctT1pd+eM4gdqnVjzDotvVb0
         REB9uvKwUQe9otONVvAl8Zp3HH6lfskrq74tagKJk0mDUohv1UiHjPAzYxykw7S3yi03
         aV2PVUeMIw4wyyzF5YbRU9PaUWsJkvLBv7tv2Wj8QoHoS8oBPdpPycW+hVyGZGfo+PRT
         ygjpH5pjG+HwGE5DFSNbYVnfj0VmZG5++t53aovW+JGEdDRRp+rx7xsoRfgjdClIUWZ3
         aKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o62fR3XicmTQpyeoxj/xI/V7ktA8LxV/7f30/vkQiH0=;
        b=xwMeEqtqSatYDpzwlZRfNUmOILbmRmSBnZz1AiUxBd3ymQwo1tieX/4WYc9aw5mtJ+
         5atE8gX4V4ndLfErbV+TIkUHC29bxyHvdg82iA4Os84oasn7yra6tFxUNDWvcqvz43eg
         raZni/3nKrr4c05OnODXJK9pcVyLpZXTYEMWMvj+1URe52wJEQ8FFfCEURvbvetq4kIQ
         lMKGCLxlU0TWdnD1o8sIVNUp4aZiriwd0iy44trWID5iQvPgfg4u4v5+Idc5cd7VpsZM
         3CyG8ErLDi9jzpYHbqQNcva+hMidzMeny57m2lKRqTCYWICyzj0kouiSpvUL1bH1TZi8
         I1yA==
X-Gm-Message-State: AOAM531VDUxRCSGkUdJWo0MkrZNsL+ZNvldujGgbUHeOOykksIr9oKD3
	902ATDiNQrgszHcf9kVVXIE=
X-Google-Smtp-Source: ABdhPJx1DWbNYZ5V38PpYw/r2mci5+FBKv0zEKxHUnmnrFMjFsCSMELyFBN63elrVHBa/0t7dsAeNQ==
X-Received: by 2002:a17:906:49d0:: with SMTP id w16mr18937729ejv.455.1631989161953;
        Sat, 18 Sep 2021 11:19:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 03/14] staging: r8188eu: remove _ic_type from macro _cat in odm_interface.h
Date: Sat, 18 Sep 2021 20:18:53 +0200
Message-Id: <20210918181904.12000-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
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

