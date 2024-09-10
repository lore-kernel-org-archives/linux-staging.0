Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045B1459EA
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941111; cv=none; b=pAQovCAL1ct9odP9RDEnz+uuHFkwvBAW2S3cxAHNhSh1hxphoFO6pM91SPeZ0jDf6fKu4dUL2dcbzhzNs/aKA73BFSyaO8R5611zVc6uqaddk8UgluS4ShL+vAuUXZtTrybm2lh79jhPIC5HvQqAi62V2z9z0dmikv4hKntYFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941111; c=relaxed/simple;
	bh=ZGtWmC6isHMopRoqC9d8yE1P6elCllzkgS1uslrz6Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jdoBAl73iIurP68lfdeT2s1EqoDfbWOdGEU1sh1Mfo4NnS2wx9s9EI72TdbS3q1ekHUgTJnhZx8oQn37tWQW8/BoSyDzPreSOetUBqbC+UOMdbOhaLlcf2X+bE82QI8kb2eyMScu8Vn7PD+M3wF2zsp85COCGw3hbnKBilgvSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKAIR/tj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKAIR/tj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-717839f9eb6so780909b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725941109; x=1726545909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSF+JNJPT0XCzK0Is0o/8qewAVtX7tARlqlY9lwV7uc=;
        b=nKAIR/tjR5O0i2Zp5vM3itY236TDeJ/B5hVV1oNSog8Cz3yc3piqA6WW3KVGVPHyZv
         YFl/oLMM06SWQGzJh47nCmlnU40Sn6kQOu01pGAXiuPV5llFSqu6M6VRqtMGpQY0MloY
         GwHDgTRtJ2znAUGnA4oAsJM5qM2Br59EwuJ7XwPZC6gx6wwXofrZbEa/QboBNilq2i/9
         arWoh9TI6y8yoyIJql686tUYbGY84Jj6sSrMFq4x3fqt792mxgN8yjtxL9qv8X3pMZFS
         yH1aUKG8ReQ5Ajn3RYt0AhEBEnbaEbXl9U4wjA6taXpWM7raZ+H1j8phN51isfFj5Nb7
         NCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941109; x=1726545909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSF+JNJPT0XCzK0Is0o/8qewAVtX7tARlqlY9lwV7uc=;
        b=o8fWcs5WgZT4n6KMljFGJ8pBb+mgPiIj/ZSXcr9j5NlrQAGdyTa33DTI6TNZHcR7p+
         VSbrGcYEktf3F1gEYqT6rQ92bPJUNvK+sfY296Zlo2yJpCh4uIT8HNIOMXIyMzuingkH
         HDb3KmXdYlR8cQor/wmJbmj/oSnVlAvRzBMEAi6fOfbC50/a8hNz0+fa/BLEGJwNYf8/
         VzaJVrjoHrcepmFI+Y56MP8M1JtR8rKtZe9uSIBo0SzNT4uUdA+TmflPsRt8jhF8dcU1
         62UDN1qe5mdcMPBik6WgxpJnYrUIbMIt1N4FkMtlLQeEHuwwAkH3e4bBx+EB5Hgqbtnp
         lQVg==
X-Forwarded-Encrypted: i=1; AJvYcCX4eE1aKH+NTNpob71zrWfR7glEQ+4bb6VYvZqdXvlgV3a0GQ28kmn7IlNFH7vNp324fHiehWHZ/y+qfG1s@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7vRWOtalruV2rhe6SrfmobqPTls8ikeCf4sDmPflBI9T1nRjp
	CGgA7xr7o+fTilNLf7mAaNygKtySQkEGHVeKVSoB/hrcwsdDaawaL5by9BkG
X-Google-Smtp-Source: AGHT+IGPsUCz9jDKrZQpfPAcaU5EzuOdjxIgcI7BKDP7vk3MEfa2dTR8ldd+pyfyJYYWP70tfksjBQ==
X-Received: by 2002:a05:6a21:3395:b0:1cf:5471:bbe1 with SMTP id adf61e73a8af0-1cf5471bdcamr564575637.8.1725941108872;
        Mon, 09 Sep 2024 21:05:08 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8259bccbcsm4779172a12.79.2024.09.09.21.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 21:05:08 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_mlme.h
Date: Tue, 10 Sep 2024 09:50:01 +0545
Message-Id: <8b9184ba4e489d7eec389389ae435fa4d9232113.1725933169.git.topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725933169.git.topofeverest8848@gmail.com>
References: <cover.1725933169.git.topofeverest8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v3: Created patch series with cover letter as suggested in the feedback
v2: 
 - Created patch series as suggested in the feedback
 - https://lore.kernel.org/all/20240909041530.2431-1-topofeverest8848@gmail.com/
v1: https://lore.kernel.org/all/20240906141134.10118-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e103c4a15d1a..e665479babc2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -131,7 +131,7 @@ struct mlme_priv {
 	u8 roam_rssi_diff_th; /* rssi difference threshold for active scan candidate selection */
 	u32 roam_scan_int_ms; /* scan interval for active roam */
 	u32 roam_scanr_exp_ms; /* scan result expire time in ms  for roam */
-	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to speicific target without other consideration */
+	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to specific target without other consideration */
 
 	u8 *nic_hdl;
 
-- 
2.34.1

