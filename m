Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC9355022
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986154; cv=none; b=nZHnq/iGahlqRUAxrCA067A6IfhvdPHkspV/Ro6PVzyNSM48pMgnl/jOzpj+XVhBoimP09rtBvJnM35x9W6Vm7e+B7N7bnHrtOEbctpOD37/q80SFXy7CqfEP9zEzxH4DTBsbdOkMW+IgNsNzUat+5VQslLRo7y3tQhhZJW7ebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986154; c=relaxed/simple;
	bh=fH+JS5TmELysIY2xcaSYIWEw90PNr1cMplwNRB0XNVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzGhQXBjvrS6CKMS2HLzlj3S/9ZV+LHRXvdST9sXNfqkxtG8gHcjBq+uK8qGZ2gh1oZ3rdVP2kJpc/pWLHwDM4NYz4xpXQfQhNvr6x5dQJufcOqbk1kecUxuGMjtSYyJ6d7iurlLagQd9LR1t2Y8WreU86YNcoEhDzbhEV3ETlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ermFsAmN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ermFsAmN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso440119b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 07:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986151; x=1766590951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDoeLCFPMBfxb+K/1kxZw2gcw5hr2QZDGXnEim5/zak=;
        b=ermFsAmNvTz6+ch7gHaMJTzwxEI7gwbci1bXEERkLmD/5Qc+F1UoGIdPOUv97wyYzx
         m8zZcxM0YPA2oDqkdsrAI8BQojfi19pANH2CulYDJ3SqVBd1L6CThrLc1+BKlxDtV6/z
         j4UqCyZRBSEGmG8q78q+5qSjk+nLxx8nCOQJEyE8Ph5mh+yDWhM09xwBiUIfU5v2WHIy
         cvizihhKpuqgnYFH6bZ8EbCO3Gjdn8t5OygTNs9/RdC8iBLmSMhCKWL00ae132alORgR
         YqlnGCIV2aisJlYjHGXg82zYbbLSBbF/mC5RJZSjMQ5gkboS7VujRN9Op/NE7xN2VOEY
         aa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986151; x=1766590951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDoeLCFPMBfxb+K/1kxZw2gcw5hr2QZDGXnEim5/zak=;
        b=VjFwlx04WkxQHCE0k3BB2haj7RCNwbZ6zQpgatzJzuvG+vFPMxvJpJp0AgqBug0FwX
         lP6sue/XkHW67qMlcT6p6qxE4nyGWuqrHAnGHbjulwFpL0tPt5CK4juOejGkQbFIoncm
         LP5zE5DRc7+lZdiQHKPuBMFc0txWJgNTBCkAmC5ex1ES2gN5lUgBmDW0L6yTBUYrV1nP
         QCqhHlmNZdSCU5EyM2dHXsgOcMPVHh+wrh9ybasrSVeH9ibzD65iSSPw65HSSasGaoM1
         RsNxUFqhnn96bupLuYbJfA1ZhETGhvWYo4AmGGz2Tx6DZX7MmWyE/A68xy1MVKSyEPHG
         E5tQ==
X-Gm-Message-State: AOJu0Yw0z4RjTMrLC3IkWmZRe0eDZ2Gmm3DD//j4BMtY/FkQo3tY7JWA
	JcNxJ/dUgqi6CRsz49Bm95rEBSRjk3kR/XVfgmTR444Vkd2GsifEd+D23O9vCRZR
X-Gm-Gg: AY/fxX4sKQCBcR4XOB8Fgcoha50yXz6TdmwOznzQuwLWV1BnAmE7/ByOmSC+C5c3gJh
	TO57PQ0WYicJe/M2w2dKq0aXMZVrqzpUH6hXDrlZMlNu/oAe82ieaeIZNQNNStQANk5jJhqOz9L
	Rggqx37Z8NrxQtT72Og9ZrNkDvcrFkdXBJoCp1wj/aH2rFe+4U4fwK2MCAmxhm//ZRxTNLqIFBq
	iH4+rFsykW0drqj9UPBLe3sJLAr8js2XkEUCMSW9Jio0odQzxkgjTesu+dFoVSCi7Rm120B6NLO
	FO7w0beiIwxIZOj2xylXMoZWZUqRYKFnGe2SFACo37GBY1bc9DPZclTF5jDlcUToZHEJp9SVOlt
	PgMx1tw3JJ6KRKeaB9GJuzjGqQMIGhg7+f4DdIhiAWTMx42AlDkii2Rnt/glsB5QwtB78XP7IP7
	jE4xtNNZ3SCsNU0B5KGpY=
X-Google-Smtp-Source: AGHT+IFpZCOT96SGNqQ5tE04atSpXv04zTB3Q8g1l0Nxvr+ZuFntTjidduuzzDc5MWIq839Hc7UK7A==
X-Received: by 2002:a05:6a00:4207:b0:7e8:3fcb:bc3c with SMTP id d2e1a72fcca58-7f6691b48aemr19121809b3a.17.1765986150746;
        Wed, 17 Dec 2025 07:42:30 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc0bebe7sm3097978b3a.59.2025.12.17.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:42:30 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: remove unnecessary else block
Date: Wed, 17 Dec 2025 15:42:16 +0000
Message-ID: <20251217154216.8921-3-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217154216.8921-1-sanghae778@gmail.com>
References: <20251217154216.8921-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else block after return statement in
odm_CfoTracking.c to fix a checkpatch warning.

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0b70509f553b..166af5f6c9e0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -132,8 +132,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		) {
 			pCfoTrack->largeCFOHit = 1;
 			return;
-		} else
-			pCfoTrack->largeCFOHit = 0;
+		}
+
+		pCfoTrack->largeCFOHit = 0;
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-- 
2.43.0

