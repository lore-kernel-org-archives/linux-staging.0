Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834123D297
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554084; cv=none; b=Xhopf+TzuSoeqnRa78+9vexJ68TZyGW0dVEL37M09vHNmu8NGxFWDB8xN4wNVEQDHqZP5uvP3hvTRZGhV8/Uh8GmI05ekI9QJOb3GBAyGqlKVn++zi1v5C8gNWxZbynCG/naf6VIvkdD527Ly5fzKDIKmSutkybsYMcQMsyyfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554084; c=relaxed/simple;
	bh=b1ZKZnSLcN1E2zncH6CzTAlKfcZN+485GfXBL0r6HLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CwewY0O+WuoLuLzGTZTJAdE7m2hxNjYg33oU7pV8diOVBcshuRKkrdqADHJHwhK99nipnvQKbohZUgkT6/lg1GM8o/zvumDqXoSHKpvQ/oSXeab6yD5+6ljQ3rADMqjIcHSDCc9Y4QnnkqJKbuoh7B6XuhDRnyh5Ulgp3SyTl8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWGhyYBJ; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWGhyYBJ"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649278a69c5so5768413d50.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769554082; x=1770158882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12K3knDYiNT4Tg6fUx5/6sjHdQE6gFsFRMSmaZ7OIUU=;
        b=aWGhyYBJW+XUGYQLWp6M+Pyp6cOxd15+a6t5sDbE5PjYH6QDge7tYl3h1uOLABPMHj
         NZlKGmYsfodZPtfet8OKHJ9GugTWdCUQW0do+VeN0dKKLP1iedKuaJYSSytfM5ENpg5o
         bn4A4eFAlaMzeoSO8QXYvD39k8pd8ltzs36HjlVfzWgQXL9C3UF8yCTNRhJzh6JGKbF/
         EFagGz6bTzSaLome4vUXbfAAwkR9vryxA5gc0MHITKODtEwjBIi1DuGKOAD49sBgmkL6
         BN0+aK/pLHAU/JkqnidhWcDLAYq0OkEuBQQPRheW1g2llE8eZsK9plg8L0smXMtYbM1O
         MHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769554082; x=1770158882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12K3knDYiNT4Tg6fUx5/6sjHdQE6gFsFRMSmaZ7OIUU=;
        b=HhaM/okch/B2gV77yQYQZzWLN/5Nu+ZhIDc1F0+m22YCnGnF8zrYl7ER12+0dD7AMk
         oN8Or8v3i4pcIii1MxI4aXcJziaPBDH40vIGJgHyO565CWQyv83IeheASdKK9eJvgZjs
         5N1gfAjG6aeZ8Z2FHwWtfwWinQ2lGjlmj4dhHDIY+cHVX+5xzps3JtqLvQ2AW1nYs3O5
         ZO6Jol56BaMoRdAs4NuxV8NOi9qE4RLKnTwFeSwx3nM9JORvWo+hc3T9zEnAptKkaUfO
         D30+LU9WLsG7jQKYqBHI1ZR1Nv8rihpM3mvBi1+jcS11X7zGXCstDvudOt8oTDXSzS1y
         SRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAQ6cUCzD1hLC9HAjD7dJhnTPKq2sjjpDYhUypnIVXQMwBsiCTl85q2PlOdKbeQb75N7f4Yn1NWFMT3Vo9@lists.linux.dev
X-Gm-Message-State: AOJu0YzmnXQJpOguwCcj0LD7lA1+hjpeLaXcpswaZt/WG8YVvmnl58Ya
	JyHB/Y6PDWdd9k3iWApU1ipmyDiWqWCDHSItkH6/Qv/fUN4xnoegHsaJ
X-Gm-Gg: AZuq6aJxCPo/rC7VSlKFR0VSrJ6k4imAUhezyg0QhWrpSEkJJ4+Wq9TER6lArJj0udq
	XProA83G73Y47wcPpQ/MEiF+PefMrqQ33WhwAWya1Mk/1Cdku2CGEFZZf1ArtOdjRT+1NHbKUsP
	ox1sobkTPC0XCGJ8z7/Ttgepw94+Sbs6duDbzzr8GRahjakON5TPbVvTogg4itJjl7HSyEpY8kl
	z9JZ27wOWaTisRSxOrgW8KffSY1shfYNelB5DzyJTb94P/UOytqAw+SXIRtdZW+gvNsWNkZaIzw
	7/XFnsY6vOKTkOvt3jpzc6ErXD151q3hxDHnlbFX9PmmzvQ1BxFU7BRF+47yStbb65KkTwZoBfk
	Lsh7Vtu/xiWKvrzCSXpLr4wsaJV/zGrfhtQqW8RJkwM4WXUjPakFxlKfYp0DTMgPy+Lg=
X-Received: by 2002:a05:690e:1347:b0:649:2e28:9d58 with SMTP id 956f58d0204a3-6498fc6f809mr2065583d50.97.1769554082336;
        Tue, 27 Jan 2026 14:48:02 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960788bbsm55250d50.9.2026.01.27.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 14:48:02 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1 0/3] staging: rtl8723bs: remove unused diagnostic
Date: Tue, 27 Jan 2026 16:47:35 -0600
Message-ID: <20260127224747.40305-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series performs a driver-wide audit and cleanup of dead diagnostic 
code within the rtl8723bs staging driver.

The vendor-originated code included a variety of diagnostic counters 
housed within 'struct debug_priv'. These counters were updated 
throughout the driver's hot paths—including MLME, receive, power 
control, and SDIO allocation—but were never read, exposed via 
debugfs, or utilized for any internal logic.

Patch 1: Removes unused RX info reset logic and associated counters.
Patch 2: Removes dead RX sequence gap calculation logic.
Patch 3: Performs a final scrub of 'struct debug_priv' and all 
         remaining write-only counters throughout the driver.

Ethan Tidmore (3):
  staging: rtl8723bs: remove dead RX info reset logic
  staging: rtl8723bs: remove dead RX sequence logic
  staging: rtl8723bs: remove unused struct debug_priv and all counters

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 -----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  6 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 23 +--------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  8 +---
 drivers/staging/rtl8723bs/include/drv_types.h | 41 ----------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 14 ++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 48 +++++--------------
 9 files changed, 17 insertions(+), 142 deletions(-)

-- 
2.52.0

