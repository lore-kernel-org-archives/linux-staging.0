Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF62D4813
	for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059251; cv=none; b=uVWgWQCqPQUEyqdoEQAUX+XO6WBurXRNDjSKpvrTInabQaiNPMlD0jYYvw5fpRs0RpmKwOYleS6nTmZp9iKzQzU1Yq72HCTuXLy/LxTSen0RRcOo+NFO2OFGgfzF9ceVprGQllgoXxskt4Ni27x8I1zZIYmCj+Cr4dix8Si5xBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059251; c=relaxed/simple;
	bh=tScS/pS4Gn6GgvGk1K/xKhHsVgSJ6DREItv+LKn3W0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0cwnQpDUzpNoq1jOmI59+KpF6z87n4LkleYa0N/p9fthTRHmzEdv223/3xb9W/Yrsh4uRFRLmah4BkL8slR+NvkVSAFK4dJF7Fa9TbHZMZ+WMd0TTEy6a4hCevfNLp0K9hASuoowGCCJ24jGCoTC3mnBVukUZjBt/+hVjkflbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGUsjBH3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGUsjBH3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so22785775e9.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059247; x=1759664047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnvGAr8iYkB0Wv3fJqUIRennMUMlOyLME/4zACe/66Y=;
        b=mGUsjBH3zRv0XIx4fsHqT23FyqVCH4vnB5Km4+N+mHEzXGSSzu//ukr42MQDQ0rlfc
         OcF7vYiRZ+Q43myCK2CUd2ChpgDeQ/TeQFhOokN5tkz0KOvWnZM0j7iCG+XTlZ3qnU/C
         pwojCJAoe14Rv4uO19ro9rRwPAMSpPbG9rj6thzReAEFCJXgqjrC5I11highAK3Gm7AE
         ajq/HVRwXPOzl7olM5jZ7IOm299tt1i3yx5E68ctd1mMAVwWiAgnWIjJMNFNjS+UENCO
         z4BFyykEBYHC4F2mUTBQem0mM45MZsK1Zkv7IYdyvGObrWL2vVL+fqrhh1+4Vqb6FsNo
         UrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059248; x=1759664048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnvGAr8iYkB0Wv3fJqUIRennMUMlOyLME/4zACe/66Y=;
        b=LsPEexpGSiRmhFgaHvPvkoyB06H3X1arRPlWoA+CtxVTgZVN9OvGIixC16bn5k64AC
         /hAm8kQPYx0j6dlweAK/D1MD4MXOAlUJgwudQPjyishWJ84DZshvUHY07qt1+FqTWQUs
         S4Hj9tflRAKqdqgVXjl8RR7AXxDj3+e648hOEFWP+7tmb30olNOwhPrbFWNJSbsGj/wn
         w+jH16QyMQwJu5htZofE+2e+8gYnN7noYXFwUBqkeEpf9XpPcm0XJCT+mV6ILeh5lVdf
         1gDTuyBTw6YNdfJVYFlcSSQDUj+7oXPENe8Fakqf2pkpy/HVUtXQQOF1xUSj6ExGS1R0
         gn4g==
X-Forwarded-Encrypted: i=1; AJvYcCXSKVQm5QOctjELHaaBmTvbuloUDrVgFgTMTXnlYxpigGdQKlHsDxbj9CU32eJcNVfsXjJiD2riJN9eWVPn@lists.linux.dev
X-Gm-Message-State: AOJu0YxUx2f2lVpVqLy8pYmf+hqFbxk0DDUwgR29KP6z0zoWH3Pw04je
	zNDFE+uxBJpU+7W317Mlf6WVwUGQ0i5Tj2n5Skjkzm8Njd4qGVaekBdC+Hx04d9L
X-Gm-Gg: ASbGncukTr6A1rIIw3zWdfoOg1JCUCZdhceaF3+PtmPFgkG+the9NDDl8HhFmWS3NVX
	iFzBMG8Xnqa5WSqLZylCqb5Usj7hN13JBZBldHbQ71OnVrwOyeHn9yjYA7yKCBXIvGUoCoAItMZ
	YqLCKdUYBlX55SQMEdr5xtDGzuSbH8B6Ykzoqlc6Sg1rg957JVxfMp8SoKP5jYbxAJKcjNYjgjh
	xsozHmGhQ0WsPYWyDm7NO7tDE2G53P0JzlTh0qRaMTLk25kx6QORH2D1Vq421ZIaMZeKnJR/AOi
	mDaCHNpTlTnb+wUnlhyvP7KPXHG/N3SmOSBfENZ9rlijvx0IWgd7uglIaUlffqRxwz58VoR9K5/
	9jR5P/f7RnkeiLJSlomhtUSwLoh0TNj545ospRQ==
X-Google-Smtp-Source: AGHT+IGSoXJrQGjjbAQu+dFDiNaJeIvSNFQV3ZRIFhhtFQ94nnIsQBfhQk5TjF/wR6Cbv80f4vA5Hg==
X-Received: by 2002:a05:600c:489a:b0:45d:dc9b:e85f with SMTP id 5b1f17b1804b1-46e329aedecmr83219135e9.2.1759059247234;
        Sun, 28 Sep 2025 04:34:07 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996c03sm187074365e9.3.2025.09.28.04.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:34:06 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging: gpib: Fix sending clear and trigger events
Date: Sun, 28 Sep 2025 13:33:58 +0200
Message-ID: <20250928113359.6197-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250928113359.6197-1-dpenkler@gmail.com>
References: <20250928113359.6197-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver was not sending device clear or trigger events when the
board entered the DCAS or DTAS state respectively in device mode.

DCAS is the Device Clear Active State which is entered on receiving a
selective device clear message (SDC) or universal device clear message
(DCL) from the controller in charge.

DTAS is the Device Trigger Active State which is entered on receiving
a group execute trigger (GET) message from the controller.

In order for an application, implementing a particular device, to
detect when one of these states is entered the driver needs to send
the appropriate event.

Send the appropriate gpib_event when DCAS or DTAS is set in the
reported status word. This sets the DCAS or DTAS bits in the board's
status word which can be monitored by the application.

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 4dec87d12687..ea44a766fda2 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -327,7 +327,10 @@ static void ni_usb_soft_update_status(struct gpib_board *board, unsigned int ni_
 	board->status &= ~clear_mask;
 	board->status &= ~ni_usb_ibsta_mask;
 	board->status |= ni_usb_ibsta & ni_usb_ibsta_mask;
-	// FIXME should generate events on DTAS and DCAS
+	if (ni_usb_ibsta & DCAS)
+		push_gpib_event(board, EVENT_DEV_CLR);
+	if (ni_usb_ibsta & DTAS)
+		push_gpib_event(board, EVENT_DEV_TRG);
 
 	spin_lock_irqsave(&board->spinlock, flags);
 /* remove set status bits from monitored set why ?***/
-- 
2.51.0

