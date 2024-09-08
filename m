Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B301509BF
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790292; cv=none; b=QXel/at24pE9hDNivQnntdf48Ktsp6yyzv64oDoFpBx9obp5mVZntsUopMxd/gxERI8/oRrSLEpiHJwZdXuyY0ss6M9BQMhK+ZuvV75d/8BCfD/5gT7RLY9oIMDb0Mz9kST3qAKAJrbrUc9ZjxUN+z1RNNSQ1syLyFG/Izlah2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790292; c=relaxed/simple;
	bh=BboeagGjKvfTaMpatd3Q9UtiYxSVOaorAWSf4hQUXUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rdzcKIYI/ywn9fspuxWh9ew1MBCw1fhAY2XZxZx8BMBqhJ8FGseo9JlijCQnHnn3pnNi+4s/jzJiGBLhv02Bc5u6wUuIQv2/l5k1Lzs+MnFoMri951ZqoRrpNrbdzr6jwVRTEJm8kf4EN4MYg9YUgf1lVXPqTjRM3VLuBgQgVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUe3xPdk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUe3xPdk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso2350711a91.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790291; x=1726395091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pz0T81DyM+ABMiQOyhUaG4cYHqvUmHaS8GbpCvlsf4=;
        b=TUe3xPdkbyt8qI4CXu/DawDAyZzJAR4OFSjkAyN3HF2XaNqFvGQl2mHyHXpf8sFLGx
         qvhhXPFP2Gobq35hDHuo7gSVoVkEpEBh7y0HJsIgxdwRS7J2sbm5+feaBsqd3ls5mZKp
         QcVNfPBt8Kk3bC0aSBUc2xTgEy6LaD3shEYTBTEEC14gF6K2ptQaHSVP74EhN7F3w6Yn
         CqLCLH8jeinR/Tljzy0m5r2RSi26IAUADj/hbjpRcu3hXoFIckVmacRPWszXDAvlk7S1
         bGPdC7aGilUd6deGZ704zwe+vzUNp6N7aOnWwuqKiVuZHjSieGBwYyj20w7y5AkucjhP
         /61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790291; x=1726395091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pz0T81DyM+ABMiQOyhUaG4cYHqvUmHaS8GbpCvlsf4=;
        b=GwHabBzI3Azl94GR80Qv+ihVj9yDNLffTlCN+sLbExk2Fwz4WN4RFLjj6SACoSPehA
         DH9v6WGi+dc+K+c4dfuXei4GFu6nB8rlzKnecCA1NUTyIUGIcEjm3MiunUWgEYEWjnWc
         /6GNYhaYqjKR+p2Rjs7cqgrsZneeklA0u02a5QQ5RTZ9l5vfd/1Bwz8Gk7fn7OAOaWdn
         9p1hy3cnZwgF5DzivWwHx3pBafmWvA9AUQibceGaMKI4SWRJRaQ2k40lKeAXai+GBaxy
         6j7LikUEYedFIzhu0jIJJMwnOdc1eXSJEdJ3wP798xZjW7VG/bF29nNwKPrqc25vF/Wt
         /Ygg==
X-Gm-Message-State: AOJu0YxVxwf6qzFONZnsgBn9kZ+4lRlUEgZ/jUDznE3ju2gO2vUNv06X
	qcAFFWddxeuho4hVINXz7HVOB7ZcWOIA+tgKvrfIXJK8Yi9Z+cuYNDe7HF5ryfY=
X-Google-Smtp-Source: AGHT+IHRjf5GcLOnN3CwmtT15cylTOwvR3MWVaG9aLxHdFF9oWFgzIhjEotLGg1C/PcPcdVbvFYyzQ==
X-Received: by 2002:a17:90b:3b87:b0:2d8:9dd2:b8a1 with SMTP id 98e67ed59e1d1-2daffa3a9dfmr5177223a91.9.1725790290898;
        Sun, 08 Sep 2024 03:11:30 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:30 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 4/6] staging: rtl8723bs: fix comment with a trailing */ on a separate line
Date: Sun,  8 Sep 2024 15:41:08 +0530
Message-Id: <20240908101110.1028931-5-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the trailing "*/" on a comment block.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 drivers/staging/rtl8723bs/include/rtw_security.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 4efa2d258ebf..1e5e7f52f8da 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -240,7 +240,8 @@ struct mic_data {
 /* ===== start - public domain SHA256 implementation ===== */
 
 /* This is based on SHA256 implementation in LibTomCrypt that was released into
- * public domain by Tom St Denis. */
+ * public domain by Tom St Denis.
+ */
 
 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac);
 void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key);
-- 
2.39.2

