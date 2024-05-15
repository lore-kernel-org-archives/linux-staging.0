Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84F4EB2B
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748767; cv=none; b=cpZcTFHOwDPjtGjFLHGdfGxjcD3NhzBAaIQUbYOzJqxNW8F+RB5LYUTH0DR81kB1AMIRCeYYOWYpSigq15aZaeRGlen11gxCTJOQlLsgrTpoG38CflObOzeeLkxIuhnMflDGfbEyk1O+ljpNdeZxN8TTtQV+TDQXIu109AWqIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748767; c=relaxed/simple;
	bh=W7YanCirN9wvp2zde5wv/2tgJrgt1xFhjhHajSKuSHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJpsi7hKt+lhuwYrRcIBig43mZQX4hp7ei8k4ESZEb4gRuDIhCUZ24yRaoatJyuEmjBI01dIs5aYEUGb5DxLUDzXJed3mlmAiOvOVfffigEnIBr0ipdDGgRT1rbMVX26sDJ7LvNQSNUM5QK4t3RxwcY3z2rZ08UFtg5sze+U/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NVPBJ+Ly; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NVPBJ+Ly"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9b94951cfso520922b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748765; x=1716353565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5uBXo5orQcdm4k609Ve5/BzbHzbX6bMArVHYg6Cjbw=;
        b=NVPBJ+Lyr4/EExghwBm5JZXLk/IZczPm5NCroyIX7myR6P/6YSzcXHq/df+oCi2OXg
         0vH5WWF1xn8PB10XoqALJkgfwDNG12RmzoYq4xkkhnHo04yzCE7PJu/sdyxNJ0L9WuDo
         VTuC8xyyphzoZdXFeYL5x0q8+1WFtToP9I+3i1HHydAT5zCoPQaDfzbLb/BaiFR8+byH
         5XylhXAJJ0ZiZ+OgXuGeCD8p9nVj53ssOfxGtBk0dKSuy8Ajx5zRs91q3tUu2RfJJX2W
         FZwzf9tL2/l8jh/+pz+2Ka7OED+f8pCOVsgIdxV2Mfxiz7M7kG5swLI4bcaG79R4EapA
         ZSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748765; x=1716353565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5uBXo5orQcdm4k609Ve5/BzbHzbX6bMArVHYg6Cjbw=;
        b=gOOLLP47fCIec5q7KF51vym0Hwn6IzTQcpFt2RA7F63XaKGkHk/TBnxY5xxV/k25Sd
         BQt7lo8oAWprJ/6C7rUkabJQLr+cqPZaQ/004fb9DwlsnvNBI5iZBJvuHDiJ0vfOKyy8
         h248Z4Rw9hWdBV6QIIslZxfr1RutrG9n4OE+TDta2/oK/xNddtIKwtVFir3WENSB2XHa
         0jZ6IBLoCEpWj8q3xrKkw4jQGpTEqZs/reV5gsF5NFLsyYYFnc2+Jdkk/0o5cHDoijy6
         gtJGxBd+in4tTu6sI+ltwo0IABTI86YjbJ+7qpNGtIro/WVLHjuNYXs+wy6mgnOFV8nf
         IGqQ==
X-Gm-Message-State: AOJu0YwFwjmTAlk48B+Iip3WK1u4XH/yAiJJDF8Kal+PjZTo5cYNim8Q
	NEP+4b5lRac/tSG/+olv/d3mX1KuOMoh7rCmCiucJvT48AAnlUMIEabVHoRYnWU=
X-Google-Smtp-Source: AGHT+IGd8pJGmwnbAEWl4DdU9jN9a9BZE7BDE2KjzGYE95GascgoKwP00mKOm6PzR9TUCs2ysEYhsQ==
X-Received: by 2002:a05:6808:144e:b0:3c9:63d1:6fce with SMTP id 5614622812f47-3c9970ba8camr21808933b6e.40.1715748765203;
        Tue, 14 May 2024 21:52:45 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:44 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/31] Staging: rtl8192e: Rename variable AddReorderEntry
Date: Tue, 14 May 2024 21:52:12 -0700
Message-Id: <20240515045228.35928-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable AddReorderEntry to add_reorder_entry
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 3afce436a5d8..30bd6f49e915 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -403,7 +403,7 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	return 1;
 }
 
-static bool AddReorderEntry(struct rx_ts_record *ts,
+static bool add_reorder_entry(struct rx_ts_record *ts,
 			    struct rx_reorder_entry *pReorderEntry)
 {
 	struct list_head *pList = &ts->rx_pending_pkt_list;
@@ -610,7 +610,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 			pReorderEntry->SeqNum = SeqNum;
 			pReorderEntry->prxb = prxb;
 
-			if (!AddReorderEntry(ts, pReorderEntry)) {
+			if (!add_reorder_entry(ts, pReorderEntry)) {
 				int i;
 
 				netdev_dbg(ieee->dev,
-- 
2.30.2

