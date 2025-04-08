Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12A2566E7
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154745; cv=none; b=r6YBmj5zGjVJ1BidY/lFZdmbmlvUTz3d+fQC/aaPpYWo/C60c7cHvGIG6lRWdtlZ+cqtm1kMLVagyzAeRTORCHc6b6+oXjKafTLWPWXrC2QYtIOdgIerZt3p6ecBTF7GsVhzqgQGqRklyCQZHVr6ykOsiAlIq/c8gEDYq1ArZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154745; c=relaxed/simple;
	bh=slT6m15jtOTNs/B2FLm4zfuo8rL09VaXielIzRuqlBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdDjD1rs3YCHa9wcrnLPB/dwpxX6Qvwfozx6bInElmVriPMu3ZERcl34UkKrMIr76O7f1JIxik8g63AEqqozg+ntqfaAQOQmUJuVOFFUKxRbuGVMgfJvOl2f2Xso26hTj7BZQEKCK04Kv0pCi+r/p7dPcHFpAdfz7x2689R9mk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UtYiI3DD; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UtYiI3DD"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso4244988a12.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154742; x=1744759542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvVUYF3W9WGYrgSJIX9w9iCFvoKwdGoVDieJ1Vz/Ohc=;
        b=UtYiI3DD4DIIQPxbZDaeL3vWyEJXEjEJ/8de4exVmyS9fX4Gya1mKrqFLr6wiExiuQ
         25xaMdbOCKou550aRWiM9lmQhnXMj2EfDxc09yfzCWY77AgKcKIIRRcpzj3N3vtSXWID
         g8vjR12xyBsWUEcAKkosDrYjuYdTnwlxb1BZoAPz04EL/j0OiliuDQj8hjzq+zvGel4q
         lNOX5g56737juukhvsRaKXb5GF/yKJjfGeuiNo1IjKuaiQQ+UN5kEiuZco4Dd8Bfn15T
         lfThkKB84VMIJx5D/p+5E0g0zPBUASZYFmIoBZ3ZwEb3QdGR4s4H3NSmQ76noliVb7QN
         aZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154742; x=1744759542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvVUYF3W9WGYrgSJIX9w9iCFvoKwdGoVDieJ1Vz/Ohc=;
        b=u80WRWIZOyQKlyRiF9PVHpHOjSpxhdX8eAgrWr+yrwBr3kTsH2Fo+fQioWHYforPjd
         9PhgGazueG6QzsaHbzKIZX3nHOeyLmJ6vwGlmKLbDrTUhCrPbfAwJHGofacXOOPFdQBN
         uYt4AktFkLpmDvrLfYgB8/SHz0OwzMwZC0+mYb1KXQlbAUR7ynzQCPWjxp2ir5P9sV6N
         /K5Bry/yd3g7+bVezebgNg5VWXtQAhdyZ2vzeVA7Y3ciBL+78TfRBPTVVgFFNNfgHnIz
         ZkoODU/VlZjxkL3QdSFDQ/rykuGJVXCpJ00mQEjamGMrtWHmUSTqWHUziZ82X+hu+Wuj
         D6yg==
X-Gm-Message-State: AOJu0Yw65xZDaLE3di6JBiewvdub6Mq6E6zTW+LC4WwsnG6SsLlIFSvv
	/Gbj+LG6cNzIGVah/I+k4F3uuS6PanMfhFymXGozg8yEsgG40lnIcVsSYa8Fkg==
X-Gm-Gg: ASbGncuWY/n8JklWUfUs2DIuZVyd5CH6805vHMpGES2H5Ga4dFZaaS0opHFtcOHa+gf
	kI4STyNX1h5T9c4wYxFCdEXXAIg4B68K5lzQK3C4QVmk/7jQ7/rvSsixkNmBMVuD+GAom8X+UIV
	Y5hegk4mMrOaYY5W+eFPIzvdc6EviOTDR4iGt55i3TbpVlFFp2Nxfe4qDZP+SExnyHIeTLXA4+o
	q/9sOIb3r4VTLcy91oeG98g0gYh9RJYetxiOZYQPMRUy1LCfkZkiMuMEICyX0yYpBseqUBQQEZo
	s4KbtRTM8QdgXyjrtAPnD097vIWNmJr6Ur8PApW9OyP66ZZipxJoP1ykz0wAOcXDBchnnCEhflC
	CY61E6zmf/g==
X-Google-Smtp-Source: AGHT+IFK5EKx7Wi3+ySQBoxihMaRXY/3fkiix5XLIBkPbmbfU+gZbTOS9D4JxSE8/AuYlWHhbuLCgQ==
X-Received: by 2002:a17:90b:548b:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-306dd5789bbmr322739a91.31.1744154742199;
        Tue, 08 Apr 2025 16:25:42 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e3b2sm106860275ad.178.2025.04.08.16.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 3/7] staging: gpib: Removing gpib_event_t typedef
Date: Tue,  8 Apr 2025 23:25:31 +0000
Message-ID: <20250408232535.187528-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_event_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 8 ++++----
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 3fb369caf17e..575d9b65f293 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1848,7 +1848,7 @@ static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 {
 	struct gpib_event_queue *queue = &board->event_queue;
 	struct list_head *head = &queue->event_head;
-	gpib_event_t *event;
+	struct gpib_event *event;
 	static const unsigned int max_num_events = 1024;
 	int retval;
 
@@ -1861,7 +1861,7 @@ static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 			return retval;
 	}
 
-	event = kmalloc(sizeof(gpib_event_t), GFP_ATOMIC);
+	event = kmalloc(sizeof(struct gpib_event), GFP_ATOMIC);
 	if (!event) {
 		queue->dropped_event = 1;
 		dev_err(board->gpib_dev, "failed to allocate memory for event\n");
@@ -1905,7 +1905,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
-	gpib_event_t *event;
+	struct gpib_event *event;
 
 	if (num_gpib_events(queue) == 0) {
 		*event_type = EVENT_NONE;
@@ -1920,7 +1920,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 		return -EPIPE;
 	}
 
-	event = list_entry(front, gpib_event_t, list);
+	event = list_entry(front, struct gpib_event, list);
 	*event_type = event->event_type;
 
 	list_del(front);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 4be7cfce539f..8ec89290523b 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -302,10 +302,10 @@ struct gpib_board {
 };
 
 /* element of event queue */
-typedef struct {
+struct gpib_event {
 	struct list_head list;
 	short event_type;
-} gpib_event_t;
+};
 
 /* Each board has a list of gpib_status_queue_t to keep track of all open devices
  * on the bus, so we know what address to poll when we get a service request
-- 
2.43.0

