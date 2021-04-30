Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024812F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:29 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r9so103823582ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=jtWasIzfeB3HThE5WNkVGBjNzzs/ezVGmm/nfnq96q7DwYlnKK6FX0vtjsZjujgoSU
         A+KkZQAPP9HHxv3N2ioO5sIimY5WmVi92tWSVV93cB0FEGV4mprz9uHD5vdYibmqN3oe
         MDdGtUvW7GAnyklEj435kjY5Vf1+p1CG4dI/PtUTGC/ZMRteZn0iI6gujuvQue6ngrrC
         t20t9skmco3LMPgxOnoJRze94oLJnuozp/QGCUmbOVe1babL2y9l0bZVUAQBLV1N3a7r
         qq/HqZPg8I1HZPOuDveZKD/DZBPrF2UBjNKQTj3qgiBQ3Oyqci+DAheKrHtsDgA5/BG6
         Gj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=RcKFiMb3kZ5s+n9J51kHSK3JAoYCEm/u48K1SeABaY4lik9fIkmTBb3tJZgxH+oaQ1
         Xk74qEco1V6nm4/9ztf685KhkjSJhngvd3rStK5eogMCT/uZUxpAjyGmdLUrfapOzvRf
         +g82GjQY5nCbdcPvbCZe5vVWHArK7SSY1mSWkBvrTjEt15gEeTJa2g2nZNlat20F20L+
         cfkXbet4DAIXvUIo/Hf+vZPuvfCvEJeXsi+a4NCw7txW2GO7LpUpgv4fHkG5JiXe55TS
         J1CGf/EPEGH+JrKIxd0WpdMLEgtGTd9OoUkdzvkg2kJGIj82vtovjoOD7YNDjTLwifGX
         qRaQ==
X-Gm-Message-State: AOAM5317zZZqyke9pZe9aSUythurtyasAvE2parJiaZKFw5tZfoN3wFZ
	9859xz9AtPZKrh/JmN1643s=
X-Google-Smtp-Source: ABdhPJwM4pBUsPyTlUtgxhGjYASUNYxYBZNtL0l0pcU7pqA5UqTNKGOzotW5oybvmPaPivDG6E4nKw==
X-Received: by 2002:a17:906:cb1:: with SMTP id k17mr2771315ejh.307.1619768667663;
        Fri, 30 Apr 2021 00:44:27 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id f25sm649547eds.73.2021.04.30.00.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/43] staging: rtl8723bs: remove unused ODM_dbg_exit macro
Date: Fri, 30 Apr 2021 09:43:32 +0200
Message-Id: <b460dc555a70a80ed0ce9aceae7cf266c549bfb2.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_exit macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 7c9a87fb8e51..c359eabebb67 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,7 +97,6 @@
 
 #if DBG
 #else
-#define ODM_dbg_exit()					do {} while (0)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

