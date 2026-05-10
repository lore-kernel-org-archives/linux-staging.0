Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32723D291
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435555; cv=none; b=CFOKjfXFgrzdXDMned8TtcnULxa4fxZEQpt1m3vACSEu+Ns840mGaOsYXFTBpQhxlRh8qtXCFNDWc/CTE108i47RS30+IYUBCobWdMQCdGAjKirIn67TDV8ZSDnw6JW2NTYLiGLO+8awu8mtNkZ8yVq8m5uvsT54ZKq2gwXLvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435555; c=relaxed/simple;
	bh=6rQFNb3zUbq+IjyIVEvY/ALzSpcPjJLu+xJ6idgmKJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpC44P73gxu8O4WMlXyuAZvv6fOWpfPGmzSpU5sEHhtj4HF+RTLf44i33E6yPT+bdg+Dv6LdZwoaOIWKQCQQHC7xKrEiSc1EVXLbfxwcgxRmD0vMrG14+E+iblfNQrKFuLUw/LJO3c4P8+N1zn1PQ4x7xmszX0w1eQHytKreVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCnLq1de; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCnLq1de"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2babfd18435so17729845ad.1
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435553; x=1779040353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KAPx2KckuU9FOLOUg+I8aCkqeBi9fbVusl3tz8CzKg=;
        b=cCnLq1deVOOD/cEYFCYO/V5xdrSCnp3ReI8PA5zvGngQAGPpqd4rJos3dPLOJb+MVZ
         K460//KOg6TEQOOL0qVwG+1+ve1TyGc4OwkPelAGUOZmrVxU//KQK0hpR/rcGJjiYZyA
         rTd1xM/mdODnhlyeWQ+1DphWKGsDLXist3RTpUFsdf4rZI+wqedsW868sXGcWeqnGX7g
         9GLfLzj54GkbvW2nD1VlQPhjpqRSSnujBnfZ2JorqN2cj0aJVm/gYXYyCa+7C/GQNuAF
         bW0Q6tTcDqwHmOj6sKRhVrvJEG5T/XXP0IYi2qdj0gLeuPXCDQ05u/JIyWayEsU7gghH
         R1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435553; x=1779040353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KAPx2KckuU9FOLOUg+I8aCkqeBi9fbVusl3tz8CzKg=;
        b=YvL9mqTkdelZSh99Q5SDLNQH0Nu0dKETpmNV1w3umAX93zBb6Y+eWUeyvwINTAjqRl
         SMmViEucZoW+gzUdG/quDx0oL4dTydv/5C7A3ssaP0YhRWaZzCIVQOj/rl9F641JVplC
         4rw1jSD2CAdagdMSQXX342rb1xwMAu1g5172gOv7lw/UWE6Ifiq+6obzOVO5KBXHAQs2
         5Q04h7SQd5uyEpqWLrhCWy+XU9N39radcF2qNL0TwwegbghAkzFCkecu3sEoKxh3t9+/
         2xEMARnoifTII2TwNUVxMFWLEU07vo5NqcjXNiOtGGZAZdMjLKpIfXD1L2+dAe6hYAfa
         IZ9w==
X-Gm-Message-State: AOJu0YzQBPf4Y3UTmYTAp4xqd2XCxQB7sgux8BMQEpaFQJXhnmVOOE+3
	cdynP7+Faw0mkvaqJEDKItm1IsQnlGKJHC92ILDxNj3gdPLK0KFdvBJhUxWWvKVXGqCdFKDW
X-Gm-Gg: Acq92OGStCPNn8oIWUpbZK3bsnogdDQbWUSx36KieD5MJC7LbwxzY9AcvO4EQRKIQb+
	PC/JJwYrb5Gy2h7kq0oB3LswiaiY4ipjjREqxUAZXs7/XKtV/6Skqceh0zr7/JFG7BDMs/sL4bA
	iEx16gatryetzmQa9DAY2GGT9lyRVPj1QMwWfRRfBaV+ZBO0At8M9msiOAmONQUcvxxo9eAKd2N
	ATWsGjoYqCuqHh8kySS8yipyZPjoJQCCsxt4TlahHGk+lnpt96UYx6r94U1CxYMPFvoqxn7rrvt
	L8nWfN9ErOE3Ri5UBSzP0OEtDRAGpZ2yP66/v920PLKDOMAQg8a7Vhgr2uOR2ZIxIXOQpl8MQ6w
	PRqoBwOLn9V55iP+LXx0oFHArQu7xJ7Pe6VTMHBPGpf5OayUZmtV+En0Jq6aAScKoxRgZQ06xi3
	PusU688cb30AtMpMMZ7GMrOnh+iwKQCrbT/eU2BFhc
X-Received: by 2002:a17:903:98b:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2ba839e1af7mr224122715ad.27.1778435553346;
        Sun, 10 May 2026 10:52:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm83169715ad.47.2026.05.10.10.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:52:32 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: Fix coding style in ieee80211.h
Date: Sun, 10 May 2026 13:52:03 -0400
Message-ID: <20260510175207.563378-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes four separate checkpatch.pl issues in ieee80211.h,
split into one patch per logical change:

1. Replace __attribute__((packed)) with __packed in struct definitions.
2. Fix comparison direction and wrap macro arguments in parentheses
   in IS_CCK_RATE and IS_OFDM_RATE.
3. Fix block comment style: move trailing '*/' to its own line and
   add ' * ' prefix to continuation lines.
4. Enclose the CHAN_ARG macro body in outer parentheses.

v2: Split into one patch per logical change as requested by Nikolay
    Kulikov. Previous combined patch was sent as
    "[PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h".

Pramod Maurya (4):
  staging: rtl8723bs: Replace __attribute__((packed)) with __packed in
    ieee80211.h
  staging: rtl8723bs: Fix comparison style in IS_CCK_RATE and
    IS_OFDM_RATE macros
  staging: rtl8723bs: Fix block comment style in ieee80211.h
  staging: rtl8723bs: Enclose CHAN_ARG macro body in parentheses

 drivers/staging/rtl8723bs/include/ieee80211.h | 60 ++++++++++---------
 1 file changed, 31 insertions(+), 29 deletions(-)

-- 
2.52.0

