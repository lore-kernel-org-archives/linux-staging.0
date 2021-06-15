Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E8872
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:45 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gt18so3574906ejc.11
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LgeZ2JYile0wfxLPa3/QdjQOXfOnyTEQN34yF3jCqoE=;
        b=trM+NhcbmRP9RJgrenAhxF7nzko6KTtLGzPc2c5XaV5oOzh1aCLtjzvGvC1EgayEjx
         /v484YFqFxNa/rQ3jvGABzaO7aRifefOAfQd/dIdS+Nsaz7jpGQXtshRaQ85r6Qul2HD
         w2mg6NJ4VnybL8tYrjpjbI5gkavp676v7Wc5+1g4HaQZ2QOb0vGBoh86JwZTA1SpQvMx
         fbVHRpi3vBXjy2PEaDMpNULi8iDModmotqK71BHHx1jbW8GSbXh6ivHsBruyVIsm2qMY
         Ms3+twAZjM71yugkoZBwFMGMe2nL0M6OcBx0m4ru2jBzaj7KCcJRJYiUKloW33FAMn0G
         lCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LgeZ2JYile0wfxLPa3/QdjQOXfOnyTEQN34yF3jCqoE=;
        b=sAyl1PlIzKkJPnabnhU8OzNnktwsRyqlFJKRhjkNAFA/81Wgv7jz+SxtXE4QzCGRNn
         7q2NDn0pLSFDI4IHxMJa/+qQ4Is8RTfhRWAukSzsdKSI0/fDiALAhb4UQJL+PFHwRStg
         SQyi1bT3pmTRcXCS1sTHDyGmeVe/Q2IGgiey7/pLIATizYSsgEnobom+6zKIbsOF+uro
         fcIAb2UXPs8vhjmndA5jguynhVbsQUF0oma+al/XH9++/pjqEOrr4Zpx/rB1iAio6ECr
         jvLSkPoZvMdyVtOL+9OXb1LeJ3g6Sx3teSb2uOXRSRrSRovcjcVnYf1p86Z0yzydyvao
         V5SA==
X-Gm-Message-State: AOAM532H7ld29jA+hMb5iuyTQoYnxZYFB+zLqAt7+HfsFNfxgKu4fZda
	xdU7v0beGuu81G/dTTOe2wNImwvd7a1niQ==
X-Google-Smtp-Source: ABdhPJx2AxTVMle/ivxhdSo2pBV3++Uo+aHcLMQRiVRi2yKr6dZxos8WU86W1dDvwqk3GvXd3WuraQ==
X-Received: by 2002:a17:906:9706:: with SMTP id k6mr20175851ejx.456.1623757544388;
        Tue, 15 Jun 2021 04:45:44 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id cz14sm11385069edb.84.2021.06.15.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:45:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8723bs: remove unused WAKEUP_GPIO_IDX macro definition
Date: Tue, 15 Jun 2021 13:45:33 +0200
Message-Id: <6bf5ddf3e4465840cdfcca79a524645cdaf0104d.1623756906.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623756906.git.fabioaiuto83@gmail.com>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused WAKEUP_GPIO_IDX macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index 4b2cf86b8aa4..eab934229789 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -25,8 +25,3 @@
 	#define HAL_BB_ENABLE		1
 	#define HAL_RF_ENABLE		1
 #endif
-
-/*
- * Platform dependent
- */
-#define WAKEUP_GPIO_IDX	12	/* WIFI Chip Side */
-- 
2.20.1

