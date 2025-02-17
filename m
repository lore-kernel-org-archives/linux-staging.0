Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE24216E32
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786772; cv=none; b=Ywb18XKfgCrPj1ZBK7a6w0jZQSI9Xt6t7XK0cXwYH5Eb6w7lyo35y9qTrgPbWp9NdG62chRQIjhZLUdQIgWbQbeo3Q8A3IhjhI7w6HLtcZkaiAJMVUCZ5nIenpb8ShEGNdJR94zKR2Xnzs3cFXqGmaux2L21xXm3GKP9W5SwpI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786772; c=relaxed/simple;
	bh=eIbUoOIO/oPlM/ArywSv2GC++LTTbctguFEEFD+IOC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UV7uGciJll2Eaplt/K5/zUegUE0EBUyJBSPEFUgkuluZs1lKVuSvJCvradRR+MaSEcg2tZMVwiXtVFUMyWRHheRjpQLIO52jTXGBtnhuXVhrSbpIQYaRh8t9MI+mGj10HPSd8iaCbJH3bSt5pkZbb1/Prjfz/fmv5wpnCanUd+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2ZN98GB; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2ZN98GB"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22101839807so43572445ad.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786771; x=1740391571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMj86FWLmYH9fJq/mESep7lKDCa0pYdVlxGvc/mylb8=;
        b=W2ZN98GBTPqNidDHZKHDXUZHko3uUZxw0T9L+QQYdGHLNJovKPZk/nZ2IMK0Qcekqh
         CPrlVPrxU7C2yC0dScZ92B0WJuzskl/eVpy1syvvdRyhls3ndsZo5k54QgWZfaow5ZPB
         yoN/hWRCJxWz+IdJv3HqQ5FP8+xs4jyQJTOUG/ovo4p9toeQB7jrClv3x0iCnGPiALus
         JK8SaYL2xRMfYXpeIfoEnhSf+M5iSwnWBVjTPXN2L7gZnispGQ/3iu/dp7ZH9++pGQFT
         HibxmD/pJwExB4D9drnC3lwVVWnnJArTEgLmKOgi0zDV1/penz0nlSBhFcJYR/luQhve
         YEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786771; x=1740391571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMj86FWLmYH9fJq/mESep7lKDCa0pYdVlxGvc/mylb8=;
        b=V3LBnID+I+0aBAFuXmmtHZOZXdw2lToM3av7B3kJ09FEo+2P3Fj9nQL+y8IMXr0g3g
         cV+bSGgGMsT94NCPltYY5v81ScrvJYiHltSh8nqGDyKR4Lgq3Acw5Ij/AOb41TEmqmF+
         xT54rSK9rqrbGl9vNiwvCgwa6fjayiO7xqwUo8RfC1TXRRVUlu1IhAOqESIXCHKWWxA8
         G2i5SkaZclrhNj7ez3DdFs0+GqhFK/SWbapi1TAWdxaBbrBDoPlXbRnc/UnLLUUg/iMU
         HEBsQAowgW8TpmeN59fOpiS18wxYI4Ue2wMXz6UuthrIcS5UGNStYjxI28ZOTov2P2CE
         /aJw==
X-Forwarded-Encrypted: i=1; AJvYcCXdoml0fvqDytGVA5FjtXpc71RFqZykq3+2wH0hhbFFUtw3tBX/SeC572oq3LEWwqn7QRWdv5z+79grdX2S@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ0gvbcMXLv6bK3by1BzfTZvXjnOLiWa7/+pZDqahv7F3xFEV3
	1VIYZKAo6hrOubx3dAVStLAEQcvsz8DVuI8Njhm9dF00sKoPL8v3
X-Gm-Gg: ASbGncvVe98ZQe/Kq+Ud60zpkSivrqayleLV4lwMBG0O/uXf0yBCGx8J7degh3wcqQt
	9+cpgmpjKDw37UYeB0mPJw8F8WYvBpfSUSewwYtkSJLg5ZNerylPceJsJC2J8kuX9x6J42RR55c
	kHgrmTRfmqogOXf21CaZwKzR0OBM9BkgbsAcx0FrfuKl3mLI2w8lAwAMwwJyF4/hVduFdhq+AUz
	pcP32fYuPPeeoM7kYtLtIKgWuIO6z5J5nTucjF2AFne9sK3B7Kv/d1Y5GH8yXhsF4rIeaLZJP7N
	9IUwy4g6Q4RP8by+2gs1
X-Google-Smtp-Source: AGHT+IF+ylNk9uCKSZLwrSfkw6u4sUmwGOb28XeEZo9e3pF6VjDegZ0FEdoAi+rGVSX7y7WSjOcrIw==
X-Received: by 2002:a05:6a21:33a9:b0:1ee:7c01:d16 with SMTP id adf61e73a8af0-1ee8cbbccf0mr18603271637.30.1739786770578;
        Mon, 17 Feb 2025 02:06:10 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-add286bc8e8sm4768102a12.39.2025.02.17.02.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:06:10 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 4/4] [PATCH V2 4/4] staging:gpib:agilent_82350b: Fix Indent issue with block
Date: Mon, 17 Feb 2025 15:35:15 +0530
Message-ID: <20250217100526.49495-5-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739783909.git.kumarkairiravi@gmail.com>
References: <cover.1739783909.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

There was a empty line, which was causing the checkpatch script to think
it's a single line statment, after removing the empty line it's no
longer asking to check that line.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index b6871eb3c8..1d644d000a 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -228,7 +228,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 
 	if (send_eoi) {
-
 		retval = agilent_82350b_write(board, buffer + fifotransferlength, 1, send_eoi,
 					      &num_bytes);
 		*bytes_written += num_bytes;
-- 
2.48.1

