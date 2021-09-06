Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F353FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i6so10638117edu.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=GjF6j6jCtZTYM12tx7IF57xxlapmGqyoLvi+cZTb1VazJLy+dooW97sROFnDP3l7+/
         VqP58+KDD6jCA4qVrqyJk0Czupuwc4ubVWuf8IojYEfNTGZ4A6iij05gnlNscsQ3sS2J
         wnKvz/egYPjQPN1xB1OYIBUAzLxbzjB4bpnxHkjbvKDLFhYQeLqJugHHl5H/GwxsAnif
         G+46sZbE3RzRauABajkJlvHiPoMqx/GMw2kbpj527ZB7Y8JW0z+nehKHieHWRwR7JuMc
         fEFjvaEjibZL3bYLeU3sO+C3X8eGT7FzO5ipQIyp07HKh8mW/tjS1vlOPVjq+KAN2gb6
         eDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=rs3R9+blTt7HJGBM3kppYvfvmQYbYc/WNbGyWjQZ9Sn4ojj4Wzn7aGyRtr+vpGRfpK
         t9zRUeIYCC8OviJt1GV2rslWH71WQhfbpvMOYJfdew13Xv2odWMbd2oug5LYXw25zGXe
         uv82jYUuFE/HEWgYGO681BZA9OWtO3VvMfWaNuovviFSed78c+HrwDZLLghJ01wMBwz7
         3xiz7SYmGsb6C8khB7puzD3vJkShxMHaxk4+7CPvDEknpfBaE2rw4+7CXYtiv5JADIEH
         yWEgDhVHdmKO2/ugQnR0Q4U6KJ00CHQ6F7wMiWrFWmRjekRTyEovpERZePsk9cuLwc0/
         DQ4w==
X-Gm-Message-State: AOAM532ANpwqGa6KcXyvnpih1PSrufXvm3ryF7tVKAisfnSv5ry9L/qg
	NBbYkiI6H8LaOjvoH4kSml2dkP2pAWMLJA==
X-Google-Smtp-Source: ABdhPJwBzkVwOfaKSVXdHJPNID87PTdG+y+2A6JOXZjP2AnxhQzZQpbcMXz2AX2O7To6i/bUm2k3IA==
X-Received: by 2002:a05:6402:2210:: with SMTP id cq16mr14621310edb.348.1630954462549;
        Mon, 06 Sep 2021 11:54:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 27/40] staging: r8188eu: remove empty comments
Date: Mon,  6 Sep 2021 20:53:14 +0200
Message-Id: <20210906185327.10326-28-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty comments.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index bae9a32ec27e..9196a7925940 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -25,10 +25,9 @@ u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 /*------------------------Define local variable------------------------------*/
 
-/*  */
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
-/*  */
+
 static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
 					   u16 Offset,
 					   u8 *Value)
@@ -364,14 +363,14 @@ u8 rtw_efuse_access(struct adapter *padapter, u8 write, u16 start_addr, u16 cnts
 
 	return res;
 }
-/*  */
+
 u16 efuse_GetMaxSize(struct adapter *padapter)
 {
 	u16 max_size;
 	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, (void *)&max_size, false);
 	return max_size;
 }
-/*  */
+
 u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 {
 	rtl8188e_EfusePowerSwitch(padapter, false, true);
@@ -380,7 +379,7 @@ u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
@@ -416,7 +415,7 @@ u8 rtw_BT_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
@@ -508,7 +507,6 @@ u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 	return ret;
 }
 
-/*  */
 u8 rtw_BT_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
-- 
2.33.0

