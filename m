Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC43D2F3638
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854338; cv=none; b=sipvTI+DxZvaAkimIhv2QKYvySjI9j0xYecb285uXZZ5V8OJS40dORNywYzUHtA9cV4WyiNCr+C8IoYSwW88ufDyBQ7Irg/NH5XN2/wDYB4JAxb7QYW2H8ajxOv4/Rid8FgCidKbjU/bcJ6oUya4+Du0v4ZWCQLwWH8S6PVL4ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854338; c=relaxed/simple;
	bh=lf7WAmXXlNMNByc6t4LTsXWtP5fFo0VO8PLMA4FvwHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLSA4ENB3rPh5+glS5mzPCy34qdQZBu5YqlREUrNYlEXJr3pgQmdocv/ICbyDR4P3V6j+L0bYHmxh3a21dxuQqRdHVcrVR71fmyZGOmDF8uwGu2h+qw5v5+hX0Z2wtSZvexuiQIDDPlKJIzTvMgg2EEu8ZiSTseb6ORyCxFWX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpOjR5PZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpOjR5PZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47758595eecso20876005e9.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854335; x=1763459135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyTFCidwYxLdrRo0mrPJg5BpG+UQKkEfi+EP0wnzqpI=;
        b=JpOjR5PZgFLibkRKRWPyTHq2wdP/Tsjzxsbk7yi92BjqotVqyBS8TSaGlko57i+OhB
         47oDO8edXPDRyay2rS5fmvH88tCh2WReylBkKxPouE0mv+43lOnpBytswcpi8dmeCrNV
         6ksH2cbMojVoTMZarED+2V/2wcHdtuS53Vxsaycjk+V0TmvMs2yU+eLZoWdBKQa3j+1e
         Hq64C1MLp8BTxwBNzeXW65mL6kFDhzP4/In85RDARiozPUWtGnZz0+dSMlQDji9zhmkS
         Kdy+KZN0JDlE/gteVsAKQ2txlLfEl6Vbt5uXqwI8s4s+QlpEwJ/6J1QN4cnGqkRbtMLG
         lcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854335; x=1763459135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyTFCidwYxLdrRo0mrPJg5BpG+UQKkEfi+EP0wnzqpI=;
        b=fZ9tCyJKMv/4Xz0QETZQFqEh50s1TInMRNZrMsztzsfAwVadHFIgQjQU0ewC4SvXQE
         TRhjKYMRvERCOekZ+Krn03XVi5Ldf/Dy2/F70wq0Fpl7qd3+RQ0n/szK6pF3qIy749BU
         4YdWupPuTjxzZV1UZX1wtYItAmBHLTdkh2hEDWPuWvjoaMZZJh4cT/bZNdI98dRT3F3x
         DwSxSXHgmqyUrIawtD27z8Pm6yO/PoBPKZabMIJGquw67qhFG6Ox6w0WYVKuSHm19w9C
         6FefFmdjjEX9kvJuV8bbaX9rcbnJDLaf406qlAZCoCc4x4vz0fhfrdvNklXtNHPvl121
         rsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwiLo/G4HtwyYapRPh0OpU3KQVGgCOAPakOQI/q/zoi/0ogHGfZuxUDh8orkMqjodC+9t0qbxhTl2DU+SO@lists.linux.dev
X-Gm-Message-State: AOJu0YwAWpiPqrCjB5NhtU6bwvIDUYlQsSe+s2SmkevbZW1wh8CNHSgQ
	qDMv1o8NquEfneAuuy9UiZ2nl0r6FUxNAOL67Qhhm4HO8Qo7bQrmyPB5
X-Gm-Gg: ASbGncsd7/nhSjUsQbOL2UYfkS9GSgdgLRWFrF+sJSpI0ZbpugOqfDpNTb+kz6bPICV
	gFun/8QlxlM9Yib/uqGqWm2AWlGKkT/VbCKnCGNOjTGZm5o/nA+DPGYVCX7YPlXJkWPsaTb0ipP
	x004CI17ZpmLPEe5eH3putbrGLaoFhNmV4/wKj7ThaN/CB4zDucXdQC/agdXXgRTDWQjcy/qFVy
	vyeTXxzfD0LGH+k5pMlqM3VPLLN/uqWkFCSn2U+gkIFicSkZwbdVuro+6a4Du1SYefI71ME16Mm
	Iw6sMTNhWLEHnnDvsDXG4+Zerca40pkb4MbMmcTFmPKwR/X7zHZNCqz94mIIvtRlijk2mVTGWE7
	APkvEals8Af/QI/4xFP8FCEz6Yl0lXN8v6WzKidX4SWOKl1YQajRmPV/NbbbCcko43dkOHIqlU7
	LqFWDhg3Npf6v3RmbwPrbCN55Pm/I=
X-Google-Smtp-Source: AGHT+IE+ZuARGiz3jx6grGJFiduhQHFRxZsDGWAZ3QmBErVlqeABMe7Zfmohvg0NcUOhdBFLbPcwEw==
X-Received: by 2002:a05:600c:4f8f:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-4777323f091mr102982615e9.18.1762854335069;
        Tue, 11 Nov 2025 01:45:35 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 05/10] staging: gpib: Change gpib Kconfig option title
Date: Tue, 11 Nov 2025 10:45:07 +0100
Message-ID: <20251111094512.6411-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the word "Linux" from the gpib Kconfig option title as
it adds no information - it is redundant.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index aa01538d5beb..2f42aa2d55fd 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig GPIB
-	tristate "Linux GPIB drivers"
+	tristate "GPIB drivers"
 	help
 	  Enable support for GPIB cards and dongles for Linux.  GPIB
 	  is the General Purpose Interface Bus which conforms to the
-- 
2.51.2

