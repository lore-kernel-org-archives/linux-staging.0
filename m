Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5EE5F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e9so16823112wrw.10
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fG/ia2hCPgGAHd91NlRj5zr40qf0Vpf+jJXPm3SaaJo=;
        b=fjzzWjA9kNVieMvEG/TYM0eIg6I24azwM61gr3TknYqXg65po1fx3IqA7NqPato0ps
         AN2/mQiUsj2I57gGyD4RJbTlQeFAMkNgAFO47GDEQ5wmHiK/PkKL+6TioKJ9PlmdnMSl
         ucBcDdysM4Q6aDeW+I1YmT4nLZfQhg0yA5JE4zJVgt3JIS4gr9IJWOVoCdIFk1kH0enx
         zzk06oxxWqENqC8L5oFvN9oCYXpagHu0Cu/RMjCkJbH4iXE4Jy9Aacv8vImhZSqSxWOM
         bwTUv+1bS8iStFPwctgpidBNl8XpZHbnMXd/Dvm+pd67tzdcgE3yRSJVqvy7/fWitKVn
         kXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fG/ia2hCPgGAHd91NlRj5zr40qf0Vpf+jJXPm3SaaJo=;
        b=DgZF3PXsnU0yIFlv7PV0/dhu2k21CJmUtx/ADws0wmGeUHic4kO5tyRvViNrPdrWIZ
         T40zhdXbuuh1aJlEY95q1ryvF/NQdb0lr4PyVlDfN+xgBC9IYhQdtLKvT9ym/o7vBQyp
         wB2Br+Od6kTTj1QAp0EyHsHleyN5QUBdeGnFaE0rZjLPzdxsJIjJhNqPMW1azUpf6xAA
         mkKcLKMOiWac8j5nql0fMZHHSA/9l+oyAahpZLFw7o7Y6YWLrJ3HObKQcqaatNoWaO8Y
         i1nP7i7F1N2o2IrloMGntdYhnOTI+Bwu66uocRTaoptkLlasf7M8OldsummH+aNP8Okz
         cBVw==
X-Gm-Message-State: AOAM531eh9BbbulMCY+7UNVWqYrTreTTYxe8T3fcqIzPQx8+hVyPJzYu
	HGpNNU/IJRIAeO+C6DzLEgY=
X-Google-Smtp-Source: ABdhPJwBEAHWBiVUgUc5L64yzxlBzmKS0xPL7p8ic7nGyE3OS/8lv4dlTRL4u3cnW1zp6PnhPvHW5A==
X-Received: by 2002:a1c:a7d3:: with SMTP id q202mr15859778wme.93.1616420238054;
        Mon, 22 Mar 2021 06:37:18 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:17 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 09/19] Staging: rtl8723bs: remove useless structs in rtw_event.h
Date: Mon, 22 Mar 2021 14:37:07 +0100
Message-Id: <20210322133717.17797-10-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/rtw_event.h:

	struct addba_event
	struct c2hevent_queue

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_event.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_event.h b/drivers/staging/rtl8723bs/include/rtw_event.h
index 560521c80ace..d48bae5416fe 100644
--- a/drivers/staging/rtl8723bs/include/rtw_event.h
+++ b/drivers/staging/rtl8723bs/include/rtw_event.h
@@ -60,10 +60,6 @@ struct stadel_event {
  int mac_id;
 };
 
-struct addba_event {
-	unsigned int tid;
-};
-
 struct wmm_event {
 	unsigned char wmm;
 };
@@ -88,13 +84,6 @@ struct event_node {
 	int	caller_ff_sz;
 };
 
-struct c2hevent_queue {
-	volatile int	head;
-	volatile int	tail;
-	struct	event_node	nodes[C2HEVENT_SZ];
-	unsigned char seq;
-};
-
 #define NETWORK_QUEUE_SZ	4
 
 struct network_queue {
-- 
2.30.2

