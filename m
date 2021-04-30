Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8C2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id u3so27006197eja.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=bhLu2/oTRWyIzj2UV8+NfW3op9aBa9qldGvAKgRoC9EwlHzCkAnIwxxmm0yI8mYpGr
         li5k4bO1ahwQsE9UCMc6x+Bjbv6becBXuib30gWQMvtE6kPTgs5jUKkzo0Y8FbNGcaXN
         B2rMB55YocTMZGTcvQ6tilDY3UwgV2vSy/nNld4pINWwRUTIG1ZzmT/aMPsT+zcOdTE9
         OXIKf/qQih212Z5f1M8ENZJn1f/WjLD9rAx1Wnvj+Oga2zGdr7vLho+IZjQLl/h9Rs8l
         RdBi8DSZp1rvcwSBQz5wmCpWwCcq8mu86swaonraLSAJbTtw5iNEaAUxdElbtL3JUoFY
         lKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=cD0QQnFhg8YLxefN1EPObrQe47BJiBypRF0Z++7dFRzqfFtTMf7nWpbB3LhRB5/5kH
         im3jylZX/wREKQeXf8svxB7i+2dqKqKGRQJAVTasgi3nIr8O5USqOLQKkbJbPn3pPkvJ
         sGQeU/Zox/gGIy2oFuM+kdqA/TQfxQRB1HF5fnTUYx/v/aP6yxGmXso/IRAr+fGJd4Eg
         PjGEZ76Lg1ddEqdtev2n1SXB+6L7e9mE6Fb2ecsclaOmFBDtCjOcZrzdxM6oHlnJlHgs
         MQpzK/y3DcYFSbtVscwHFYVf2aXl12ZCWqvL05x8B7MQGwwl4YGME7JCH8GfoovSIIS8
         A3yg==
X-Gm-Message-State: AOAM5307r0PcqUwv603aP1OasI4E8Xf5dpseAf0vRD8Z0Gfg7XvOX23P
	WIpzr3wZS+0KqSe2f+OOkzM=
X-Google-Smtp-Source: ABdhPJw01xjPEUi0taulog9SrlEy/M73yn1WjUOr491dPEADO8i/uMMHJmRCkqwJueEA+LicKodhkw==
X-Received: by 2002:a17:906:828b:: with SMTP id h11mr4805236ejx.305.1619794654939;
        Fri, 30 Apr 2021 07:57:34 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id l1sm1474830edt.59.2021.04.30.07.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/43] staging: rtl8723bs: remove empty #ifndef block
Date: Fri, 30 Apr 2021 16:56:39 +0200
Message-Id: <2caae2efcfbe74cafe6aa000ca7b330cc371dca2.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifndef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 78b9b4548dcb..3faf4da42bd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -91,9 +91,6 @@
 		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
-#ifndef ASSERT
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

