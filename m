Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215426C39E
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069672; cv=none; b=Xq9md3T7z+2fzOFlOMsVmymnVqIiNlCkkdqY+O8fBhqGX2uzaruqL2Bn74nIOkwbgslizD2C9/hP+cPa6MrD0RFp3AnHAnN+85KvcuIYgFuTZl06OOmFQ3U1OmbUk6TcDNQF8xEkjay6fLU7CVOnB7s1kHrNL99qHo5pBdA1Hbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069672; c=relaxed/simple;
	bh=lCQ3i0WjgmV/u/HtYvF3mEQpx4d5c2GPE9QqXAXdOds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSAKsXXWf3NsNp7b3S4LyyCZGb5W88QvAYc+7u77v0LmsfYsW9YNRQsl9y7yJuPk84RwSMks+h+qqfP8MKzfZhe+KpLV8x+LkuuK63+ODEil3QkhTTvbhsQ6S4qYtWKokbk2dvRO5i6LLtmGDmSKuzesS2yO4GOnlElpOyuKOZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeD5Cbev; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeD5Cbev"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29568d93e87so51186595ad.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069670; x=1764674470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOfabRqw58uXymfi0oKljc2zuZSidHR+PfYRIsIU/J4=;
        b=VeD5CbevQiWU8xmlnSIdQZy7nxAakXVUB39N/qr3AbkMyNeg9gNOtoPVGv310EfPbr
         oyat+IJoaAfHKuvemkE5Eje/tSG2cJbL4Yj0jfHs4XCE3pXemr9uJWbcYWo1naf5DGja
         GxS9NJ37xkt1TvL9S9xcslUSOAI7ErdS2hCDIvd6vhNZh2vK9yzYyz/Nr1UKn+Ea7aIj
         HUCFkQWmvjwpTilMniTHUWe04uE4w29RUPgiiElF41+FDwULb3Ftgrjp5uB7bnoo+6P7
         w+trQDxUoPq+1c/kGZJxvf1OPuH/Qb/ry3X52BuWzb41etFyZr9M2MDrX7gfnveE9W8D
         n9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069670; x=1764674470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOfabRqw58uXymfi0oKljc2zuZSidHR+PfYRIsIU/J4=;
        b=UqTg3Qx6HKrTBHMce3lyMoSQx/UlFFwdm9uxiAhc6Ao/otzn8a6xmTmZMukpjgUYSF
         hpGPURjbW3IBJhaW8dX4+H6asKKKlIfHdgmhwSWMeVCtHX99LysKk5myGfRVrqjHvxO2
         QAoxPKH+MHdtxY1gOViANecI6d4VntJ2/P4SakdFirjuqpnFTAI4px2oKW21mAQaBcNJ
         OKfqHqWg+spMMekpPddf7RceUqVa+fgF2KFgG3xn2BvXn073Bvo3BusVAi/np2FXkO01
         YzDS++mUM5h89cCw0RXhN29N3+yeJjHdjoIfbuVhipeBzZhwGX6Ul0qFKF/bUwWtCFs5
         s/Ig==
X-Gm-Message-State: AOJu0YxK3K0BB3vvVJwNq8LYMrJLDLjdDsaD3/7ZhNy69xl9Y5td/uPp
	Ev56mNTuYOGnFS3oe2zjhk9UVX5y12aUlXJVkx1ThJm0F9f/rEeUH2tE
X-Gm-Gg: ASbGncvpeMUKHWmc8zl6FJl2EM8P4YIGKqvHBdWMeBNWaqCyGL/CKTYbHY/znKuK6Y7
	/gG+q1jWyToeet94bIA0Gn7qT5WOjRdGHv1h+jXxjLfSJ5StD3rr+e4TcAwesz+XbDa/IunieEG
	6C7LCp7j6UCbrMp2Df9bIocu88D28CwElrEF6HQcqR0F6ebRWjs8PscSfWlF/TcQGbSgt0Tt9S2
	4cC17sedm/SNaLMWJYR16We8HsEuhxRcNVI/fguatTQmKOS/XUjNenHMNkXVWJHcbxHi+V9pA+U
	+GgqewTj4/ZBMxFpd1lrnh+2Ya+pfo8IJIiqIkkvhl38fTzxIgE462Vw7Hb5GakWGBJfE+VHujn
	Z5lQ7sDKfNaaH66ovhv027INOAJ0ZjHXEX0ZUSxPDrT+Q/a4HJuH+Wo3ZTfTPmBakoAMozsPMQZ
	8qMtvKLns8XHR3UhK23racguppSUd/2KxiIkwZhHGuajB0IyihcOrXHN1O4uDkxYN4QtF8j2RpO
	arbpFXIxogKtGQ3YwdkLXjYKbSeb651rXEAzD5SqHfK+EOsjAgcP/kSHwwjtGmuKVJAomRboz4v
	4PIJbaDu0jhh4AniPl9SgpSArT/bLdn4xw==
X-Google-Smtp-Source: AGHT+IEQSYwVhgcpMBagRBpg3X15saNeb55RL/ZmOsxu+d8Fsz4VHtaZZRevI+ps0r8yq5Ct+bZ2vA==
X-Received: by 2002:a17:90b:4c4f:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-3475ed508e8mr2412235a91.21.1764069670258;
        Tue, 25 Nov 2025 03:21:10 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:09 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 0/5] staging: rtl8723bs: FIELD_OFFSET macro cleanup
Date: Tue, 25 Nov 2025 11:20:54 +0000
Message-ID: <20251125112059.16913-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the rtl8723bs driver by removing the custom
FIELD_OFFSET macro and replacing its usages with the standard offsetof()
from <linux/stddef.h>.

Changes in v2:
  - Split the series for proper bisectability: the FIELD_OFFSET macro
    definition is now removed in Patch 5 (after all usages are converted),
    rather than in Patch 1.
  - Patch 1: Now only removes unused RGTRY_OFT, RGTRY_SZ, BSSID_OFT, and
    BSSID_SZ macros (dead code not used anywhere in the driver).
  - Patch 2: Split long line to fit within 100 columns. Also added
    <linux/stddef.h> include to basic_types.h to support offsetof usage.
  - Patch 3: Fixed brace formatting issue caused by removing commented
    code. Removed unnecessary outer parentheses, moved the inline
    comment to its own line, and added braces to the else branch for
    consistent style.
  - Patch 5 (NEW): Remove FIELD_OFFSET definition now that it's unused.

Navaneeth K (5):
  staging: rtl8723bs: remove unused registry and BSSID offset macros
  staging: rtl8723bs: use standard offsetof in cfg80211 operations
  staging: rtl8723bs: remove dead commented code from odm.c
  staging: rtl8723bs: replace FIELD_OFFSET usage with offsetof in
    rtw_mlme_ext.c
  staging: rtl8723bs: remove custom FIELD_OFFSET macro

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  4 ++--
 drivers/staging/rtl8723bs/hal/odm.c               | 13 +++++--------
 drivers/staging/rtl8723bs/include/basic_types.h   |  3 +--
 drivers/staging/rtl8723bs/include/drv_types.h     |  7 -------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 ++-
 5 files changed, 10 insertions(+), 20 deletions(-)

-- 
2.43.0

