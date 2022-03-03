Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B517E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:11 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id r11so1609370ioh.10
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=At9rhZ9bP/5wc2tfjZxF99ePrD8o4MbbQ/4vArkM+1I=;
        b=e9uqh6T4ArQ+bzZlwa2ohBxHuuRe71nusE323J/YWoHDuCADM/aHAkh0xEJLkrek8C
         PSkf9YX7uVWg5ZnQj0lJ2z+R9nqJnVUzsjwgGlgZSzpV12I1W9Plf2EU+cDf5E80eij0
         ZshFrT4+rmtczn4i4Z6WztivKv0uxUUujaafodB4zRNkSgnEIJ12xZqAhnk/+rNniq/k
         wGvriWwtJLkNWYNZ46WSz4e5sChIGX0Sau3DmpujSHqiLuMRJJlby8lZ6LDpsa8Pa987
         dYe5iwnDy8JsFh6zQBQ14Vr9HrRzFkmL0xJwMUwm0tS5yTDfaag+bL/BGi8fU48rOCO2
         o8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=At9rhZ9bP/5wc2tfjZxF99ePrD8o4MbbQ/4vArkM+1I=;
        b=faYfjVMmFbh8/KQf0UQ7hRZq1U5sfRAMwz2MIyr0kBKRP2Vn2/nwLmDtD+7XZt2E+x
         jXlyf4DxwFrVhJhBiU+/3uJDA8J6PdjTlIZgoH9IguyTYKg9SJOyV0ljaUYv/Uv5FwFv
         Sxj7R8T0TQxL2Xsr+y/HGltQVZPe2W+kVCwQ7jdvmWmmFcmf6lNcbR3IMmIXqLoUAkdN
         QFlRQFFJ/JtThUTKSD+Asutfise710TCrLpQjL4FxTWyOvNdy+43TBhr9pJcu466YlHx
         0T2m9cFNwoVsiODB1TdhWdEgvSBt7crO+7KSARVgJDnkSNAMNTYXJq+xSorGPSu/EekI
         fV4Q==
X-Gm-Message-State: AOAM532Wnt0pkVmBjM22zfvjCmZfQmA1qHfzYctsIoaPB6PVK1V8nqGC
	DxfDW7wVk6hAcOPquR7BJp0=
X-Google-Smtp-Source: ABdhPJzfbvK5rst7gmndvthlXCWaSCB8X5msFLQbemjDSPvsB3BX2zo087oUvLQdubAebPVmaJythg==
X-Received: by 2002:a02:3f13:0:b0:314:4a83:ac2c with SMTP id d19-20020a023f13000000b003144a83ac2cmr30604613jaa.3.1646322790603;
        Thu, 03 Mar 2022 07:53:10 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:10 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: r8188eu: remove unused field recvbuf_lock
Date: Thu,  3 Mar 2022 21:21:04 +0530
Message-Id: <24597a0cc19fa59139bf0a77ccd11a8229d7201f.1646321515.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646321515.git.abdun.nihaal@gmail.com>
References: <cover.1646321515.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock field recvbuf_lock in struct recv_buf is initialized but
not used. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 341605c67216..19d22db56e7d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -54,7 +54,6 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		spin_lock_init(&precvbuf->recvbuf_lock);
 		precvbuf->alloc_sz = MAX_RECVBUF_SZ;
 		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
 		if (res == _FAIL)
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 90482cdd2236..7347ec162632 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -207,7 +207,6 @@ struct sta_recv_priv {
 };
 
 struct recv_buf {
-	spinlock_t recvbuf_lock;
 	u32	ref_cnt;
 	struct adapter *adapter;
 	u8	*pbuf;
-- 
2.35.1

