Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897B29CA
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 16:47:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id s15so11848750pfk.6
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ansSlz8HDsJB8ecrOJ3F72s+yUKx5QSDGORnGt8rLcg=;
        b=LTMafr+N1w+Gnu1qx/mswRZsY++dpxOT1v/3jtQOnzAAiDCVlm/Rw9C5qFtLrEo9Uh
         YNOk1Gz8KnuYJMLKjFi1VLkduP63K7hhYL7Z7UZQVKp6qxTjhimXCRa0PaX7qcpTa83R
         Qvg9K/MGDoE/KfTydpyETWdLQNfEaMWM3ZuwHC7mvxPG9qjJpyDERY+7jNT1a/1FRcsc
         qXCsj0C7huUmVT0KTMF0q1+vWYopFY0zokA0aiPW4Ssf7WE3Fk8DEgvJoQZxtOCGO9IB
         AQa2U6iY3ToVdFXfCszXz58sXKC4+0+lK79tnh4fzAtgSW+oenucTm9er+ZxMDsWqNHf
         3gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ansSlz8HDsJB8ecrOJ3F72s+yUKx5QSDGORnGt8rLcg=;
        b=rPP/zoxo3FMgDnFlmlq7Y8hj+laehsDZuj1emeV8rW8Rf3Lb7t24xZKhti4BK4YGUF
         AiuakOW7cEXBLLoG0WEUcU9/iy4KY+oo4FztWzOfJSx/7hzQEvqMDmnjvHONhg3luiE4
         OiJFH7FbT8BPI0rNIwX/9IflwQkc89NSHl2sSY+S4GSLiMFiY6nuOiKG19hskrIe8hMl
         BR93CW9XWP624cbk3oWyhRgmDkG7IBEYwQpWIkz7HKqxC7yBd3fJAD3NBhVs533R7YcS
         qFaDS6nI308R4Pj6fXp91u1z7H0PaskTUp/tI8p5jcJgD6UVvnbQEvWmTmqubuNlGHAk
         j+Yw==
X-Gm-Message-State: AOAM532W57fA4L4zEU1mRFf6y9VYyACrjJRS+vbMmZpOZEalAl2EG1V1
	oeqcCOmkC1LkSoUR2pK/+yc=
X-Google-Smtp-Source: ABdhPJy5FOMhkI4iy6O+TYeQ+qNRJhhIbEpvKYFdzOgbG+ObnTYy4gslK29ZKTC/77nLlYOZ7AIbqA==
X-Received: by 2002:a63:7d3:: with SMTP id 202mr12617172pgh.120.1640537231877;
        Sun, 26 Dec 2021 08:47:11 -0800 (PST)
Received: from localhost.localdomain ([103.230.148.190])
        by smtp.gmail.com with ESMTPSA id n14sm12236759pgd.80.2021.12.26.08.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 08:47:11 -0800 (PST)
From: Gautam Menghani <gautammenghani14@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	gascoar@gmail.com,
	ojaswin98@gmail.com
Cc: Gautam Menghani <gautammenghani14@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Remove repeated word in vchiq log warning
Date: Sun, 26 Dec 2021 22:16:32 +0530
Message-Id: <20211226164632.48952-1-gautammenghani14@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gautam Menghani <gautammenghani14@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c650a32bcedf..6759a6261500 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1661,7 +1661,7 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 				  service_data[i].clientid, service_data[i].use_count,
 				  service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count count %d", peer_count);
+	vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count %d", peer_count);
 	vchiq_log_warning(vchiq_susp_log_level, "--- Overall vchiq instance use count %d",
 			  vc_use_count);
 
-- 
2.25.1

