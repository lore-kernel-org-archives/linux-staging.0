Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CB31195C
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470166; cv=none; b=ZaZgqNIMQ2Orb6zFY3Dm8dldl7hIa9DEhn3d3hIsh3HvSYiDqVm6MDOIdkp7jJWXoOaSze8iqHmW/bLz404U3cCI5pN5psaYCIFowYGhREFdQ8O/doQNiUDGj4TSTq0LdSeE6DKabswmYTxb7bWgZkHuskyXh3O+I2l3AGWO1wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470166; c=relaxed/simple;
	bh=MEi4MePEOlhyLiWhDXjcK23C8xJankTZUdjD50pO1Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aKg7oq1FMt/I7f0yeBSFLwWWxqWrOisrdfoQBGTS8K8qHqodbzyLcMn8595lGls8FNv765GWkrTrk5Uub/btFtFL0HK+ncF3/NuOw/a6nrpgX0oE+tjf8xhTO6zf8oN4AXvm7hVgF18//dDuXuH+W64HNCcikoj7O8F1hRt5zGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHPC/ydx; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHPC/ydx"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1861109a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470165; x=1785074965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00346VtkKx3gyCJc91Tl5P1B1MYLfkTlj8IZlPeohbI=;
        b=lHPC/ydx87VxnV2foIuEJU47bjsn4tU4mxghx8qz/565Ppj44ttxzXOZoMU/jr/sv5
         17wKek+GzWwZh84nbcIskZ/HTiRqAP1EUZ1Y5JVNmbr68fC47g9GgLGIfGsa+Pm3zauM
         SgqkQLQVAmk+kLJdNSoxt9imvPjr51MYtIQ6kQjHELjZkUfI+dfEo2MpDCsmmjBRiyjm
         jDMAjmgT9KSBBSdY44j2PvEKucvXqr2NKSr6qFJpZAYkyiCdE5uimb2cQiKPyBE/vaiR
         FpHS2Jxzw657acOrHID62SWAMjF+0tOIHhXil+SCB+f7FuJpBxXnoyDbz6BUlyv9dZ+w
         zWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470165; x=1785074965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00346VtkKx3gyCJc91Tl5P1B1MYLfkTlj8IZlPeohbI=;
        b=QIvNa8hVPJCA2woJguyWKCHknkF5zCwlr2xDms5LeS3hfpFXIvAYy0BJjvDibuUyhY
         ixuq+nCqAiooxZA8I5hkncY0Djj8o/kxGpKEKgFnr4Lpi6TrmyRnTV8eDUA19aBkkqL+
         w/sdPmz1lKPvysDAXwZlj9tdcxNacQh2o4oD+j0XCRjvPpsCkk8Sa+E42adosIjCHkV1
         jE/hwxO6KOpfXNo5AgCOGoEiiptfTToNlXv5i1CGc/wQCh2lVc+CGmOVKKJnvCvw7VP/
         0xrtwn78K0OLOJ7aWrmWZX5DZYAW8bkNfVEBPj/eZlv81fdRstNz3VDfu8JuZdUjE6xn
         fB1w==
X-Forwarded-Encrypted: i=1; AHgh+RrZxMu/c84/cn0bAQFqvioPOpngt8dVUhK+N8Pm+PmZ5Xh88L3fKIZudiVJopWvg4MMTDtUBWl8epGONMA7@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt+vbXPF3zRd1UnPl63e0+dwczPO1UzzDBA31hgY61A8x7PVyI
	LK7ZBrrcwfeCTma8bTFT9Cuyxd9hP3kUBztbggiGL9rycvTP67yFvrgF
X-Gm-Gg: AfdE7cmQnIjAmgGwJBthR4HraqgjFMEA7G+whC48FTxm36n+feXjMjJOzG1oTTEpmh5
	oP9XMas8GXp9ozfPfT19EGwQ4sRRrMhtFCzhXC+iVV8GJ1wC8mVbzEo3qqBh5UQuuvyZV8zjRGD
	wN+dkRButeodYShClD1uQHuqC23DoHB68ccQNX5KG6rG5/hFD3yelAcDI84jQWsdAmXl9zNygAx
	Tc7NGJH/2v9HY5dv4EEtsFP0fvH2QPPwwtF609dDb5vIqlcZZFBrdeD/gzF4b5RkejiMfV0JBfn
	aHx7TURMFr2kONNbd/ff85OMBT0JqE1DuZROObp4M6vBTBZkatrAKlaJDgBlf272oXjKASnMYfi
	g6yJ/YHTRMPIsJu9AnZuY//+m7zk6dAHMKLznzjZs5idYKXIzUJPKHcAmbiEjTKzHvXMp1az4MS
	AjcSwt3bS/oJ1ebzagCG20Qgga
X-Received: by 2002:a05:6a20:9192:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c38d9615abmr16276182637.17.1784470164815;
        Sun, 19 Jul 2026 07:09:24 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:23 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: Clean up unnecessary module parameters
Date: Sun, 19 Jul 2026 19:33:48 +0530
Message-Id: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the 'Remove unnecessary/unwanted module
parameters' task listed in the atomisp driver's TODO file.

The first patch removes the unused debug parameters along with the
user-facing pad_w and pad_h parameters to safeguard hardware padding
boundaries. The second patch converts the remaining internal usages
of pad_w and pad_h to const configurations to enable compiler
optimizations and enforce type safety.

Prajval Chaudhary (2):
  staging: media: atomisp: Remove unused and unwanted debug module
    parameters
  staging: media: atomisp: Mark pad_w and pad_h as const constants

 .../media/atomisp/pci/atomisp_common.h        |  6 ++----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 ++-----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

-- 
2.34.1

