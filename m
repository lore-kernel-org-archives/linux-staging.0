Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E271
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w4so12885449wrt.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=AjqC7NnTumKdnkqksajoC/+27I/jmvb7CpNcND4yph3S5YRl6lbeHqJGwfRnWlkg0J
         n7TLfUoFQgxmk0b11WnhKOA/rl3FFraAdVB/5ODdBanIC3Q15Cigisng0l9zyfmzHAn3
         EQnlzex9vvupi7kYneX2grW6QNVldg7a8HOPygECvDQ2LCwYJVTF6bu20KNWom2XVhO9
         WW3cdIXWRoVLZ30HrBM0jJ6IE/VXHDxHMnclcJFva1I6V1pF4CFj0lX9uOY+4kNtX8bj
         hZ+PzamVXRcblDa8cjFroUsfo0G5jiMbPN04eI/qcrQ4eIJw8/7QBEoBJcNp7a5Bu29D
         f3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=o3Q9GAFlFjx0lwiGnDgYpLENd5I4NDGvmGGco5RymB0GPf2gS/n7HX1ijTx7J9gJSF
         JtJthYkWMxnd22JZgdgnKUjXE11F808sF9q0mGTVmjh0kWjPSOaX24AUWr8w6dBMtgRc
         oyc3M4HOlmyRtILTOmHuxO68SJkOjDdiopMW49IqEsABrQwoBiQqxR6exAKAa8aDXfUl
         0RbnqvFfsiKkd67L5RfovFpiBgip1HGu7IJETgSrNAa9RyI2gYX7bphviJp2fHVZr84Y
         G0D9kSm+ocEeO6BmK+LYATu935VfUiwymI6wIhdOjrRcRh+JqY13efR8O93xzjVDQggX
         hNqQ==
X-Gm-Message-State: AOAM533s2btrZy14T9AyTGZhlWGXMu2AxVKRQchdxiF2YPknxK+0hXDx
	mTrlQfcvbyBhYgMEDFrj2ZQ=
X-Google-Smtp-Source: ABdhPJwh491G5m7V9l1l4klrj8KgHm55jZ0xL2TlOTb8oMz+Bl5QvQlPr1gBzfZRjF7CKIj2EgH/fQ==
X-Received: by 2002:adf:f844:: with SMTP id d4mr19224032wrq.203.1618323055321;
        Tue, 13 Apr 2021 07:10:55 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id t20sm2484713wmi.35.2021.04.13.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] staging: rtl8723bs: remove DBG_871X_SEL_NL macro declaration
Date: Tue, 13 Apr 2021 16:10:41 +0200
Message-Id: <412587ee7cc21572b68af564dc58f738aee2338d.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_871X_SEL_NL obsolete macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index f1b37d511f27..12873c3d801d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -181,15 +181,6 @@
 			seq_printf(sel, fmt, ##arg);			\
 	} while (0)
 
-/* dump message to selected 'stream' with driver-defined prefix */
-#define DBG_871X_SEL_NL(sel, fmt, arg...)				\
-	do {								\
-		if (sel == RTW_DBGDUMP)					\
-			DBG_871X_LEVEL(_drv_always_, fmt, ##arg);	\
-		else							\
-			seq_printf(sel, fmt, ##arg);			\
-	} while (0)
-
 #endif /* defined(_dbgdump) */
 
 void sd_f0_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

