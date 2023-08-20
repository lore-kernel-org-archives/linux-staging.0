Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78405A3D
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:29 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4108f709210so3481951cf.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492328; x=1693097128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Btu3fz/hzzEnWh5UsyHAJ9P5nBC3gu50dMe6Wq1vPYo=;
        b=kTWrON3fLsUFUr4nSK2n7mfl2MG/sQk/gxPMHkt9vaUS3CNvuJHXB7TFMvQpij7JVH
         XVjKn2oNCTGEkG8JXiFsNdlnSgP9obc///ecZaDEGy5A1JSpKbkTeUFbgSxdRH7xXn/I
         T/NbEv3DvXBQgsRFSahanawc3FEPgAqFhNxTAJgTeBu1qN9NzTzwf0XrCNKngFnuIci7
         oXnCzPQjX4fmKzMkxIzfNFmBH6iAKzX690QmoXcj4+6wgibTwRC9K+ogAKm3fZH4r5rA
         FT2ZZfU9mPXz538FwNOioDJ38q3gqJ3HOj8O3Kyk1DVsgZPAXTs1RUIVy/ggWLOlty3k
         pGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492328; x=1693097128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Btu3fz/hzzEnWh5UsyHAJ9P5nBC3gu50dMe6Wq1vPYo=;
        b=F3+xyVbseGuSf5iARFy6cFdYaeP/sEFnXxZcx8s1i2gsXWIk7f8Aj5ZMEM9wFYhzp7
         fGLoYo11XuKzceNb3itjuJ1vQXVAZrddCnThKYJwHyjT8ppKkdU42bD8ubeIbDr73ENz
         qDBzYsBEw+AaQsJufjWNpBvriwjqbywrRaRLerHhWX1yzVravFtS7S+rVAlgXX0Sx+JG
         Zi3IiprUcIF5kjG7ja8t40qchahlIzhsiFn88DupZAL5ozQfvR3MNu32jSsZwGUHGBaC
         6QfEiH7mH2dkyG7y9dHv7eh/nTMD5923IoXVkInvNMFWhhTco0EBW80jHJIR0QBWjh8+
         CUng==
X-Gm-Message-State: AOJu0Yz2h8kB4uXJ+vYIp/eFphfRHxzNLo/8ifEy/+cRuIhzDwlQHpzi
	LhImWHalPdMjGgH5fL8/9fyfbO/C6USgjhEYOxA3HeUp
X-Google-Smtp-Source: AGHT+IGM/n/vdrW03aY5metSm1eKF1w8dj1Y569wGZwW/NOzkzFFXKmSi5/8w/FmHsRZB6VfzkCmvg==
X-Received: by 2002:ac8:7d13:0:b0:40f:f435:1b2b with SMTP id g19-20020ac87d13000000b0040ff4351b2bmr4985688qtb.24.1692492328492;
        Sat, 19 Aug 2023 17:45:28 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/16] Staging: rtl8192e: Rename variable pTS in function AddReorderEntry()
Date: Sat, 19 Aug 2023 17:47:40 -0700
Message-ID: <20230820004744.278022-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
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
---
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

