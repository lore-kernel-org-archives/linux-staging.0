Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AC1E1DE5
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 02:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769999592; cv=none; b=rq16osL8Wl3wNNhBErLQE5P+hC62jfoP96pyBrl7DhMmrrosHJw08/mVwHWEPmTagTDiKUuQ32rSiLvm8Bso7ymJc0a+HjRJPmHH8G7WhO6YC+Q1/QrRUP6HKRZi3Ued77r7mevHFIqp88JNc7IJHgMfmcqZZJJApJ1duI1mhvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769999592; c=relaxed/simple;
	bh=SNs76Ynvdngqzwaa0kRkOvxuI1a48yY5O+elvS10IQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyZ986ZdsU8sFQmzVO/mEDx4AF1diVe0DiKpYGbzNwSQOwwXij5qNUdmtH10kxDj0yOkQZacQnjsuXqbwpHnOm6aU5mYbpN3T8aF/G7khFg51DKHcOBIlaoLHXVMK8Pws8hHmRmryVy2Q5Xk1PVdhG0L/SGgaTxohtDFmefQiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1vx1FiY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1vx1FiY"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8230d228372so1996484b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 18:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769999590; x=1770604390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mP6Nulix8NKuK5cDhAk8p60ccGqEHCnwELx4DpyID/k=;
        b=M1vx1FiYvKaBFif6GmnAay6E0a/BPird1917YuqRUM8NKokYYX305UoK+RaeM7oDsh
         gPFTS0kVvQaxUkVviH1utxxKn7ba5aTLNRHGVgay5KkFHr6zz4rkKQcfEsdRAiELcmeO
         v0tnDzsH4NWx2cwwalBo3ywvshVCg4LTW7qg/0y6XDssf8f3WqHJ74/BxW+TOBC1h75U
         FuH2N29YlLBE9NWc+4iOCtLEGHfdlbuhSMO61j5njROoWxcaQ50tb6XonGkHKi4n3E1t
         Mr2r6ecx7kBwWb+XDXG2GPXyp2iH4kqCJdq79kALNFv1VrTRCD2aqn0IF3PbrjHUWvXL
         k54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769999590; x=1770604390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP6Nulix8NKuK5cDhAk8p60ccGqEHCnwELx4DpyID/k=;
        b=kQcfb/TskQf0T//Q7UmzD+xf8fvsHalJ6TfaqiVxWNsvQgN+M0X7pBEHRJqx1EcFFO
         2RuNTaAKTZaUUrWTs37licgVEZilQiPMfZQMt6I4jJ7G1p7WX0bnsndUoY9SdLP6n2JX
         uyrZbSqnHwtD/HD1zS+R+jy9/fEmSK3F9J2huSzIyGmp/022K82fs73QI+lUbgrTuYIT
         gljh1AXjjTWEAgf5wDCRY+RmS6bfHZWPQVrmZ0ItQzJs40+ofhSnJ0ltE359jA3gMVPG
         WXM2wlVDUm1ipfZtynDBG1oEMA16Ezr2DJ29DCf7OTgR5b0JpFG+3Baus38Z1DpmZocd
         Lc5g==
X-Forwarded-Encrypted: i=1; AJvYcCXPJLo65a818zRjAGdwy4uOiF9cNfW25/BArVKqGLYZ7a5//cVa0rwGsJK3JEfpiuiaGpQAkYY+2A0fZ1hf@lists.linux.dev
X-Gm-Message-State: AOJu0YyiTx/13qrg9Qj8F/yJlSWBMpRAeWN6G/G1QFbDSUfBXdXWPfrV
	/skWd7rW0c4q6BB1EceuF2CQbaj3o12T+EuZs34iNL2kruHVF7zRipZe
X-Gm-Gg: AZuq6aK1vrF/57dsSDHKBYRJsVbK/7QbHSN7rOp0jw1/d310CgqvfFsuZbrGKjKCYHi
	hBKbzFUt6puZiYBoEaJPWWs2nmpOnc4WXvmkOeJYkn1jrdh+boEGb5c+YonAsy5heJqwsFh6Gg9
	xn352f2SGl6z4zr16yiLP0F/ceCLHqncaZYN0AiPLb5speeZYN/MT7Y4FCPrrWz9/xsgz6CnJGq
	OoGf45EbAFTKd0IIqg92cl3FmrB8odyDmobnX1wjDP4cQ5e3l7JyWl01gVwi6tJ9vytPOEqXzQ9
	XhzXKQY9aKuR3Fwr+g/E3A//7fgZYr/ON7XeToFCpmYkitTURtj++eWS21xcTPVrr1jKuZg0H1y
	vpZ1dfBezJiA8Y/9hCq6vWTx8+uKsOzpS77Y0553SqUg9JNqHZbIrB+nUCyMr47CqQAjzO9Y+RU
	3BsV33krH7iHu7M/wmJpErxaFiQkmZnzJK6v1jHqI5VfiPSkmXyPGT8Lsb8DI+LKhc
X-Received: by 2002:a05:6a21:398a:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-392e010991fmr10891346637.49.1769999590510;
        Sun, 01 Feb 2026 18:33:10 -0800 (PST)
Received: from localhost.localdomain ([192.9.168.136])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22459sm13605605b3a.48.2026.02.01.18.33.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Feb 2026 18:33:09 -0800 (PST)
From: James <supernitsuasnowpee@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	James <supernitsuasnowpee@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Mon,  2 Feb 2026 13:32:53 +1100
Message-ID: <20260202023253.67552-1-supernitsuasnowpee@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing const qualifier to g_fbmode array to resolve a
checkpatch warning. No functional change intended.

Signed-off-by: James <supernitsuasnowpee@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e615..15b5de33b8d9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.52.0

