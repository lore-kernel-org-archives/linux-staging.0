Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A83748E;
	Mon, 11 Mar 2024 04:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710130380; cv=none; b=hnweBDHunKwiDkvTc1SPmLTYcojG1OhyoGiYw5WJB9n/4Bf8+oCqxODWigBmyGnC6nDza14X8vId4XPSRXw4GUAR2jv9gzKEa0J3xX3PynZzlBV3+ccHsAjyuyZRKPJiBtBR/j+i6J4COSvqDG0Zy/v3Iz/LLwireemmnl/FDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710130380; c=relaxed/simple;
	bh=H7QzImCqr+MPfhkRL29aves8sd5WMJwJTv9ENBKbAN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4TpWoSKFGDRulLBcb4fb2wee5zPmemj+bgUIl2boHThJCp/ZCXwq+5ir+lkbRPUDM8ar4qNFNPG/jG1YNH83n++DR5fHZKwdMnojBIxZ2HANQOlGy6c/OHiV+qlw59Lv7XPcO8Zcf9TdKzBVkydHpzpLDprRrn4kBlntz5enFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFB2ZIgo; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFB2ZIgo"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a462b068416so35534366b.0;
        Sun, 10 Mar 2024 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710130377; x=1710735177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP6BsKLGqp4vXghd3Tx6xETihqDBz/uH6RECoyX/eJc=;
        b=BFB2ZIgo+bQvccNXThokVjmm5SSjYIj/e41NHYT2efwQp2F1S0YM79MzTfXqk02Pjb
         svRR+1PMCTKVvOrh5HXv2oBXXi6C4Y6mRFJOFJSu9pF8DcayTyJEioUFHZAoopRKK+JU
         TuIy2UMWigmn2djsAhv6Qx3JIDcH349UZTtuG4Jad3hGhLf9+qnQIdwr0KeBHvSI2A9r
         w43Jvz0p2N+t0FU4ZgnL6GHCigRUfPExztfhMtxjnPs2lJoNefvtSwzeOSLyitjtvYgi
         wR0DMhzgBSKseKx4RzdrRedDMamL2P84M2KZ1QpgqNnoVLi+2dOPxeOYCCaPO6Wz1+O5
         tyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710130377; x=1710735177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tP6BsKLGqp4vXghd3Tx6xETihqDBz/uH6RECoyX/eJc=;
        b=Qf4KybqCLpOCG40r0bJKI3lYg3qlR0Mrsme63UicDR0c8xA7ESkpq+1vUJon8ikS0B
         uewRmGkMkXMzSey09Tu94VMziuzZ/loNU8gA3zbBC+FOJO6WphYVfwR/5HznVFDhpR6w
         1tgTQfuCDTHznecFDVmX9v7rIoexXaRkmXiBiBcjGKV+Q+kQsKo5Idhe4eVt9OfJNhAV
         t0oDn7XoWrzIv/zRD/gqch/5beqB58jwBncUV1D2a9ioA3QeiseipInkrecohXDppJ2p
         tk6VwX8iTPQ6VIZX6/SdlcJp5i0Fm9rTPry3uOXBLNjQ9ltYgIxsL51apbIHZ4CNR7MX
         JQJA==
X-Forwarded-Encrypted: i=1; AJvYcCV2W54k18FyieUz5PTJViJxBqMaWx85/AkXnsyaaqjwItfyMN5sa9c/tgNANSyt+L5X5NKRz1MS+PB7MI/fdw3apbfgfa3FwWOWbQElWUflTuwXohAU9fvbQp0CHevznIsLnXiqiG/QHA==
X-Gm-Message-State: AOJu0YyrzS9ymG07uYt8nC7KwEQmyyXwkQ2VzAxBv1HLcgvJfAfIViGd
	x1c7uFOhdguJis0qny2RlDHv1BM7YQOmeCQrJAiyJZR0/VSSWkKCgLQ7RTDHGnw=
X-Google-Smtp-Source: AGHT+IEfXD9SXxw7SUmqGLIOPxPzVL6Pn4NzLcBFSof8H8cW0guMndIHKfZQWykOOMXGlPXrRAbgxQ==
X-Received: by 2002:a17:907:cb82:b0:a3f:6513:1489 with SMTP id un2-20020a170907cb8200b00a3f65131489mr3863686ejc.55.1710130376511;
        Sun, 10 Mar 2024 21:12:56 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709067ad000b00a4537466591sm2477338ejo.32.2024.03.10.21.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 21:12:56 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2] staging: vt6655: Remove unused function RFbAL7230SelectChannelPostProcess
Date: Mon, 11 Mar 2024 03:56:49 +0000
Message-Id: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311015601.17428-1-dorine.a.tipo@gmail.com>
References: <20240311015601.17428-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RFbAL7230SelectChannelPostProcess as it is dead code.

This commit removes the dead code to improve code cleanliness and reduce
unnecessary complexity in the driver.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:
  - Removed unintended blank line introduced after removing dead code

 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 057860a5e100..3427341e581f 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,9 +68,5 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel,
-				       u16 byNewChannel);
-/* }} RobertYu */

 #endif /* __RF_H__ */
--
2.25.1

