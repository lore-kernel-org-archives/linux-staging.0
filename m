Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F023D6F
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 10:47:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o34so2899887wms.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 02:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDOa5zAjxEYdZwQwENexU8DjbH6bq4RkGCaO539Y7fA=;
        b=SEZtit2TYLlZ/CFGrluRQZeV2omoXH19rw3xlKJdlVIUe2ntmFOGvLtJX8Q06Ize2I
         w6Ez8FL2EEo/CyelOhNsac7tbA//euZj5/tdMpE4SeUTEhiinaQH6n3NnO7tlaZdkv6f
         gKG5i702oy+D2ftnUb+wC2U93LGsa0TewSfGgrfPkwSDsPkT9A8XUGCb7JCjfCd9rVuM
         NK+EFWOq6+3Mrokj1f7jliRkubSonsyTmgdN5Jlo8VItpwbFJlb19JrDBuBAhuOGJ0H8
         1QzgUmCDJXFfaZtCHN3pNYFysPfOHyxFX+Lm4P0diJllyfaeGoUEmvAdI07WosTEepXA
         PDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDOa5zAjxEYdZwQwENexU8DjbH6bq4RkGCaO539Y7fA=;
        b=58n27uSgYNPdkGpkv9m4jnDa56nPAMiwnhBCPbwL1VJlTwzNA+6IAEgun5tBhm68dc
         6U+6s9lduOjv9dK1fvwi5axaKFRTxTqgmvITI66F+rNj2DEkzqo8XuUEJo7NFdqzDdcR
         KPXcpWry4HEqrpjHT74sro7kVkyVCDGsNSpyuCf6GG24oxSEfKlSt0s1kWUo6oXtBdw6
         MiXgdGACb9IDN0rL7+YxYewTvC3hkg1Gzd15fF0DuFsQ3TLP7eNg5h9xMrjTeEJexyk1
         oCylYx2aD++jVxGdKa8iHGTOEVMc+kIpiu/xQcej+ScEuY96TgffGQHsCozoKb6LRzjU
         l4Vw==
X-Gm-Message-State: AOAM531Qyxrma0wMK8XodxwIZ0Q8Hwiwi/72HVZTL6orbL1OOqxYdJxZ
	zZizyY7s8gBo+re+CIi3nyA=
X-Google-Smtp-Source: ABdhPJyp+txqXxigrnTRyLOPTaPW0lu6yiIYHRrXl/74gmUQ+6rN929i/lmlIS8oTnw09BzzkYn4WQ==
X-Received: by 2002:a7b:cb90:0:b0:37b:b88b:b4a2 with SMTP id m16-20020a7bcb90000000b0037bb88bb4a2mr2155841wmi.148.1645094869500;
        Thu, 17 Feb 2022 02:47:49 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id p7sm13690196wrr.95.2022.02.17.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 02:47:48 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: wfx: Fix spelling mistake "unexpectly" -> "unexpectedly"
Date: Thu, 17 Feb 2022 10:47:47 +0000
Message-Id: <20220217104747.15424-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/wfx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index 0ddc67b56589..d832a22850c7 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -190,7 +190,7 @@ bool wfx_api_older_than(struct wfx_dev *wdev, int major, int minor)
 			goto next;
 		}
 		if (chunk_len > WFX_PDS_MAX_CHUNK_SIZE)
-			dev_warn(wdev->dev, "PDS:%d: unexpectly large chunk\n", chunk_num);
+			dev_warn(wdev->dev, "PDS:%d: unexpectedly large chunk\n", chunk_num);
 		if (buf[4] != '{' || buf[chunk_len - 1] != '}')
 			dev_warn(wdev->dev, "PDS:%d: unexpected content\n", chunk_num);
 
-- 
2.34.1

