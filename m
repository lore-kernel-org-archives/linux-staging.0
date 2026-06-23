Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92A3D564B
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216767; cv=none; b=Zto7yrKmov8ExVhG65vTIszCkQ0asYrD+JpIApDeuH12g6tPMTwYolCOqL+rUVvfqrZgLvHJ18aywCqZb+TL3lHrCIXIAhlRLWreK8/Ny66xcIovRhMYoefiK5loDnyI6XUR5xb41XVTzwkzoYiniSSb5a8pa8dQplfLnLe4aHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216767; c=relaxed/simple;
	bh=jYREDepR47KjeQrqsZGd0v4IevTq7V7QkSx6T008lfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+c2YtXTnxnK7jec+0RRXtRs7yhhPGu1/1SnPPbPKfjRjNkDNhvkrrtoHgE8md/179n+dO5bBCfqtwEw0LsToSHpRz8TAXsw6syU+t3oB5FUDFOZ6sheeb4I93283rkMNjFebqnue0g0+nMCOe/hyuUk4qMduczyDl/NqeGHT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGlsZjkX; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGlsZjkX"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-36b900f350fso5070763a91.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216765; x=1782821565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKPMD4Ts2JAJKg9A9CxG3HhINqnjsoehqu002KFGYBU=;
        b=BGlsZjkXw2eOi0FEf7aLr5R+N7N3rR9gsDNrEC22pVprxzLbwHXOjDNSowqUHSU+Bw
         aKq3Q6eyZltJD7fzFgBBzSYoECkcHNd1VvSQFQvrg/Aq6Rtdr4AzOiU90R4SFVop4QRk
         ljYSuhtDFCKbrkLD67TH9PChbusWEC+zWr6Pm63lUaWUxRf3sVZ+n8VbVr/s1UELst7W
         EvfocMsnFUWziqPgxwHlXoztV2I7DmJtGhxGzGQxeKdPzYI/+7IITeK0wHaeRKClwf5o
         tYowRMKagoEsit7HvRPN6RFtyVau3g5YEKvIcHdt90ikFcxq27KvmtzX0lfqcZb8H711
         t8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216765; x=1782821565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKPMD4Ts2JAJKg9A9CxG3HhINqnjsoehqu002KFGYBU=;
        b=EQ4u2ZtKRq4Gbr/rpo+ZtC5uGJAvP8EJWe6VlAPWWDkBQmgFOkUDSOPUEtSfWQTWfW
         E2Lb05OkbvOsoJm9waQH+tNZSddAljsCkRRPAa89GshGGKeR7kYw7Wxuy6uvucqpIGuJ
         jqy7lDEMLYf3+0K0LtlVfrVS/lrcTrK1O4o+9UtAiYtv9EsqRGBlMz6ThLjqgBVvFqUx
         +5z8bCPpb/NHgUNqcsZ5I8rx6Q5Xk2bmoMhk6o4jplX/ELqNg3C21IRQoiZlWVHwdNCn
         nlnBdCIZSP0pvgw71O5vury1+PYKECKx/7IFjNx+vgQOJzAwPVVN1i1XOhwFO2n/2OXk
         7ErQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlUysBvjjNIx1Rne6rTFc/d10sMfDGEOyKZlh+1rNqNMlzZYUeX2MsOIj2u4iMBR0whJTRHC5LydORuqwd@lists.linux.dev
X-Gm-Message-State: AOJu0YxCZRQydBSo1EfKytWTrCuudYJBebZSVJEKcPv24iRmgHu2VqaG
	oxUMMr74O8Q8Txqaifwm9dm7gMUuu+avhKOiJ9KMI6qcggIHHWEJGMOjfwFFJXANzUg=
X-Gm-Gg: AfdE7cmVEGENFyX8jqRjawev3uSkmeQvCHFLyCK3k1ZhhWK+6Ah/vy+xanrN+MCle0F
	+LGvyAtDxcuQBzC9jowKlsmGf4ksYRX6XOkME5Hg3MvsS4lNP+iS7zctXjPLY3PfP9q6cPWRHLp
	XWY9PUHiDC2b+NXJymDLi83xXRwl1URteesjBA0E/nhRbTKZdeyPtO0y93jBJc3evgonvrSuO/W
	+7OPyfSLkjzLJhoghlcUCIr7gpJIHMEQ3amKySIOwibwmFoHTE+PLs8LF2A5N1uMoPYzIn8XPvK
	D9H6hxVys+t/ckteXodRjE0jKWoi8ALWZ26Rv6KSkdLZTC0jESmDHH7tK8wVdR84A57FdJud0Y2
	w4kG7mjNyhWJWQG6Mbr9ba3SLxGvqXSnaF+24MAqiON6u0KcCO3Xj6Dz/0vYHrSbYJj5+NuU2IK
	qYqEIzE4xSFm1QhoxZAMmLjlxfX1u2IKv/ztZC2kGWtDC1Aht+jL/GAMJbldo98Tt/N8+1zrdJM
	Q==
X-Received: by 2002:a17:90b:5212:b0:37d:135e:2c42 with SMTP id 98e67ed59e1d1-37dd17b6369mr2609292a91.24.1782216765110;
        Tue, 23 Jun 2026 05:12:45 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede3f9sm9705032a91.3.2026.06.23.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:12:44 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: clean up CamelCase style warnings
Date: Tue, 23 Jun 2026 20:08:12 +0800
Message-ID: <20260623120815.14737-1-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Split the single comprehensive patch into a patchset of 3 logical
  parts as requested by Dan Carpenter.
- Worked against the latest staging/staging-next branch.

Bruce Ou (3):
  staging: rtl8723bs: fix CamelCase warning for bResult
  staging: rtl8723bs: fix CamelCase warning for Address
  staging: rtl8723bs: fix remaining CamelCase local variables

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 54 +++++++++++-----------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.43.0

