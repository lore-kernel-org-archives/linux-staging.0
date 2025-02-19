Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E18821507E
	for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739989941; cv=none; b=VwcmNBxht5BMQEvojFLsKlaNIeeRn7mIdUcO1h4Jj4U8eJOz9eoCtQo1sXAqQP/nS/0iX5ibupApvAb7FCb1YxajpaSsfahlZUTvz+hh7cb4qn3nUerbuMMeF+5t7tVJv7fJTMuUb4f66eTJdyh/cUZqxErFTWqkD4XV/X6UVg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739989941; c=relaxed/simple;
	bh=fpeqhpGWkHurwYKTB1xKAEQUJ9Ttk3Bi42IWr/pT15I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueSr01gJ684n871KXagslVGHpruPq0KMXBG0wYzr483ckqbeaFOG4mNFtO7cqQUBvfyIK4VsINirpMMQxdNiFHG+vOjpx7RLIWEgBj6usK1L7AJiBv5W0z46lZKYPg3O8Ct+Yf05JM6Kz7UtqE0c1vK6mIYUvyNyRbA/q0RF3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iD3vxJM0; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD3vxJM0"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22101839807so438045ad.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739989939; x=1740594739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AsR67bqF+fqYAZ1L+J2XlKEArNOWP27kWrQCUz/8HA=;
        b=iD3vxJM0hjdHmcgP6NrgM9oScQe7rKNZBAbKrgLrw5Ucs558tZ3ZjtCqwGIWp7rRHG
         BKTRXmbkNZM/wjoPmIZnpnuVrmRLhKOyklpVT8xYiFaJ9M9D/FCkT9bDNOZWAk42nUZX
         Dx7vJQ1XZecvVouXX3dSuTGpzRAeYbvhBMJ8yH06vcINHVXqDYyFGHwwGKwKRYmtyp8I
         y0HQK+l8d6N3ZY5jYwxjC2FDHLlVTRUhIJwM2gkLOJjh9bdB9l6YJsCmu0Um7DK8ZeMt
         DOoDxJTg5LDgjOPAWw7ggA9XmM95uOlcjGHFxykbOqCnhlsy41Y+xdhVbGh/jzX+1pye
         jgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739989939; x=1740594739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AsR67bqF+fqYAZ1L+J2XlKEArNOWP27kWrQCUz/8HA=;
        b=WyCeCWtEniMukiHeL9Ha7sdt7PfYV9nUEAYvYxS/mgyemkM710oemTMbRfEubAkLL2
         GqIcAyqcte7PK2udyMSYvAUt2zGMd8R/y9SBp+Erqjgstte65tSJ4/0jmKWlbRE9bLOH
         DG0obQxwzWc9z+a7HzLO1JkHa3wi76811fAGZhGvCxvqx11tuZX1qIpFpL332Gf3zdIN
         96Wqh39ucJBSkHCyFpGkXtaLWaUT7ikTnsCgTa0dy7yu+kfrP1bQe0lT/f0Wc9b3UX2X
         IcfqSTmOqL5zY9FDVAgxvv28x0J1/AZdQCTs1ldRSj3e7li+kRsAuRKPoUFtItKjxVA5
         /g4A==
X-Gm-Message-State: AOJu0YxYYohGppYLW92MCtS9B1c6yESgqlasoRvmPcJHgUgd2sUCtZtJ
	cBvOuEG5uStJTmb5iqI3ayNJWNt7tY7OLwKgem4K+3IJDSGglQFT
X-Gm-Gg: ASbGncsBt+A+mN5DMb4YjmGsmUNSeP8Hme1tzK50lVAYQa9HFihR182HhLtsuBiamHx
	BeKgSm5xYXaTXteN1ejaQyupehLWsQ07gZVcoIpGYaEPPJ0HS5daNnxwQ/7tkF7gIkOz3V0Tmlz
	YYWgMktvbT81eONiWO3SrVUvt0FPDOHXNGT5fD3ChCXltAosZSfc1azwXrrZPBHMOcNbxTlzFR/
	J5ash51Sa/txgmPl8mxkNe+RQ0u8OIeP6hRA6rbpV2G/zgZSEtjQ2QTCbr4yDk0SvJ4lMwGWQ71
	AHhO265IT80LEzFcJ+hy
X-Google-Smtp-Source: AGHT+IFN9puy/zUj37o1/n/BhUF6gbtq8eYesYjBrUEvPWWngj5jKhyU6I6JOVjKzlM/PyHF2yhbDg==
X-Received: by 2002:a05:6a20:3942:b0:1ee:64c4:89bb with SMTP id adf61e73a8af0-1eed4fd4566mr6900917637.42.1739989938742;
        Wed, 19 Feb 2025 10:32:18 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:e1bd:18fd:9875:3b67])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7327fa51eb9sm5848883b3a.166.2025.02.19.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:32:18 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: most: Remove unused spinlock from most_video_dev
Date: Thu, 20 Feb 2025 00:01:52 +0530
Message-ID: <20250219183152.176679-3-kumarkairiravi@gmail.com>
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

The `list_lock` spinlock in struct most_video_dev is never used
anywhere in the codebase. Since it serves no purpose, remove it
to clean up the structure.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/most/video/video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index bd51125698..83b46476ca 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,7 +33,6 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
-- 
2.48.1

