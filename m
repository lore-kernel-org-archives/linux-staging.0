Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACEC2566D7
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154747; cv=none; b=Sfg2Tx30IvJtiIJSkHuJ4M8Q0ETpcBIZZGdLj/2uzj+sfLWbvX+tAb28QW18OYp7Hwk7JOeYrxdu9TKOZz+9J5bf37r2XvU+AbcENj9B9BoPOP5FiipD0XX/VUz/ZYfvKjdO3jmFLyjdXeA4eA1z2YrxsG3cfSKE4OmPLekmf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154747; c=relaxed/simple;
	bh=f47LmV+7WjkLMPIKBfkl9xJdb7ie0wGOQSjehuWY3ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jj/GCVB5JYWNAJTVq0ulf5Hf0U4SI4fEMFLLEV3NbxN2qto+L7T3mYrBXLQ/tqk0fI6ahIcv7EkaJMuBIYAohqrHICsS/s2WvU+nHKpzO32jlJrnAqq+sn1CQii2/2vW5HjWUIQIYV7e0HoL4Nw4TzdNNr2POG7gMvilSr944YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=NamwovbA; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="NamwovbA"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af51e820336so5785547a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154744; x=1744759544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2xjIWuXyaxMet536XfRVVtc+yMtIlss6dqtracfTNw=;
        b=NamwovbAGbqSPtRMlRPfdjR72gDnlAur7IL8AIQQ/krLc1xPlpI9TD1o2t28zvG+cV
         dOGq+ScqonPGGEGaobWbO9uXQxXg4DbGjYgJy4fRw15ouO7QXTUI8GRScH9oGsjWhjI1
         FXPnbmQTbHRmKD1+qgTYT2Ou5DnfoQ/iZPo4pKUEiO2lI6x9kJhlBcPtqVZHWfi1mXSp
         W3ueUTR+FVHuRqJcFMBu5Xy/kElva9Ck1gyX+ih2S7itHdFRZE4iwgbm/ICEv7BNNAGS
         9SFe4if9FToYntSwKoieIdJZguOfanjgYAKWjv0qtDJjt8HLJYyui+OoAp4padpTh3DO
         HOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154744; x=1744759544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2xjIWuXyaxMet536XfRVVtc+yMtIlss6dqtracfTNw=;
        b=qFvjy3CtVieFwJgGP0EVhucTtL87C3zlYfPt/dyYzndiw+0KHXUTiNyK5tsU0GdDPF
         1RDUlHiNRK5ktsNoy7OO1lDCvcqPSJw/ZiiMisvpZ6N2Gn/aGZibSpQOkdgU3e5XSK7h
         hVU8Qy3iTPMW1wjDo3nHb9HnlyTHIkwj3PQ1Zb/3/a+O+wvGYEQ9h/17NTKHBDf4NQCX
         HP+r57CvmE23tbf5iJvc0npkHukCm3g0xbkgQcv4BYeq6dN2m7NLJGK/XDGiDAkbeu0r
         JtpMwM9nt+ORzN4nFNhWBmrxGAvNPMmoDg2usAIv18B/WQyxYa0GVlEKE24WloBwyi2r
         umrQ==
X-Gm-Message-State: AOJu0Yw1vp0TEuVnANResFGRxX/0fzMw7K3hcTWkGLYscpsO4DrsY72h
	42uYLPvQba1dGaVljPyQpeBz6MLRWU2YpTB1soWKc4lLq+wykEIy60Uq11z1jWFiC4cmsr0AynQ
	=
X-Gm-Gg: ASbGncsWnd2lggGEIp6CNlmQpkVFKX0q7SIx8GRbJnnxtgWp1x4Cn6yERrFjrAY/MIc
	DJqwjmxAQ2SBjMKp5I23P+QFg6OhtgZAwKKLrvNY0lpQ0T9hFHM9g/yxLKmIEuWytyBl+iySCto
	Mc3wZVEtqqZYz5SBPRjVUS04/S7oqXRaK+sQPM8sbSrEk+pyFKyL5u2a4ix5rx+dSlFY+Kp9d9d
	O9DJx5DeyqiJGwdkx1eqYnVcZnRSfZ2C1a2rPgtopmvTzSQZ+QP0h4wyUvWyRBGteLj+1MvnUUF
	a7EOvOC403rTPOLplqDkasYZf0aar+Zqwnydm8w10FrvfS/YvOU2ULbzppHri9eP4mjUz6SVuO3
	pf9PIt9TtZ+9JcuM4GAWy
X-Google-Smtp-Source: AGHT+IG/xSy34k0CFTgjANoPWktPJ3qK1n+UL3TMBJIpsVBenJhFTfbQo1dWwYbicmN6hxa3SriRzA==
X-Received: by 2002:a17:90b:4ece:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-306dbb8db11mr1260947a91.5.1744154744609;
        Tue, 08 Apr 2025 16:25:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f36besm11186913b3a.72.2025.04.08.16.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 5/7] staging: gpib: Removing typedef of status_byte
Date: Tue,  8 Apr 2025 23:25:33 +0000
Message-ID: <20250408232535.187528-6-matchstick@neverthere.org>
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

Replacing typedef of status_byte_t with struct gpib_status_byte to adhere to
Linux coding style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 8 ++++----
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a2138c7f641c..b06cbd53c36f 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -183,7 +183,7 @@ unsigned int num_status_bytes(const struct gpib_status_queue *dev)
 int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device, u8 poll_byte)
 {
 	struct list_head *head = &device->status_bytes;
-	status_byte_t *status;
+	struct gpib_status_byte *status;
 	static const unsigned int max_num_status_bytes = 1024;
 	int retval;
 
@@ -196,7 +196,7 @@ int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 			return retval;
 	}
 
-	status = kmalloc(sizeof(status_byte_t), GFP_KERNEL);
+	status = kmalloc(sizeof(struct gpib_status_byte), GFP_KERNEL);
 	if (!status)
 		return -ENOMEM;
 
@@ -218,7 +218,7 @@ int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 {
 	struct list_head *head = &device->status_bytes;
 	struct list_head *front = head->next;
-	status_byte_t *status;
+	struct gpib_status_byte *status;
 
 	if (num_status_bytes(device) == 0)
 		return -EIO;
@@ -231,7 +231,7 @@ int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 		return -EPIPE;
 	}
 
-	status = list_entry(front, status_byte_t, list);
+	status = list_entry(front, struct gpib_status_byte, list);
 	*poll_byte = status->poll_byte;
 
 	list_del(front);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index f85091b1bdf0..6a34500af65c 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -324,10 +324,10 @@ struct gpib_status_queue {
 	unsigned dropped_byte : 1;
 };
 
-typedef struct {
+struct gpib_status_byte {
 	struct list_head list;
 	u8 poll_byte;
-} status_byte_t;
+};
 
 void init_gpib_status_queue(struct gpib_status_queue *device);
 
-- 
2.43.0

