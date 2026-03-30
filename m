Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51B3DEADE
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894987; cv=none; b=pHI9tswbXikYJMRXA/D8fGyRCBd0md/lAbQDuW6HK8tGTIXRDGnCRvzstLpi7B9Gi/F13hudaKuJqHj9SZZSPHYPzStUxTS8PDXlj8UZQBfGzIyHFjOtX5tmLIjO5sKYP81N/RM+Q7vZ0ZHb3gYbtqSaPdmcDfvXebE/ZRpPo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894987; c=relaxed/simple;
	bh=suqsuBsVchdVwVar4ZZtGbmQ+dClyiLJBPlCob+IUiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xh8lL+4+9qu/TLIn/M1OfXt50s5VayLkurbrV3wZKIOsOLcL05TUpD+0Tpvg4NTJSOgjMogPYhDghdZpSp9uiT8TnfMJ6KsRyJurKhLfSU14BcuG4ZqabrEvoISWqlpEXQZ6JhHH0VgZsyLPGE+W263vCG6Ydn1PJ7qdlWSVIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wht8rfQP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wht8rfQP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so42387405e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894984; x=1775499784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcKBh4KWsiN7v1ouQtoD5ZQbdxWi7sovHzhSf4lU27I=;
        b=Wht8rfQPgGk4771CzdBywCZECPAHxQHJBJ7Ah/1mqmm4pagv/WURcuxGrKPrHtC4pH
         JbOXtomk9N/DQILm4EXz/dnxzQvBJK5NKaaYbAhTmAMoVh+qQdPK8SrSv4elfxRuyNyy
         icBC0IxDwlhesIJmvK4HUY2kyokkbpuLxb1qb4WS2Flt/42CdhcSqiQ7OKq3Dvqnf1JF
         W34WTP23ILxhRB6ixa71PJ26ZI80wiMQ8KpfKrkkJx87RNOCB4WN9Gg7d5D2YEZ+t60B
         9nn7FBFETJlTvXO8JotcTtsg/YRv4VEkgtnDJD11lCYIHxWpvBWN3KvS5XVxw65AtxGw
         G5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894984; x=1775499784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PcKBh4KWsiN7v1ouQtoD5ZQbdxWi7sovHzhSf4lU27I=;
        b=ADFFu+lrN8boEza1evSfpLNRmmI5jONsGRgnEBLgoivbApJpMOGB9Vm8HhNyUB3W0C
         dHryY0Ei9sZUtmMSPaJP6Anp0iBfC0adraZ5TjGWL4yPsNQ6AqpTGPAqPz7VrV4clUje
         V1+zumc8H/dhTB34i0HYADqnLPio+mYTUixDzXyZthbEG/T+FpRZIrBXqptjZCo2c3aK
         Ynk25OEBlCUD0Vg8RHxREHBHFLCl2GVqTiyTJQYqx2UT/2Jb1h7+fWm6ocvBjt7OfXOm
         qtIf6W151JXaqAkubYB0YeelmvXavJufzeJtgDCUTCe25HyMEcskFlJ8s033YWZ88MJx
         qJBA==
X-Gm-Message-State: AOJu0YwXr62nLAnv3Ad91UBpORzfQZ9pLSQY/z4a/Bpn68/aLtE3Sn6X
	gEEKgTBnVXG7ks/Q5qtqBpz2G10A6g/QtxwBRKN1uiBoRp3u9OCVkk6r
X-Gm-Gg: ATEYQzzN0BGYkgspSGviHGBKAMuvZlq8OyZJ38m1lxspXsyXFFsU+4ogJ9WDMPMWu8I
	SnhFNSBKm8JIzir16vkGmKFnLko7ukaDqSSeYYeNmpzgKLUIfSuS0UovWMApf1YV0YfUxNaBtD/
	cshoKcAoUDEUzLc2Pt8h+ax2O+ONlQyylsC8Ym/2tVnw8Pv4ur/ea5pbeTEzkGwOWDgqsXPB1bq
	xIIv5ldStGN2jcK0v1+NKFhzvyyi3qWrlZI401w7u+DdUmwcNKkaW8I2cZ4MFtHG14grStkcvFy
	k8uMguwjvitNt3DI59xPUpTOPN/969mI6F1r/OwX73dEecLlxTaEzX5iCBbQDz5ali1mLJTaZUE
	uRKGYENjL3mkK3bi/1G8zsvVKigLHrZ7rMgpn+PtJ6pSMiV8MwcRS8nyBdpjlU2xKbRorcIy3al
	P6a0fk9Kyo6XN5HdpSES7aniZRW80Hmgx7dVrtRkWSP23SGAvDjaaC
X-Received: by 2002:a05:600c:a31b:b0:487:716:2fa2 with SMTP id 5b1f17b1804b1-48727ec3c1dmr187938795e9.16.1774894984046;
        Mon, 30 Mar 2026 11:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:23:03 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 5/5] staging: most: dim2: replace BUG_ON() in poison_channel()
Date: Mon, 30 Mar 2026 19:22:55 +0100
Message-Id: <20260330182255.75241-6-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260330182255.75241-1-grondon@gmail.com>
References: <20260330182255.75241-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() range check on ch_idx with a return of -EINVAL.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 23230a32c..7953d4626 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -647,7 +647,8 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.33.0

