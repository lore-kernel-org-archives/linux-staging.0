Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729E29CA
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 10:55:49 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z21so15257960edb.5
        for <linux-staging@lists.linux.dev>; Mon, 08 Nov 2021 02:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNfZ6uMilvryu7GOeBols/pZXZY1MA2eNPOG6Jq/4aE=;
        b=U6/HA5p3cWuErRNeCPFky87n13xC42GPv4nrDR0gbY2gmrn+ebDtFFI2KFSqRVA8w9
         sOvpJUlzvyFaqyAHLWTG0d1jO1ESIuUOsmI7Yr0xTa/igyFZyMRi9xzpp6tKBaln5hr1
         +ieS+RiQVx5e4zERv7D2tkbG3bW16i7yinhi/tTZMJmgRNfQmLB4grolMp3/mpgOP59e
         +RL9WS/kJcBUrdGGeN2Fglgh26MUnGI2D56JPKdsxflxQRLjV1Nkcm2QTAUgEXoy4JiT
         T/LLw+EX2OxCQ7jWfmz6P1Itg4cI+DvI5KmtJiWYcxncPb0bAI6aLGma18pyYJ6Kg3Wi
         5omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNfZ6uMilvryu7GOeBols/pZXZY1MA2eNPOG6Jq/4aE=;
        b=LrLuPE9ZFztoseekgBi7qBbPpzUUQGQKwev0S17GkOd2ha39ioFbaexpZdgOdvvJnE
         FMrAzaXqW8SJ7/R0Uz9BGGQBqa+MRuJaUdKWWISn3RZAWRyyyaOX7jI+D1r428Z5q6qH
         Pdh1PrWRqLvogFU1ACIy9jc6CnSZPU2l4cUD2FSGm2O39ZW8gMKpTjx1qZtS29V6NiTu
         IRH0VLkD29HZpG7ZCemE35SdTb6k9D2j65ys4HhieIbPKlRdZsUitzTk/FylNM0cCHpL
         bJtfkFffROGFAPZtq6S6MdCuPF6RQ3tS5OTD17TISsrQHmVh9JCJcwsCX1XYIuuJcQEv
         L3Cw==
X-Gm-Message-State: AOAM5337oaNjcgpw7KOPV/purhZ70kpZaB77vSQliYDjIQWG0BNeNnrT
	u9QqIOu+tRjynCU5OyrzoFQ=
X-Google-Smtp-Source: ABdhPJw45JqAdv9ir6/uvLoZyLi0420BmFuUQmuzlpYjj5tfePpXzhhGGK88crc5ORPybLmIPd0E1Q==
X-Received: by 2002:a05:6402:10cd:: with SMTP id p13mr106801534edu.111.1636368948149;
        Mon, 08 Nov 2021 02:55:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::38bf])
        by smtp.gmail.com with ESMTPSA id b19sm7747051ejc.107.2021.11.08.02.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 02:55:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: use GFP_ATOMIC under spinlock
Date: Mon,  8 Nov 2021 11:55:37 +0100
Message-Id: <20211108105537.31655-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function rtw_report_sec_ie() kzalloc() is called under a spinlock,
so the allocation have to be atomic.

Call tree:

-> rtw_select_and_join_from_scanned_queue() <- takes a spinlock
   -> rtw_joinbss_cmd()
      -> rtw_restruct_sec_ie()
         -> rtw_report_sec_ie()

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/mlme_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index a9b6ffdbf31a..f7ce724ebf87 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -112,7 +112,7 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 	buff = NULL;
 	if (authmode == _WPA_IE_ID_) {
-		buff = kzalloc(IW_CUSTOM_MAX, GFP_KERNEL);
+		buff = kzalloc(IW_CUSTOM_MAX, GFP_ATOMIC);
 		if (!buff)
 			return;
 		p = buff;
-- 
2.33.1

