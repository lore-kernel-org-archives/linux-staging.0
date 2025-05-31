Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBC1925AB
	for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726029; cv=none; b=IZeXg0kHUr9mtGD278XOZG3ehYthwOHMn241ahnkeFIG4D2sLRTfii7/GX4yMix/IAlbw8BuOcdhhDMPz3hC2URV0TStr3n0SrA+JohjOUaqz5vNSTzvDM/Irx/hELr26kdVxtbWxPYbex54xcuuN/jNmgqt6Mw0nWs0/ZFgT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726029; c=relaxed/simple;
	bh=PRyboB1k7N2KcrjhZjcaIgm465CDqcL2+Yf2Cysk7ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tfk9XHG7x64TAtJ5jZCTN2ppK2s7bkMQywSxAgFCRncIyEyulXx12CEHmVAZTzzaIOn7Tqgk/rx1Kn8JMMGeunGg2LjOhU0SVSrjdk/vIl0144UBPvPZIMzOD4c7m8BPRc/I7ew3TXuz6FEw2/IHUqBpXw1SU2baDO7YiPOJ12s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxP1vLwQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxP1vLwQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74068f95d9fso2269332b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 14:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748726027; x=1749330827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPzi5xY/SLx3QtT6MiFRJHzuARJElgyvVmtym/koB58=;
        b=VxP1vLwQIeNjew4EYrV8vzY2ijTGG9qiO/Cktjr8rnYkInq92Yv2hFciRPQ6lsnb/4
         h5kvhOciLFz5Sd98rtbKDW1SjGCHG503/RTSU3oNunKShLnq4+ENgQ2QoE/jB/kXV8vp
         bwrL8NgHran3iaRlBt+1S5p5wJbMpFMo8JsLqA7Gq47Vv7cEPsAdEXvCZjLVU7uQJtDk
         1CL+1SPQ2C8dfcnUM+kHL6V/SCRN2utDlrnfIEaTWu/ooE92SQAlWmQy1AJ9Z3tSXBUW
         LhSkruG9v4AeaaYLBZ6Rhm1Dew7/9TTkAq3lPO7dK7NAIXlP0FtXnzNDDIWIsputJjHQ
         Nswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748726027; x=1749330827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPzi5xY/SLx3QtT6MiFRJHzuARJElgyvVmtym/koB58=;
        b=tSsG5ycL+oKVDEQeMYVBjBdWVXnDHxcKHqE0YM07HlfIwrj3wHWsgJVyWWwxuvdsg+
         kTNlLt6wzPyqVouHykrLBHnpCW2Wz8u9WH+Fc0eedgik0kwf0hlWbJqKMVLBDnIqA0Nb
         s6r28yhx/biPQbc/BxrCXUpJ4T1wSTd/buA0awpoysgT8iZ0KAY9KZxaZerb42+eK0ye
         YR9Ue7zrlzjAbz2XGF+NDexxFKmEX9lqIdv1Ur8f+Uo7onXdxBLZvZZYQAdbLHAXf26b
         B6vYUwf6JEI/tdr8wg/Eqr4dDxh0g5vScpwYfFaaYuvIKJ6XIiOc73f0GE3cShEGf+O5
         FG9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqlqZWiIM2o/2aL5G3yzcAfvN9U67HKQGuDkbzSF7j2nAChKcsOuJ+oxSMQGwbM15stwTGIOBsV/XHKpUe@lists.linux.dev
X-Gm-Message-State: AOJu0YxQX0Sg02RqFi4kKhj/WGkOZ8FPLPV+5DWLmYNQ7wTNvu1HU8j1
	QltAzhcKM+YxmPXt6e9OU4vih6znk5tSOY8A7jaSkRNdbo04Kptj2uRP
X-Gm-Gg: ASbGncsOjQMkath7SWFNRgg2mAX5C8fPAr7GyKJje5HFqzwrZCSRjgNPy1eILkkfHUw
	rxJKH+9H9R8B4mgRjiwTRUrb9uxwAXsoyFtJ7WovSC7f8PymJdQpaXj45Pqs7nFICGKtPmt0+fD
	ADZs2ZWd5hQXwLMddmWm1nPY6e2vxfUAF3t7UDpU4Zbjjk0z5xPHiWp9VajB6RY2KcQ6QJP3kUq
	F9N911z5bp5Q71VELx5fNLVy1hkZjSiIQ7sdAsgQE1X7iNbH5HmJQ/RP4sP4Hqz5kthoV8khKdR
	6kAQTV9uIYaRuDpB1pTfx0YO0mU+4976Tay5KG03rU9cWqNruMWNlkH0W0eQFG7wqVOr
X-Google-Smtp-Source: AGHT+IFNXrT07jQqOOjMisC/VlId5cQOFjn3jMV4LhgfHEDxAUPohcM7n20UJSliYShKjOPG5Nj/0A==
X-Received: by 2002:a05:6a21:3a48:b0:1f5:8221:d68c with SMTP id adf61e73a8af0-21adff48c77mr10543241637.3.1748726026726;
        Sat, 31 May 2025 14:13:46 -0700 (PDT)
Received: from khalid-HP-Notebook.. ([49.204.30.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affaf9dasm5161824b3a.109.2025.05.31.14.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 14:13:46 -0700 (PDT)
From: khalid.datamax@gmail.com
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khalid Faisal <khalid.datamax@gmail.com>
Subject: [PATCH 0/1] staging: sm750fb: convert CamelCase function names to snake_case
Date: Sun,  1 Jun 2025 02:41:01 +0530
Message-ID: <20250531211319.55682-1-khalid.datamax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up the staging driver sm750fb by converting function names
that are currently in CamelCase to the preferred snake_case style, following
Linux kernel coding guidelines.

Specifically, it renames the following functions for consistency and readability:
- sii164GetDeviceID		-> sii164_get_device_id
- sii164ResetChip		-> sii164_reset_chip
- sii164GetChipString		-> sii164_get_chip_string
- sii164SetPower		-> sii164_set_power
- sii164EnableHotPlugDetection	-> sii164_enable_hot_plug_detection
- sii164IsConnected		-> sii164_is_connected
- sii164CheckInterrupt		-> sii164_check_interrupt
- sii164ClearInterrupt		-> sii164_clear_interrupt

This helps maintain uniformity with the rest of the kernel codebase and
improves maintainability.

Signed-off-by: Khalid Faisal <khalid.datamax@gmail.com>


