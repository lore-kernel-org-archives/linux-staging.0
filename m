Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255F4963BA
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364103; cv=none; b=nnI+RvtL3b/nU0zSEJwqFFwmWRoT4HzOOuJhpcf9RHBVGsUNueohbYz+nUIYLxhbivTR6oByT/Qqit6cBTbdIEZ0xW7Uzo+ZqgqNQziKLGBymWndScSA3n2LADOBUvajzFUMu1y78taDPEdshhasou0Yj4BQdS9iFNLU4JweJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364103; c=relaxed/simple;
	bh=UGzK0wD+4bkd3wDWXUs6andTHbeSm0gU68wqz6vGYts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j67GrpLB2Lt0opbxSI4sm/51nkASnFxXdOksdLYeDQCs6HO0emvUlQp2RMJqLzObgwCjgkpomQtn6Hpzy/BWr9yzGJyQT6bY7i8ZIThn195Ye53O82j0lO8iVaI/mvL0D1AuJY8NsV67v/kZBmkAa9WNShdrleWbC80ynYm5u10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuHPifoD; arc=none smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuHPifoD"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e61353ec3so119386766b.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364067; x=1791968867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmxfFGMIH+hpU1CFhvQGlEFC4U55G+QIPjMiXjDrbh0=;
        b=KuHPifoDdtcWfTWAWmct8D1+jg5WzTBcgSaWWRP9P0uT22g4cctJXHOxu4JoFOtT2a
         uig7m6eZuYPxg5ubVgBSbmgBLbgAGgS2MVAZ7ttJvsYO79mNF7xkz4MMhk9tIb6jMXVh
         Z8fkoqle59OUAsZGOBS0EilFQH3JtBWpdtZP8/Iv8LATNHxjWhwQon5FQsnYm3/BMAfh
         k4tFrSaU9W5FZz9SOm1pPhveGZOiNnnbCrgVTY7QzjhavEymr67Cw6W4VVh/EGU4RTju
         fhZGMiICd2Y+f8TSLfGAM8d772zMBPOPFJDxs/inUMcmD/118rJDQqgD6wsMsefVAKp5
         DMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364067; x=1791968867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmxfFGMIH+hpU1CFhvQGlEFC4U55G+QIPjMiXjDrbh0=;
        b=pqbmn3Wr2Z3KbzkaerBOpuM7b9Xd/k3RaGXqtqYdUO6zW/bNquw13Ig8McMlzrauL+
         6qV8TYT8UYzc1W6SPgLYvcxaOS/Y3W9wtGBAjFXoEbuXT+PueGm27iB1NN1Z3rg8OGhH
         7+sIQhWynibqWaF+amqqyR/SmzO5szGDuDdnQ64txGIXya5zg7CdlDnxjSNpKXynf9r9
         v2XGbknTru+OO9khwd+wtbwlgklO3j8GWzuR5FxFgRAp96JsrcaUuEBBG0PAdR9GjIr9
         iagXQpXCcjcOyct0TULx0+z+nh7KbnJ+bpkQzzeSL9ESiGBXsMxA2DZh3Aw/em5rcyOh
         xZdw==
X-Gm-Message-State: AFq9FYKKkEuomEoiXvJSK7j+Jxq+hOHXbRs/QMPshQMyfbKyjEI0VWxP
	pQPjE8FQagnKYQVk6L8oIUzZd0dEXIPW+GCX2bIb86BZx8dgu1sNW8/+
X-Gm-Gg: AYBFou1XOcOV1bFYkjggMy3GtZBSnAYuv2Io3f8W+0VgBrvaXo1uwNgnEVgf3GTo/OF
	2TgUD+SSH1IRXxzoTPbKUi4q6ZR3LCFH2a9jbmYE9SnWRML8BxQ9oNgxykW0JHvwi02uF9+UbAA
	r6X9ijhD2uHCMhOdK81nxAgdbs4RaWcyyC0xtBEc3pYofBx32L77MpQa5A705BS2dtyUcWiTcyv
	8mRSmV4wGNMjmxswAlrJW9p3RfDyVpAbTOAIAfGlQhW0Pbw5SENkfUmqf0TU6wtHqgOYK2fhljr
	B006HLfjPWpk7ivypwj33+c0oPkgVccjMilEFWUPAcpI9YJJQ+Z/Lb/2XokRB1wDCF2t68gDEn8
	/YEvwtMSoszZ2JKrjZxGH2LyNIxPTyIncZ05EXdLMSCtpzF2UFoKmDkeNWsa1krpGm9mLyRKr6v
	0Ws9L6j0PaqhCS2x11oFL0tgQjNYs86vx2YJftklA+XNUP+ZI4WnQpBT/IC5JGcT4kdT2KpKjCy
	Q==
X-Received: by 2002:a17:907:3e8b:b0:c2e:7daa:7645 with SMTP id a640c23a62f3a-c317bd9c34bmr139970166b.23.1791364066253;
        Wed, 07 Oct 2026 02:07:46 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:07:46 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: struct rename and cast unwind
Date: Wed,  7 Oct 2026 11:07:34 +0200
Message-ID: <20261007090736.277636-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Now,

This patch series splits the v3 patch into a 2-part series as requested,
separating the struct renaming from the cast mess unwinding.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
the call chain to remove u8 * casting.

Regarding your question about the existence of struct phy_stat,
I discovered it was dead code; no function actually used it. Furthermore,
the rtl8723b_query_rx_phy_status() function prototype referencing
it was also unused, and was removed.

Patch 1 renames struct phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.

Patch 2 unwinds the cast mess and propagates
the real struct type all the way through
the call chain, and removes the unused phy_stat struct
and ghost function prototype.

Please have a look.

Thanks,
Timo Joannin

Timo Joannin (2):
  staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to
    rtl8723bs_phy_status_rpt.
  staging: rtl8723bs: unwind cast mess and remove phy_stat struct

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  6 +++---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   |  5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  7 ++++---
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 5 files changed, 10 insertions(+), 27 deletions(-)

-- 
2.55.0

