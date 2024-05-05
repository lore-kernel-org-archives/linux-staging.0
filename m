Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491217CD
	for <linux-staging@lists.linux.dev>; Sun,  5 May 2024 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714879782; cv=none; b=DtWT2JKLj1I7SWJDU1bRqmIoxPnFhedUwAxb0zqpjriIZzdKcLmb4IJo8Db0geMhapCjXo//z11mPqhNCsW82L3VpBgxbDtieJGT/PhMXVNix5Il38UtIqOVU7gzIG+fLGPBf5pWoTAVN3MpZmCKXyrSQCTh5yfH8iTrIrgPJg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714879782; c=relaxed/simple;
	bh=4i0Oujjns/PW7PTcWJ+RumP3mTxmEGwuf9DHk12FuN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nv3X2rXoYdofmZIFeR2S+X/JxNwoDmKS3XIms6xm7PH9vF50tWzosX1y+p4Oa2Hz3NrezArPMIMz0/BGGvYRvUHvx5yHaOk2cpS8u8YltansUaG2OWbR3rNbFBtunObpENqNczy3wsNrNWEWcPw570HzODvzQrGRWxPMf2R7pHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpvCORRs; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpvCORRs"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-23db0b5dd28so650234fac.2
        for <linux-staging@lists.linux.dev>; Sat, 04 May 2024 20:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714879780; x=1715484580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoXNPfWEXlDGV6z3+1F8Nm/sflOvF+RNEkcMkhPNqA=;
        b=YpvCORRsDkxOvdruwSLl3e1z7hSeym4wE5JJmm9/3MvSXMHY0roFs4hwvnLB+LuAY+
         EJx9Gu5BGZFdY5otnJqIgiSg9TkzbdqtOdY7c+7pUcHVcnxYfs+POod3qv4kMrK+00ct
         6uK6RUnfKL7tzAjYZ9RxxaWnmW7ngQjIp+UdZjceY5tiXRQzzcwo7lkJB1bsIEQgStMF
         RmmcRKFvmgMQO8jA77QBOmZTzg2MLBi63DArf4WZGu6OINSjdXF/ONKlmIcfreM7F2NR
         SoTUrSXOtIHp2WXAUieQLd/SYo9++P5RRyjEF46TVhD9WCqfWzqQEDSgfU7sOX2/8RKJ
         J7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714879780; x=1715484580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YoXNPfWEXlDGV6z3+1F8Nm/sflOvF+RNEkcMkhPNqA=;
        b=FFxRYtLAdcmdcuabhfImSBLdCKPllXMoaQRyM7Sh4p5+/igvxQ3N9yTyd4fcKBy3Xn
         FTBuE7TXJ7LCTTdeaqTaWn/AbHIBW8RWM+SUr/GqQ532DeGpBiBvqveLdakvZfZtOzIn
         YV3+Xu8Y3kyiJYsy49y91eitu4Avgk78ICOXacO5jMUMLLdikbuE5SyrGNGKsFuSE5Zm
         j0d8VoldWSx8nxno6UgNCxRbIjqDYOFJgJTnocLkLIwZVZo46LdFA5HF2kANcEH9UZUv
         4o78OCHSxMlmng78SgAd0A97euww8T7N/h6zO0IoW0e6AK/Qh4ESq30HhbATWlbbhsLp
         YTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnz447lBg20q0mepM71aas1YzGhv/9tyJXLdAXtixWK+6QP+azU423FhpL5/3XprPQyC5kmpoG/vlrHzPIqT/I7BsfHK6SmXZflOgNPQ==
X-Gm-Message-State: AOJu0YyvaQE7iFcgeRU/T/kKdxMp06zWNQ+0vPBvd7Afgkrr3g/zIAcV
	m84h342cQVRNdWrDlSjm0wh8H7GnlcXkzCrX4zAAAWc7kSk3yELh
X-Google-Smtp-Source: AGHT+IGgYyTHvEoeGNOUKKiSnusw8L7aboGNcu3Rc8CQOJQ5HVKXu1tfogFDqqKmbBC+bzbIrZ1XMg==
X-Received: by 2002:a05:6870:508:b0:23c:7b6d:38d7 with SMTP id j8-20020a056870050800b0023c7b6d38d7mr8139676oao.36.1714879779645;
        Sat, 04 May 2024 20:29:39 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id w11-20020aa7858b000000b006eceb4cb828sm5384732pfn.180.2024.05.04.20.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 20:29:39 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in ia_css_eed1_8.host.c
Date: Sun,  5 May 2024 09:14:30 +0545
Message-Id: <20240505032931.133879-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled calculating in
ia_css_eed1_8.host.c. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index bfea78171f7c..e4fc90f88e24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -161,7 +161,7 @@ ia_css_eed1_8_vmem_encode(
 		assert(fcinv_x[j] > fcinv_x[j - 1]);
 	}
 
-	/* The implementation of the calulating 1/x is based on the availability
+	/* The implementation of the calculating 1/x is based on the availability
 	 * of the OP_vec_shuffle16 operation.
 	 * A 64 element vector is split up in 4 blocks of 16 element. Each array is copied to
 	 * a vector 4 times, (starting at 0, 16, 32 and 48). All array elements are copied or
-- 
2.34.1

