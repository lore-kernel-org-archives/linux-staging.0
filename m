Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1E71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id p6so44010507wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vp7TMpUXQWMqR3/UFW+ck6WgnuYX1oYQ9RhzEKAEBI=;
        b=DmCw5el2sjzb2Ji4I4vkcqIT4YtIbR2ms+PMWKZnsqGFdcBtUkCKlyxTjy7Lu1tU2k
         KM+cs/Q6Ltlzl5XjE7PcH7ANuCcnRnCm4kVFzm6q6XhnKccRrB1lmUdSBx3vQT3g/XJq
         85OiSyCemOvkWsp8L001HnCtG9icZTJpInDqV00G1cx/zsoevd7+nGS8wb6TRQMeubT0
         AH8I5qJPc5jQTANfP8rzQfyQyKv6VjdGUXvlIy/cg4weAit6jXncEYtMos42d59aa+zR
         uQ/fKHFkMqG9xC5nLUqMNUxCr2GMLRvuSFccCWPJixYxFmqx+n0iDwYiF+UZZgOdHqQH
         SygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vp7TMpUXQWMqR3/UFW+ck6WgnuYX1oYQ9RhzEKAEBI=;
        b=RGuWDcuJvQrCGrVnNCQdCb/RNJxiLcMM1DH74VFde8Af7BmT9x4varrMTVO6wX+iYq
         MtAhnNoModD8WuGlFmFQJAvyoBf1wUG1KGL+g6VQQqZwVTrofhVbNeJLxSAdpfwqa6mi
         PlcmSEzfzvqT/QowSSWjK82uiC7x5+q9awp1EpTN5B4aAyeTouepzdSo1AwgAu+9v+Tq
         4sCki+Qpx0BVVr2JK71IDGfmmomLO36CgiKoDhcs8Nvf45DTNacJmhVeOjGeA+k8Ny9y
         2+8YB9/BNfq+SuikBlv7reu87fScLJ4Q+szSivgzSZjfOBPrvj6HVYgH9KcYORSMb6BT
         rwEg==
X-Gm-Message-State: AOAM533z8DlTqGY107GsDKIhqCOCSFwZj1/H0rXfwrbtahapqsVss5am
	HxvvYCvYYwTC7JYohNqiWU0=
X-Google-Smtp-Source: ABdhPJw003+WyuTNrIQi7WNVLyX0UWdsr352YujVuKbV8/v++Lz6hB+jZmNnSnppoQZKg5bey4ihdw==
X-Received: by 2002:adf:e647:: with SMTP id b7mr9603490wrn.43.1619254972233;
        Sat, 24 Apr 2021 02:02:52 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id d200sm9744983wmd.45.2021.04.24.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/50] staging: rtl8723bs: remove all defs related to _dbgdump macro
Date: Sat, 24 Apr 2021 11:01:53 +0200
Message-Id: <d9eaace0a9312dbc9bc5b6775489dbbb64554ed2.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete _dbgdump macro definition, undef and
empty conditional code block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index c7e8187ca7f5..2232a1014528 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,21 +131,13 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#undef _dbgdump
-
 #ifndef _RTL871X_DEBUG_C_
 	extern u32 GlobalDebugLevel;
 	extern u64 GlobalDebugComponents;
 #endif
 
-#define _dbgdump printk
-
 #define DRIVER_PREFIX "RTL8723BS: "
 
-#if defined(_dbgdump)
-
-#endif /* defined(_dbgdump) */
-
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
 void rf_reg_dump(struct adapter *adapter);
-- 
2.20.1

