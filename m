Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402888C1E;
	Sat,  1 Apr 2023 18:58:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id l37so14788743wms.2;
        Sat, 01 Apr 2023 11:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0EbqnaKdSiijP5AMHVuBOUgkUfHYyGlvbGYlKLav6c=;
        b=D2Wv96vcb3yoPTQYqJj798MQvDM69mQmUSiTRwNmVtEAwcfI87/2bHbmxjvIMsH5bU
         7qzxxO+oLaCioavYqdZ/qtnSkw8gSFx3un7zY715c3CqaHkdGZb7wH/7s4VN+TJKKWmk
         2oSSJUSuMdPdUqyBmoGnVDIAMy0BDFyPeLbWL37VlVBehJeKFJWAlVri4BjKjxzvt1EO
         TNfS6ROQ0sY+qNjtRtf2HZeDYgoA/+/m9UvKq8VhJGve7NjQEfb12e7qjNy/M/PfuJF0
         w3YMd5rJCMd61kvS3MSba+/EXwQxcGNpmwdQwbeOiWgUGCH9tfqv1vPL0uHU84xyJH0h
         An4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0EbqnaKdSiijP5AMHVuBOUgkUfHYyGlvbGYlKLav6c=;
        b=7Aw/8e8KOjUOzb+RbhgTO0sEEctYN9CautyKq6jAwNER/tWG5ySnvmElyw1ljJKVKG
         SSNUd3tMV15hPNzB+/bHX3K5VYKnkpIxTo5vVwnO2nQFoF0TQaTK1CbbrdNlEXyG/Q0A
         EnZ5lvyHBNmrpk/gDSomu8KemMet6PTKquL/RNa+HiQcUY831IcbJBcrD+v3RzKO31xF
         /8eeX+pQ1y92fiv/QY5yq91xR4gyF+4uDofVSBmYmMNuXj9J4h2LJhx02l5HZVtOeuZa
         iz3LCenOHPISaOXP+3Ch9+py1zPeU+97yC+eLYekBSrerye4dthNvxmVI3nvkcjRN8EQ
         CHsg==
X-Gm-Message-State: AO0yUKVFgpWxo+S6ouNi+PCzA2SfDjWrj5YRnIOb8ONcSRuxiZp7Rfcc
	CcyjMhBM41ImmYY3ZnUAgK4tCmUx3aceqXee
X-Google-Smtp-Source: AK7set8080+qC+D5SOfY8YZLaERU3d+h6AONLNLXHZfn/ByUituNzOF37sbRbEOrdrg6k6rThnYMoA==
X-Received: by 2002:a05:600c:22d4:b0:3ed:b56c:9496 with SMTP id 20-20020a05600c22d400b003edb56c9496mr22974761wmg.31.1680375531269;
        Sat, 01 Apr 2023 11:58:51 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s17-20020a05600c45d100b003ed51cdb94csm14017463wmo.26.2023.04.01.11.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:58:51 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: rtl8192e: fix alignment to match open parenthesis
Date: Sat,  1 Apr 2023 23:58:41 +0500
Message-Id: <76814f7a2a026ef195334b0c42ecd2aeb8e8ea40.1680375200.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680375200.git.kamrankhadijadj@gmail.com>
References: <cover.1680375200.git.kamrankhadijadj@gmail.com>
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

