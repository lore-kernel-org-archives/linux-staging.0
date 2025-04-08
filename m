Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77C21C9E0
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152995; cv=none; b=ZVGW9yTjEpkJXxO7kMq51BPnMFagx/EJ1MGWc1uSYEHu4GO3v7pjx00/B6WjAZFTufuNYwOrABgKUC/grFq4HFK5H6X+5av1s1aZiegUA9JJXoy5AFLkkTfQv/HfMbiLWComJwWHT7ZahOr2SNgOHx5muv3boXUTirlg8ebfe9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152995; c=relaxed/simple;
	bh=TRBpCxpPErvC9vf6r1KxqZGgSpiio7AvdNhVlYpOejM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5aQ0YCN0vvQZyWxTQaGEfRadVxCyjMy3BYiFGMh/g6KvqHsQafvI88Y/O5xD5eq07NNKh148LPn+dd/EGkRelVAaHYYiFzXcVd+pB0rtZDHVnB0+hnecuZh+QOGgW3H76ZIJZHnCRXrrBwovNk9SdBmd/9LZykLcBxodkivCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Mt+K9SLd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Mt+K9SLd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22435603572so59851265ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744152993; x=1744757793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRSE/FByM16FtEVw5mNrSLD9YZcn125jpwvzMuX+IFM=;
        b=Mt+K9SLd3++DlAnSj+9kBm7p7J6+BuO94/2/m5TY06yssSk2839mtg3Y0/GH5H5bpU
         ALHiQIbp9fI5NIxPBpMP3kfZpkAffM/uj228b9QQCSnPwIcnoqubyb+U1o7I3lfV1wFq
         EZ6pfK+/XAb0QNN7jijD8Z3gYB9Eq8Cu0nB4RGGa7wt312NgNazEkcxsE7T+nRKzNhhZ
         zn8owtPeKX6xe0856G2YBK8Wbpj08KiD0+Zr1UnmEeTkrsbbOIN+wHfx6XfEiVS2oG+W
         ahk7mq+gd7RUEXfBmc4EZQvWM4pa55A4UnHnvR874Od37y+6/4x1eMoMNHI+sWokMa48
         Fd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152993; x=1744757793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRSE/FByM16FtEVw5mNrSLD9YZcn125jpwvzMuX+IFM=;
        b=HvdzakBqJ9RBqhnUU3VvL3eEXDlnh09ib06pP6jccrkfbMTS12JT/2J2pkvBGaxI22
         1ImeCrs0qZfK/qj1iB5Etb/9RAF60ChMxQmbq2HmTghkEm76FWDN7mtFNdvXrAjZLI9N
         PC8n+ESBLFYJqeYxxNpYwuAeuRADAT6oIMZS1ZH/cIp9aKL/ZTkHlrZMF7VnHVESj+vp
         S/9U30MJ+aEda9ZCyA4sEs0HYXrK0+Nju411HS0F/yMS6HFCnQLXD1KjMIK584hYYYRh
         iDbzdMWOSA3ddiR63b1Qg2nCV3najFaDTLFZSsz7RkZp6MUZo1G1xmRXFE/lti9y3UNz
         DAXw==
X-Gm-Message-State: AOJu0YwjyvgKZuz9jw0WUndZojm7T7Ss+V0sQ4oIXLBJ7+c7q0AkZe8F
	bEEWBm6uC+7/CogzidXoq+5hz0u0ZGF0/dkLci48oL32P2NsESfpO6d6RsB+cg==
X-Gm-Gg: ASbGncvaP3locidM8ydZ6ieCXR5RsWXvYku/J8QzPrIdo6blM8FHEBQt3vIEMwmm+I+
	yh2jfGJeGF//J5cEdy5WYdsaDUHq0e/kXl6sk0obdiv+E4qu6gDhx65EsJUZsKrEjKjfIMMzVuD
	6mhd8rPMqgMBUsAfDI07Ga/ECtEpyMVBz5eBk1tXZvz4Qi2czI6RFw8ktjN3YImjnD+I6QXg5Qc
	5JxVWKDdmBD4PtsGw/kBSKsDYlvRvOABztxGx08jEbe7JsEeTkoGarcB0315+6pb6kN5NATndpv
	65yN6+OFvd/d85flumnZgxOBAgu3bxFYPUkj+UQ5OZ8hbKpaZpbcjTgo6EIS4Ev0eS/pmSr2bPt
	gFXPFc/D06g==
X-Google-Smtp-Source: AGHT+IEiHHZ+CcgBSLU7e4/EiMGdNliHUboV+VfHVh+QDf6U1U2JWX5TembEMbDPUlN1UKwXkKLQAQ==
X-Received: by 2002:a17:902:ccc8:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-22ac2a1a5f0mr13284915ad.37.1744152993014;
        Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877288csm106456005ad.232.2025.04.08.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:56:32 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 0/1] staging: gpib: agilent_82357a uses completion
Date: Tue,  8 Apr 2025 22:56:27 +0000
Message-ID: <20250408225628.187316-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

agilent_82357a_send_bulk_msg is a oneshot event where a semphore is meant for
synchronizing over counting events.

Recommendation is to use a completion instead.

Reported by checkpatch.

WARNING: consider using a completion

* Patch 1: use the completion instead of a semaphore

Michael Rubin (1):
  staging: gpib: agilent_82357a uses completion

 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 12 ++++++------
 drivers/staging/gpib/agilent_82357a/agilent_82357a.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

