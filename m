Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2001A38F9
	for <linux-staging@lists.linux.dev>; Sun,  7 Dec 2025 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765132688; cv=none; b=he5MWI3azHFLg4TiY2lRQDvh/D6Z4DY77mzR6mpZy1a+cTuaHkg9oCR/8Lqv4pPstUfp9vjMgpH8pZOe552KuGW8ZmjOgR73V5dzNgn6oklZZWmEZOuc8jv4WQfvM3VnvPODZeAu0Cjki50v8wOyb7hwW9cQfMjdVF3cSsS1kLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765132688; c=relaxed/simple;
	bh=uMsgzOQoMLVJfoLdLE3edbEtJbxu3hNq160at3+EEjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEz7CADts6+69QoZkaBI1p8vVinr/PlZdevHzbsYJJhf01t0UBMjnlY+lww8bBVl82gydRycKPiIlQNQqs5AgZ+5OxErmCRtrnjmU79NjVDltoVY3CBQMGvoXtPmxQT+jtH+gkVD3x0ZJrUGqNVDigZQN+2PvIaIRfDKecJujfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsGI+z6Y; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsGI+z6Y"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b80fed1505so4083752b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Dec 2025 10:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765132684; x=1765737484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idV11jp6AZs8EzGVJj9/F49gNvV3m+KpBm0ikwz0DzY=;
        b=LsGI+z6YYNQdcqBXsJKkaAm3BXCmwy5J3OiwFH4tSf+vDdHvYaVfZ9vl7LVq8CXKzv
         UaYCMu8tmvAOO4DTroC8abSBPeur574zGd5gZp9rE55wFUFr1R90QQSiCqHqhnebgVQf
         FURyW9EB/Z1wQGwZbOG2wDl3rhoFiuHSRX+W202fn2Nt1ozUKX+/InwMZkSk5VxD7yTp
         k5HqYoV+mXLT6Fxxc8kLKihpMtVz9ze+JIhjIdGkiPC+FHoh64aSKBJ5h4k/Y+qGVnv3
         TstAkR/qjDXuRItA5X5o7VWBd+yFWBAIBeO8g4s9CoZ9f5Hpssg/yS/L8PVyOC7CFcnj
         MH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765132684; x=1765737484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idV11jp6AZs8EzGVJj9/F49gNvV3m+KpBm0ikwz0DzY=;
        b=W3QtcTJXqmQKIH9KkM9zbb8BwNMv5HyDB4C+IOQe906G16NNDYWs9za4qHHOtfjqx1
         j9lFWYY6CQj8WvG/3q4u16VYc3ENIvj2dYuKVX3sZtyvwyaJy4DV9ShBWrV0X+nVk0iQ
         8Qyl/mFiQTlVgSSxwFtudNIQBeRRkHRc93bChv40ei0HAJvufZtrtsmYtpKK3NpTDeTM
         ks/VxfPJCNBHgu0DJ18Kc2wjN6ltx82j6u94TX2gob0fZUDRbVSF6pPiSI1IwL0+LojQ
         BW85H4bex3QSHu4TUYV6NJMG3q45tu8IPx6/GQ/9COvH93zprARb/Z3uQIQX5Xi4tTix
         lIJg==
X-Gm-Message-State: AOJu0YyKkR+fh79okM5jEe/7GCbflYaLIvcpqXUDYqnOYbjU0QnviGg1
	mBB0p5V5PGX/7Yqcddv/2I/dJfCJCY5xbe11LhaJnRhGdDiEDJUsrloq
X-Gm-Gg: ASbGncuJBQ7+m4+gN0wyc3+uuzTOMz66g8aWabqXDk4orDBWXF7D9BR8VecdUwQ2466
	yFc5WgQ8OFSfMy0OwU5WF1shCScGFZ6Iw1SnsaWPp8UFo14qSgXQD7dVkNMUXEZVkWqaMjU13i1
	oCVH7huee8acB+vWaaV8tySokxNPRGBW2M307y82BLRc74kg4gBxD6f+cyP+4SJpRju4gr7aXy9
	MjLbRDFhH571ngN3vGOho8dSYrpLQb4jz4Rf1bcHPM3X9VHsP2c+/hj0vrBHG+EffaowOu6HVtW
	XHrI/FnOxypnqohd7pA7YKsZcdkXjvHdcqs5BuiyMdthYsF0cww3LOjHUXRFK/CXxZIzVUfN98f
	EDe4a9ACCsfrJHzkiRKC0Z+ahxzn4fPOP9PS3D34P1W1htFY2rNncWyLGvqDuBrIqtorKWoWMKN
	WqEWIJZThTzyx0ZUMYx9VtWxux87pMBsUh
X-Google-Smtp-Source: AGHT+IGHV8JOKkjEXC9Bv6koMq/wfYcU2y1t+/p/MwyBEhkP0sKzZiQomgT2olgZrFxFxzWvLaqg5Q==
X-Received: by 2002:a05:6a20:3ca8:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-36617e6fb61mr5230747637.25.1765132683971;
        Sun, 07 Dec 2025 10:38:03 -0800 (PST)
Received: from archell.tail4ddb89.ts.net ([183.83.53.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a32dff0fsm9956228a12.32.2025.12.07.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 10:38:02 -0800 (PST)
From: Aaditya Gurawa <aadityagurawa@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Aaditya Gurawa <aadityagurawa@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove the trailing '\n'
Date: Mon,  8 Dec 2025 00:07:43 +0530
Message-ID: <20251207183743.916085-1-aadityagurawa@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes trailing '\n' from atomisp_trace_event.h to fix the output formatting.

Signed-off-by: Aaditya Gurawa <aadityagurawa@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_trace_event.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
index 4c58a8f5c7e8..db077e5566f6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
@@ -44,7 +44,7 @@ TRACE_EVENT(camera_meminfo,
 	    ),
 
 	    TP_printk(
-		"<%s> User ptr memory:%d pages,\tISP private memory used:%d pages:\tsysFP system size:%d,\treserved size:%d\tcamFP sysUse:%d,\tdycUse:%d,\tresUse:%d.\n",
+		"<%s> User ptr memory:%d pages,\tISP private memory used:%d pages:\tsysFP system size:%d,\treserved size:%d\tcamFP sysUse:%d,\tdycUse:%d,\tresUse:%d.",
 		__entry->name, __entry->uptr_size, __entry->counter,
 		__entry->sys_size, __entry->sys_res_size, __entry->cam_sys_use,
 		__entry->cam_dyc_use, __entry->cam_res_use)
@@ -68,7 +68,7 @@ TRACE_EVENT(camera_debug,
 		__entry->line = line;
 	    ),
 
-	    TP_printk("<%s>-<%d> %s\n", __entry->name, __entry->line,
+	    TP_printk("<%s>-<%d> %s", __entry->name, __entry->line,
 		      __entry->info)
 	   );
 
-- 
2.52.0

