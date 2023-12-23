Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1B1368
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="A5kivh4x"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35fd902c6b5so11662535ab.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296788; x=1703901588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqmGALmfQVkTxvHATe/0a3Ev0Lr0lTuyhbxTn9L9dQU=;
        b=A5kivh4xGx7dknoYHVDiAHC1cKMQ/wGWcU4NmLfgb5VNXpW6CJ+EH6UzVrctjSDVnt
         DzAAibKTAP9TfF7uwVIm8Fojm9yJLqP83y0ET45WLUp+SvtOLNsp0Fa/LhGMcRv3Bsol
         hHI2j1ozo2TmMHex8qRvxhH+U0SudOMekfsg5DQst9hlozjeNLnwVIa88nrerUxPabUm
         xR4d2Jn9Q5+tHObkWr4W9GizsDptiTDSLWrJ2wb3KJIoUqB2PE9hRcFpkbOih9o0EW42
         P9aHaBWIugdZmFlP/b5nqeFc3a7SEYfrgbxEeOdSJSqJb4I+Mj1y0zZ0H/yABWI/ufjm
         gWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296788; x=1703901588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqmGALmfQVkTxvHATe/0a3Ev0Lr0lTuyhbxTn9L9dQU=;
        b=ePj0lJ5JR3i38HIe46B+1k/D2Vbj1yCwN12LVRSlxGmzgzrJPUsNnMAhciGLgsJdRZ
         fprT6mwj0MBgE7ZAVpAx5zIRVg+MNtL+bXRotivrCRTCoo8QFJixiaET4P0kSEy0L3sW
         rg+Y5kKZwFQ/xsj9FXQ/PHI8rPTsDF4mHND1+V47Vw0oUUCsti3yconV+AePmTmhExrb
         rcU/oWVWAD/7TdH1U9KKiwQeLlYqgAa403kfL/q55dQswZtlz8OPd8j5yrua218UgywW
         may2OXOmZsF+TC2lBY2IWxZi1LklrJfV5OUpD1FRrRDDm8ZTL/52Xp7DfMqKNMvug8fQ
         o4AQ==
X-Gm-Message-State: AOJu0Yy774ydh91Pb7p97nTQYQgCaMytQSMgq/FizZbDOmvW++SlUh74
	mbfUEXxT6aSjoPlJf672/dt5TeHNdxr5lTc0NjDSwjMUvAA=
X-Google-Smtp-Source: AGHT+IGD8u4BhnPYDDNlhLY8nlTXK8tfMq4LjOnrLoQMzup6+RsbjjF/OEbk5ve4O/FBmhhLit0Few==
X-Received: by 2002:a05:6e02:1c8c:b0:35f:d91f:baf1 with SMTP id w12-20020a056e021c8c00b0035fd91fbaf1mr2755492ill.93.1703296788317;
        Fri, 22 Dec 2023 17:59:48 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:47 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/20] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_association_req()
Date: Fri, 22 Dec 2023 17:59:25 -0800
Message-Id: <20231223015942.418263-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove parentheses to fix checkpatch Warning:
Unnecessary parentheses around hdr->info_element[0].id

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 8b689e828864..960cc86ac23b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -917,7 +917,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	kfree(ieee->assocreq_ies);
 	ieee->assocreq_ies = NULL;
-	ies = &(hdr->info_element[0].id);
+	ies = &hdr->info_element[0].id;
 	ieee->assocreq_ies_len = (skb->data + skb->len) - ies;
 	ieee->assocreq_ies = kmemdup(ies, ieee->assocreq_ies_len, GFP_ATOMIC);
 	if (!ieee->assocreq_ies)
-- 
2.39.2

