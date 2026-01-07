Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0C3246FE
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779267; cv=none; b=A6ppDbxib60cWoccARVfgX95PNQfFCcAJRhwkI/o2eABoHHyJ1y2p8gpv3daU0pTdpWLgqI7o+RNBoE1tY53ECVbM+dFVIUTUDP/EdZWW3V+QIJ8Uusdt2soxAwhMq8SFl91fj6tj6VPlnNEXwwCfMsx2NxAoyrWLm0NZMAzVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779267; c=relaxed/simple;
	bh=WKB97XOLcmwKc/51Ty+ofy5vOxBk561EYmTLKGHMsQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3FrJ1phwO2FaFCQRiYpUtGBrmL8EtB8W2opNBLBf3OrZaD7peZ4IL0PYKq1NHh/GCaUzUrWEZvVpruLt+WrPdWjtVNyLtrONwVoh59RLu/+vrVwBk5+ew4gPymSRuzC1apV2NBBXsq4oEF+pCf5RSECt6mISmerJTro9s4xaJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ybp5W1Wh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ybp5W1Wh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso5829105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779264; x=1768384064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7XMCM+IOn3MGIGHRABZ1A3vBtHG9JW07kumNbNmeQk=;
        b=Ybp5W1WhtJpOk3PfSHgJ3vvyM70CfalG7z1vvl2VBvK3OAPx93NfS0yxqwcW3VpUtz
         BhRrg2B2I2b/PI4YDQg5yGnou3x34ioA1d/RTer0TdiRAijD1bOW3BocR2tsr36CWznJ
         MGBkznHVhVGKLQ4tQFaAR1iUCFkraduxeC7T0roJbOdRtc2vk00qyQNx6j5ZhKvEaokf
         B/YhsUcmrZuowBlQ8x8rxspw+xge0+ebyulB0Zni7fRKWuYLowQCp1nIROK53sZLbZSg
         8Rv8Gke3a0v60jN+lx/6TEjtG9IBsKmvALBw8srCxv3U5uvmILw3LP/9Mr2ciYb0DJ+q
         oqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779264; x=1768384064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7XMCM+IOn3MGIGHRABZ1A3vBtHG9JW07kumNbNmeQk=;
        b=pIjQHqsXT8c5p1qjdUqdxdVmVx2frbPMPB2gz7Z5GeA7Ahy7/jdpcX3jD9bBydm1AE
         Hju6XBdSZcdGL+/nWr+J1cDpNWBN48j7w53jpihnSQLm0l0IsC4FRvn4x+1gvOrIHQHD
         H3hMZAhaF7yPLJkhqIhTZCdjdIk3tIrQfBLUJN6UB2AQhE9hFPJ+imNM+P+GtiQFWh5C
         GYBApSn6W7idJgyIfdtbWmwalfsM69fnUGcbuAREez1wzLDlfmaxX0Xy+gBgT90cZ2kD
         dQbFBSxvKK04bhkr1CP+OZuKpE6blRoABz7yLTxha1ZilMYqd0qrhu+D1lMYzrWjDJQp
         KkUg==
X-Forwarded-Encrypted: i=1; AJvYcCUs2ITfbWeXPsD82yrUUZErDlNt+0Ut+CmctcMAAgKkEPyg1DlVqSxVYbV6AaEp9N/cY79x9C0S92+Jh27e@lists.linux.dev
X-Gm-Message-State: AOJu0YyYO69XfHBJWDLDpUVZx2T88PmbTNa2qix1ZTgAqTHnVO9wJXmz
	BYbritLbeCtfsQyZE5tsM9DEl3KZFsNpp56qJ3sr4KtPij0Y4aZ2wAmy
X-Gm-Gg: AY/fxX5ttNXwI2ObVCarDH1TVcSEjmPoHrI2XlZAiCf4RDTKvkpgG2RhIoafFmBT0Th
	gPjdSYKKVVr7Ie4azeG32hJ9BBjG/BlrdUQMbZBGP9/zFt4qPFkiO73C0q7QCXmPqyNiagx9KuQ
	ZtOvh1rzJvWx7qYl/cLj8AaTrzWy/oyNJkU4Y6tPukYoRM3QM1Ba3kdQ9hb94Vss5DrSmwYl/NC
	LXohGIiMHlL1Gl9AToEtAUy81xgmouu8Qo4w1pQwR/Znj2ilFkUG775nfPjc9EHBmXU5V2JYpPD
	e3NHhYZHvVnc0m5i9bAInapx+km+nsBKgTEt3swB0UnetdNNy+f1dd4kM48wNFJmsXeLP377Wev
	a1In9DuCeyXtbGhekh/jsXPW3VlkLpoD1g+IIa5w+KLu7ChMncYxzFR8guHMoICEzyT9NkiYmjt
	WmTX93XqUGP6k+U9wdKekQkg71/Rdz6Ysm3w5q6CqKBJh30WSpijLISK58i9Ejw34bfYNU4rOHm
	lfILOlmg8s2areQxnXXBMPeiZw=
X-Google-Smtp-Source: AGHT+IHRW2qQ0SN2NxzIjxOAFlOFn2hT9OUGn5VFMQYofoyvx/h68UFN7Qpjf/pOxE/+TvQYWUd9ng==
X-Received: by 2002:a05:600d:41c9:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-47d8484a4e7mr18905025e9.8.1767779264334;
        Wed, 07 Jan 2026 01:47:44 -0800 (PST)
Received: from fedora.homenet.telecomitalia.it (host-95-244-124-236.retail.telecomitalia.it. [95.244.124.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a10f7sm7423715e9.18.2026.01.07.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:47:44 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH 0/3] staging: style cleanups for sm750fb and rtl8723bs
Date: Wed,  7 Jan 2026 10:47:11 +0100
Message-ID: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs various style cleanups in the staging
directory to resolve warnings reported by checkpatch.pl.

The changes include:
- Fixing 'static const char * const' declarations in sm750fb.
- Removing trailing whitespace in rtw_mlme.c.
- Simplifying boolean expressions by removing unnecessary parentheses
  and explicit comparisons to 'true'.

All patches have been checked with checkpatch.pl and the modified 
files have been verified to compile correctly.

Lorenzo Simonelli (3):
  staging: sm750fb: fix static const char array warning
  staging: rtl8723bs: remove trailing whitespace
  staging: rtl8723bs: remove unnecessary parentheses and true comparisons

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 drivers/staging/sm750fb/sm750.c           |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.52.0
