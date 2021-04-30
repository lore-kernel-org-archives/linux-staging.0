Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18712F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:36 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id di13so672996edb.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=Tj0ADbLDNc0uOnrKa6SGsh01aGDFVSeOgqRBKLMByEl6WiIz/TD/qb/nlHfPNIPInF
         bLOYklDzQSYxSIA9CujXxJSEyHCbkOS4iVm8sxPpwO6mjfCSdcL4a0ctd/pAvrnkUYzK
         OFYKzRTHFLlXaaVBWu2OsW286npGVf8pnQHWho0QuXi7FtbIRsykghvOp2HfITYeNVwN
         y2gV/seWlWs8ao9YlPgFpLLUlVx75j7w67mVpwoP1KXQL9L1aFkesjRjw6sE7repG4tI
         tBYppqSIUuA5WCjHOTLCfE0F2DyutJLnAABkf7QvsrSbUrTTHerMp8wbCYFnYmK/cgSs
         ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=oBYQh8abfsrPxBLYNjBBS5opogiBhVydsQseueddABjWB4zt3KnLI6n4f250SOBAfl
         ZwPBmhOegyeMRxZdqsAw2Vndm9xw9XgUWxu0pJqB/BbzPTdO8oXvXjYo1/c5WyoghOvo
         cQfBUuzRLMYR2txBUrh6WXvmVCz0Y2AbafJRN3dbc9WMkkMLaxChWe5yhwjIGAso/qnW
         ruTYhQpx3r98Fxc0hgwtOThID8VUcGhbblV3haDY5R9wJm2WSn8fqVYnmVAwQ0+kBZlq
         DEOXHiw4ckA+k3j/zpCvInPtCN+zjagnLolkZd2KHGJYpho+Sof7d9H+RGkMheYwIbFS
         FG2A==
X-Gm-Message-State: AOAM533bOTKUmPiYnEdCRM/bkZwA0v8TzDGQFUOV/UFAV9e7tLIWSa8f
	PMQGOIDx2voUgiLTtllC0Pw=
X-Google-Smtp-Source: ABdhPJxutpph2AsljsAdsNGmJguKXFi+l1grJiSfnpP/ftdZaMJaZgjtF06aHBnbFRQ8VerLqXdfBQ==
X-Received: by 2002:a05:6402:17ef:: with SMTP id t15mr3613432edy.385.1619793875515;
        Fri, 30 Apr 2021 07:44:35 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id u19sm1426672edy.23.2021.04.30.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/43] staging: rtl8723bs: remove unused ODM_dbg_exit macro
Date: Fri, 30 Apr 2021 16:43:44 +0200
Message-Id: <87faa19a23063ff9cfcbb66c86d8a1ac8e9d165a.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

