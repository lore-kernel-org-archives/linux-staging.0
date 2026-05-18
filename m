Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D873845DC
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127611; cv=none; b=KCCikABZf3N7bm6OJt9dgFTeDOEo0H22ukodqTg5oYx3Jv3BKtvcdbnB0k30VaVpo6Bass7zrxCapm3LbHVAWUSjBYlGj9gFPxrTjhRQb7/4a0xNthaBL9jui50/YY2bdCs4YV71AQrCf888cjJcNJi+LacPVhk9zrIqCDT17HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127611; c=relaxed/simple;
	bh=/pCsjRKridEAZvgT0bK1uAJUp/lJ1sXw25DlF2hQqmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=G9Yr+REhF7hi9F7X6crTpGOUF5JoI2xOvzQpn+gThxhKD6KvuGB1NwLrKJuSKOeWssHT1owrIuIhERHswDWJCSWYyyKciFUmCroWQbPPJFuWgmGx9OGkPZbcow8pmFYypWthoXkalmtLWk/5+7TifemwC4BFXtR3OeZD7wTPnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMdYl0Wx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMdYl0Wx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c801d732058so1059963a12.1
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779127609; x=1779732409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1qSkKe/f08oHoHCDnsqeE2nljzkV8PVTaBOBPj1rII=;
        b=QMdYl0WxFDRRT8L0PCI6iSY2e3dgma2mJ+hVrT52CImz1OKz5vrme+tQYG2+G27u/r
         +UjOrpIU/qwvc6gIJYO9Efu8nWlVn2LuWJdJsAVJK1hVkPJlsA2NoTY0mJe4pgvLgn4b
         tdNGpV0Ys9XrAvDfWVxNQbn8sUbrBpXNYwY4Mrw6HA7iVeEcBWZxvTKEG5s2N3kXwgia
         i6ceVmWwxtHV99COs1CnfC9K0vAl6X6v/OCORkrMdSzcck7mU8kkAglGUqt4dZQ/386g
         9uX3sirnxanVw5Zsi0s6BRHF6lPdTNjOenYWqyQ3lJ7jEB7whvOygW1d57Zi/ZEFBU9a
         4wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127609; x=1779732409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1qSkKe/f08oHoHCDnsqeE2nljzkV8PVTaBOBPj1rII=;
        b=mc76tZNV4YVfKKqF79q7nQzCJBKgYGo/WCrI5MdS29yctziuIgq6z2ag8kcED95Ri9
         Tn49Bz/H9A1sBg2g0n/Q99EY+IsIrf5K54ioZcC5RzBTPO6cMivNbMnEl1TcB9D0m1ZG
         6PxMLu+JPeWRR55mvhdAy10wkVMsAGmavGKT11jJyv7HFt5GtVh6dvHT0mXbTBsAPi1t
         6v7Ufg1L7W/84TqgFjixViovrjxDsB8GA6thyT5pC3ieR7AFfM2INGaBwGaGTw3JGIIy
         qISmocFk/f7x5sPQqkfs5dAdx/bSV4THRn6xjOyzBXNPW+43x07wU5BYVtvTxDCD6AU1
         XPlw==
X-Gm-Message-State: AOJu0Yw7UFmz/ESxU8632GgVObJfGaZvI/wJgPgzxMQTb3sE5DOAK07U
	6Ddwt/HXfF4fuH7L2GLOW5RfYieqXjVS1mbLMek8vc2yW+VCcPcnPo2qSxG08ODU
X-Gm-Gg: Acq92OGv/zJxJ2y0ZrMnGv7/tYFkCNuZPN+5huzWD4d/8M8wYYvsm9T3viWTJifF5LG
	WEegKwbKKcsw76y7LQMiw/ugaRz8gvb9rMvQZzXExUgq7gRySDcxcO9t13TfaGY8QDw35M6IcsS
	aKKgTb/jU9hFZpuFh1gKsglhJqG3QwZaFk2XAxEYC+lXKXb6SStfYgiomMkcmWI9ezqa6v2yn0k
	bzeanspGnhkoviv/m+LSDP8QExA+roZf2yNNitGablfEQWMcZXPmJ1YgcWR7uTOxAyzULnVkEBW
	AeJTgRw3VcuaFZc7vKdnlEi0iB1njh+ip3XW6ZYIGkMdgMNPB7VQN9BF7bgglc/viaHXIJqEtmb
	B7YJEEozWuRL0g2fRtaZ7F6fPc9qGLhTJlM+/wOUeOMhdOhxcUCs93nJw4I9Ru3woI4yUsPMS1T
	9U2G7N6Jf7ktZwpl/pdu89nO45Y0FNK6kZ6BlPgH4BDizvRf2QwuFWkeERK6dY3n/t6Y97BUK+y
	exEPg==
X-Received: by 2002:a05:6a20:12c6:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3b0be80465cmr19408009637.13.1779127609197;
        Mon, 18 May 2026 11:06:49 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:41ce:f2b7:a7ca:2637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm14642773a12.20.2026.05.18.11.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:06:48 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v5 0/3] staging: rtl8723bs: efuse cleanup and brace fix
Date: Mon, 18 May 2026 18:06:38 +0000
Message-Id: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series cleans up the rtl8723bs efuse helpers and fixes the
brace/comment spacing issue in rtw_efuse.c. The series has been rechecked,
sent to myself, and compile-tested.

Patch 1 reflows the rtw_efuse_read_1_byte() signature to a single line and
fixes the brace/comment spacing at the end of the function.

Patch 2 adds braces around the else clause in rtw_efuse.c.

Patch 3 reflows the rtw_efuse_one_byte_read() signature to a single line.

Changes from v1 to v2:
1)Reworked the efuse helper signatures to improve 
line length and coding style.
2) Split the cleanup into smaller patches.
3) Fixed the missing brace/comment spacing issue in rtw_efuse.c.

Changes from v2 to v3:
1) Addressed review feedback on the efuse cleanup.
2) Kept the brace fix separate from the helper signature cleanup.
3) Reordered the patches to keep the series easier to review.

Changes from v3 to v4:
1) Folded related cleanup into a more coherent series.
2) Adjusted the patch boundaries.
3) Rechecked the series for style and build correctness.

Changes from v4 to v5:
1) Squashed the redundant efuse brace/comment fix into the final series.
2) Kept the series at 3 patches plus cover letter.
3) Re-ran checkpatch and compile-tested the rtl8723bs build.
4) Addressed Dan Carpenter’s concern about the previous 
version of the brace fix.

Moksh Panicker (3):
  staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
  staging: rtl8723bs: add braces to else clause in rtw_efuse.c
  staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

-- 
2.34.1

