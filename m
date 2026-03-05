Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B072571BE
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772676144; cv=none; b=NRvUvJR8NeL//gDeD0qTpHQ7RILaKOSxQbWGIVo07JSywuOpe957w0kVf3FEMXA0u11/85PyAlMaCRMuklLZtzfl48SMquhueLy2DMt7pcN0yP1VEBpW1DcJM9+W38k8wtK55W8KRI1gABmzFYTjkVUmDr40h4n9wITkT3jzrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772676144; c=relaxed/simple;
	bh=Ut0LBaIFCr8anvsWjCXs10JI7D3ERgIc+nt7nfIPcrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnudmdxlLnrNJf5QzWVmKZpY2PXCeU7WW1r3y0EKdbipKs6UVG2Ppu0aZ4m4nZy97LGjh6ZoSz1HpMVjN4SrJxduv5NuuJY1oJ1bGGp+1I2a9T/9uzE8VQxsts4gbbDfTipcflDMP9FQVE2k/ceAGYakYCgXzIJO7j3C/dGpIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T33Zx++d; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T33Zx++d"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so86139065ad.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 18:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772676141; x=1773280941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Bg0btbUeSqqnqqf25rmDsoXzFMKsOrLyRA2/2SfChA=;
        b=T33Zx++dyKfynD6CAIQ73QQtM30KJdkVlpdWYnpFPlSpLREr3Vsk5W+k1z1tJ820QL
         81hHora8M7w6U0PQ0O7E5dq2jLQAvzQI+k/B9KrEMtiAsguxyW7PY0QdJELLUvTX7TPE
         Go8g7B5vOKIPam16AiQ2BLi02Y9ZJxbKbsNtI3P+D4IkD+1vv3Nl6sR1nv8NecX1C6hk
         zYgoTiDZ7huww7sirOTdH+HoVw8YirlM/4IgAwD2GGicOsELZ6n5H97AcH4qIustOjrj
         /nsnpouwKJMEft/258S+j84zFPe13YZAVDKAHERs/dXISYy/xv5NmoH0WwMvk87TQVvZ
         WxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772676141; x=1773280941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bg0btbUeSqqnqqf25rmDsoXzFMKsOrLyRA2/2SfChA=;
        b=w9KHqeQTK7YlQis9o0ZtyQ2bWYIP4SwzR6oDN3eiWxn0XR+/GVHcmV5hmnnO84MGA5
         tBL9142WEKlT2N5pgoh+wK0mo82+w+nBHiCMFbNucclMiLgOnWUmMexIBhhY14XrgwMn
         bLqNtp0c/iRIgSuVTzebm8waziAxtNc21+7letUxxgQlVT5oMVVB+0sHA/KIDvQQ4CJA
         2yDPu4VCDEx8lEPSEkVt3gZwKs3iHcGkjdf6EUbHZlZlcEDorbW2FmiRJfpkCpRd3v80
         igNV5OmOBRmY7s2iLS0hkJsZPhEMzMiMzEXZpwTka76fMTa/avRnZ6Zu1KJDraqm9yRM
         FLfw==
X-Gm-Message-State: AOJu0Yy/QdbX1Ud2ttpg+x6tqTqzdTqKcuhDxa44xhF4a3O4HP9Z90mn
	Q62FBnHYRdLlooWk3al/ILoHpludMZcr0zfeNGwrEOBKh4Ll386w5zGO4+El/lcGNso=
X-Gm-Gg: ATEYQzxCSIkFKry1q0Sr/NFW0o4zKtbQgH5dTK5HycSAZYcbjXOfcMISWSitzAAklz5
	Lo4eHa1+OVz+hZ/EUbp3eH24mz9gIsUgG986fNEXWjgN8gpfaoXHlHyOtVzuWs9ps7V2QGD0jK8
	GqS9EeaWcJ8eNUqJZuLHiSu7o0sCTmeGMMUl651k6kEiwcj9/FuUFtde/kYHlUd9LnhtEnp96z4
	4/yiyXosS+BtgMRUjgvUR8DpMZp9ojTJ3asZiuIaOkEpWkKCJlc3z2OiCq1arq+p/9Y9pGdJZ+4
	HY5KNUiWsuiFOEUc/T8wDe4/3oN5TBYvEL5AUlubNHE0/rVPfD87LQoC6DfkLy4NYXnxNN+NiTe
	8iTzTY8ZYKHTVDwDuBUPt66DyTNpb2vMDnHCo+DpcNoMd3EhnHrwph+luW1w9OctN/fdMdSoaeD
	e4atrj1f5l5R3g52G808XDdFvc39D9orfkUbgDu2JRCtxdKLJ8I/pJMRZEzDdT8q3V77eFZMVHQ
	lBXCItfgKuF9W3s
X-Received: by 2002:a17:902:d50b:b0:2ae:517a:6c28 with SMTP id d9443c01a7336-2ae6aaf14e7mr46171315ad.29.1772676141422;
        Wed, 04 Mar 2026 18:02:21 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f3436sm294587165ad.88.2026.03.04.18.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 18:02:20 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: most: dim2: replace BUG_ON() with error handling
Date: Wed,  4 Mar 2026 18:01:48 -0800
Message-ID: <20260305020148.59842-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG_ON() calls with error handling to avoid unnecessary kernel
crashes.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 8d649d920433..cec9d19e1cde 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -168,8 +168,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch)
+		return -EINVAL;
+	if (!hdm_ch->is_initialized)
+		return -EINVAL;
 
 	spin_lock_irqsave(&dim_lock, flags);
 	if (list_empty(head)) {
@@ -190,7 +192,11 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 		return -EAGAIN;
 	}
 
-	BUG_ON(mbo->bus_address == 0);
+	if (mbo->bus_address == 0) {
+		spin_unlock_irqrestore(&dim_lock, flags);
+		return -EINVAL;
+	}
+
 	if (!dim_enqueue_buffer(&hdm_ch->ch, mbo->bus_address, buf_size)) {
 		list_del(head->next);
 		spin_unlock_irqrestore(&dim_lock, flags);
@@ -271,8 +277,8 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch || !hdm_ch->is_initialized)
+		return;
 
 	spin_lock_irqsave(&dim_lock, flags);
 
@@ -457,7 +463,8 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	int const ch_addr = ch_idx * 2 + 2;
 	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (hdm_ch->is_initialized)
 		return -EPERM;
@@ -569,7 +576,8 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
@@ -645,7 +653,8 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.53.0

