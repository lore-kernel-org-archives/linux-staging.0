Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEC7081F
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810169; cv=none; b=eCldRSVWEZIs94ITIdYLFhFQZGyUW1ic6ToVOwnwKhpAN7fMUyk6GsiKJuRKzHPht+gJMc6rGW0L4BfNwM8SWzNnppuhehI40P0VShb5SSLbMq8/z5sE6JZvvq/xN8SLP9XpTnRQZwOHbu6stLwO8/10dndwUF6/QRF1FxGDPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810169; c=relaxed/simple;
	bh=I4h+Hb85bL/zpjRA/hGHNI3yGfnFlHifIvIALM1Wh7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Um0PovnGKs71DdmyouwNjt8o2YmY7LFG8rUuj42vEMJjEEta0BIpHb7CHzkE06sRLLGz4Ku5R/fRKg4XlfNLHz+ziM/RtifJ2u1QFa/ZGdhsTQTCNBQIME7x4ONTX270byyoONS1XwyNi4+W4rzQdxJA7sRYtELmg82lBoyCA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs6qAyAc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs6qAyAc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso23466205e9.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810164; x=1775414964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=Qs6qAyAcaW0+JLy6CiqQiXlpz8sZWZ4QnakyXfh3e6Mct3S1WjrqM8fpwl0MOQ/J5X
         LeV4ID8wNFn/B4VS8n6xMCC5QEJ5eXdxOAUfJ3xuqfIHRFybvqjAOQHepLtGjuFYv3HW
         weom3DuBQ2Cp+xIVQsQznITHhQOtCl4a+fqg6GllbUQ7PUIDf1/6PMMlXjER4GIq4Hgb
         VY2YUdCodrzWHifJf/7z6ChIATIFuauGfzWpaOFSLzc0tCyFfd6S3vJS79XZUyGBorWf
         yu2ZtVv9YPt7dowDry5Ah8MJx5hQWZ6iDDfzxDKlhNi5RO1xjsSLxLsu3OTX15oG/kxv
         lDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810164; x=1775414964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=JyACwvidX5ihuPCRSLabIrCD82M1kS+aXOF0KG/OmQC3NIhUPSZoYYY43Ev1XpJKVG
         3Q2zeVG8xznjwGPFkzilKuBa+MtFpMNq4P1wJNGgcrlpFzN02gAEFAuatfJC89SbbRcc
         W/gS1rNUZCo7ByigVkMrnMoRn5TP8RmDVE8+WyUg2xHSNxd/HhxghBXL1qEPV6vifo0E
         CsSVb9pMCLc1d6E6xPN1wriOgE377ngRHm4ZzAD7FbJ4Bw4bR/Njc8yRyAtT8j8qLltE
         z0dwuvvZ5/cpQ6JU4ALkBqOkJECOx5sFtMy/cxxcyDHEAc0Fwxb0YhmadMdE6e+XsoC2
         C8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNqzbgHELNuoelckWtVFtuvYRgPOZIs9I3V+2+8iczt2A+P4tPua6LNjVc0WXr3ztZaRTb7DYJF/OQ1Qht@lists.linux.dev
X-Gm-Message-State: AOJu0YwXb+8iym10ySwwU409vXEbg7KNyCEvyk7aQatCUvVLH+0yQXJT
	up85sPXLyzeJYN4NzwhMgFiWtFf0MCYowOuuv75KpshaROd+tVrMVxE5
X-Gm-Gg: ATEYQzyC66jKYbxSy+1Z/IDeLmLq0hT8LnZglfrjtPQ1t53x+ids/WJmQdgM3sSg4Om
	akw7zo2j4qmXRr8a7TYLmcVtvjG3jAfk/M6GGzSO9a/1w7Qe5ch4+oiFpU2v2zsw1H1ga7QXz2P
	0hExeTUNbzLms+u9fFnQ5SZzVc6V8Gn68KIs82pQOom10EB07s6wWRY6xjBGqU9VPGBCq99DlQ5
	uigG+t81Ps++xeLoP0WfLxXgIUvJt1hS3tep10f1CRA6wWIZu8hozS7w1Hkp/hFKgejpbev9Xzw
	Ff3hE3D65ro6FsScTBwGTpXQPz1r0wAzsrIXsHShmpTwSxOLWsBtvdq4qVy5scW4zGkr4pwnLjD
	03jnTvCi/RBYgMbSlVUJ6lTdKSadwnA9jGdWpLHvzMkr1RgjSA+g8uBTroj4lOGrv7k6URpnZRq
	kI0z6fg3T291mJRcTI4OYD3b8IL2JU2NPcGGw874FYCs+4Hh4mpbs=
X-Received: by 2002:a05:6000:2701:b0:43b:9b0a:7e80 with SMTP id ffacd0b85a97d-43b9b0a816bmr11756256f8f.3.1774810164251;
        Sun, 29 Mar 2026 11:49:24 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:23 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 3/4] staging: media: atomisp: reformat block comments
Date: Sun, 29 Mar 2026 21:48:09 +0300
Message-ID: <20260329184810.455285-4-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing asterisks to block comments to conform with the
standard Linux kernel comment style.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 6420436d88f7..c65a5be8445a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -100,8 +100,9 @@ typedef enum {
 	N_GDC_ID
 } gdc_ID_t;
 
-/* this extra define is needed because we want to use it also
-   in the preprocessor, and that doesn't work with enums.
+/*
+ * this extra define is needed because we want to use it also
+ * in the preprocessor, and that doesn't work with enums.
  */
 #define N_GDC_ID_CPP 2
 
-- 
2.43.0

