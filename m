Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF224887E
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521295; cv=none; b=BGfsgUnFjHuZbhqoY5xWgcXj9Q7aq5DHrChZHpQt5lUPQutcBOtYUeSxdFUMxScpBUyGxnS5RoC1XEPn/9aoiP2VFnzv+XDRgadv/IVj/Vfy7/wII//1UDYov9+wcylOQufbsO/9oSQWpIPLcjhle0FaWTl8QFzhrTIz3UYDJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521295; c=relaxed/simple;
	bh=5Vje+xrWctEiwOuMVGTeox5qz1KGjwVCJ/t155qyego=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vBFUJKkdQLcQypsCbp67bQJuUujiqFs+5drWpdQrxDRINeLWIloLfxCJfQZ3/BE7l3v9FI4o75aBhX7qcgGYbmm+G/Z8LxbhnIgNTjO8LDcmjpQdNFBXG7iT1STQxgBK51UmHTQvvXFikc8IDXZb0LyTSbWxRAzpPKlKL95dHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6Mj0FhS; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6Mj0FhS"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12db2e415a7so3080626c88.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521293; x=1779126093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfgLYT4q0yf0IA51okgEB6jMFvDI1E4ISTHt4z8TNhU=;
        b=h6Mj0FhSpc7IfKzuAI31fgO0K44iS/j5UEtazzDsTsd12XTX/t/hyI9wJwsVGFC9rY
         u/EERXra5DdbpWWhzW9XC+7tqrNsBsYAEJ8460SR9VaHjxCg5TALOt4jejzu4aDFrfh1
         zdUQxj5kDMPNFETZMudpfvDrn7hNB0+iL8wKINy6EMl+m/LDppeC8DPWpQwWxMMloIt/
         r2j4pGZ/ZqdEFxn2k2WPMIW2PM1H7Nhes6nlGMlzKBx63Mxfti1hEsiyewdFygExzJM+
         Jnn0rV52UjTJEBTXftdVWoBgHWLZoeWI6OQaYEv9r9YI559hR0cfNVoTeJhU3SSdxLGQ
         mg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521293; x=1779126093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfgLYT4q0yf0IA51okgEB6jMFvDI1E4ISTHt4z8TNhU=;
        b=o2KRgleppOgE80zdyYabPudZuRJTfQMLT0RupeUJIoROuJ3nQXq2ZBlynUcbNWAv23
         tGDqVJWf+bAqvdubTFqd7KRcjJ5Y9yogYWiKCaUOC5jmDjuEA337zPV9/etXyBTEPnaj
         JYnrJ7HtwvSUqqTa8HFpc/fMU2e/ARBIf+DXSbmWDi1xYJfgqvWn7uuAAG9EFQbiTgdt
         X8Jmg6t8Jb8PHJTA6Qe/VG1U322Ceq72kcAXC/lmAemze/MOhi2NOu3FTbiBfyOG6xs6
         s4ZZJvIk2p32XJ2jWWxZVwc8A/HkOZv76tlkUZPRSVwyUwI+aAqXqATBY2ncPDD1d53r
         yZ8Q==
X-Gm-Message-State: AOJu0Yw4B845kpiARo8ecF8Sl7iocr5nwHaAV74oeMBB9btWMnRtWapQ
	rlPuZ73cK7f2iadcYC2Q4flKjyFtinGnmQVHKSufiyUwPyl9jnxdR3AtnlzG/A==
X-Gm-Gg: Acq92OHS310LKT/a3/ImRM0NOvV8KJtIE2gUzwtzF4QZl0TU5KO9JpgrXv5wgXjLjA1
	9sacvbQ4gDV12CjouPyHlnnWrTDZvd67xwp6AlH9zwkxJkhcRCOBTwx1RR4sK94w3ry3RyS+wDm
	hqnZtRfWO9/7Bu2k+ogDq4iYpDBBSNodmRRa8/QjEedt+53mLSOn06YL9iOJ3yWoQCHp5+LnmFO
	cHuVX3Y9s/ZJP5WzvEZeFvZ0LUqrwqrYDtBiodb327n8zkwSdLZAgFmSi8udL0/N3xKD19goVGk
	A1HwtImkLyB9qKY+UpPohESvt4kDuLZI0oYSqWSqTKsus46Dtc8LvWO5PUh/LagI3jCYyjmO8Dq
	MtSc5/LrAHw/2msOVBnDvbkqoWyDLN3/+z3Ba9DRujS1x4YLoagsOrkGqqjKk/FZj3QJ3pf1hsd
	cCs/4zXOQWoqIeefhzB1XhYQfzDbMdUR3AWTRevVDuIJU=
X-Received: by 2002:a05:7022:3881:b0:12d:de3f:f3ec with SMTP id a92af1059eb24-131a6af4638mr13812113c88.44.1778521292646;
        Mon, 11 May 2026 10:41:32 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm16899550eec.27.2026.05.11.10.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:41:31 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 0/2] staging: sm750fb: fix 2 CamelCase variables
Date: Mon, 11 May 2026 10:41:22 -0700
Message-Id: <20260511174124.5345-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset renames 2 more CamelCase variables in the sm750fb driver.
- pvReg -> vreg
- setAllEngOff -> set_all_eng_off

No functional changes.

Jennifer Guo (2):
  staging: sm750fb: rename CamelCase variable pvReg and drop prefix
  staging: sm750fb: rename CamelCase variable setAllEngOff

 drivers/staging/sm750fb/sm750.c    |  6 +++---
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.34.1

