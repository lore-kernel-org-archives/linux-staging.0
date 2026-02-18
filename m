Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F722367B5
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414455; cv=none; b=l7Hl0rHfJwxX0YeauG+d8ZZ62lYwKqBXEPWLa3uOBwXj4TKEB8WsTkBGSb+TSJmMT8x0J+p/8/R1uOO/CCzbXfNY3IggCE08I46nHkbh2sJeJ3b4uYyZB4/JzTGIFkYXs7G+fyRX1+ln80WekgwLWLlYXSPBBY985ceYJ+iTtg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414455; c=relaxed/simple;
	bh=0dQmWfSkLWHZIeZkZ8VHQJj65+/Mk70+JV9IFJ0C19Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6phSyqBnlAz8jBIREzOVxh4Y9amlyUTWKsjle+hbNnxbhh8vwuzMT2wurxy0ADoj7maC4e44QPyZCLL8ONXByleXb/0L71bqwnHoxC7ERk7bDyG22llR3YoEKbsVWMwENsm/5UsjYtZ6QMpaeQPoEoUiFMXHWYeSmpRrOvbg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+A5Cv4N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+A5Cv4N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso7502005e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 03:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771414452; x=1772019252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmXOd/VzQ8NigXE3XR25xPW4/QizwI2XVot4T/0meeY=;
        b=Q+A5Cv4NkNDQxbLOuoOUTU/2MekYpqz07KKVJBbpOGmRW63rcWrStvk5XKVIBeznxg
         BN4R+eME2oQakMfZkSg/zUo4paJMGeXOpA1S0VB9mJEuf4M9GZ+VARzbBhBxXm8UMhs9
         /0fdVcdUgmjcoBI8k5F9R+PkL7V3ihvuYVaQGrEPfIYYpEBeyKsuu7kV7cXq4P6GQyqc
         NIDuFpy5cVEdXCONfUspSRMXGfzeauca3AeCFb7pe5Qpr/1usv5OHLBUoHR6DhhHMexN
         sBvTd4lQu4DIY4T/GDi/EqXM//LDUEyrudul45wRpJnReTpg3xrOGdIaxxEZwRUx5X/B
         lc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414452; x=1772019252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmXOd/VzQ8NigXE3XR25xPW4/QizwI2XVot4T/0meeY=;
        b=F6I78THohQfdeHs/y+5FUIv722hJNAVDvQSxEhpre8MiV0AliShr5nRgm48qYieebc
         iLyOcnihnOAW//8/HFtVyZ/wYCmoSAT/Eubtfa6f3w31mJlu4OEWy+AfkwrIwMHUXk2R
         PvWxLwE7VQR2IhCDR5COb2EqlOnZjDmuhXHFecdiFGJuaTIj9r4eTCPs9MGlu5ohghhc
         5Vzl/fUNd5O4IDQeHd5EpA/zknF1emdWCKibEMqaBAd9Hd1/bqEuTE3CbQRsC4k/cHxE
         WpW1Z7udSoJI8Lfk+18xoruPyhUIYlK9M/hLIcCyzTcSoPaX1xxuVqssnMNG8u/dc6Yq
         eKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOP9HYGoteBdUyUn2377FUeVtI3jsNseNNr5DTF2UebjqJ0IZeAoFGL5gIf8t4iiPsMMI/EaWxJCNcTI5Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzR1tWKxp7zTVSZ0aJwA9DRXQkn1HTOo6gixeNI42m9RAyYVmwo
	0Vt8A5Wzp72Pn0P4/yYLqKVszIMvFK+5isxw96+IJWEQU1XPMBvQRaEL
X-Gm-Gg: AZuq6aLBcmy4QnbtChtXCralFHbKLcE7HQcoUe9XhQWcDbueY6LdoRRnpEkL60td8KF
	LmCqwN009IZLupVW3BKzuzaJBxTzeI/IlcQLbIsM6HQf+RCDnIsjWQ46xvUCCMP+zwkolVBxon+
	5Fc4B/kZI46oNN+xCNHecpawWAmHhJtKO2765WAJcUVJ2jtzXqPHYfGtSaQUSjNKvbiR52IEXa6
	koRNpknCaoU5nVFeG3yFBok/qgYjmM3UFJcWX/nyqlki//fHpGc4iTEbf2yZYTkspVPyG+gkk7w
	7CJhRogX0LsDZQyv0seeOyAxstQS6CAW7FYvsHM/TH5Qnkx20AOaOF6clNeBSNEb9RjzPsSL6mk
	p8tCt2FdhgjyvR33EYOVPvFPOmDoEb+9F4cbAy/bNpL51pTGs3LkNw1+djPqi1CR8161zNczs0X
	6P0yhiwBEJd2YHul0R8ZtqYZVyGbccuiSVTSyuB7tcKG/BetDBrXpdHlsxb+DB8UTvxM4B0Is7y
	2cAofquec3kQyQ1b/ZfRlhXMUmELGld5sCG0Lce6AYsecrdAlRs
X-Received: by 2002:a05:600c:4746:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483710519e6mr189377635e9.8.1771414451842;
        Wed, 18 Feb 2026 03:34:11 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5acaasm37265038f8f.6.2026.02.18.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:34:11 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused macros from rtl8192c_recv.h
Date: Wed, 18 Feb 2026 15:33:52 +0400
Message-ID: <20260218113351.405150-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RECV_BLK_SZ, RECV_BLK_CNT, and RECV_BLK_TH are defined but never
referenced anywhere in the tree. Remove them.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 9664758e21be..e2e9aa03ffdf 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -7,10 +7,6 @@
 #ifndef _RTL8192C_RECV_H_
 #define _RTL8192C_RECV_H_
 
-#define RECV_BLK_SZ 512
-#define RECV_BLK_CNT 16
-#define RECV_BLK_TH RECV_BLK_CNT
-
 #define MAX_RECVBUF_SZ (10240)
 
 struct phy_stat {
-- 
2.52.0

