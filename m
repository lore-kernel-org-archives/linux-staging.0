Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79738301026
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403632; cv=none; b=U86gio5gMOUbpUHwlJ8T5ZhghkrUdlJwzlJJp1NlPGl8pQuCGiP5pBV3bCDz5J0CRsUyWRqP4KclVK06wwctUK0gKxp5rYrk06OL1ijmTjwIcl+24t5C+ibL9spVJF4PAcQkBBSbTWwK0ZepJlwHQEH7Za90RNOq80J9hvV2gPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403632; c=relaxed/simple;
	bh=Iz854n8taKQW2+QRWUMgDn49QSkGXleBZdPpit44i2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXRGg/bk6xKxLYscgUFUiJ3bxJq2+mkI8ZejHps8DQfhvqq9ePF4VDIt7nyWkD08wzUdfL/ADXGQ7+21Svfd+zsO+CObzI462iAiSlliYv9EpXvqdfjy2LISDyZnxOOiX0RpM1TCkliEzyB3+AcOym52AC2qYjOuhrsxNQEbU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ/aGBUp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ/aGBUp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297dc3e299bso45003765ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403631; x=1764008431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zqpFfSTxt6k4olHubnKsjeBvml78pm5/tIXaoImcTM=;
        b=MJ/aGBUpBVaoJbe+UTka00TXFL1Y42pH5XnozwIbD+LAmJO+7WkJwDuvKADABqeR4G
         Mhm1SsHR0AF2SRFhR1MgME1UHfnL254SNlNyyoums6Z6sdr10e7lnv+rFkbKw83AewgS
         5sWBvvuXqdJQqCfX7qIx5ZzuylMjp22IZXq+dl6PKrL73iZkNyqjoPxvBHPpX3DQMRZV
         Pw5BQ2TBJMuVoOk5lp8GshDYQSBFuoJ93m+IMTNvee0TNEeLrTT/krGjQ326TiuaUmkm
         nLOvGrFylb4wzSyYptwIJO+Jj7RrNZ3Mr0/5fyrKUXWCbS9apGZFoOGJdlyzypsDzP9N
         eHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403631; x=1764008431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5zqpFfSTxt6k4olHubnKsjeBvml78pm5/tIXaoImcTM=;
        b=Xb8VelJfvxYgEE7DGZx3szYn7stFAMM1kGaN3xAmFr5LDnVqaqAgdaI3DjtgsIOFW4
         QUkZVdT2PFUXbiLiSqlVdvELgz1eFCtrcfI0SCpCPDpLaDpcHswOE0x86br2U494ZItf
         fJS7WkI9afu0O0fyOOdMtxulv3Aq5xu5wBvUwZHtW0XjjC4MQt0/oulVzDwOXZ0PE02D
         O2ckBOFUXr2VCk0WE/cLEwK+I5XkYoHn4xot2wvgAwhxbBKxsIXliMsP6XGAoB+s4jbm
         HkPkWFCxpJmeCN2lCQOzdn3403DoH9tJTGD9Ub375v8AbM1zOsRNak2ofPUqyIZH+hpE
         Q5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGB3uQxZoqcozV9Nc8dqUzWsUKxoUhgRxp9XNCkNVSiCTOJzpDUlsIfFTD0UMstmvCLAnMBlOBnVwlMc+B@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5bVZWsH+0b5kYJuSnw1295HbbH1P1wJqxh2cdOEf05gb61jEA
	knZxZ1VkeJyhYANkrdNYrNIMyYva2mLIpMhM2yQOEdZm4bwCSI7RQ3y2
X-Gm-Gg: ASbGncvGLNIpmsuN/bK1XGpSYwXVETn52L6cHLWC/ePdCNNOydwT9EeubUZ2nE4l2tE
	tFPUps1wsyeKVAnPoB2DHkEAzWoF2PB3InLtcEUeEgCnHK4Wu/Uy86U06lVnZ6nvuTz3/P4YEzj
	RTE/AEXRLLtwdCukqi3oTuJDOmup3l3t02/bDK/ES5VO2dgKSlM+vb5oI1UBftfeL0lWlHeVP+I
	qiYCwlQfDUkcDkn61t0eFN9L/oxYnolhd+Kv1kv8yqCFLvRLjdi2Xc4FqMuF3EnG1/aWh+/kyRT
	QZVs9AZJKl4xZ6LebVNS6YoXzdlw2DeWWgcFqHSJmAKt+KEs9yW9r6sX56B1debU1pGN+f37aX8
	sne2oYcTZFpU2003zUUgqqNX6RyDWDRNlHjNpYKD0z5vSc7A5UFDxvDiwoEWx7TpLww0fLY+k89
	H0U0MeImLLMVoCWWyYJzLvvCggvkktSIpQ+VTYBOrYgAAQiHw=
X-Google-Smtp-Source: AGHT+IEIVPzECjsDHbIbkO/QDUbP3Jsg29my+qlUCT8wwemnsmBxOECXClYGm0ROW93roGU1v+RIWA==
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr151503745ad.39.1763403630739;
        Mon, 17 Nov 2025 10:20:30 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:30 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 12/13] staging: greybus: usb: validate hub control response length
Date: Mon, 17 Nov 2025 23:48:17 +0530
Message-ID: <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clamp hub control wLength to a reasonable maximum before allocating
the response buffer to avoid oversized allocations and remove the
FIXME about unspecified lengths.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/usb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 475f24f20cd4..1502641f5dbb 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -105,7 +105,13 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	size_t response_size;
 	int ret;
 
-	/* FIXME: handle unspecified lengths */
+	/*
+	 * Clamp wLength to a reasonable maximum to avoid oversized allocations.
+	 * USB control responses are expected to be small, use 2K as a safe
+	 * upper bound for the response payload.
+	 */
+	if (wLength > 2048)
+		wLength = 2048;
 	response_size = sizeof(*response) + wLength;
 
 	operation = gb_operation_create(dev->connection,
-- 
2.51.0

