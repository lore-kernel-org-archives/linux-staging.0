Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6B12B72
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998542; cv=none; b=r6ERUa7dfvufyj0kA2SRCsw4Z0eyH02WprgXUC5qw2miiV144W54KG9vvPf37wmTkWNRKmGBMUAGem/RVNRU32JTQHCzHLZ/PXRqcHPNJj285Ik4uraWl+EfcnsJEbgjLWM4tD++h2tftSthM6kqkFukQWydMlrjUYMxJp1adgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998542; c=relaxed/simple;
	bh=5aVoma0bpE5GWX/WIZ9LITVTKqc1xLxGDktG+yidrQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PIa+ygvy+lhcJiFcn51uqu11ln12Ujq/yl9fmb0Ql24J/GQkXAIh8+UtDsQFjqi3abumbTb8JGvSZFrRsWlZlsxVePzPSz7LcKqR+MUxCAc9AKToKP6wtKfjhdFnrGY0mWLyFW1AEoTgJtQuE4vnjD34O+AyD8JyXM56RyAPQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=UaD1hDrx; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UaD1hDrx"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6ce533b6409so3045587a12.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998540; x=1718603340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKb/VDt+1G/+4IorQ/WgsaHkB3UUwpTTGGc6wYZp8zc=;
        b=UaD1hDrxtanmiaQlXSKYpBnNe4dcHNd+VCRHh5rhJ/O7fv5ZlYAjGNRN7+TOHg49Z6
         Fr0ba9McJpcaXFx4r6PQDw10PQGLAHQU1mlzIiotC34RJyJoSok7GJ9ZMpCQm+0USolt
         ScJW9zg0mlBtaPlstBuiUHIsi2ANtn43KX3TfYIbwfozLlFqdxkWWTgfqOZA3EgXRa8K
         vGDnThgBrfDc52VeKwScnuKt4Jky4m8jh5MdVeFuywLe6v/nkeYkPxa7o9T1SSgvU3p6
         QsWGLc9Icc08XBSAhhdTudOwnBzcdHb3bIYubxek9BMCLOU8bsdp9AsxkA4Q91xF2S48
         7h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998540; x=1718603340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKb/VDt+1G/+4IorQ/WgsaHkB3UUwpTTGGc6wYZp8zc=;
        b=i/JAM1dBEIbW7+eBQJX0kejz+E0/jagkv08NobhLzvDDrra3t12+vOlwA0E3FfQDnK
         0pAForFI0kaAQxoCbVOcqRGUAixG63g4jCGyg+t3tKEmMdYM3KZT+7wgu65ICus6suv0
         nEupz8gZkM5TYv0MNODS036XrtCXGmvW0bfVfOAQEn5zR1b7ZzlTceXE+OjQzo5CtS5f
         fDvQoKdhdoaMnO7EWYlWpoF0/i/FbMgIhlaqajDtT+3p8UD6SCewt95Z7zWKqtHlfktA
         tDgvKMRtuU1J0/yyYvyd20OcghjqjbkhdDVXGB2XvYDOk94UBj8eYGSyqTB3f5AC6k8C
         VCGg==
X-Gm-Message-State: AOJu0YyxheHl9TjOnXKB0s22RZLbA6cV/XmoVoOYcLRkQUB5bGXT/JlA
	rYlv3Fq7JPf74aaD7BFOBHgnxnBAlC3BalID+opjdINHNVpbSr1TGtA8GBEdRQM=
X-Google-Smtp-Source: AGHT+IGmNjqiQssDmVqEQJrhuHT0e3CeZ9A2cadaiJHRjoTBCTo2tjN4RQg4nlaDqEo6bs0Ze7fRJw==
X-Received: by 2002:a17:902:988b:b0:1f4:b18a:3f25 with SMTP id d9443c01a7336-1f6d0398abcmr92192565ad.60.1717998540444;
        Sun, 09 Jun 2024 22:49:00 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/24] Staging: rtl8192e: Rename variable HTOpMode
Date: Sun,  9 Jun 2024 22:44:29 -0700
Message-Id: <20240610054449.71316-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable HTOpMode to ht_op_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 360d1cc446d0..83082a990fbd 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -417,11 +417,11 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			break;
 		}
 		if (ht_info->current_ht_support && ht_info->enable_ht) {
-			u8 HTOpMode = ht_info->current_op_mode;
+			u8 ht_op_mode = ht_info->current_op_mode;
 
-			if ((ht_info->cur_bw_40mhz && (HTOpMode == 2 ||
-						      HTOpMode == 3)) ||
-			     (!ht_info->cur_bw_40mhz && HTOpMode == 3)) {
+			if ((ht_info->cur_bw_40mhz && (ht_op_mode == 2 ||
+						      ht_op_mode == 3)) ||
+			     (!ht_info->cur_bw_40mhz && ht_op_mode == 3)) {
 				tcb_desc->rts_rate = MGN_24M;
 				tcb_desc->bRTSEnable = true;
 				break;
-- 
2.30.2

