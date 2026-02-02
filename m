Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4E3587A6
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027657; cv=none; b=r/rOyUkd3ujrgrDDZMQe1QcZ6qJ6xG+dl1yBimKlQhfGu/e3rIO+c6pn50TYfhc06ooX1+7Zw5OmfUlnThSTMzNO2Zg0lCp0w2FH2AlL9p0zE/bg4kMwGB4BGrkW8nHYzMAV8F3vAiIZ52S2+MQcv8i0/LqiB7A+CW1zVxg39qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027657; c=relaxed/simple;
	bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBamplFMwcrCc+Jrc8iObZrsqlFtc8PjDDWvnyWMyr1wINot5n3vPRipA0DpD0TTPB7eS/3OYSKMdSbfWMnvx4buZNr5c1La1teHyobGx/gZ0jRATuTHosMVw5vR8yfYcEHE9C8Zs1J11eEGInNjy6Y8qSJTVk94M53t/8ZXwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsXyUNkG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsXyUNkG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435a517be33so2520861f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 02:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770027654; x=1770632454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
        b=CsXyUNkGe8NFr3zRpf9EvdosarLjCiXOqaE/PG25mgD2tO1X3dd3ritSXurEmmRE6+
         bQ2KoWkWE7AusnVNhJtrpIBKm9tMPg1DVtluphQPqfq5nltUecIHo7Sizw0Z7RL8WL10
         QHrHZdrrjE9Vt9kFKe5nLGJcB6S0mACsli8rHg6KneRO0Jh3WyBrbynvVIgq8M2oSTu9
         xtrKEE4XLHnkF+7zDeeicH/wjgqxrr5owF7ijKHkPe2QUG7IUSzZgRcEOWELKkKkoqYF
         0GgERLSPNNlNXosPrRpypALBb7EH7ZrIfDre184P0OQuZGPbFGQXfLQgSGV/auMYsdFv
         cZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027654; x=1770632454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
        b=eINvu64/cd8ZT8lxXVs7XwbDvuT3A4hprKTcWOzZ0OoP3VJ4AXjPW36NTJY+Jg+jKR
         y9noIH9ZKhIvY6VZNSj6T784dZF4L1Gg1CMylWdYEkOKLvh0Zs+guiep+2K2O8VrVDco
         XBUXmxLVS8osvRAFP1rsRfPpdXMiu5QIFK1G0uUU1TtUv6vEhwPtJ4QNYFd+ZWyMnrdM
         qHeP9k24WoOw1qPcE3nKOMaM1i/tovW1aJWfGd7JuqvW3DCM0YY0m6yO2F+wDB/5jqZA
         T/15gRFPsROQBzI7hP3KOdoQ96v2+UFk3l4wTeDftuRPAiaQJlNcwlb4GSG/m+SJHASZ
         IK+w==
X-Forwarded-Encrypted: i=1; AJvYcCUHZBogGxR46nvwDuBVcrTwHr1qFy8ayIGsvyxIfY2kST1oNJhys+5qOcv8ewVBUSfQkT7jK9yZZ6s67dU6@lists.linux.dev
X-Gm-Message-State: AOJu0YzxEPtqQd1t1iyoGxf1xvPnUwGU45VCKJVSUX7HKdxd0pT2kJ8J
	fx5DBSYIqAu0SEWAfKo36KgOfIrTRwbrdgwTzyOjNkxBKFWT0Y+HDtVk
X-Gm-Gg: AZuq6aJQCImmkXIEMutuMa4iIi/fwjN/vbz5Z0k6SUqdvBmZKgNEBvLde9IPkkE8YIO
	9oHr7VkHk7rPdUpMUdxOE+0Ytr1KoKw+oUOufaQSRoBWY/ynSFidsq6lkH/TOIVY56nBxFJWDpM
	e2weYwdAXamN7QB+Kz7dt1xKMwnnUU/Peuomds1YIUdvFwWIBf0JwLV7p/j20niAs8NsN9kyz1q
	ZToNJRINNUAI1YzyFhxZ4DfNJT49vJzHzMSnhDxkze4t0ULmDeqCfTDLsbVfIDFFA+mM0pBhbBV
	H3zpIAnr8tlaOJYaSZKfM7+slpvrChwDSCfduGFuxFpwlInM8xVLq1i2imNX7Xw6rL+yVUY7bQu
	L1TTMD4dhwEhs3Sjz9sgBmKhw+AdSAG59Z9Co3zwumXKohHfKPtzQyPEZtgvnXAb+OQ8e5AyxXD
	0kdeB/byVRu8Y3c8gqmq2V+pR4tjsEnmO06Ol4g2Aw5zOa/PFN
X-Received: by 2002:a5d:5885:0:b0:431:808:2d58 with SMTP id ffacd0b85a97d-435f3aadb41mr16590973f8f.51.1770027654151;
        Mon, 02 Feb 2026 02:20:54 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm44667193f8f.26.2026.02.02.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:20:53 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [RE:PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:18:43 +0200
Message-ID: <20260202102033.9642-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026020258-very-numbly-b36b@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Was this an AI generated patch?

I can assure you, it is not AI-generated.

> Either way, it needs to be properly broken up into "one logical change
per patch" like all others.

Understood. I'll resend it afterwards.

Thank you for your patience.
