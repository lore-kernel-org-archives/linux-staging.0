Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E184657EA
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720286; cv=none; b=oHY6L9GLDz0hYaFK11L09A8FqKE+RjVjm3E3oGyMJOwQDXsjIiLhC0HGVlCQI0k10kDKL8l/Bw8Eftx6hGwFiZ3y5fneQT0wMkp4GCUrYEJjcdn5rrGazEWIcGgx43jWifF7yoERMyRy+aA7f2egKoECzFF3uQTTKBUU31WRvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720286; c=relaxed/simple;
	bh=RWACD7HX0pPyfHqPyRi31tpb3skyU4r2+xqsU3C6SEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rAAgWMJlMRsWQWqV/LXjP9fz02oeQxVlFjy+ixt/clUrSZF5FCUkBz8OT7+b0lFFo8hcGC9nPebNX/oX2XjCXyu2lfGi62I962y4Ra1aedRVX42MHPx9ZA3UCVs8uZV+28By5k0sPbPq20YQ2KXnNjRje92rynKKcYJM+lJ0Mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUIB/XEC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUIB/XEC"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39f1ac13687so7185971fa.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720283; x=1787325083; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xVcos67s4ipMAo4BIvxlhJox3zbQvVuKpFk3+ZpQk5U=;
        b=JUIB/XECupN/s1bZBAWUM+t/UA//wsxdAuWWe/1B3n0o4bS/S3Rqm5gLYO3bga5xLY
         npZVEptXxEHIkbVD/b69ucvFR+MMloWT/SE872JB8rSui0GvLxsdYPGyw/U3vRukKzH6
         m9tHvEUBRVIu61UapnCNGw6ZX9mJZFDKzNXiFkfg4irZIQ9S/wRZWw8OBHIVay6z+G5/
         pxeLR6LBZgMdk8A55jJ0ppSTt8tnzb48VsqwMMHYRoLPeM+wHXA99iy+4WhKHEGUhIdz
         K3668azTZRq7Ta9/QEcghPiAT7lxvUwzCUWr31VsyFzUPSWpDDzsUsDZDEK1w1hInqfw
         HoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720283; x=1787325083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xVcos67s4ipMAo4BIvxlhJox3zbQvVuKpFk3+ZpQk5U=;
        b=oEXcr2VgesDeJym4/JVPVsDhTGz/8KOdZLyx94kf13HwMmzPD36vTganJvP8hyG+Ia
         CTeM6ZmG3oJIIok4piLEMdUUasGArs3sE2dUbUdZxqG7HaT0Mf2GhAly9pcS0xFrQRTI
         ztqTT8ca5L5sPvQ+s78sFN4gXgMpWCgCZ4RzBb5OA/t9QqMPL2JLRDwQR7wiFzfYnkoK
         qLSnKzX3+Kl2G7gYcLzFWSjeuGvHjPAdzlUkc42EJgzOkRL1tJGZdS0O0ctQe7o1B+k+
         27lGvlESdYAqucWXDEc6GVJmDsPnk79zlkuHYKG2kKQOvU8F8kdo3ImYOdv8Ii25zSkS
         FbFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7HDDTkkw2Ub3s/mMEfQqqWraaZpYJyqLN6016pTpiQwikffVGS68T9R1wOMy4QNonS/rQL8SG1zD7ynuW@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ9FvCw8yRJqgiT6k4DbMOaIq6lBJ+3YQlA+/bMp6X35TFrsdu
	/uSHwQkybjzDUDkyojC4n911aKIQ2QnyaWyT2F3Ri48sGLW57NcL7CVh
X-Gm-Gg: AR+sD10EOnqLKL4ey8iVaEzWWd02vYWBVayLScsOpoKPzHxWmYP8t128tzNpn9682MO
	SLh6aekh8nXw4Cn8GMFS11/dykMZSFQj68oPaXiNHOp7cD3+J3AHoUbd5rj9sHiaXeRsMNLRg+F
	xKuVgE6NE/uYH0kxa/ZOQ/MDf8BSue4IQ9tQ52O9+hYZYHzXN4myDa9cDQ/uGX3zRsTS0miGVkg
	R9vqgUZopnI8cFUF07473K82r79d0NtypBnXjoeYBZSfd8fUUeNJlvkq1AA70BUa8xcitAOdPMq
	E0BeO1CHHyiy1zKPPmieXY13S/gskTgBbQFIZiw6w7zO6UVGsc4ErvRqUVBU0MBm2eQCozudIDl
	qtIxbNYzlSBQ4tL+4QIMDvfJ+kfDojwNzE9Srqeow08bMQ8udEwB/MywbVdVXa99aavbOPQ4eI1
	7KZntO/fsXO77BFkh4GtZrWwIJ5EJhLTAGq42IJZOpWFSealWSVYSHgU7qMbLNeRJrRKgX+Q==
X-Received: by 2002:a05:651c:2121:b0:39f:ef56:65dd with SMTP id 38308e7fff4ca-3a1324cbb22mr6213951fa.24.1786720282491;
        Fri, 14 Aug 2026 08:11:22 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:22 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v4 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Date: Fri, 14 Aug 2026 18:10:07 +0300
Message-Id: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBuIqaTSq0iRqf1TR4iRjJWCe
 Pem7fJbvLeTIguUrtVOGZuopLmgOVU0jDw/YeRRTM46b9v6bHhNUXTpM2La0I8xmsZevHcIHJi
 phEtGkPdv2t3+1td9wrB+T3QcH5ELI7J2AAAA
X-Change-ID: 20260813-atomisp_remove_hmm-407662efafaa
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=2237;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=RWACD7HX0pPyfHqPyRi31tpb3skyU4r2+xqsU3C6SEU=;
 b=zKpKwy1VY0Yn/EFGPo0ymRWnSuCLYdTUrp2jiriMZS18dabz6rJgEPaUkqPWGNmGlCgF9e8eK
 xHYnh73NLIsCN2vg/7VuPi8mcchDT5jE6uc6uccbv8RywLOdAXSBcAl
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series removes unused functions and replaces obscure
variable-checking macros with clear conditional statements.

Changes in v4:
	- In commit 1, include the removal of the static 'hmm_bo_vm_ops'
	  structure and the hmm_bo_vm_open() and hmm_bo_vm_close()
	  functions (whose addresses are stored in that structure), as
	  they have also become unused and are triggering compiler
	  warinigs (I removed Andy Shevchenko's Rb tag because of this
	  change).
	- Add the Rb tag (commit 3).
	- Add the base commit hash.
	- Add links to v1/v2/v3.
Changes in v3:
	- Split the last patch into two (inlining macros and removing
	  the file).
	- Replace variable initialization with assignment, followed
	  immediately by a check.
Changes in v2:
	- Squashed the function removals in pci/hmm/hmm.c and
	  pci/hmm/hmm_bo.c into a single commit.
	- Add commits to cleanup macros from include/hmm/hmm_common.h,
	  as suggested by Andy Shevchenko.

v3: https://lore.kernel.org/linux-staging/20260812205429.39181-1-nikolayof23@gmail.com/
v2: https://lore.kernel.org/linux-staging/20260723185217.317981-1-nikolayof23@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260721214238.840406-1-nikolayof23@gmail.com/

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Nikolay Kulikov (5):
      staging: media: atomisp: remove unused functions from pci/hmm/
      staging: media: atomisp: inline macros for checking the bo/bodev pointer
      staging: media: atomisp: inline the check_bo_status_*() macros
      staging: media: atomisp: inline the var_equal_return*() macros
      staging: media: atomisp: remove hmm/hmm_common.h file

 drivers/staging/media/atomisp/include/hmm/hmm.h    |  17 --
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  46 ----
 .../staging/media/atomisp/include/hmm/hmm_common.h |  60 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  41 ----
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 272 ++++++++-------------
 5 files changed, 100 insertions(+), 336 deletions(-)
---
base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
change-id: 20260813-atomisp_remove_hmm-407662efafaa

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

