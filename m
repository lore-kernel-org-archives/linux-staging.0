Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CB322A24
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956671; cv=none; b=q2y3XFoGX1A9ZKuAKa4Ji6RvKkL6aKTBGHQ4qGaOEWb41gn5NEn0TKbcLHORzgEJdHZehqovqszQJXK7t6I8LdsefAB02TfEZXQKS6MdJeajNI2/iZBsuz2K8777VI6DPH0beWd5o3tSN1H4I49xejshu+LZJbhePkNrQXoZJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956671; c=relaxed/simple;
	bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PsHMYNzgmtJmdBM0BLbvZ3N6RHHPy6CU/15/S9ey6u8g1vHPFS63XpQ1sbjUZ0jhOJBlBD1RrxgNfxoTysPcz0aCvlEFel+Xjr3y7i9wK7YBqQr0C1zTf8XHLqDwgggcicGZ+Kse+EywUpm66fEAYQd5IrmNcApsugasRZQJ538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G09d7QFY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G09d7QFY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso1929163a12.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956670; x=1768561470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
        b=G09d7QFYs8s4Pzgg+Cq5aqkRIvvejGqmfsl+ZbRRFIfFM5/UWYUY5TxA8pKxf60Q/y
         g5Tb9JI3u8uAUA8WGGMgFsGWEJcWlfCMhJvZw3FGlEQpJssYbdbOGFACXigf8tY9Eq0a
         QFojxdITXwbc/pjvuxNOkfW5oyId+dYjDaxa5zJEmeA8ISwDgQ/8utFBVEO7soDAV3s1
         /8yhgZaS0Tf12fdI45pHmXwec2MDBqcvlN1hOiq/1DGUP117Knn4vVqOkSVvo+1M5icG
         KkhDRyrRESCfk29wOMbKAg+5bI8blaJMdiQjyah1MEp16fic1Oe4Iogb3FBU0EII0oXb
         MVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956670; x=1768561470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
        b=dA3sR/9tHdWpAdPyOsP6EnodykjQbBmhzNPLvjIcDSI323OSPD4+RA0RJkTxWxawgM
         RO6KCPd/vLMiE0wGSj2Lbmb1w5Em3Cz7oD9KwTTAzQoaVQQh5KaGOd/QbC2AbzqI6AlI
         RFrf2cnFojxXgRjNXtrI6iQAldjq36c0Ax4uuqvP7az8NFtfMxTA7B54gvkqH9PRnnCu
         +5bVXy2b2xY+u3idUqTaEhxVTXtkDg00r2QD6Y7oGLmMGhOVLAHLto1RoA92l3rw3xvB
         GCZJjuyCdQhECnU/gpAqc+sw3OQbGhiiTtbwfJVPA9af979Koj1yUxYC9YdLCpsOXvzD
         u1Xg==
X-Gm-Message-State: AOJu0YzUCp1kuG2N5o0V3Zo7ztnyV08KaR2XXzWTBuJLcUiKLLeKCn6P
	Ss1IXeoFugRBxqvUORv4La7GxIx5te7zrSCTCDqQltMnw0r9/vB3mBih
X-Gm-Gg: AY/fxX4bicpfLKgzahu9wpfU8X6gZGEvhdDcMBeffjwnC6aYOqKusjZ2UPgdmsZNMml
	NRq8GwW1tYu1WcX6GLOOhl/CeK8tHEEXgx7xwNn2obc7KyoAGMsYfNf39exOA4Wcy3ROYmhrJ5y
	kmDqYD3vFuwXZc0jkFKpQIRclsdM+h4ITWuquPbNATpsTQ3ge12hDOKvja/fEczoehs74mdSYdC
	kMOKO9rtxjAeNdmFXucQKD4bKEB6+29xHFnC+iuZ8pYOEsPLA88OHGrfnnAaPFGs78eYgdZfVpB
	8Cn0d01LAaadkWkOQ8BXB88o4e5tYJFuF0EX+OVOl2NLBhzt4Go1SihJOYFQPFISyEWw1jm/Uh4
	QB3D/VzG7B+SoXnzmfhB46GGA70pVgvdTQWkw95S3l8NcIo8bgfPcpXm2PBkHY8apPdcEXLliIZ
	FYTER1nz+LRJxVl/Jv+dv3biUFAZ4M4yI=
X-Google-Smtp-Source: AGHT+IGYpOnh9gP8dupbZacHwGH9bq28wwN6JbSEbDv/aBKfcc9z0Ix1WJKEGJEXT5u5LJXeFxahcA==
X-Received: by 2002:a17:902:ef0b:b0:2a0:d662:7282 with SMTP id d9443c01a7336-2a3ee4b74e3mr88408095ad.37.1767956669652;
        Fri, 09 Jan 2026 03:04:29 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e26sm101637725ad.48.2026.01.09.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:04:29 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
Date: Fri,  9 Jan 2026 11:04:16 +0000
Message-ID: <20260109110417.16359-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
self-contained and focuses on a single logical change, as requested.

Changes since v1:
- Split the original patch into 4 separate patches.
- Each patch now fixes one coding style issue.

Patches in this series:

1/4 staging: rtl8723bs: fix block comment style
2/4 staging: rtl8723bs: remove extra blank lines
3/4 staging: rtl8723bs: add blank lines after declarations
4/4 staging: rtl8723bs: expand multiple assignment into separate statements

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
