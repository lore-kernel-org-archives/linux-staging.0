Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61664428
	for <linux-staging@lists.linux.dev>; Sat,  3 Aug 2024 00:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722644305; cv=none; b=IEe6kALt63zq2kWA4/VQm29/gG8EThHVCql0+k1YdKqF+gjuNjja58AeYF9/Q5p+1CjPFYIO/mEDo3ubckJ1UWUIBE24jz8NMlsy2VLJtdiosM84aABt+5uq63o4NY+l76atfysicYWRmY+nVBf4mzJd90GfJxe2V5kwVD9SDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722644305; c=relaxed/simple;
	bh=pAQgIkSRZwjkpI5gO2BydLYmo5HlIqcCrZ9VS8V12yM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TpXr33E/e8fZUJVI2rfqKLr19JlHHKyjpobe4CqgyRal01y80sCXu1JTJz0294BxQ3fFCkymRRtcFq52LVuaxgahsehZWfjUjcaReeI1iYViZ4KWTL5y4pjDjYsD/hsN+h3HXXJLPZ7UDmAh2/SvGAGh7LCbdeoypblOLy4SHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOM4QAu+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOM4QAu+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd69e44596so27821435ad.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Aug 2024 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722644303; x=1723249103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAWRuSmJKjlpvA4QhYPB4hwoTefNcdDnXSOAB90DYYc=;
        b=VOM4QAu+qn6Z0Tt+HiKWJSEN3HM+p8kh09nIfBxEG6tFgwQeZjsP8XG0rvvtL8CK+J
         1JNmCjamja5IjNbAhcbtHeiey4/rgW/ZUCO0Vk9zu5aHg9qClM7v5PJLqjjnIi7894TT
         cwkCQvRNCQ1lJkA6iDa3wV5pbCRlZiKljhRzQCPkotxJmRmAFX5iGN38eK59yhfQLZXy
         CFRNNJQMcgKy+r4ybvYvvDHJHvUwq99Dcpp4I1reSK47bzzQrTYS+II1CyvTdv0CXEjE
         5H8z58baj4BSZM7sHLo795Tu7MC20znJ8n8jeN1YY3c7mPB+w5JF8twQ/8kLBewi4hO1
         cs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722644303; x=1723249103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAWRuSmJKjlpvA4QhYPB4hwoTefNcdDnXSOAB90DYYc=;
        b=cTak3ao3G9DtWh2vBgTlAFwwwg86U7STZh9Dp5lfVlgZ4rungak9y6bf+/Iw+JoWWp
         TkSUZLwBbABzDG82VwF+J2zKwQtRzg7M2fm78OYrWN8od4hme8u3QyO8JkQFfxugWQKt
         ZtdEHQCF/qDEJsOBG3jVrFyceFlzEVgEkuri/z6kT46tRVty3BO4dthmyeXUc0IJ3v+s
         IB55RwxGHfIlIwignpWX7lsoS8RqWmANXHo8mIPz8ATkSywF5lN2Ztv2ozx3xzYdZ/ix
         pDpLW6Ec56FK0pplCsduCAnh4e4Qz6TdRy1n2s/pEm8kgSVHdrsgV4c00y0PnP0sKoWS
         TcHw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqJ1YRcvY2TudxSkVnuI1fAdQgXjHGFqoKeRpgJXP4bAMfLBO2R2p9Gu+++uW7bsFASOZj94Z4KMH3Wye4Tn13ISjiR1vbe0X7lQVbg==
X-Gm-Message-State: AOJu0YxzpnfNqdjTGfeuaC6/AN02YVk924aZbKmCqa2jxM0VH3SQMtSH
	t6/vpD+SUX9ZHvCkFuHC0XM4/d3V1He6o4eHYQD8nW/cTOf6OgNm
X-Google-Smtp-Source: AGHT+IEXMJ/xDGW0/TPd6BplXEHx1lumggDv01n9rtt4EZzLr+h7VIsu0WAr2fg3YtCCKSnHroS3ZA==
X-Received: by 2002:a17:903:41c8:b0:1fd:6ca4:f987 with SMTP id d9443c01a7336-1ff57bc504emr73575585ad.15.1722644302627;
        Fri, 02 Aug 2024 17:18:22 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.204.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59178248sm23542255ad.202.2024.08.02.17.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 17:18:22 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme_bridge.h: Document mutex in vme_dma_resource structure
Date: Sat,  3 Aug 2024 05:48:14 +0530
Message-Id: <20240803001814.7752-1-riyandhiman14@gmail.com>
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

Proof for comment:

1. The mutex is used to protect access to the 'running' list
(line 1798 tsi148_dma_list_exec function)
	mutex_lock(&ctrlrl->mtx);
	if (!list_empty(&ctrlr->running)) {
		mutex_unlock(&ctrlr->mtx);
		return -EBUSY;
	}
  This prevents race conditions when multiple threads attempt to start DMA
  operations simultaneously.

2. It's also used when removing DMA list from running list:
(line 1862 tsi148_dma_list_exec function)
	mutex_lock(&ctrlr->mtx);
	list_del(&list->list);
	mutex_unlock(&ctrlr->mtx);
  Ensuring thread-safe modification of the controller's state.

Without this mutex, concurrent access to the DMA controller's state could
lead to data corruption or inconsistant state.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9bdc41bb6602..bb3750b40eb1 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -61,6 +61,7 @@ struct vme_dma_list {
 struct vme_dma_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect DMA controller resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
-- 
2.39.2

