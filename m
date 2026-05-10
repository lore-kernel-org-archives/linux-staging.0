Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A228B7DB
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435560; cv=none; b=lMBbBrp1XehfKqSZgSdUn6gbRitLt2cLnsHYV9e44L0mmFxs8ZXHs5lT9+okhQqWyTYzJvl7GzhPUS1whXe9wC6dsd7lr8AGdHLDC6+9DChoojCXr+iTF0v/MRfvlv1KTz1poNJLapnugQjg+ZMVDWKTRizfGj+0PEiMhC1nkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435560; c=relaxed/simple;
	bh=+LhJIrA4hRufKiv8DxaaNALAxY2JSHlz3ijwFd8J+mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eg0NAW2OtoX1715Ni6cRlqeY0LOYnix3JbZHyWS3zY83/G46wuWwxPLfQTOW9jwCuQ5ySiHtYqsRCjuANfXStmIi10YbpIUiKdhy3TkNldfw5QHoAZ/6Kqn5a3/Xtrnyg71Z1+Y8EUOFNwsJtAKgagnnd4Zp6gpiIw9p7hmxTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy3bY7VU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy3bY7VU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba4a1a0325so25503545ad.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435559; x=1779040359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b40riQCZukuig9ESrRD8GI8hwafGxJB9UjgfgtKgtwg=;
        b=cy3bY7VUc5S0cUf1lhu4MylsZUUjzdzAFU53e01oAGjDLUJZvAsD3nRrIBsg5tLNly
         8rq73zeMrn0Ax6uCyqw6iiiGBZe8VcCyRDInHTy/y9Di50k83dtB3qsw9pXiKQnHuXrc
         7sCQJiCt9h0DziVNKteAE4NXC0vh7QGSR0ixKqrtFNsL3PTqkX2HXvY8bMGlepv1gbah
         VTSMVNxq3ThghVWwx9drKnc3CKiC+VMRyP07gKozi2d4otbH7J2qgQ8Dgd4sY0WFf16C
         BHIw2PKZU6gB31tiHaMlLNNX859etHc1fKeSQRu6WyemUI3S3ZAteslOqJFJ+2BVlWCe
         GZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435559; x=1779040359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b40riQCZukuig9ESrRD8GI8hwafGxJB9UjgfgtKgtwg=;
        b=mRJLJw+C62vEpD2wY5rfi+OEp1dD2xzeYK3EsZqEFIBU3O4EAbAxjO/U0yjlIXAIVP
         BO/qOH5scqXoPk64mOB6ZLX+sGZn9wfoINaMKmN1dpaxE5bZjcqYP0g18pG6BRnjg494
         jpnS3JRfaACn7cLbh84IwOr4+1vZtaim4+gvWiSeWZWzbId88UKmnbRUKDz0MlvOl7KD
         mVKJ7tnWN2eaWD2I1yQkhfU/S8bYo2nO1m8N13xDbw3MPgl19spY4lDsj5EoAJRsF6ss
         7hRGzH/OSwFvedpN+Vqw3RfBR22DLw85cgCXIlFUAPvWOVSTvWFyFKpd0Pxtjj9KPIwj
         dD8w==
X-Gm-Message-State: AOJu0Yz+qVHLGhzhiNr71eUJ84tTJOYslwui/njq48rJMQXDEzVynORD
	0quNaus7j07eW1nZtmt2rapcohq+oMmkuemmaBCs1y8FU4I7SHVh+8bK
X-Gm-Gg: Acq92OER7KjgOX+xnw891oAKN5auZKdmegRMne8OYtca7VxHWWxd1ksV//sttLraImg
	0BbP1GMcSzFhg9dkowwDcCTcmEvvxPEMlQSGe5fuDoWzLuBwJxrfke5xkPBZ9SHSd5NWtBo9kC1
	TpJ2oCB3Kl4g5RGXT1jUqmRwx1CqwNk0dGtdNMUGuxPEKmaDE2fFle+gTsc5dEUzbYYYmKe34Tq
	lCu9DGxGVSsPCDySlAoTuHFqGfc0XfgvP1Rhvm0a1bpSCfk9e8JYrgtCrZbRD0+vYR7MGmOPRxg
	DEfWvvRrcT1URK4Fa5O71K+0xIKy+h8xhrPwUy4a0HLGQt82fABGLauKbmkkTrxVD1MrdJ23pAa
	1TSxa5CsudEwKW/EDSkbsrzXPU2mn9BDECsZOo3rLc3C4bUZ0XBCSSMzuv7ci/HTr+WJye1+Kz9
	Kjv68WoEWQfraYlcLYY4ryESzX4tLQlehchftcNDm8I3JSjms2lvs=
X-Received: by 2002:a17:903:38c3:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2bc7ac58e95mr66134395ad.36.1778435558922;
        Sun, 10 May 2026 10:52:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm83169715ad.47.2026.05.10.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:52:38 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: Fix comparison style in IS_CCK_RATE and IS_OFDM_RATE macros
Date: Sun, 10 May 2026 13:52:05 -0400
Message-ID: <20260510175207.563378-3-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175207.563378-1-pramod.nexgen@gmail.com>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the variable on the left side of comparisons, wrap macro
arguments in parentheses to avoid precedence issues, and wrap the
long macro definitions with a line continuation.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 7a3609d019aa..11825ace95a9 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -394,8 +394,10 @@ enum {
 };
 
 #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
+#define IS_CCK_RATE(_rate)				\
+	((_rate) == MGN_1M || (_rate) == MGN_2M || (_rate) == MGN_5_5M || (_rate) == MGN_11M)
+#define IS_OFDM_RATE(_rate)				\
+	((_rate) >= MGN_6M && (_rate) <= MGN_54M && (_rate) != MGN_11M)
 
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
-- 
2.52.0

