Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246C3E410F
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341863; cv=none; b=meGnlCXtBHomBYNDZaxJuaS5jAA9oa/kMoX3jLkBZomeV8xGy1HBScEDw7V+29ACC6cFGEC4Y/vJpAhqxQcXosBN7vRdT4qnrBlOiwKmzZevptCHc3yE6nQ1na5XMq9S1U9xEg128+uA/3kpdpw7skyYFiCVVf76VqC6jUmddx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341863; c=relaxed/simple;
	bh=Z0lznjmT2fklPYTx5yPcuTT3xhmNlgD0+HUS4nS1wCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkCuG85z21fbDA23mqFL5P7ga/yMwUZkDHIEMVmNc3ps41nAgkdItEolK0UM+ivUfXpCBANFopOurMnJIljXLd0QT+umlGR5SZylaKEWqlmu3uOx5JIroyM+hEXM7sDEljN1KhJzOjnjRd0j5AeWsCWUjqrS6UwuWULp4xS+3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKv/coA4; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKv/coA4"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2336180eec.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341860; x=1792946660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxESZ098zbjfzDcvUMgtVe2zTbr0dJel0R4trpg856Y=;
        b=nKv/coA4JcyGxZxjt/JzQ/J5oYKF6abZWR+rOknr7R1IDqhp5+8xOtQiUQJ4Dzbbdc
         OeaUZfnOFymMNjaFAnItMX9trVtrRsQ7lFxhhz7eay+dNuXh+HEHFVk/MS7JrxmHL88V
         fSRZc/Fimuo9V4YoPpWoZeNRfnWZlT6n2uw6WpuJ8t70XE9qBp2d7iIYUvlWpJYt+uqa
         UCrqayFREeix0LaDmDl9SoROnZ2bSZyIpY3DE1zYzP1Nl+KCmzYzI0QHyBkZXobpP+o+
         5bl1kW/ZZd1leXJeueBXiBLiWvZ79WzyYAK5lf7QB7Fd33xWZaXhdVUXuoNyoxw3ohm/
         ddYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341860; x=1792946660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxESZ098zbjfzDcvUMgtVe2zTbr0dJel0R4trpg856Y=;
        b=2h4kPsWrmthu/+7TQKYIvpgPvWSjmT6h6FV18G12LPYpcxQedHHT3M9jG4S5TSAT8f
         Wjls1DAwyFs0c4QKPbkxPa/OwN9/XILE8hVyFECU6eiy6GzkYqyE7BGjm0emti5p4WG+
         MO6q/WA4icaoCH+OakCGMVhgtPkvIbNtMpg2euyjI4D3jyBvea/gqP7Zd93w7NOt7/YU
         eQqbPjtkgvXZvxFZ5iKMrD26u89d0jmiJ4JBAZydD3aju2odC0otMOWXNDgJFaJHxnhi
         IMfvU+8waO3qnf5QxzXP99KbRsTXds1KhdgASmwKlVSy12FqXE1YIImkZsdLlh62Yis0
         X3hA==
X-Gm-Message-State: AFq9FYIXxnDAKqCQBVXXdCAUZkg+Q5giHum/n1xvyJk+3swaUtO5qNSx
	WG0GrBm8TXjctIXAcAaS68IcSEYzMa9MIp+gBSjaj1AKdTwPi9XO4/L9
X-Gm-Gg: AYBFou2vEWwit2KHyYAXAPoYpbiYkyO8Yq4ZwpYlfkkZmdaaLv6ChTwztfQn6CysWJ1
	+Yv5QbBtPm5SUls4nYSBIjHqv0jtDK7BclVsuBaTgHVN0+kQYuu63vhRxzgPXOBey8mNL+qOyK/
	0fbobiCwBDA5a9sYn2iEqvWxPcWxuHylvmijmsDg1Y3zyCNKs9c7wdL9QQ8LNy2owEbjBmBJBeO
	RDmuz98n5U+cQY7kkD1MpeABeieDeoAW9QEzjklnlEjLZzTw106D6ZnZwCmF6L8Zhicf2QPrquD
	WiwGl+422N0RESHAw6eYUPgAblHDZ6FI09fNxCux3uc10EBJawXUfGqZCgmWDcOjzYNFBjpKoda
	T3+Z91LszEutfgLUrR7AfYQ4tx50Yh5Y1TSgPCpF7KxS9iHd8dBVW0cTjGSlVlrhqNd7aScDuSk
	XnJgwQtkubkFSjrPDxrqHjYh150u6Hpk2V728YZlhLRDEVAg/0U5bupoKDgX+PgmehzVfZjC07v
	x5DTLizl7RiH5fKww==
X-Received: by 2002:a05:7301:da84:b0:353:5b04:8d19 with SMTP id 5a478bee46e88-361a0e85f90mr8009309eec.9.1792341859895;
        Sun, 18 Oct 2026 09:44:19 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:19 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: clean up SIZE_PTR usage and remove custom macro
Date: Sun, 18 Oct 2026 16:43:59 +0000
Message-ID: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up the custom macro SIZE_PTR (__kernel_size_t)
across the rtl8723bs driver as part of addressing the TODO item to
"convert any remaining unusual variable types".

Instead of a mechanical substitution, each occurrence has been converted
to its idiomatic kernel equivalent:
1. Replace open-coded pointer alignments with the standard PTR_ALIGN()
   macro, removing an unused variable left behind.
2. Remove redundant pointer-to-integer casts where pointer arithmetic or
   pointer arguments are already sufficient.
3. Replace the remaining pointer-to-integer address casts with uintptr_t,
   use size_t for alignment offsets, and delete the custom SIZE_PTR macro
   definition entirely.

Ashmit Kumar (3):
  staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
  staging: rtl8723bs: remove unnecessary pointer-to-integer casts
  staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove
    definition

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c   |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_security.c   |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c    |  3 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c       |  8 ++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  | 11 ++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c        |  6 +++---
 drivers/staging/rtl8723bs/include/basic_types.h |  2 --
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c   |  2 +-
 8 files changed, 20 insertions(+), 26 deletions(-)

-- 
2.43.0

