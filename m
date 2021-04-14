Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C406D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:51 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e7so24776790edu.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jmKShNJOq6+2r/pcFVOsH3BuY6l+Ra5OlenQ7pEqnqQ=;
        b=HtOKDuoGu95gJsvLP+zYZwjWmOr5BtTfd4KX1etWcBAQoLUdWPopIHOQWQ8KhTuhho
         0MSWHDTJCo7h3hx2z593WazWNcl6i0t1gE0U4yJFm7ZAheNJwJ3He/dRC4C9r9SDvaPY
         uZ3rbqvBvFEu92pZQR/cn4UmVptzDzzlOq8jXyIlq9a5jPc2DEx5+VUA4nKXD3BF8Ejh
         CAuPqKB9m7k/MWie0o3R16Avo0GW6+2aR6HQGTv4VIhRkSoI8O8QzGPk+NSTv0Fp3XGy
         Cln3XUn4IWL+ui1s1EIQ5klVDwPlpQJPFNXxX9wM4cIUfvIdAQmnkAT/0tbA6cDBll1z
         B2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmKShNJOq6+2r/pcFVOsH3BuY6l+Ra5OlenQ7pEqnqQ=;
        b=EuLlXd4nAapNT2QGpg0eoFxkn47FqE7KJGMjYIVzVKZYGQ+Qih6W2k8P0clixfXVQ2
         s6Lzk1tAt1bALvpsvlefsi59B+o0Hzveo0sOJvseDe4pPjUv2+mnI/sT31k8WfH52xF8
         p+GZb0y6QXTt9tUJQKy6897spf3DrZE3zJdxHkWBErQmHu9V+8hg7RlnqYUn1+u7Tcu5
         dRbTrkHss5lsC8f6R2tOry7/V65zYfw4zPeEQyMy5BrrXp0LN7noGDgGZmeB5iTTsEdz
         dF0eq4copOjWiRY1xpePm+mErpq/lvAk0n2tbbtJ0gLMxeAMx7hLv80yEflb2l3dk29c
         A7+A==
X-Gm-Message-State: AOAM532H/kC6vZ+goc4dWdPmBRolUTguFCxeaM0FXDI1UJ4DT8L+G248
	QuRv97kF2cws4fpHsMhQ3i9NBsEzYHd7ng==
X-Google-Smtp-Source: ABdhPJxGCjbKgVr7boBMoGbxjfqHGMXuiWIsdwvVGeLqCS95sTCVJ4eSuTj0eKMpNKqJLmMhF/lg2w==
X-Received: by 2002:a50:d7d7:: with SMTP id m23mr178840edj.378.1618423910286;
        Wed, 14 Apr 2021 11:11:50 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/57] staging: rtl8723bs: core: rtw_security: Demote non-conformant kernel-doc header
Date: Wed, 14 Apr 2021 19:10:47 +0100
Message-Id: <20210414181129.1628598-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 from drivers/staging/rtl8188eu/core/rtw_security.c:10:
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'p1k' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'tk' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'ta' not described in 'phase1'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'rc4key' not described in 'phase2'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'tk' not described in 'phase2'
 drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'p1k' not described in 'phase2'
 drivers/staging/rtl8723bs/core/rtw_security.c:1937: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 9587d89a6b24e..60b724729900e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1921,7 +1921,7 @@ const u8 rcons[] = {
 	/* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
-/**
+/*
  * Expand the cipher key into the encryption key schedule.
  *
  * @return	the number of rounds for the given cipher key size.
-- 
2.27.0

