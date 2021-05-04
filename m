Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434472
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 14:51:45 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id l4so13591710ejc.10
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXRitWWRRFW0ojzwHJ4zpfVrafyqDHpLGDB/FMLEkjA=;
        b=KPJ06GykRFITdlNEv2SiENZ1qS2NqNVmwqkaKf/QGA99iaVZKrMGifOeIwaTATX3pO
         Di5SzTE6Gk/QUoHbPgsk74gGIrafT5BRRzyNcLhwMOMcRt3RSAZOa9+5dZnbUy7Ll9WU
         w2hJdbq3gombr2fKfxErzj4+obEUIr9b13gBtYry5ghI6X4pjB2OV3nT+CPElcek7NjP
         2ksMmZryQZD1YaqGYttYkiKtB9idzrwbAhvWZFUGGnC4M7QS8gqHFNibLjfiMvmqHpH6
         DjZlVDILTl3NvIuhXZVTVRbQjULg9q6UGechcvxONdxuKnyfghCtQyEiGhgN5/kRcdCp
         dQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXRitWWRRFW0ojzwHJ4zpfVrafyqDHpLGDB/FMLEkjA=;
        b=uJt6cX4XHjQM6jw9BVJ6t5vMAQXS4XSKoCXzxIwAaYf7OhbkMaTDm1/NNJ/s00Tk6H
         e11P+QWcZlQvgZ7kwoHBx+Wgq9lN3Q7Cnexd4+raVmnXgwsiP2h0Rx6x+gc7+tjykEJZ
         R/NglKSGD0wgZ7DQx2eA+nSL7lSeWSnUKq2NCJKdBbFVORbw20sIf882YqNo/ObjzD98
         +DZuWSKhkCHgXvZz7dMsKYL/yW9kRXrdnkeYOJVEhQA+hRTWsJnse7v8X+cwgISYh+0a
         4y+s+yL7EROylDE2buILfj4u3dTuCBR6mqRrFl1gUR2c7FUWQDu5AFoEvrthS/BFRq/e
         iTIA==
X-Gm-Message-State: AOAM533DHHuSX+xZQ3gzL6hrEJJAvaHRMGDlNVIEdVFpfM/MoA0rrvWm
	I4OQY3me1Ocw/PeOvTSFoCeeRXviqeZWpw==
X-Google-Smtp-Source: ABdhPJwbeM1BHUhdBCa8Z9fGtMiQ2Zf9JgIOajJHeew+miB64OV87e7Am4ta9iBCuApKJQcvNe7hpQ==
X-Received: by 2002:a17:906:17c8:: with SMTP id u8mr18317300eje.57.1620139904195;
        Tue, 04 May 2021 07:51:44 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id q25sm1523792ejd.9.2021.05.04.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:51:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] staging: rtl8723bs: align argument position in a new line
Date: Tue,  4 May 2021 16:51:38 +0200
Message-Id: <f195bc7d72c122e5e16b3857cf99ae1f84734915.1620139727.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620139727.git.fabioaiuto83@gmail.com>
References: <cover.1620139727.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

align function arguments position on a new line to
open parentheses.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index e4f3049ac351..0cb603aa4ee6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -2056,7 +2056,7 @@ static void aes_encrypt_deinit(void *ctx)
  * (SP) 800-38B.
  */
 static int omac1_aes_128_vector(u8 *key, size_t num_elem,
-							 u8 *addr[], size_t *len, u8 *mac)
+				u8 *addr[], size_t *len, u8 *mac)
 {
 	void *ctx;
 	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
-- 
2.20.1

