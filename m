Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715FBD267
	for <linux-staging@lists.linux.dev>; Fri, 15 Dec 2023 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LH3c/Zdm"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-426113f0ae6so412821cf.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Dec 2023 19:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702610979; x=1703215779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/xfwvK3tMuaBxwp2WhVM1G1Tt3nsJ10bTSRDiKNOns=;
        b=LH3c/Zdm6uMvOEH/t53WxI6SJNJ0brvdEf54Z9K8jFInbEOHalRMWduqs0U3gM/U6Q
         35pe48tt0vk1jsALtU6/B+chE6cJNwPnCREcANADAlFgVJAmdkhWp5s+rsE3KaDyJL4C
         fegfoQrX1kT6s00zqKek5n0b2/eXjkxIC/x23SOWuVj+qse6LZLHHEGUM+qPheSj/wlk
         qzG5/P9YN6ZXLPd/sqI6RffLANvk+jnnKHCjx5D3vS7ElrIaYgiBcVUi9L4yH8CTUc8A
         IrUYNgC34wj62uM8EjdP4Euyrt+woYVOGaGbDzwwRwQ9ycs5gJ28Ea/a5RuzxLcxof17
         hRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702610979; x=1703215779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/xfwvK3tMuaBxwp2WhVM1G1Tt3nsJ10bTSRDiKNOns=;
        b=p+JLFS9JGBmzBAZan025UdJfd1Ga2akQuU7kXssPVaoOYn6WOo1feQohJ8g7yEJr0m
         ifwZ7kJc+gOLx7dQzS5jFiA6lBrLk2abAopIGAz3/m+QfgefouHsH6qG+Nyu8Ky3MVnA
         UUhaDffePbDGb3hVsVmmbPKC5BQkRhAR83IAqJEiG0HOXxV6NSyM2eiifO6WXifkI4Ok
         gKqHDnSjTw6lHTIVvHI25WaSsWjteCFUIkASL4g1Vn+BfGS2GB9HCNBWpr+dptM7xtJ3
         4K0iObdW7CAPCVIoJlvuNj/DIS4eU4DMx8DF3iRY+NJAtAACxzeXHZzZvPPu7gX64xDt
         JBRw==
X-Gm-Message-State: AOJu0YwcbvF/wsOidpWUMJEtEKseawWJtNkGurw0zb7G+iKbNhj2Wk0v
	WXvRV0DScmfGpRA6QA5PoHA=
X-Google-Smtp-Source: AGHT+IEv1o7rVooQvXq9j/N2ugeieTK0xz0y3K5QtayIgEVsXCo3GQtTCZTsFxPIqBQuCLca0n9siA==
X-Received: by 2002:ac8:59c4:0:b0:425:7326:e9b8 with SMTP id f4-20020ac859c4000000b004257326e9b8mr16756106qtf.68.1702610979353;
        Thu, 14 Dec 2023 19:29:39 -0800 (PST)
Received: from c853c274fc8e.taild933d.ts.net ([97.109.250.36])
        by smtp.gmail.com with ESMTPSA id c2-20020ac853c2000000b004258641a372sm6345597qtq.45.2023.12.14.19.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 19:29:38 -0800 (PST)
From: Nathan DSilva <expitau@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net,
	kamrankhadijadj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	expitau@gmail.com
Subject: [PATCH] staging: rtl8192e: Add blank line after declarations
Date: Fri, 15 Dec 2023 03:28:52 +0000
Message-ID: <20231215032852.501316-1-expitau@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found using checkpatch, removes one warning about line breaks after
declarations.

This is my first patch, feedback is welcome. I am submitting this as a test
before moving to other subsystems to (hopefully) make more meaningful
contributions.

Signed-off-by: Nathan DSilva <expitau@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ecaa4dec3f94..397859c7f5b1 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -946,6 +946,7 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hd
 {
 	u8 type, stype;
 	u16 fc = le16_to_cpu(hdr->frame_control);
+
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
 
-- 
2.43.0
