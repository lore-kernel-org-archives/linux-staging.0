Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B456D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 18:06:48 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id 130so11947606qkm.4
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IOBf4Rkhwj6PE+3jdS6mZV2iKsIDxZ6UCVlFQCFR0Y=;
        b=s0EDeQdYnqErngF1nEmE3311Hy7J+dz5NQjNys2dVGlh7do1ngGwB1c4gbu+DCS5AE
         5jAUPWMCtzD/PxeCMsDAg/+b7mAyb985FApn3gTDNeJZPwxeUEl0s2+e6t+iOkgJHfLB
         56Wd5n1Xf/2LfwxL4VN58Uu9dSBNx/o1AfqUgi0iJL9b545LK74n7uZ1ENmUtCgEsN8K
         5qoMV+xuWbm/uwVCRwHI84GVON2ZxMvqPoe3ivwFRedk1WqCrPSNfkNeKddKSS/ba1nz
         PIJKPuRPY/Nve+i7KkALhaO9PqU4KJnqG0hj+2NkS1VTuQ1i1caPRGnm9KEfCo/zP+RN
         z9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IOBf4Rkhwj6PE+3jdS6mZV2iKsIDxZ6UCVlFQCFR0Y=;
        b=pgCD/25zgrq38LiCTeYGCbcGaPmZYJosFj0z2EPMDPwR3eQFGoCi5GDcjlRSNTmR4q
         4/KmuQMByU+7tN6jyDyT8mjSvlEF/wqRdI2zv/fYar9qo9XZUCmCvDZGARZ3B63xzY1j
         Vh0ibdtDi6muapdJV3V2IMM/xAJfHExA5XLaZkHGPNNH7Oav6/G5Dj2FGwxWtMgjEPLO
         SvGC64gAtnZ7mCduaSwHYmfittLaLOmq19rodzcr1O07IvuAalYIPlm5c8nVhmoLhkgo
         YW+53GBYj8YEGH5jvr6dmhWcdmmwnGrsKCZQ1uVq+J3fd8MCVMwRjjNlu2YLg3lcc0Ou
         R1kg==
X-Gm-Message-State: AOAM532nDp/VUl0Xmc7hMlZNIoeByTSSpYfpcikEaBPvSBjBZJNyeDSt
	R4jUczpHe3o0ldiCSP9Ww7g=
X-Google-Smtp-Source: ABdhPJyjz1cmQf5R7k4Rbio5OpNnorzm0Ith8awPs9DswVhEIFC4/NAf1+0/MVrR91i+mUcafEG4Qg==
X-Received: by 2002:a37:9e0c:: with SMTP id h12mr4622078qke.398.1618510007694;
        Thu, 15 Apr 2021 11:06:47 -0700 (PDT)
Received: from laptop.attlocal.net ([2600:1702:1050:6b80:8429:e77a:40fa:a57d])
        by smtp.gmail.com with ESMTPSA id j15sm2394005qtl.88.2021.04.15.11.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:06:46 -0700 (PDT)
From: iankewish@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Ian Kewish <iankewish@gmail.com>
Subject: [PATCH] staging: rtl8192e: indent statement properly
Date: Thu, 15 Apr 2021 13:06:45 -0500
Message-Id: <20210415180645.65699-1-iankewish@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Kewish <iankewish@gmail.com>

Indent statement in an else branch.  Reported by checkpatch:
WARNING:SUSPECT_CODE_INDENT: suspect code indent for
conditional statements (8, 8)

Signed-off-by: Ian Kewish <iankewish@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index 238387d62..4a760ecbc 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -291,7 +291,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 		tkip_mixing_phase2(rc4key, tkey->key, tkey->tx_ttak,
 				   tkey->tx_iv16);
 	} else
-	tkey->tx_phase1_done = 1;
+		tkey->tx_phase1_done = 1;
 
 
 	len = skb->len - hdr_len;
-- 
2.25.1

