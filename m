Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497A301026
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403612; cv=none; b=rcpvMfc/Z+IsmzDTNZZV+/wgtdrFDcrQ7qx2E7HDkL05ddIOxPsDGSS545yw3sR1tkSXDcCNGEj3wbyRcigBb+YyABH8Hc24FBTFNP2m1ypyMBeLNkgH5oBXZ42xQuIWThourQWPdJhhxd6c+cFOid+BW5bC5t9o7aSIv4sia3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403612; c=relaxed/simple;
	bh=6YfDa3gErDw62xSp7e6B6JQvMTZO5nbRlVohEOmLm/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCTJgr0BKbKn/46ESq5wKImzMooFdQFBV+kB+aImlVD3poQILrNO4vk3f3Sz7w2Lb5jK7dLmDA7moqoXdBV4/pyFZ7qR30SEvtMLcR4Kw3oY2ZqYay8ENvcfS9cv4XkxCLNk1uTRmND7v9W0X4YAVabx49rr6lGBST/QqLFj8G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzdAVvmb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzdAVvmb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297e982506fso55292245ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403610; x=1764008410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zl9EMXpVNyBJNhHhexUPn0nO02fOhckk1ZQIRmn1n8=;
        b=IzdAVvmblPH735NP3lcoisJ0JEIMB59Tpj8Ksb42/u3IO+y/wRwG8mwN9m96pWwm97
         lY2+sngCWAwOVyUYAuE8FZa/QqxNuC89ZHQHQHw+H11PlAPaneLQznmd0M09U+jdfXRI
         QZuEMKRJJj+G+HQUJfHoaYf7MCZHGQL2BRAf3BDieJT0XFVOTFZZjHP3RydoyXanpkFi
         RvMBicI1POHN/veswLvGAucaHtXVBNK8OrsPaJniq3agZGQiw9DEE7Rxhzs1GC9rAFqW
         jfW+Vp2mV6rba31N5cMSOj0FaVUn79OCbUogBfGRG6jSc8CuIUUavS6cSki8lw9twp49
         AgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403611; x=1764008411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zl9EMXpVNyBJNhHhexUPn0nO02fOhckk1ZQIRmn1n8=;
        b=C3iW36xQ5vKJSZMDqVuTZ5nKqjjQG2Y76jU5uv8NDERxxw3KkdT8fNBfBtBaaaTDCz
         O/FsjOiVG0yaDyoicOv0TfqJ8WOguU16TnuPJPyjW4wmzgCR9geaPkeDnFkBhtcpMOJu
         yt/0QwEKOZGrNy3BqI/+su+a9MTtKu1NNWbmgHwLIjFykE6ylndnlvLw4LWkxQw2PJRM
         rplJ+LiTG1pypTWXDDkN+XkiAfQVnY/r4CAgs6NeaPf957FjthYV55yU1xFb9AhjjzQk
         2qP5r1C/4k8UXrePDLMxHvNw/Bq+hufNC++ytpYC0tHvHyxJSKTW9BCRTdl8j/vRlRsO
         1Eow==
X-Forwarded-Encrypted: i=1; AJvYcCVyRACw1UvsEDc4yjbI2Rs1DifxbB8iAqAP4xMosNzcydJZ05p2JduWloa1haBqoweWQUgzcLHUOzZdDl9f@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+2OXrkAew2TkhzNy8SusZ3NaF2jku7CNiRuIeTKsOtnJmrJlt
	MT4hI7m8+po+4zh9schC51QJ9VFvLOsezJJB+IjIT0GOoGOXcaGiU0xCIXOs1Q==
X-Gm-Gg: ASbGncuWkRHWADM+S1Mpl1nWrdkoyX3LxM+X+6IYFLNU36TRQJVqTZ4j3b0wneuRtSY
	exbfPkrmnkaqcocVpt+uxEvtsSb5U9ovDaK+VbuAqLRjdyMnzVpDxCCM5hiSZpjMMuU3IeX0VdT
	7u2F+rFlN3jqHPgvYMWi0VX3KOnqgl+eldd3x8CTrW7Z0R8ndl3aCNlPL0Sj+9EDtATHMhu34C3
	n1Fsf7EHrQ4ix3JghbVSDCwp8eRowBaIoQ+cct8AvruyNy6CLBbatj90n5oUYpKufQb6Xv9KLMv
	VGXdRtIeRl6OS8SwFImrcp8fdBEFgFuq2tV8qdDcxlDpTSdlnqFbd4foypefLFjVwAy2khlZwRO
	o6IFyyGVRtoYqHVEz39Z81+KWc0x+0F9xs6Nucbz3Gxw1SmAJoUUbfiMkSTCwIiFSPP7Sp12B8o
	UjYizFOAqVFHNu5n0mhtZbmYbn4oIYdPa3yJKgfksf2t+xPVk=
X-Google-Smtp-Source: AGHT+IGuwynby04MgCea7V3BgAbsj3sQvzf+jr8IFztcIAGNF9QO1r6tdOHmQhyLrO8P5X7tL8cPCg==
X-Received: by 2002:a17:903:46c4:b0:297:e3f5:4a20 with SMTP id d9443c01a7336-2986a6f540dmr145141315ad.26.1763403610602;
        Mon, 17 Nov 2025 10:20:10 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:10 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 05/13] staging: greybus: audio: remove obsolete FIXME and document topology ownership
Date: Mon, 17 Nov 2025 23:48:10 +0530
Message-ID: <20251117181818.118139-6-ayaanmirzabaig85@gmail.com>
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

gb_audio_gb_get_topology() allocates the topology buffer using kzalloc()
and transfers ownership to the codec module. The buffer is already freed
on error via the free_topology label and during disconnect in
gb_audio_disconnect(). Remove the outdated FIXME and replace it with a
comment documenting the ownership semantics.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/audio_module.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..c7deeb99a41c 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -305,8 +305,10 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
 
 	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
+	 * The topology buffer is allocated by gb_audio_gb_get_topology()
+	 * and ownership is transferred to this codec module.
+	 * The codec is responsible for freeing the returned topology
+	 * on error and on module removal.
 	 */
 	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
 	if (ret) {
-- 
2.51.0

