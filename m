Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963443FC8
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 07:10:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso13912184wmb.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZJ/kXxj691OQQ1voEIVZ9kX56LFg3cAMVd4BWTgZhE=;
        b=A8pLfIdIUq8yUHMCd9UfQjFTXpwAaMNfBGA8geICD/zitzsgOusWH2Xbb8hoKywh3c
         QJAWdfxRx0yuPzwlha+JtFsHeabAizdXlm6pOvZcKWynuKxV4UAAA9RNUyda88QdwuJB
         qPYY5+zRxjVxArCZEo6BG1ZXFQLl8e0OQGq02D+Zx+whdNfQYZFYVULj4sqd6jE+/oUa
         CRPw7m6GBiCxe45hVlYkvWjR3rsdeX+iK/pmlub9TKtJASH8Vjpljvw6fo2cOk1Bx1LL
         DOvVq+b/QUGPmdJVpHnUNb0wcviQv7ESRdRa6Vz2ajDVy/rdxyPmIblRqbh6F4QeH+Bx
         D25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZJ/kXxj691OQQ1voEIVZ9kX56LFg3cAMVd4BWTgZhE=;
        b=nbILNm7Tk4KtzbB495QiHKEdzdtQ62syXqAcrP9ZdukM3jQ/YeEmefwudqnYuAIS1U
         c4yEkAayRWvZj9X6KCIsXfKeGIDVWKIqrFzO3TK+BlGPDMyvfClE8w9cARiYc8993pgX
         vo4hf7iHbB7inxbOzF+idS+IJ56itZPyhGIwOpHeGdAg9GsYMgCVPh94DhRb56DTeQAy
         /nx4mMZnjHH44FPQhmjhEmV62v5yKpLvos6aS3PWzKFrT3Y28wX8e0iBwf634RbcuoZL
         q4YkLKmv472P0k11BwpbRI7SNvnjEuB3D5KAynbPUlG0XeZiptT+owHi0Ijr4fe19yLz
         2ukg==
X-Gm-Message-State: AOAM530oaJs3e2Tv+hkYzquoVxYytAyAfmvsNAIHK0IbrudKUkE3SK1a
	yvU101pFACVz3XIGzVmmuvHS0VPi5vA=
X-Google-Smtp-Source: ABdhPJwSNN6UtDa5v+7z8zQrKN92cE1VtubMzJXBPEdV9JS8mAc9WOlnA9ZCY2TT4AB0Cr7wLvpUhg==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr20816713wmh.114.1630307419100;
        Mon, 30 Aug 2021 00:10:19 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id h15sm13561974wrb.22.2021.08.30.00.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 00:10:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary parentheses
Date: Mon, 30 Aug 2021 09:09:24 +0200
Message-Id: <de4fcdb3ff45671333713b27f1dcf376b22f3978.1630307025.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630307025.git.fabioaiuto83@gmail.com>
References: <cover.1630307025.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following post commit hook checkpatch issues:

CHECK: Unnecessary parentheses around pcmdpriv->cmd_queue
103: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:169:
+	INIT_LIST_HEAD(&(pcmdpriv->cmd_queue).queue);

CHECK: Unnecessary parentheses around pcmdpriv->cmd_queue
104: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:170:
+	spin_lock_init(&(pcmdpriv->cmd_queue).lock);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 76418c525b5c..ca405dc76c2f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -166,8 +166,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	init_completion(&pcmdpriv->cmd_queue_comp);
 	init_completion(&pcmdpriv->terminate_cmdthread_comp);
 
-	INIT_LIST_HEAD(&(pcmdpriv->cmd_queue).queue);
-	spin_lock_init(&(pcmdpriv->cmd_queue).lock);
+	INIT_LIST_HEAD(&pcmdpriv->cmd_queue.queue);
+	spin_lock_init(&pcmdpriv->cmd_queue.lock);
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 
-- 
2.20.1

