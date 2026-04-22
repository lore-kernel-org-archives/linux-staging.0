Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316D2652A2
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838810; cv=none; b=tDUlFQbLinlV09A6A+BwlwFZmaFDuPnrU7Pb/lLIs8zV8MKHWndcwXWwIxjTJWD23PFeSR5H3t+tTfjsNqANM4CdF0cqZXDsYUILB+tDqwsqGOaz1O8FAOC9jbO/bEgTVbpQqwevqvifpglxF70rg5AO85Mi7AD2eF6hM9/jmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838810; c=relaxed/simple;
	bh=62ziIt/IPA7GFwdkYJHiXxDdUjlAJ8QH7KWSz0/iBGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I71sND1ZtI5+nd352WSL0X5K0jkVliEO37fMru2Cjykio7kigfrN7Sz3iAGe1sr11o5c+8tk7T5HrH1xCKYnAcPRm1kbARtQBvGkz9dr6upbD47g9KOHp5S9HdvVKlj5biMLGwJxmctaubxl0YIQdOAbsmzFM7FNGEbir1XgckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEDGQkmc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEDGQkmc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aae146b604so33869465ad.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776838807; x=1777443607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9ExnrylaUifhraiDuvmiibs6vGtay8V+DWLv2OsyZs=;
        b=iEDGQkmcn1kuxFoE1eZo++3HEFPB39xy4PmawLBXCzSAjm8TcUk8aS3dP4NOPA0rJU
         ViiCozE9LC8O7Ivw01yevqCi8irfcsv9FIKiPa0BlITqSFv7VvCsvx3fW4qbcJbF0eOl
         cQoKxhf6rGDyFzIBbfhxdK8NAlWCwXv4IUriq3mFUdEr47gqnipxdJfYdtbg32Gn0/fC
         AsjAJZWzxnjJx9Fc5uMNx+R24qUUCYmEBURG7Vy+aM7ytB141kdF+VcaY0khTtjfZLWo
         PMHBJ5x9JlmAkY4mp4k6B7/mbaex7lOoTlL0n+M3UP29/bQzfUeuyGIAYmglxWLC7fr0
         iPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838807; x=1777443607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9ExnrylaUifhraiDuvmiibs6vGtay8V+DWLv2OsyZs=;
        b=JF3IrEBc0407sO849kd2gAOps3MxZ07SBPQN4OnbXPs38bMphtZNESJMCy76h7f5DL
         zoQns4F030e3M2Xfu2X6I9k6cxK986hyalkpesxwpKoHbbCSBIqLKg2U3P40aAXtZefz
         YhMaoHSlbyD80GMakvw31QlZGqO/iN6HL6SbVJTbSnzUA8vhKoDuXPu5cJfupaSSTFLC
         cL3JKxnZw2C4bDboi9gF/0qlL4VL9TFVCBlBRruURYIhy7nhabNsG0swwEIU7CnUPPwm
         WsZWj6/9/vdJ5YGFGyNkoKNk+2oX/HIzCXCCp8+MBrxXK7vfrfR8fR6lRHQHe//53d92
         Hy4Q==
X-Forwarded-Encrypted: i=1; AFNElJ82OndIDEirUPLzkLWET59ArPouHE4LuFJavPueC1zwrFzlJwlHQGN3YGMklQRBpBJ0mS5BS2blfg8zxQP7@lists.linux.dev
X-Gm-Message-State: AOJu0YyEExVBMi2t6y8wjYp6H4Z+8oO+cR7TOHiO59p/c15JnuSyw1Nk
	UjhiCuzzvIVTX5uepkJij4ZYCSJr/WE8x2ly47YsukcFkw480gGDZOHn5wgRV9I5
X-Gm-Gg: AeBDiesalxqgwYaz36NGMPl/lJ5/0qMJkctovZioZDmXzADEQm/38cfZF7ejNESrYpB
	gHZ1iHUOKkmh78+jPC0EhVJMbvaRqjWZBvr2QFTIOUEHXAa+XgniLZTWR4f0YfBLopobZU0Debc
	6m4vEjOa0r8jEKnSak186qxvgKCAXcZODpq+L0lpQivEtrjPWXlS8Pi3JCAy36p9/tPjBjKvenU
	DrDHNbvjI+s1w7mTfDAc9P9pMNECo/iUTnW73UoXxfedZs7Z/nTH5ft7BnIgIZHQrxNepCqEWF1
	uM2SqYNGH207k2wq4D0O9Ev3AywVlK37MLryQvddjNXNheDkiEj+gckBYebw1A/JhqZSV9RG0Bc
	Iid55prukM41B0WPh1XIUPMarqN3rILUkayLthOsArPOKeMdGLNep4l73mrr250cH6hBkVXJrPO
	i6UZ1HszmeHylhLGncgPqsgQgd4bk6363EhIOPXVJ/q5mQ3umTVeODzRGoQP2bsQryx58Ejzt1n
	Pi7lLux1s/8pwNO9uTVTpIKvK7PPKV4taoTms6UqKay6SHjVaw7vnt4MAkrxZVUcSfevRY8
X-Received: by 2002:a17:903:1d2:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b5f9f4e110mr230390895ad.23.1776838807124;
        Tue, 21 Apr 2026 23:20:07 -0700 (PDT)
Received: from HPVictus15 ([2401:4900:1cb1:c66e:4923:54b9:776d:c8c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf81sm150926775ad.43.2026.04.21.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:20:06 -0700 (PDT)
From: Sajja Easwar Sai <eshwarsajja20@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	yong.zhi@intel.com,
	tfiga@chromium.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	Sajja Easwar Sai <eshwarsajja20@gmail.com>
Subject: [PATCH] staging: media: ipu3: fix out-of-bounds access in imgu_map_node()
Date: Wed, 22 Apr 2026 11:49:51 +0530
Message-ID: <20260422061951.352746-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imgu_map_node() walks imgu_node_map[] looking for a CSS queue ID. When
no match is found the loop exits with i == IMGU_NODE_NUM, which is one
past the end of every array that is indexed by node id.  The value is
returned without any bounds check, so callers that use it immediately
as an array subscript produce out-of-bounds reads.

The most critical caller is the threaded IRQ handler
imgu_isr_threaded(), where b->queue comes directly from firmware; a
malformed or buggy firmware return could therefore trigger a kernel
oops.

Harden the code in three steps:
 1. Add a WARN_ON() inside imgu_map_node() so the 'not-found' sentinel
    is made explicit and any future regression surfaces immediately.
 2. Guard imgu_isr_threaded(): skip the affected buffer and emit a
    dev_err() rather than indexing imgu_node_map[] out of bounds.
 3. Guard imgu_dummybufs_init(): continue the loop if the lookup fails
    (this cannot happen today, but protects against future queue-table
    changes).

Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>
---
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 84c4d0bf027d..b231e7246f52 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -62,6 +62,12 @@ unsigned int imgu_map_node(struct imgu_device *imgu, unsigned int css_queue)
 		if (imgu_node_map[i].css_queue == css_queue)
 			break;
 
+	/*
+	 * If no entry matched, i == IMGU_NODE_NUM which is one past the end
+	 * of every array indexed by node id.  Callers must check for this
+	 * sentinel before using the returned value as an array index.
+	 */
+	WARN_ON(i >= IMGU_NODE_NUM);
 	return i;
 }
 
@@ -115,6 +121,8 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 	/* Allocate a dummy buffer for each queue where buffer is optional */
 	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
 		node = imgu_map_node(imgu, i);
+		if (node >= IMGU_NODE_NUM)
+			continue;
 		if (!imgu_pipe->queue_enabled[node] || i == IMGU_QUEUE_MASTER)
 			continue;
 
@@ -535,6 +543,12 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 		}
 
 		node = imgu_map_node(imgu, b->queue);
+		if (node >= IMGU_NODE_NUM) {
+			dev_err(&imgu->pci_dev->dev,
+				"dequeued buffer with unknown css queue %u, skipping\n",
+				b->queue);
+			continue;
+		}
 		pipe = b->pipe;
 		dummy = imgu_dummybufs_check(imgu, b, pipe);
 		if (!dummy)
