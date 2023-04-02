Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660814432;
	Sun,  2 Apr 2023 14:32:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w9so107698885edc.3;
        Sun, 02 Apr 2023 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680445973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0EbqnaKdSiijP5AMHVuBOUgkUfHYyGlvbGYlKLav6c=;
        b=fxPZuh0uJQhe82KpCnaxLqcWweaM7VRVfxJNvpKtiVclnj/SXwE+HdnKx4fLcPEE9x
         SoJGqi3nbaWpfxGHIbaUZZc1u3FZARth9Dfz8AixcFoOReKECB0GpFOYMwFn3ssw/k5y
         q142iY3YVJKC4wI72scS6Nba/pcAvv0K3fbrrDr7Uyjxe9xl6GwcmoGV34YI4KbcMbP+
         E70eRTnbICOq7e1rwQRRx5Jb+zaNUWuQIocp7NZ7gk6GC6g2RnqwQSeeEd7jwj9dHhwm
         B3Xt5URhADdQSIdB8nbEwELfcNQBDbdHhi9AV5jZX3OwP/C/yu9/4eyuF5/QeLA6Zrc7
         L8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680445973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0EbqnaKdSiijP5AMHVuBOUgkUfHYyGlvbGYlKLav6c=;
        b=0QFul3goGOntEl+PU4PMSoewHJkrPdycn89/Fy2IsKZ6HfZ5PMlebq0i3QLN/phMkm
         zUqGZzVlYjfAdIM9tdTz/h7e593GIn2qL4DHxQ2mejxt/lZj8sJwJrDqyFNPArXCN08l
         NqUW34Ko/Op4bJ0z7c7KO8r1uiBrdMEVHC+gYTap/m7YNdzsQulnG9TtR4EumW+FnJmV
         YdfWVUBO2x3CD8seX/tT6dhIETgcy/+l7YFM158gUyP6r4E7Pw1ohEZ9VIfatYsly4As
         Q67txahd9FiTy2exPDH1fBg9Kk/dbGT9aUv+KwLLIiSjkQFzSh078LD28CMJCBYCcYX9
         lWVQ==
X-Gm-Message-State: AAQBX9fW4VEpX82q++sHN5YbfAzsQl9DJy9t0ZT+TTbztPlUg6PcMG08
	h5tq6dP+ro5XecocSNvzwSDOxIdAkojQaQ==
X-Google-Smtp-Source: AKy350ZXjjFMXrLcYZ/YZ3o327TMJILni8gdgD6bYM8TDo4r4Za9IJQi5IHub9U9f8+b/7aFDgb3zg==
X-Received: by 2002:a17:907:7d89:b0:947:c8d5:bfab with SMTP id oz9-20020a1709077d8900b00947c8d5bfabmr7852387ejc.35.1680445973100;
        Sun, 02 Apr 2023 07:32:53 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906839200b009476dafa705sm3273292ejx.193.2023.04.02.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:32:52 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: rtl8192e: fix alignment to match open parenthesis
Date: Sun,  2 Apr 2023 19:32:43 +0500
Message-Id: <76814f7a2a026ef195334b0c42ecd2aeb8e8ea40.1680445545.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680445545.git.kamrankhadijadj@gmail.com>
References: <cover.1680445545.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignemnt to match opening parenthesis as suggested by Linux kernel
coding-style. This issue is reported by checkpatch.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index eb7b6deb2ca7..8d3067a6ccca 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -332,7 +332,7 @@ static int rtllib_ccmp_set_key(void *key, int len, u8 *seq, void *priv)
 			data->rx_pn[5] = seq[0];
 		}
 		if (crypto_aead_setauthsize(data->tfm, CCMP_MIC_LEN) ||
-			crypto_aead_setkey(data->tfm, data->key, CCMP_TK_LEN))
+		    crypto_aead_setkey(data->tfm, data->key, CCMP_TK_LEN))
 			return -1;
 	} else if (len == 0) {
 		data->key_set = 0;
-- 
2.34.1

