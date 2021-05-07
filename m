Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7D2FB5
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 07:36:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z6so8107065wrm.4
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65d8j8KxAbaBeXVMozPvqbc0VGuCAIdxy/SojbfesRI=;
        b=uxX35QF4aly4LTSsErimFGWmK2vKDX96V0zb23tscREHRcZZgNpOvFDFMDQN/47VkQ
         0wp8QoTQbbQw1c9mGL32g9wl/WMue34hdX6ZvblqWmg4eIGAQbSwlQ44eXdanb0uLWKo
         F/PZ/gTrey6F3SvBhYfSMbqvBU/VN0xIoN1pnooHBS0jKz4dgU0v/2mZFZcDpqS0aeS0
         olBOvqSIe0CTT51oq7nKzEsfSPLwhj67d6AciWghUbSw9nNYUcBZDAx0KEVmqyZ/LuU4
         /3kda48hI/3WOEB/omg1Rul404oIDJQ4/TC0vvxzhX/gSUxHs6UmAXrJoSY6GPrELNhR
         /L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65d8j8KxAbaBeXVMozPvqbc0VGuCAIdxy/SojbfesRI=;
        b=MaJ12kMkoaz2g8xEOb2xg3e9R8y5tjbGKZJMiIfvnz/BlzTSoDnOnktD1+arOtzmN8
         fVBAH08G8LJCgMurIR7D+nS8l17inqMuGXqwXJfBXX6+i7Of0sQK4JzfEJrHvIKlMYKw
         2M0X9k8V7xngDEV7hPG/HP55JEluScEi35GT6B/6iRwR+8fx/n+4CcczlPqUnr5zWhjW
         vdGSVtKDiW5G8QGdcECpSDVz4PY/OJ9rVeMpOTf/mdMtUOrjS+VofKWBWBZA5HcjALLj
         FM2E9gW9KnTaFj5wY2NUn8dAbzxpvivJwec1xQgJBD5qmHi3jkUEPnE+ZpfNqfA8KCdV
         j2+g==
X-Gm-Message-State: AOAM530xXQ6APkfx5sgCeIoTk19MOHj7q72Cg2hDhnHALK85+5AoCmeh
	GnLI8ht/BoXWWo4elNbLL2s=
X-Google-Smtp-Source: ABdhPJwUcYDdHrWzz6wgkE1dlZla1lAW+KgE3ewuO9V8Hh+cYTI+Crs4EG18DlZw2WT+QdZv2qrPPQ==
X-Received: by 2002:adf:e947:: with SMTP id m7mr10842029wrn.70.1620372966347;
        Fri, 07 May 2021 00:36:06 -0700 (PDT)
Received: from agape ([5.171.80.53])
        by smtp.gmail.com with ESMTPSA id l12sm8363863wrq.36.2021.05.07.00.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 00:36:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8723bs: remove unused symbolic constant _AES_IV_LEN_
Date: Fri,  7 May 2021 09:35:59 +0200
Message-Id: <ac3f5a400dcb61f46db259cca6979ec41f98feae.1620372584.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620372584.git.fabioaiuto83@gmail.com>
References: <cover.1620372584.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused symbolic constant _AES_IV_LEN_

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 76076c4f0763..83b711c5df0b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -191,8 +191,6 @@ do {\
 	} \
 } while (0)
 
-#define _AES_IV_LEN_ 8
-
 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
 	switch (encrypt)\
-- 
2.20.1

