Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764071
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id p6so44010581wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vzf/YgZItTJD9AAwq9y0zSWQfAI0RmMuyvnRYVtH28M=;
        b=Kv0kx7TrJDYFbEfxrZvVoDP7M9Yoq6sl07zJBgQGydB/bzLS5ybeBpoAX78Cm/am2z
         wezDpdNIw7A0gzXSgkCrYlBlMTZTdZISMf691sloHM20DbH0zYUKx+ZAMAaSkjOfl82J
         ZTDMMEVkrkEJXC3RDMGZZJ/RJSOIEM2vuwLZPXOmTOpjnml7RzWMsE8jnwodVPfT5ojm
         hICyu7yOkXUHetukMb/CV/ILlduQEzRrY3xOGRJTA6pR/yV7OV/+6AVNYJRoTPpKwn8l
         U+y37h7q77QUeRqkSin8UCy3VK9wRsiRH8V0K942BV9JTVwPdRtmvBorT89lIiDrTht1
         HlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vzf/YgZItTJD9AAwq9y0zSWQfAI0RmMuyvnRYVtH28M=;
        b=NPU1cKvyVvcozmcoEoAZTL9FKkOa2yEfEjfDXrguXYLbV/BJLveeanmZeRjDNp+o7W
         pdKgcUhHDTcLR6P1hOaESJXkDxE6e2/fa9/EWmLllVTs0Stb2lCQzjxHadngXitl+o2s
         Bnrov6n61JLUQfP9biViFju132Vl7Jd8jTkKXZ424gU/PbyCfkim2tr5tF0MqRVNgcNd
         A/ZRXtOnlobRaRztaT2Vkgh+I48IR2cj0K2FWMYRNtpoEfu+7LS7/6qQbZLRfgNkZFCo
         OPIB9xctjF1jD4MhM8eELjehHCZiA7As+UUDCSlUM9H1Czxjp3NedpcJFQGbQieJ/d22
         SLqg==
X-Gm-Message-State: AOAM530xhkQAlRW8/H3tLY5DA6w8M4VHtPv6jnpTkqzJzxoSxKQ+CDdP
	ae+zUZHniVmWQSD1MIy8hlw=
X-Google-Smtp-Source: ABdhPJxxRiOITxJaaBUB+rPLgyC6LY7iRlStyaxGUTdUDw8ahdZcKn5eKi88ECorGWrsQ942SIwEcA==
X-Received: by 2002:adf:e647:: with SMTP id b7mr9603757wrn.43.1619254975546;
        Sat, 24 Apr 2021 02:02:55 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id u2sm12678741wmc.22.2021.04.24.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/50] staging: rtl8723bs: remove unneeded header file include
Date: Sat, 24 Apr 2021 11:01:55 +0200
Message-Id: <b58b5edf820026f08cb7289c1461561ecc95d41f.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unneeded header file include.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 579724e8fc2f..acf4deacd3a7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#include <linux/trace_seq.h>
-
 #define _drv_always_		1
 #define _drv_emerg_			2
 #define _drv_alert_			3
-- 
2.20.1

