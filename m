Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588DE101E9
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:29 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68c3b9f8333so17939b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972389; x=1693577189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA6Tm2kwkGXqxyYc7/1C4cf4CRJysy9kcmoHpsNSe5c=;
        b=H/HjUBizQqV6KkG7sKqXRhwSxx+ieTwJlZdxRhh+v94ULQFRZEiz158JCBchpZnB7c
         w6cDUZTNTP1UF1uSEeQsdJc1R0Nko1gnMpeMEJMZ20S9DPPSAzft6Vq4FKvRGrAuiBG0
         0LZ8qaGjmCvW3YQgERlL+eNfncTzideVtyPH3iOgFyS3oP0uxjrLbmOb4ZXCZ5ai4gjt
         dCWvynfWdpKL6zU7cN5vdmyqbtRGOVdWUT9BQAX5Mzh1bv81x6N5EAZmpTtXmnfehMlE
         8dQ8fK6En8LkJTAVLolInkh6y4TfZ7O9yXQvqDocl1vnDCYwv86jeH70mb0xFSgWnC3y
         0aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972389; x=1693577189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA6Tm2kwkGXqxyYc7/1C4cf4CRJysy9kcmoHpsNSe5c=;
        b=TpH7yTTKv0ConKu6ouiJ6CqJ5ZNTvlLtK3hir0VDEGLavxyAfRpM99q/XSzOGP0E1Z
         zIEy9q5gJHP6vz5OslG1htMZDU+3LKmJSZWAUzStYeuffaVAxTKp+Dzg78aVSvyywM/w
         8yORkD6piClnQR6Tc5GbbR/dhp3eAhFtwFsV5OmUMB+pK+QBuDUY9B8R94UHeYWa5dd0
         0+nUUFhq1LiHhiDkjQwiQICVrJrmIoaHuJ5uwJQGmIHsmKtK/tISjm9/7veSqKZhX/D2
         eT4QIG3HYsOvx0FZkMtZgUW7eXGYe2HIALepKIoXUSASfvmwWVHyotlis4n9V9tDdbBQ
         grrQ==
X-Gm-Message-State: AOJu0YwHpr2ZZd3W2xQKKZeZWx0ZlTExQthD3IHb1AoGfx6rR4gmMjsD
	Kw1jQ5JmSnM93EEipOulmGwPnQ==
X-Google-Smtp-Source: AGHT+IHrH5+zMu4tyX2X/oRuZzH9gWY9XNa9o5EzpCZtD85cf37iNnxMgbl+QGWrnqBdjTHjzt8nRg==
X-Received: by 2002:a05:6a20:7346:b0:13f:13cb:bc50 with SMTP id v6-20020a056a20734600b0013f13cbbc50mr28019628pzc.25.1692972388667;
        Fri, 25 Aug 2023 07:06:28 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 12/16] Staging: rtl8192e: Rename variable pTS in function AddReorderEntry()
Date: Fri, 25 Aug 2023 07:08:43 -0700
Message-ID: <20230825140847.501113-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTS in function AddReorderEntry() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 8a4029f26835..1d41f62fa346 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -435,12 +435,12 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	return 1;
 }
 
-static bool AddReorderEntry(struct rx_ts_record *pTS,
+static bool AddReorderEntry(struct rx_ts_record *ts,
 			    struct rx_reorder_entry *pReorderEntry)
 {
-	struct list_head *pList = &pTS->rx_pending_pkt_list;
+	struct list_head *pList = &ts->rx_pending_pkt_list;
 
-	while (pList->next != &pTS->rx_pending_pkt_list) {
+	while (pList->next != &ts->rx_pending_pkt_list) {
 		if (SN_LESS(pReorderEntry->SeqNum, ((struct rx_reorder_entry *)
 		    list_entry(pList->next, struct rx_reorder_entry,
 		    List))->SeqNum))
-- 
2.41.0

