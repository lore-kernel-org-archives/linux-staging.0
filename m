Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18970
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id k128so26189087wmk.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DAeg4inHkDxK0M8FI/mGa+6PBLw6yGrM2ERnE7fCtjI=;
        b=CVQjSvljvbG6xUtKh+ulDigfUwYns2XS7fg5eBwtQslGmz5dATxFEnV3+hUQva3Jh8
         0GVVOM9o7J3HjkxC9EgCs8iy6kBVjkRBLZONpyrCUXklYLEJ2adzoUJS3Jf1ayJgFPF4
         bherexMZQAzPfAcTU+PYu+FtYFCY6nhFUVSIRDZ1TC/+6hgJl/rkDf+Jb1OL+JIJcPXa
         2IepGHloA0D0vszzddKTEKUciNa3YtSTDFKe9cG/wvOVRjpkp8TcXB18iRli3QsW+LbG
         6F0r+Qq+3fpzMFQTrDXFX+ofVqMCH5uw3N1Y55xGIG0BsqL0ptVlj/KsKI5pOEz1yyk+
         Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAeg4inHkDxK0M8FI/mGa+6PBLw6yGrM2ERnE7fCtjI=;
        b=i3CdaHN68NqldsT1llBXw0tZHjnRrvTkF8M8y0ZUSl9y01Wm3rWL92jadsLOyhh8eI
         O0F4N5w31ie4nC1rhGQ+40GMYiKxofsOUbIb8Bf1+MTYEwUSmkg6dIspgvPUErFR4XTJ
         vRBBVptRRnrhsOaLDtbbGwpZ8FwcOqjbnybGhHYq+ZPg5NPhgP0Gx9yftBvHmrw6PGV7
         qp+CGjIni+DRW1lkK7fDDQNrxL5b5OJrXTLVVcMwNL/ME4zHAKaiyeqtPoiVz57NlqNI
         1pUe8s2ANrK47rwzem5LqWUExs5NtFgk5NhVTS9BgUmavNoacrUX5C52pKF4pUGeyLlc
         3Xtw==
X-Gm-Message-State: AOAM532aIuRQR8vGodGikzLBet5ChHdaOkVjSwj1Qc0g5d5j3KvfmkcC
	VYnWAxSLjK+KsWHz9GXiQ4s=
X-Google-Smtp-Source: ABdhPJzY5I9BSYdtT7z6LiXR+eXapOw9usCh6YmMzqTApbJ9s52jkgR8t8qQw6HAez/VZ2h6hRQtMg==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr6011378wmq.103.1619189927084;
        Fri, 23 Apr 2021 07:58:47 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id l8sm8347489wme.18.2021.04.23.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/49] staging: rtl8723bs: remove DBG_871X_SEL macro declaration
Date: Fri, 23 Apr 2021 16:57:54 +0200
Message-Id: <8fbd19c077ab080bced83dc3219e8ecbac43462f.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_871X_SEL macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index ed75db1b16f8..fbae0d3b168c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -158,15 +158,6 @@
 
 #define RTW_DBGDUMP NULL /* 'stream' for _dbgdump */
 
-/* dump message to selected 'stream' */
-#define DBG_871X_SEL(sel, fmt, arg...)					\
-	do {								\
-		if (sel == RTW_DBGDUMP)					\
-			_DBG_871X_LEVEL(_drv_always_, fmt, ##arg);	\
-		else							\
-			seq_printf(sel, fmt, ##arg);			\
-	} while (0)
-
 #endif /* defined(_dbgdump) */
 
 void mac_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

