Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519634A76B
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229782; cv=none; b=q73FCVZ0JyWwmCVB8Oq5UCfYq8dDj4KhbAN0JZ6+ib5jYnyWh898QbXMEBCUKFti/yrML9fEUZxUmH75+5hFFNIgNbuu32CzkWFJguqSowJvdBO7jjxXLTP4sYsEkaHHIg6vZw3xO8NQkLy5Q2K5qdmPTN+B2MaiIfAu1vgNo6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229782; c=relaxed/simple;
	bh=z/nHScGuq+8p7aeQqN0lRgTCEenLoUHKs+U/cffxb5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lq+Pv/gjtyYRdbT9a11Xpr4RWOnw+G+v5TPALbLEEe6kgqR52a256OwkgF+IivVXGmfAWH928Fn33yA5SWdLAkQbFUuIuc4opu5ATOl7pI9MEUfXC9pvEXudz8wmWCkW6i4QC7flvQqFm8cMauN89/IBpMA0sKXNzYBhht2yg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdfFGBAQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdfFGBAQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4e136481so74388b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229782; x=1770834582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWS8s6yjtxfp75FP8CRvThg0glynFbc2O9KwkpotPVI=;
        b=mdfFGBAQ3xljOiyILSGozQgvZUvAMAzNkQ9zs/9i1OcI+5eqVNQPkgw9UnitWRR9pp
         wmt/arI9jHuqmEr9yali7sLjN1hNUjtk/ArX7/+1VLgYcsi/Ywt2WXHngGtcsvAG6bz7
         2iDB2Or4ToLmQ1XkI8LqU10NuvzN2TigJxZw6dbItOXPLMZZTDD9NgraDlu6xxErd0vc
         H2U/2fCuKfIkRRwFEDswYrbOAgbgt7MxqXyN5dS1GYXZUOSnPbJ7UfSfBWMYjfbwe3lG
         qzMQ8sh0/JOBY4Q8DQdIVg/jvY0T1zY8KiRkn86bA+3Bh0tmzTBqQJswENrFzQ4B5i7P
         +tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229782; x=1770834582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWS8s6yjtxfp75FP8CRvThg0glynFbc2O9KwkpotPVI=;
        b=jAh1hESxzJPAmN7J0u5xerR975+HN8eREl5JMv3hNtvhZx/xuNFsBfvpqf5rwqdW0r
         0cIKiiUb5+yM5thkCgAiyr0JpHn51Xp6BmItvE+stffBLfhURZ9Xr3X3OPz18PsmmnHJ
         oHFm8wqa5WSx6Uz1goARYJl6RrgdxNBRWD/enHxnQHsArPbz0ziH3OXzlRrXhqxQNzU4
         suvqXUQ2D0uccuOEIEjkdcmzgACiJ/upaRACjjsrBr3SVOs8bU3MZ0uf/1Z9RLqkiQv8
         dtTPJJwT/5tS+S+AaGr/UVVtMOimjr0w+m+dUKtG3qbGOvUtY1OY5DsbXCPfDxRmFhZd
         sWag==
X-Forwarded-Encrypted: i=1; AJvYcCUPV1OWgIJUuA+JM4VzgLf8qy2c3KlQP90rpcg828zIIt6VryackLXrq4preDx/7vbrRUWMkGgXFIyx7CQw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3lHFH7e+VjCwLe4BPYFqplyAZYkV8UIL+dXQ1aYsTxbO0RXVG
	1k8cYIy3OomOJvBLi4lGBQqrU03peZQwjp2xKWp6oUg7OWR2qyc2ogHu
X-Gm-Gg: AZuq6aIC5PUdq+EKGOmQZ4w7m2puPN7FdzI2ttCtzLxoljbnpvbxAWc+Cg/z7HW91YQ
	9HNe0X3shr5nqFvwU4xdFPXSStRCKhWf2p9QVZSewyEfLGXd0uBLu7IpLBscVKBCPjY1LYaOwhM
	F0NO9TxeGo7G6eXCeRYjcFNbIN/zW6mYerYNWkQpZrToEXpBksh3Kpg+f+RjWH8xz/uQQaspqzA
	CpQLSszGanA63kz3cjjqu0fsM5zpgUI3+wC61DFmcW4UROGWp/usnhPqrl4k/KvhZN2Zhe4kO7U
	Ol4htmN1ATLfKIBAOuboB4SqI1NVxl3yUV+duk086pNXbNjhLi24GEqjejIaU9jyUqylbAZRjWQ
	L6WMtXFc6soAwoan1JBJ/1i+/Xot+4McRNO+rOMl06uPeM7qMU4T76OxLHfgs1b+vcNjLkRs3wy
	doIhI49tw/+5pI1tCiPSDlB15/hNQP
X-Received: by 2002:a05:6a21:4d92:b0:340:cc06:94f5 with SMTP id adf61e73a8af0-3937242216emr3695564637.44.1770229781845;
        Wed, 04 Feb 2026 10:29:41 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c1fad43sm34885a91.13.2026.02.04.10.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:29:41 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Cc: Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH v3 0/4] staging: greybus: fixing checkpatch issues
Date: Wed,  4 Feb 2026 18:29:16 +0000
Message-ID: <20260204182922.182708-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes checkpatch.pl checks highlighted for files
in greybus, for mutex declaration comments, and styling issues.

Changes in v3:
- Added cover letter detailing changes made in subsequent versions of
  patch-sets.
- v2 patch-set was only emailed to maintainers. The email was forwarded
  to the lists, but this rendered the patch-set corrupted. v3 hopes to
correct this.

Changes in v2:
- Split patch 1 into two individual patches 1/4 and 2/4 to keep logical
  changes separate.

Rachit Dhar (4):
  staging: greybus: added comment to mutex declaration in
    fw-management.c
  staging: greybus: fixed styling issue in fw-management.c
  staging: greybus: resolved checkpatch checks for raw.c
  staging: greybus: resolved checkpatch checks for light.c

 drivers/staging/greybus/fw-management.c | 5 +++--
 drivers/staging/greybus/light.c         | 4 ++--
 drivers/staging/greybus/raw.c           | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0

