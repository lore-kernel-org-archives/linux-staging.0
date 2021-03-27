Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5FE5F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 00:18:15 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id by2so3824865qvb.11
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULl5i6QZDGcY8rf+lBVOmLulCqLPblhBV9u/OHfmxIo=;
        b=SZPVixsRU4T/+wDGHGnnn4dW5c+dn9WsH3fDrURS4ytCYT6h2Wyck4pN+St7zliWA/
         rNtTqAUMfjkXVu1jB/P/KJmYcga39rig0TLg46Ow0x3uJzxcex5JmjartKuXvBQL5FQQ
         uIY/e1MQizrEOkDvm42cQgi6GJBGbTB5dpnJrdL48Z9utlB6ASuHJhq5jRQvkaxn+4A8
         5TdoeBmyjufsq/cXh3EqeYQ/cHD0cz1ILprbQxHrMa1dl8tYqqdsWlEG73iO5WaXN4L1
         NwWg6fUMOhU0/8IyTEdVb1sbxGtJjfO/tFENh40v+Ca/R0uLFLCMzSUOe3Ul5YWASx0P
         NQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULl5i6QZDGcY8rf+lBVOmLulCqLPblhBV9u/OHfmxIo=;
        b=pLaIxW0euIG4sC4sSavfQQ6rDgkz2jsNQFIyhpmTlwK0VI6Bjc/q64+4qjbbLcWN0a
         OeCVH3cCGuJ1uyxqyQasujApj/osUKXpmYM8E+Z/UTdD8KEDh4iHPEAanDmeOvMtDYoP
         Nt6bj0EwStkeAOcHu6ljks3T4iLllrrMDBh7QjDl1bkqEAHTK+D7lPWvm1Ql3gZGPwZH
         Az2YpfZnQk1g91ln+ftNGPLZnsAG36m/IlJTYzhVZWQnvim3m1ezglyLRVTU1eCYvErP
         adTt/e9MGoSTf3CFMmzpQSiy9kECT+fN/EZ9/tuxNXTJL7OrXXhg2JdHWIQSjnm5yCGc
         YWng==
X-Gm-Message-State: AOAM533PcgZ+eMpLQbZ+xd76Dn5lxEPf6C4wFfazPRrtimSPdIm5MuEP
	COCx9IR4kEBSaZ7sWrpjv0mJHWTZxIolvDM4
X-Google-Smtp-Source: ABdhPJy2jhMeUMdNwm9j8YTRpZuoCLE6G2V9G3zpV5UAso2l08IN32RaUh4efigi224YqiI1HsSA6A==
X-Received: by 2002:a05:6214:1424:: with SMTP id o4mr15674997qvx.34.1616804294924;
        Fri, 26 Mar 2021 17:18:14 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:14 -0700 (PDT)
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com,
	fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 4/6] staging: rtl8723bs: sdio_ops: removing unused variable
Date: Fri, 26 Mar 2021 18:17:34 -0600
Message-Id: <20210327001736.180881-4-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Inside sd_int_dpc(), variable report is set but it's never read.
Getting rid of it.

Removing this warning:

drivers/staging/rtl8723bs/hal/sdio_ops.c:946:30: warning: variable ‘report’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 170a28f4b191..a24a39e70454 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -943,11 +943,9 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_CPWM1) {
-		struct reportpwrstate_parm report;
-
 		del_timer_sync(&(pwrctl->pwr_rpwm_timer));
 
-		report.state = SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
+		SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
 
 		_set_workitem(&(pwrctl->cpwm_event));
 	}
-- 
2.30.2

