Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E02C88
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 10:44:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r10so37627148wra.12
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eeHYn5tnLdQcq9Fqd1snlk2LyN3sqtAimn27J8fXZ8M=;
        b=XiCmyyBwIJtD3mlwUT43KN5+igYcBd/QlQGUGFuq3qxu+BTIWdb/rz2s67HfR5PM6U
         U6gCYfYLrVRyzltlNviNS3ICiPr1ILdmVpu3Dk/sn2GX1hgDjHt/m646CxmSjpFH5KiS
         KweCz9JqycPCqBV+oyX9EGEIQhQZvvTAF/pBqjWHck5ZQD+sa4Dc05idVMlI5xSocvXL
         7q/bCc/t4ShBybX/OBXNyOCRFhcskLEM0dFXZzUIPGkFF/KgD4XmnsnPN5MKlVLJ3zC9
         eimDUu8y7QhaO2B+TUc4ObNdoUjkHtlkLOH30+rwEEtQntKqvaQuJV3pdcnSJ3hj9Hvl
         Q06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eeHYn5tnLdQcq9Fqd1snlk2LyN3sqtAimn27J8fXZ8M=;
        b=gAg16U/6pz1II/VBI+URFRjH6zMaPcLVl1lYrzfpvn1vS1PZ86Z+ZUolzKENMUVf9/
         v6AYlz4/iU04hD9ERrNDGm2fkXt3ioo//tXgzNgu26WGZql4xQQKW6mpWmsKAYNqQCKS
         3Yzirg/cbgF+QzQnBdePOr0bzgubtcVfDuGjHqdBW+/0Z9rB251Ri9sKwy2c5ibnnh9q
         jIAB+cmAcGc96rBnELbjCsHS6ImvQqUhLMGqF6Ok5TVywsbJjmyiCr7eUOSnhrCoacBu
         6ZAIq1MwHc64gH2UmFx+3qwkUG3UwKWQs5H2v81Rrco9/kINLmrmKHdgNWxmNOZsasKN
         gzXw==
X-Gm-Message-State: AOAM531za5s8sVnZanNgKE+ezuLDCwWFOkwYJ+VBrq54s0zOUMxlP0PF
	yVLInPYSsV4WsOEVH03bbIE=
X-Google-Smtp-Source: ABdhPJyplmLbI1TAqIyFfApqUyRfzKNin1jP5mjIvDfYR3OpTc6Mc43GoEBtjDSLf4SnFDW/pls33Q==
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr10636990wrz.363.1633776275191;
        Sat, 09 Oct 2021 03:44:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id a81sm1905431wmd.30.2021.10.09.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 03:44:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: remove enum _RTL8712_RF_MIMO_CONFIG_
Date: Sat,  9 Oct 2021 12:44:19 +0200
Message-Id: <20211009104419.8811-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009104419.8811-1-straube.linux@gmail.com>
References: <20211009104419.8811-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enum _RTL8712_RF_MIMO_CONFIG_ is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_rf.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index fadb141c6945..7ec252fec054 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -69,17 +69,6 @@ enum	_REG_PREAMBLE_MODE {
 	PREAMBLE_SHORT	= 3,
 };
 
-enum _RTL8712_RF_MIMO_CONFIG_ {
-	RTL8712_RFCONFIG_1T = 0x10,
-	RTL8712_RFCONFIG_2T = 0x20,
-	RTL8712_RFCONFIG_1R = 0x01,
-	RTL8712_RFCONFIG_2R = 0x02,
-	RTL8712_RFCONFIG_1T1R = 0x11,
-	RTL8712_RFCONFIG_1T2R = 0x12,
-	RTL8712_RFCONFIG_TURBO = 0x92,
-	RTL8712_RFCONFIG_2T2R = 0x22
-};
-
 enum rf90_radio_path {
 	RF90_PATH_A = 0,		/* Radio Path A */
 	RF90_PATH_B = 1,		/* Radio Path B */
-- 
2.33.0

