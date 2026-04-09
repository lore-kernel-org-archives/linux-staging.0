Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C213AB294
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742689; cv=none; b=oJyc0o1OWtvUB7O5EVrLBZdlTHC5tOhjYU6TdeYE07HB7aap9x1HZovXQjapg3GD+xE0+VT2DIAX73Xib9e6ayYU7v7g0jZ5/xY71dwt4d0zjuZBrldOIkUzyZW37inpxnPtDakpe9FZb5O83kG73BvQ1kh/L7vOkM6YamxzY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742689; c=relaxed/simple;
	bh=cgZY4JYcYNuxKFJSK6ipW5wyPi1mPE0bqbjnMORWqN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKsaaVW8ITdmHBw7oxsAkvXvSO3erUAazqakdUdAAB91v+c/ghVOpmpOxVhCU6iqwiMvEZHtu8t/GFPY31qqcvBx5YJGmd8sSREWDuU2zU3ZD6UuzMIePyTxlbPWH9U/75wjniYn+G4jcF2K0kR5OWA0zdxiMWbAyRTAC5BgH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEYXdOFz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEYXdOFz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2494440f3so3528995ad.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742687; x=1776347487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=HEYXdOFzFCA48JGrxgY6EZzUCeJlOaP+PHoTE0/Ny0yNM9YZkqSvSZvFhYwKFBG8Hh
         qCwsFBnEx1LmGK6KBuuAazF9zMSKGarC5Pg2E4NV00X5kmlF0XFSuJs6Qb2gaSwWJ/+/
         BnjQfs3xQhb+WE5rKV6UE73b+Szu/j9RD9Qu1A25xPFPR04pGcODF4D41pC3E1N65KKb
         vRXO7Z+uLJy+1vcsjKt2rZSv3minaftCfM35RTJoRoJXB6uv5zksEuYKgLzcTtHxI3oO
         I7sWLt2vjaQ3VAQKrLhIbkcyqki0A5pMHRBZAhKcSGMo761UZ8apIZqxby3K+k0rVc06
         1PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742687; x=1776347487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=N8gl+/pjpD3/eWVn3JD8f+WzLepJE7fTbPB5/zpou4vEMNgiUGZkcgvIxEhANZSkLo
         z+lpGauqJYNPGRq/hdEgfdZVZbRZTVfPlAY6SbnZJZprcaBhvdZ7q+ov42wImoqgO/u9
         AsqDp8jqWuUA9wX434WHG7HB5Icmp7XQ7Lb0vyc5+eGH8Uo9a0t7pZhpCvjOso2S7aOR
         Y5HZ66rGrZi+7UPEW30yVbz9YOMw04YlQZpwLj/3TjmLWD/pN14CXJIIMZn4YWx9ybTk
         QJynvP+Xu7GV74spYK0HIzt5efTIiPvsv0voP8BsV//p1YS3ZzY3V2QDX734YgSBYQnY
         abqA==
X-Gm-Message-State: AOJu0Yw+zEBFx5j+iVeV14cgrM2H0VC1hd0oMVL+tkAk0m4Pgr8HGFx5
	Mv19oHG2kbRxVxn+BB17DBJJXPaUwDYaKNQdUl33mUUxYNqdjIfEpfbM
X-Gm-Gg: AeBDiesELneKvn+qBUOWC00l2yFS6KoCXTO1qLoKsGi78K4BlB0lNJycFjtMrw5BgtQ
	Bo2pZyGOF5wQYMCYAUW0WT1RS+BRqaydYlaZ2Qj5Aq5jbTCDmjZjQM/ohHKC8w1ypUokfDNqTEw
	m+uVvW+SfNbU/uui6O1dN0wMTi1FTybjcJM59r1e0Ccnr6AhmzGTqqFq36aAbB3raccFt87ON27
	snE76j4kRaLWFp3GwL69N29u5VhPMRQ0326MW2sMaSwnmuDaFRV/EPyvmyL5jIISWoGe7zNLe4v
	tAj4Y+C6Z335gfWyZVazU9dinw06AZJI02J0Lx9wcrMiX6xLWO/HeQQ4+t2IjP9XutLfrMUYHOW
	+8fomKrXGllyt1H5iqfZ6TbyToXqFOAvtd/mVhGA4hrFTKiLrqyYIGMHuheYzPZ+GFiqzB4S3HS
	DjUTd/DIT3kMVDb8ooAGL37M4uPKGjyAL4TgMsgg0g9n37uReCckE=
X-Received: by 2002:a17:903:2ed0:b0:2b2:5091:1c26 with SMTP id d9443c01a7336-2b2816d8626mr286574105ad.22.1775742686802;
        Thu, 09 Apr 2026 06:51:26 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:26 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 3/5] staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
Date: Thu,  9 Apr 2026 19:20:24 +0530
Message-Id: <20260409135026.137904-4-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the simple if-else statement which checked value of
GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
IsFrameTypeCtrl() returned true else false, with a single return
statement returning true only if GetFrameType(pframe) == WIFI_CTRL_TYPE
otherwise returns false.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..2876f15f13d1 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
-		return true;
-	else
-		return false;
+	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
 }
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
-- 
2.34.1

