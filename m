Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FDA168
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso9729112wmk.4
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6D1iaBgXOAkMH79XbQmEXP2lg5qLQCLAwgOT3lAeyto=;
        b=Z+y2pUBKzPmhUx+ckpypbI7V5e5qxPTwHOYjxD99edIv+rPd2dXxEvmtHSJGMZ6G/X
         nSfHblY4jOYTIUhbsK+pouhBUiMO7G5sxumbypOUjZxAHrsBqeSpAnh5yLbxQ/+o5gVh
         rr4kRVPRZZR64WtaloTArMCV6bBifOaWMVpnD29i+19N+JG4w32Vf7fHsrAuZHJyk5M/
         VTgRMZgRcxkSCUI389XSyHc8Nze9rBWQv6gLj9Mxxm7KugawAb1YRVjzrxvb3voZOOn1
         Z3gk8aKRPkxhcURuRdUuVqQztmm6PSe25CMNJ8JiImplDAYLn6K8JR9uT8kgMyjXEUcO
         aYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6D1iaBgXOAkMH79XbQmEXP2lg5qLQCLAwgOT3lAeyto=;
        b=wBk4OmzZeBKDZYVXTSjyLLskkkiMSu46xaEBmSBAqUkm3h1Af5UQIGi+0ZlCcSdPnO
         dT9DGEGoz99i3i+qqLE/o5lcBgPhO3nhmqcRGBn0f6h9K24lllw3SKIiPwC9qehYsH5m
         Dl7oNd9/MpeWZMxjv7IDD0CVvyR1x6R9rGbEfVGu1mginvxxtp/AzD62k9P0qSegMTaE
         qtFDOynpy+H6T5y7+v+psu5EosBzSYGchEsmmAREPNUnCb1oJbQm2kULJhH/0gTJf95V
         370qGh8VU4oTHNk9ZqUbWlyY1MA0tGvaBBGlUvTettg+t6qWaZqkAPyQUZai0r6bgf/c
         GpxA==
X-Gm-Message-State: AOAM531apz700JBeqDVWbTbhEbGDBscaxkUlwXE1l/ikE/MUiCnk0kWZ
	5tIWhWcHwm+ZRtFNs4yDqPY=
X-Google-Smtp-Source: ABdhPJzxesYcWBNYIQx1hTR8/D8SgTEdUPmhHkxl+9WW5KlPDjSYyODTHyPXOlF4GqYNXU5GYZjUnQ==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr16413328wmh.26.1640686305295;
        Tue, 28 Dec 2021 02:11:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/10] staging: r8188eu: remove unused enum odm_h2c_cmd
Date: Tue, 28 Dec 2021 11:11:13 +0100
Message-Id: <20211228101120.9120-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228101120.9120-1-straube.linux@gmail.com>
References: <20211228101120.9120-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enum odm_h2c_cmd is not used in this driver. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 64c29c1da19d..e27ba77577a7 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,13 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-enum odm_h2c_cmd {
-	ODM_H2C_RSSI_REPORT = 0,
-	ODM_H2C_PSD_RESULT= 1,
-	ODM_H2C_PathDiv = 2,
-	ODM_MAX_H2CCMD
-};
-
 /*  2012/02/17 MH For non-MP compile pass only. Linux does not support workitem. */
 /*  Suggest HW team to use thread instead of workitem. Windows also support the feature. */
 typedef void (*RT_WORKITEM_CALL_BACK)(void *pContext);
-- 
2.34.1

