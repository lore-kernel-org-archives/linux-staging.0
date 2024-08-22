Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570B1CCEF1
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344257; cv=none; b=LoSrSV+4yDDu2uQ2DyZ4dsw91TbodxnYQ2KlMUXp7F14Wc0nW/DtaqCW4q06kWoDZfPI47yCxjMm3ULBzj5BztPxfAmjqSk8DBxx9lye6ZWrJFbzch2axTg2Nm/RTyMbXZNLP7Yfg82d7ndNZgVKKw7u1kkl+bnfmeJLSbn3KsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344257; c=relaxed/simple;
	bh=QEJC1cALUBumf2HHqM+GA6290lil4w8v+hebHvuw2Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ouD13fUwaE1OfXprWI5v5fqG+d+97jq55c7Y4hdkcZWMmGw0nB7y6hu6YQIGbSxHdEkQKywfjjutjDxYpBX1hRUGw1Z8EEKxg/53e+JfEa91GvCbJwIdLcIwmOehWg6HbyA/Y47JrKnAq/TGb/tI4Y/0SaK1javpJ+39buCgnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIgONpeI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIgONpeI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8684c31c60so129984466b.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724344254; x=1724949054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TsKvdf4ZDhQDrXDhRuDXeaPOzfYKZbxyCrGrQmwONKg=;
        b=OIgONpeIx8dnHSpF3rkBuXiwvF+L5nGWnqdKvnym6tc52nggxNTwdgbAnjiVziZpBu
         TAOBmjk7Ssywo4PE/EYIeLYms/71qrAsERBC6NV6kilVGIHgckHaL8LKg6v0loRIHCeP
         y71qSJUXSHbaNSI3WGtD3bffG6K74MI4nDvW+3TpS9TcVCz0HkZRVErR8XmHims4ZdU4
         EuTXd+65s0dOFJ6TEReGbXsHF3cs7n3O1OIaEAZKDo32e1ABTR9NNEX8Ei9/93EZSVXk
         hBXMF7UG+sLE60xFH7gCLCknVWD/s1HbIa2q8Io8Fac3KJuj2O+yIwfZz85E8qsbU+8+
         VCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344254; x=1724949054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsKvdf4ZDhQDrXDhRuDXeaPOzfYKZbxyCrGrQmwONKg=;
        b=HKIiVgm+D8hJdn+BZ5IoDTvQCJ9jzb4MrK/89zIgj6tBC91wkk81qdz0o0BZq8rKKX
         KPaXHWp76S7I3ufvJXJTnEEE9Yn8l0rB99TdYCrFNEMm7/qFI4kuJ5Nv07aIDpiFqRJn
         s0rZ8GflG61MikVDUL1JXIgXuoVAY/sHHilhMFJOM6ChzDsJtX4nN1Jj6pvFbRvJXWfL
         FxP4gKwLQ62xHpOdGSCpVE7ymFd7RhVr5vcO5q9uvv/BxVNr8SkOaxTa+x+n/K9h2E4U
         jqMrSfsOLEMvh+lcXANDvDNHfJp0I6y7nBJ00Dzqt6EQJ9XQ/BunOQktACbz/5KgCIYE
         AWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUHWtBg7I59Tn8Ud2QS2KmUH1PvKQxr9LrQ6iwOwiQDSMi4M1ugFh8HL3WveWhU1GjRWk2xUFdCJ3AO+/ts@lists.linux.dev
X-Gm-Message-State: AOJu0YzCtGK/BD9271lgIuvHdQFfkPR4gDfuqlr3OaIAh1oTW94/vIT7
	mNN2UbVm/290MfgUkKFi6HQxR9W0Uy8g9+WL/2tVIpQUicDtk+RN
X-Google-Smtp-Source: AGHT+IFMyjGwQ0XSfu2JIunz6P7wZCodLI1co4GLN1jnPM7W+XkkMMw1Tg2ij2Gp7LBe+6eTUZwuUg==
X-Received: by 2002:a17:907:1b1d:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a8691aec2e5mr239885566b.17.1724344253517;
        Thu, 22 Aug 2024 09:30:53 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436bb8sm140073966b.131.2024.08.22.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:30:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: make read-only array dot11_rate_table static const
Date: Thu, 22 Aug 2024 17:30:52 +0100
Message-Id: <20240822163052.636570-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array dot11_rate_table on the stack at
run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index b89e88d6a82d..0cc5142a90e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -55,7 +55,9 @@ static u8 WIFI_OFDMRATES[] = {
 
 int rtw_get_bit_value_from_ieee_value(u8 val)
 {
-	unsigned char dot11_rate_table[] = {2, 4, 11, 22, 12, 18, 24, 36, 48, 72, 96, 108, 0}; /*  last element must be zero!! */
+	static const unsigned char dot11_rate_table[] = {
+		2, 4, 11, 22, 12, 18, 24, 36, 48, 72, 96, 108, 0
+	}; /*  last element must be zero!! */
 	int i = 0;
 
 	while (dot11_rate_table[i] != 0) {
-- 
2.39.2

