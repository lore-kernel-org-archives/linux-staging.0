Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9883D6488
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339831; cv=none; b=qfSedC5u2O/P//GrrBFCfQ+eR6WQggZszuGoywuHGjc3JFmnw0UHTONcN3gT94kCVBrXemq6QehHfXRrUN7a7OCERGViNkOXYaIRVW2EX5lfqQ8r3RftR8CGGxFeBo5OUgomENqJSWQeo6lruVJBLhE71lN5+SOVATNI4I+bFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339831; c=relaxed/simple;
	bh=N7lxxaqgYKDqE6wKjVbixL4LiZ8Yoas6+c/aXC/q1ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u87pQ0v9/Crg/T63O9QR873uCP7x1GboREFDHSUGNtL8ez4CjkeUGo30dhYDbUWboLKZj7zOrmR3P2z44dW6ip8cJLhYxdVVOjfDoWnDqMoEDsixakSMiyc5glGywIQP6oTn/Z/rVX3/n0+pyUluoBUKrLFLipmUmUChcCdrKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNTiNyBF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNTiNyBF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c757a9251faso1352338a12.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339824; x=1774944624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56cZFxb5hXm4BTweWoeqBg2xG79G3LuwO40uREqeFpQ=;
        b=PNTiNyBFwAmWiu+Y42jX8Kyu+8jZ3HmQcDE739oweCU5AD7MaXaC6BkU9XcOcmBJMf
         QaHSnXk2Rh5B8kOnPXWbg9vMhhGN73l98FjPw/wyQlHUdFT+//dg/TlW/12/UQM6ko1f
         lIU4cSn2D6LVZb/sgDYbq9wtOe4PcdpWMhB+Gvq4TjeZ2+kkGSSAFAgLhkMlOjwMNNtV
         bs8hlFpoXtPBCVq5j+eZXM6V3nu3eFI+xLECQkcWHGpqTpRF/3W0mHssM3dcWgkso1Tq
         CRBTQuJW9199iUoIfpxjx3T5tnQOakB2B6j5LkTU9EaYNqAX7bSRVhQVgOKJjC2M9rcd
         cTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339824; x=1774944624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56cZFxb5hXm4BTweWoeqBg2xG79G3LuwO40uREqeFpQ=;
        b=YEyZelFYPkc72UkMF9H2sMIk60LPC94/r1eXA3G1zm8wPLGhev/BzP6RY2niw7XVZA
         HYYdLaFv/Wk+/swm31CZIi4hh6v5N33uZfZZnZ6bJy7lUHq1EXxzkuAciN/SGzIQ0AZU
         +2SU2+mMKjAHwP/6pjam88NGjz5JShK74cAgUY4+U7jalT8VDmcHlQUMmiF/9yoUKuH8
         OmpcRO1bSA25FD8yjtKcC/4Rip5S9RwtsO74YloE04uqm2r/LooYtjF5p57i7D2aV44y
         sQxs0sTmcaBG7ARBVC/x2JmXfCogoODVICHJh7IpAkYx9BqHG0AoMlxOq0Q56qR9AQDW
         q6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWdQ7e1HeVSnphBFmft3Zl0yA7jC6InU3V2XV8rhKmgc+iw9lN5t0bsPUK9osctd+lVHTvq2Si2z0191oHv@lists.linux.dev
X-Gm-Message-State: AOJu0YxeCAhCj85uII0QbKNeM9tsiEmCvqwKXtq9C8EICGYEHguCiNIL
	FTv1BuCfAfXpoKnclyAlmAdsglzCI+Nbk0cVGkaQFkAfbtaFt+a06eYA
X-Gm-Gg: ATEYQzxq9XUJChHufwRfLn8ViQ484LijiQlPvdMfJ11lvUy3nb/I69MY5Yx434LWIZd
	jlwsRodrwhr8YK63qnwYv1+0V/zxaFPX+IO/MteN/1DEkanjjQ/cGIFqbQYpSrhv28pBfCd0XLV
	CdfUXPk/b3+3Exc+dAbVUdVSBlSnaGLV4Ujn4Vj8VAAM1zFFD1mmO3Fp6TnpwpRBPvv1FnU3POU
	kvEsW6HIbI351PilUD4b9kZz7Nkmtl4YXrWL4qHgqgvYj69tmAXyVifODUXANbKdS0Yk1eJ3m/M
	DZplXcdoTH73riVv7xaVdbjUlojMnLxqlEsyNqr/Mzgqr+5mAf5Ss95kUy85GhygxyDGYK9KZc0
	HScjb997iDK/ZHUIl3HaKn+vBQ7nPxhbdJbxtCEcAv+asK1sQ26Y2rISg9ilIsKwAc53I4K61WO
	QyehbohWgCwzccmCZwJ/lhDDzK/Eme
X-Received: by 2002:a05:6300:210a:b0:398:9c9e:996c with SMTP id adf61e73a8af0-39bcec31336mr14349551637.64.1774339824143;
        Tue, 24 Mar 2026 01:10:24 -0700 (PDT)
Received: from localhost ([2401:4900:5022:1dd1:d6ca:2faa:9e13:1354])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a738ceasm8946308a12.0.2026.03.24.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:10:23 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: hansg@kernel.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] staging: atomisp: pci: remove leading whitespace at the start of the line
Date: Tue, 24 Mar 2026 13:40:07 +0530
Message-ID: <20260324081007.23165-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the whitespace at the start of the line to comply with
 linux kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..3cf35678383f 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -87,7 +87,7 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
  * so, having multiple base addresses for
  * different timers does not help*/
 const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+	(hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0

