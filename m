Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860F6D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a6so12063561wrw.8
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BEYszmz1b6maXp+qOcJyOQv8oWJtKUU4rpksSTFfGVw=;
        b=UcZDaFWnP3g8gAyuC+WyXUyrsH55ns19PRfWEg2viGGYJZXcRPknZyLIgfF+0PVD34
         12BOEtuq+gTzocetdWjHBW1mtSMNj/Ul73q0tP5mlhu08sip/mj1sjBjJDik+GTHSkCq
         iCxc1mJE0NYuEGgSRg7HHjzum7ciIGB/MsrXtxRFysDKaLS6qhD2wWzy3ZHXtG2gPmpB
         wJ5mN2sdTGTDEpIgzkuXui7cyHsWk606qAGe9NfyfhFamdoX2GempSgjjDUFnKIyNGmr
         MonuoMjI4o6XpRXYtimmGeSM7aiKKfgZOPkn9RVsT4Jq3PPg/hcGJ5QpTxP4tV8qSeNr
         PP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEYszmz1b6maXp+qOcJyOQv8oWJtKUU4rpksSTFfGVw=;
        b=n7qu28T+aY+HzwQNmB2tJUbkIwtvzuIXBFe9BX2JgkeVaOzvdH/0FAS0uED/8rT6gQ
         pgLSBLePek/RyFB6kP0Du3gP15nu73Sy/md/9KgCD/FcWxVraXaTbVpmcDCcsXoRQDX/
         X/ismjq9ezgZMF4swVAgAPlFn07xThzbzqdzdLfyMD7nVq4pvGDGT6/JgP4Sedupg2wN
         ckLUqdOu/saNhk7dOEPeXf2SQiA1vhL3TcCqqWLU1/UX02kB+VOWaeFElfQueJg6oBdX
         oESZ+t2K7akzYUvFAHXsXJFRW1P0rLk3SUXlxO31FiDupbvv3Wc2qc3wE0BrsDzwnfpe
         75kQ==
X-Gm-Message-State: AOAM5324077TD7q83YugxLowjAFZcc6/Eu+pW8iJVLAlZqmWBX7ySc8r
	vwruY1kdKeHqPpCxAu7PKA0=
X-Google-Smtp-Source: ABdhPJwgwfzyxR97wHTllkeb2iJrQcs9jcqP/JgFOW+j61f8X21lfyBNE125AAI6BOEVc6vD5qTDNA==
X-Received: by 2002:a5d:61c7:: with SMTP id q7mr4566781wrv.215.1617803402827;
        Wed, 07 Apr 2021 06:50:02 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id h25sm10387338wml.32.2021.04.07.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 05/19] staging: rtl8723bs: remove DBG_871X macro definitions
Date: Wed,  7 Apr 2021 15:49:29 +0200
Message-Id: <53632cddb1da639c84fa52c2818904b0e1298a6e.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_781X macro definitions.

Remove all of the DBG_871X logs as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged, so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6639d79cd7ec..4c159c1a0747 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,7 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define DBG_871X(x, ...) do {} while (0)
 #define MSG_8192C(x, ...) do {} while (0)
 #define DBG_8192C(x, ...) do {} while (0)
 #define DBG_871X_LEVEL(x, ...) do {} while (0)
@@ -197,11 +196,6 @@
 
 #ifdef DEBUG
 #if	defined(_dbgdump)
-	#undef DBG_871X
-	#define DBG_871X(...)     do {\
-		_dbgdump(DRIVER_PREFIX __VA_ARGS__);\
-	} while (0)
-
 	#undef MSG_8192C
 	#define MSG_8192C(...)     do {\
 		_dbgdump(DRIVER_PREFIX __VA_ARGS__);\
-- 
2.20.1

