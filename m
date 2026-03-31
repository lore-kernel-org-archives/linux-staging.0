Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738A3EAC65
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964657; cv=none; b=Whphz1ldcHbmZiS59L/LNAdG75GkCj7i8G4ArvA7SJAjdYpoTfVbDtxKPDRDOtxaFi/y0Dx0FDpS1YUYC065QVtDn8x1/3UZW3BvUuRjoWEv712o7oOTaj6LO9aKnEJGH4Jh1ArQu05rxwpLVgdRn4/ba8mZP5cP73MGbl8YE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964657; c=relaxed/simple;
	bh=ZH3kOGmDEO3gADrpfp5Lcv221yGM51+kYEM5K/9HhGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IoihtcnPrFvP2OzvjGTaNm/wGPiCh9G6t+nASdez7M+KhMGEbzoaFlSRZxTW5k4OyXmJnOA/JBy96RqXmek4H9P9ma9cQSDGkbHOVOkltclkC29lJOq/K215A9Aa0Xr29HOcfbI0fIavQVFYYuh/KZ6dGSKok4srgxa1PNMymUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFCwi8Vi; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFCwi8Vi"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2c4db6bca03so1361912eec.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774964653; x=1775569453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyvLhjVhNdQz9p6/7OsJVs/MzdJnZrYRiPF9CcTyMdI=;
        b=qFCwi8Vis2nnXQYRYKA54BTCVQ2BBe0DVPP6zz7IK4eTnn3Pe0OoG7wG/NdkI3ik/7
         2Ks0IIhrb4HtPbdyhXaCGZgj4Fp+vVLu4kYU5TqjhrHHDeIPBOsxhseu0+RPnHoQFaUE
         kxoVVRMW1kY8bwxjvQJeEbEQYpeRkpgo4aNr8Oqucpo2wMDIrYqiOJPRRXHNAG8ge1RT
         iODZqdonrM4/hmLDdY2TaDb/wcZeMvR0sTpteJTBnq2A/g5dxKKxOx3OWb0vdouN1fPF
         6Lz6Be8kH115158lkLeMontusq5WIN7ZBs6hUiI2RCq97AyPBVJW6DN3HhHBdY/6btGc
         Leqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964653; x=1775569453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LyvLhjVhNdQz9p6/7OsJVs/MzdJnZrYRiPF9CcTyMdI=;
        b=m6HTpp3DaPgga28AOg+ZbkzgOVNPLm3UkdXHHUUeWAz9aeaKNBQjIvp2UZSU+c0DiZ
         B3XuxRDWGO0eHW2NYLpCMIHhFJO6rEhavAjEQNdj6WKYpAWA/2v3ABhXI1HemgCH/g0F
         Yulr03ilpBSk8JaGsRVOhsc32YS/V5lPQaoUHp64dI1MzW1/7Xw29cfPXrFDT7tBH7o5
         zhxeE0g29VPOMQVys2lR7wEADm1exPPr7uyYAu3s6RpBa3sriCLRguAHKdqhSLPSqbbR
         deWnPch6rk2bPIE/smFbXrv1S4EnME1jvp0hYS1+C/1EP3c/u/dxjrFY/J9mV2wdLXuJ
         K2dg==
X-Forwarded-Encrypted: i=1; AJvYcCXsTOiiILZq0pyeij72qm/x1tTLrqWSq/MhXwQviegL4USRe4r5uMWo2NnGvgV50zYcmWT/zwcJmVaYrRzW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv8f7PWju3Zmiv0+u2MdzlgO+F/Ry4hucis80DTDZuTFV5X3kj
	sYC7Pp9ft8pqngFeyDBF/W3Ns2mGfJeefhvGX82rqAU5uEH15ZZp2z/H
X-Gm-Gg: ATEYQzx0N2WjMWrigmEa/bgcR654hk6Pa1oFqwaOuAox0IEDa7dwbAP73l7rlkhJ58U
	jPc/skaCrYpcRcZCMBAlMuTxoN8dZONMZfqSbPm32R7QQUOM8iXw2dsrLPUCyuBQBVBxZEmOO1v
	cdTo3LqWKp/HKua8RQoDsu/nqbwwNh0NlmwQlv480lTngw/9/qdXkMtpGyjpY2JReSMyo7vPiM+
	Ver7f8lD+gHhntOvRib96DQfcLLQvGZDF9nGWcX3QfO40htbW1i47j/cLCCPDcRQFyVftfJElx8
	t2r0VlOMVsGuK/byFaQVaPVQR2uGnS4xVhPxdAmleNhqStURtFwFXWbn2cp0FwyKfvfNI6+6C44
	japol0knEDuAW58a3FXcVT4fCSbn6GSxpoblIV2sUU/6UnYaGow7qYxGjqyx9jm/kHkdpZ/RLSo
	kkOV/6h6/0qUFl9XS+CUhUnTg/bPBsm8nEL6WiDh3rU3JKLoeggnA4SZZ0AFyGNYxoQWUoKKx6T
	vbM0+jeK/+q7Q==
X-Received: by 2002:a05:7300:d718:b0:2c1:7480:ff9b with SMTP id 5a478bee46e88-2c7bd4704eamr1507424eec.18.1774964653067;
        Tue, 31 Mar 2026 06:44:13 -0700 (PDT)
Received: from localhost.localdomain (58.sub-174-193-131.myvzw.com. [174.193.131.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7483ffcsm10002469eec.26.2026.03.31.06.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:44:12 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: sm750fb: constify fix_id array
Date: Tue, 31 Mar 2026 13:43:49 +0000
Message-Id: <20260331134349.18998-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331050738.1547-1-dennylin0707@gmail.com>
References: <20260331050738.1547-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the static fix_id array const-qualified so it can be placed
in read-only memory.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdf..795e9164b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

