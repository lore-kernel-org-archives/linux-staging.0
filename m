Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F31A76CD
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411380; cv=none; b=ChZ/rPGwA1uoAljBFx9nPDm0dh/M2D/mgc0g+k8STNtNUE6oWjU20vplHwM3bkcvfjVPTzM4vKHqOlUAeD8KZrIUZzrhRDR9Ngp18Lohz5xJLMCjOm+W2Io/4VhMs3APRY+5XJIGHmJ7nTd0yIFege9cyBbS/uf+bFUP+syO18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411380; c=relaxed/simple;
	bh=Z0quf++gqajFpVICB5Q3/3pf9XLfHXdzDDlmECaMS0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pz5QBg2g56yKeuPisw4/1vopYjDuw8/ywShcjeC8kAq3cAQkgsrMcYtfFe1TpH92RaeXJ1LmlF/RRtMmjytAmBpBE639IsA9Prrcd2HUPpBGgekRsEBWQdJxorYVxrKGm3J2FBjU10yO8ByKqBr2JPU9t20WaHmc0c26IKsY3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwT4Xn9G; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwT4Xn9G"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd9e70b592so36481675ad.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722411378; x=1723016178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRH4DV0DJDUFsL+oAneJ1eExEHHJriff1ENVzKjdwVA=;
        b=kwT4Xn9GlMNhUiW9T/7rafPtNNYEkI+s/Jut2NMxgVDtd4CbeUcTSRunEhG5UzAqA5
         PKrwp3JG602HvfIMlwnrAOTEf92LE0szlmMBbBL+6ggYdeRB+kaJSaW97rmjASkImwaD
         Hw8dNaWt/aEjtVOmC8iWsgDTKvh6oi6oFA0R9WH8VScS9jxINmTqF15pIg0PvpgtTbt9
         C141QCgWnmiXWCTL2g3DYa1mLF0fIHSsxxnJk6c6JrOriONd1NA6+K6ruPMKNQH1r8eo
         3l+RV5O/97iOC37Ic4+jICYKTNU1sHcP65uLYq+5VmgR2r7Wd5SFBvtAhNTQqAEhH1KZ
         /iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411378; x=1723016178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRH4DV0DJDUFsL+oAneJ1eExEHHJriff1ENVzKjdwVA=;
        b=H1o0LQK6/v2oxJ6rO7xy6iMAqYJaCfF2dgnogReRxZld3hUK6Vt1+ebRZyuH3FAcZd
         vOWp010HUblEp+9lLTqF7uKcr+a5rxGBsTJhCE1ZZaJ8gM4H+BtxlrY02nudC8VYjWWB
         wKKhTDv0LMRtFkn3Zj9qBzs39747nEbDewitZ4URh5Kz+CAbW76WenwymtFzqJ/ZYInj
         DSAMMd2Yr43wBKhGbe9eqyBY79BC7yyzXDJjJcCh8uaHwuGiM7GzkfE6GJijGbczRX+2
         CEodg+aj+pGJlB8kHSU4ytHqnTPOnkSjBELBad0Mo5IMCfuLB+8V9jFwoZEgKsAbp5J/
         wZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXfYT1OmmXOvk4OoGdvE/k+8sJRTmCMMylQTmQyB7+XVAE3qrKEJoBDNEYnTEEuQ4vgSe3N+tGi5yxwwDyZRvzh4bukgS99eN2ovNe9bw==
X-Gm-Message-State: AOJu0YyGwqaJH3VLu+Zjv9dG1re294yazDW5IRsY0Z+FHaneMTUr3jvE
	b/vgVewncQHSwGsbpdgkBK8snHAUXy+D4PRvvpL/MdLVtEmlzfQ1
X-Google-Smtp-Source: AGHT+IEceKTtYYEsOkXyN0s0CRHubuzO4J5r0XPfOvSvOHmtwtPrADzOS1FSoHURcWoeZWH3v5Mn1w==
X-Received: by 2002:a17:902:cec3:b0:1fb:779e:4fca with SMTP id d9443c01a7336-1ff047a5335mr138685625ad.14.1722411378005;
        Wed, 31 Jul 2024 00:36:18 -0700 (PDT)
Received: from Riyan.inspiron ([2409:40d0:1028:df3:da0:ae29:34f8:4b4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1b7dfsm113401935ad.189.2024.07.31.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:36:17 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme_bridge.h: Fix mutex without comment warning
Date: Wed, 31 Jul 2024 13:06:05 +0530
Message-Id: <20240731073605.9857-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style

Reported by checkpatch:

CHECK: mutex definition without comment

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9bdc41bb6602..0b1f05944f0d 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -28,6 +28,7 @@ struct vme_master_resource {
 struct vme_slave_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Locking for VME slave resources */
 	struct mutex mtx;
 	int locked;
 	int number;
@@ -55,12 +56,14 @@ struct vme_dma_list {
 	struct list_head list;
 	struct vme_dma_resource *parent;
 	struct list_head entries;
+	/* Mutex to protect access to DMA list's entries */
 	struct mutex mtx;
 };
 
 struct vme_dma_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect DMA controller resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
@@ -72,6 +75,7 @@ struct vme_dma_resource {
 struct vme_lm_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect LM Monitor resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
-- 
2.39.2

