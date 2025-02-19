Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B6215052
	for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739989936; cv=none; b=R3i+FhEVCp7+LdVctGnVfc0lL0IMMbtp+HwskvGDgk63wgoJeotc+Mwfn/Ro9Wzc5WdmfybU+LTSlISnK6udGgYeCUEPggxGNdBJJmX6tsQcxwcfHjQ1BrsCyklNILiGVC6OqhZU7v2VbzkxV4fEffAtW5qJt86VM53l4/OugdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739989936; c=relaxed/simple;
	bh=QfyKjw4MDCgZaOxGfN2uwVxtfrJyJLTRioCkL2n1c34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQ9LpJeTM+/L9Knaa7PvzIvNaIwRDOlgxKr2WdjRNuKQB+me7AZQfJxOgTpX0jFtkb3DLUU4cgLlqe9WI90cHW0uwxQEFI3Bx7C3sVDeb5T/uZ1UVDV+Ur8J3BGZKrsVAIcrBvSgJ3XomabE4rQyTTvBZnISrN4hF4CwThxsTtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K82Zqqra; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K82Zqqra"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-219f8263ae0so1132945ad.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739989934; x=1740594734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55B5QwxESijKOi7V8xRhvFTRJ/sEBfufvBcf3pQsyzE=;
        b=K82ZqqracGrwW+8xeqP/NNvkmeAXYoFteKCnObkQJNYrtxa4tljXn/qV80RN/oI7cw
         qWJ4agbEyuAcnNiziiOFPg71vsgAFm6psbGM36BwPP8zoLQctbq7t7EGGUfvMHizDAK8
         e8XgNLQyNXJSKvCKiaXc+Yzbpe03ArqiITkFGjMNYt+TB4ulJY+1vZpNy1sUHyIMbx+5
         WbYWgEiIUwyZ00TzNtYjEUW0ynFszU4TLL8JVx2G2UtRfNqdHAXNliz5Fl6y1GZrreez
         FkpLRo0CgnStmBpPIFTgKTtnJbKIwkULurEMAF6QoYXwwIjUaWTFBxbteb0w4tj40YQK
         C0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739989934; x=1740594734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55B5QwxESijKOi7V8xRhvFTRJ/sEBfufvBcf3pQsyzE=;
        b=QB2O4Jnj+9rFIiVRxvo36Q8WNTeo60IdHCnDLIW4hZGYCMDYdqgoXGiZhRacFPwqZy
         Ts5Es3SyDXBlqrRedFzRorG5lZORn4sfUt2V7TbUtyKyRcH3U0ILtcfiWgK0+R0WoyeZ
         G7QJuqGiRts1FZlaOMPz9mzBEseiiRJk/vRSKLw/d9y8OE4a6yZgeTgeaFEE24nDNUla
         bnx6dxNtNnrxZM5J/1dk4M1HQGbKOVgC/WT78YI+Zry5k8avWmLqZsEmmH/K0uuEteu4
         X3glLEcT+IwQZfC7GAw5IjQCJ8xKq8Zy3mw0Zw5RaTNWEatJvdm9FM9awydoPb0h97F1
         S1Nw==
X-Gm-Message-State: AOJu0YxO2EjbXZYHhlXDLhvuTe7xG8HkxrvOlm/LWZINq833kExc5Ht8
	yUCDInWjmd5MRIIQEGLoVpi49ES3AAV1aG/kFEfkCQkNEw8aTsGzXJpXdRqL8RM=
X-Gm-Gg: ASbGncsRyKG7/DECkg312svl7OxD4NQM/DLuu9146umu9n5jwymKFGuul+pwbV6ndiM
	usrs46DTKuIB6yJyoQmrzZYToRw+8sUM+qihZPLXpvj+MSDbKBuPd2jaE54Swdvfb6SjhZm9Skl
	av3Le1db2z3uuh8+cFZtsqCqo9JQmCubUR03OYA6uWCJDKoTXiT6kNpjNj7SnSrRIXFXtd0RZ9R
	4Rta/ExEyIuu7a+W5UjKS1PeFlHTuPdN0/0Q8YXavjIe/ieocqc+g2cpnQiJjNPE2PcYHzcBfvx
	aDauOgmnSbcc5D4jQuRM
X-Google-Smtp-Source: AGHT+IFBHN6lLZxWjiYIJ+WMNnGCRA7mLu8siipLcS72M4Pd5NoxJqK72OpswCHL8Xh4vhLqsV6Xww==
X-Received: by 2002:a05:6a20:a11c:b0:1e1:e2d9:307 with SMTP id adf61e73a8af0-1ee8cbe3aeamr30297976637.33.1739989934287;
        Wed, 19 Feb 2025 10:32:14 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:e1bd:18fd:9875:3b67])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-adf06b0ada5sm5567513a12.19.2025.02.19.10.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:32:13 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: most: Remove unused mutex from most_video_dev
Date: Thu, 20 Feb 2025 00:01:51 +0530
Message-ID: <20250219183152.176679-2-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219183152.176679-1-kumarkairiravi@gmail.com>
References: <20250219183152.176679-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

The `lock` field in struct most_video_dev is never used anywhere in
the codebase. Since it serves no purpose, remove it to clean up the
structure.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/most/video/video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 2b3cdb1ce1..bd51125698 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -40,8 +40,6 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
-
 	wait_queue_head_t wait_data;
 };
 
-- 
2.48.1

