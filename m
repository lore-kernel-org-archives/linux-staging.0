Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979205663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZR32L0RY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cf8e569c35so21191305ad.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063380; x=1701668180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoeWuGVtTlW2JdoiNx27SMyvvU67YTUEiN2AiR6Cm+c=;
        b=ZR32L0RYyTfFNpZtWbS+43+NiRQfgpeDg/7wKPpSv+z8uVidB2UFD3kpwvND/gxx1F
         5KZXhQZaaZKZ5HvPXZb0RInzuxzthU8Wmvd2KgF4RyxznUhPC6pknINOAumxshEsOUQ+
         pWPeBmAjcDPmwrpar9Gig66L3RlNPdZAWRLsTRMHsuI7Eons8Ok11h7iSN53ADAIOOQj
         v03BlMEtyY6oP686TILzoKsu9HbksBWXQRB+zP0SMchYt8cdPsZ8yEhphRnM5L6XwM9N
         JD85lCM/6NUU3FZcBkGKfPyU9TK96KdtVhI173KynJYTaUvhxRNZa+lwh0R7s5S4nL5G
         mrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063380; x=1701668180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoeWuGVtTlW2JdoiNx27SMyvvU67YTUEiN2AiR6Cm+c=;
        b=dtQ6ANJ1Si+Xh919UXfv08SNx7z/bdyehK9TYV6ho5sGAMO6Uf2Q5KGXS/Zdz2r9gw
         UNCuRa5jwV73QBlHhyxoRrL34GiIVFwX5yPt90H8mx+yCtB4e2Y3jwPEJp72lM0Jip8U
         lK6ndUKVXvjN6EnyCNwHnccGxxh+WcbRvpLjLlUPM5wYLGQnfFW8aZCbS8AASrytRG5W
         CgYkO4NzfgbhaS/G/XTJqPQWudXPYGGODEtbTDxkGq5tjZ0s7rrRZpIH+ir7wCJN6xKA
         kRFxGqA8nVluy0DyMZBAGfcIQ+9YL+eC6LEpeIUGYut19jb7OaCvc7Mhkh5b0HfLIwBh
         v5cA==
X-Gm-Message-State: AOJu0YwrM4p+sM1j4dgtnzfNsOB4K4OpcuD0nWdHHvyef+7LryO4wYK8
	azzpcFBPxJNVFg0b+oy6PzgF+Q==
X-Google-Smtp-Source: AGHT+IGwH33yIyeMw5+JjU7swS3KzlABo0WP0t0L2s4Q3aTp+hcLsSMuue5LeZz6wvQJ1xkJ9sR9Ng==
X-Received: by 2002:a17:903:2292:b0:1cf:ba9d:abc0 with SMTP id b18-20020a170903229200b001cfba9dabc0mr5472868plh.67.1701063379679;
        Sun, 26 Nov 2023 21:36:19 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:19 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/15] Staging: rtl8192e: Rename variable Delba
Date: Sun, 26 Nov 2023 21:42:53 -0800
Message-ID: <20231127054305.148276-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Delba to del_ba to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index f6ba922dc82e..06aaae68aa6a 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -129,7 +129,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 {
 	union delba_param_set DelbaParamSet;
 	struct sk_buff *skb = NULL;
-	struct ieee80211_hdr_3addr *Delba = NULL;
+	struct ieee80211_hdr_3addr *del_ba = NULL;
 	u8 *tag = NULL;
 	u16 len = 6 + ieee->tx_headroom;
 
@@ -148,12 +148,12 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	Delba = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
+	del_ba = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
-	ether_addr_copy(Delba->addr1, dst);
-	ether_addr_copy(Delba->addr2, ieee->dev->dev_addr);
-	ether_addr_copy(Delba->addr3, ieee->current_network.bssid);
-	Delba->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
+	ether_addr_copy(del_ba->addr1, dst);
+	ether_addr_copy(del_ba->addr2, ieee->dev->dev_addr);
+	ether_addr_copy(del_ba->addr3, ieee->current_network.bssid);
+	del_ba->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
 
 	tag = skb_put(skb, 6);
 
-- 
2.39.2

