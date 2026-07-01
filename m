Received: from mail-wm2-f1.google.com (mail-wm2-f1.google.com [74.125.225.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CF389DE8
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 04:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879279; cv=none; b=dD9p1jPjBLpAejqceRkvT+wkJwGRbp6S5VFS8BVd0HN+BO3zfQ6bGgxUsiGedkwnIM/aIUoqoiqPMxE4z4QWOG+FtXfIUFTJFXN1DirKT4JjgRDEG3RgVI4Rinwf2JuFLOjFER/Pvv+rD78sKyi27KWQZDGM/Eq4X0zDUT+ELPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879279; c=relaxed/simple;
	bh=YSVKBzTb+iUCKjPUjh8DK38+fCXuHmVewWGjSAu3VS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qPrylQnWr9mQE0YWfOcoz6NZY86PwarvEL6UuaFqLRPlDux9SC+QnHUNp82EaODXxgeZB0YrXEeaLZccpmkc7M/TM5n8dfhtUZi83mQ7B/colz4ZBDD44Boz0FX/H1H/vK4J6twKgPf1YV4O14LAXTufsYPdFyvGOJYxM2IoaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkqRK9RJ; arc=none smtp.client-ip=74.125.225.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkqRK9RJ"
Received: by mail-wm2-f1.google.com with SMTP id 5b1f17b1804b1-493b8cfbb88so45645e9.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 21:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782879272; x=1783484072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aapNbHrrlYAD8WOsLANovB99qp/McmspZSu0jeb+fU=;
        b=SkqRK9RJylG+H/8Dnr33+xc69osGLlL+c4y0x/UJLiTfUXL0lw8vM3CUguY9MRZmRa
         AKMYA1XntfHvvSBB5ga7f+A4i481V6Nhf9zUCp0gReUsOAJC1iPP4JdHejIN1qV9nr+H
         gt6so9bIIWXJHz14sxnWUdXZ9EISQA68AE2x9KPdrXEjpmLuT3pPEetnncp4mffw2abe
         AeE1tomF7UuPKro/V8waXTjCDAogvRxy+lPvUOZgolissty+Ri4kmXSTJdDmVXcShXP/
         S4ss/EyPn1g/xS1LqVPg1Pm3Jb0kEM/1doMX7SFxzqERaJB3/qF12CkeUNE0023gDqxs
         1Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879272; x=1783484072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aapNbHrrlYAD8WOsLANovB99qp/McmspZSu0jeb+fU=;
        b=YZcU/p8KmOWXfWsyBDwkdbTFdgfPj6K6ok/0GROuQ4Oc2W/XtKDbEy60lQTRI7PTTN
         mRIC9hJaUGYa+y21nHugHgS5JDS6N4XVD6/e32Oha7QYlHooqs0ciWZMTx1F31IZlhJk
         kHWA2UeGgGApjfBrQh3waLJLtrehEwifhSquBdHqt8Q3a1FmfmWAsz8Vw1ypZKpdToJ8
         NELI2Kr49RVbnF815xNLmJYBAuEeJTAmWt7LyQwIkLIguMLyVoawz7DquRkpn0sr1y+i
         iwhCrrNHbJcVpHvTajDoE3t+94muvYlHwu6wt09HdkaFkv6YvzuVdhzDWXyITpjK4xka
         IeSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iJZT36aYr8drI0AuUeOOP6zbR24MfsT+3E+ZZbUIl2j8YyJj11i6MNs5wjoU5XNwC+OsG12XEiR98cK6S@lists.linux.dev
X-Gm-Message-State: AOJu0YzIMPZmEPuLSkpdNeNxPc9zsw0OXcKp7B7ATKkRmVnzN50M0EnF
	VKenmKzHtKu5TmFrEsS1DM3sutnQjQhFttz4ivu/vxVU2K0zryz//4aLWp0YmWS3eBU=
X-Gm-Gg: AfdE7clpRxyIhKj9ebxkn4Dq20NRZ+lald8aLCPihLosKgiVVM7JQCNEMltjog1Uy7F
	o5GWHY/GYQpKXNTpucGmx+KaZZzfeOHJAC6ZMf5yDfuq3dd49tyH+le9uU4ze/ngZ9Gw6e0g0C4
	hy+0HgFeCi7yHZYpi3KiChPKMCq6iK1aDxgWCi2u4SKBvP4zswFsofQ8HWtAoC1+2aMxRtgpCv4
	ycVw5qnAoRD2gDXYPlohSlAgCJaqW8K7rhgrurV8aHo74eCg6X1hAa3KcuVZNC0ZXpdYAoRAcUV
	gjVxKU8JqfjXhkoIuxvG6p9MWXfwPOpkC0a5HFhbiXc4aRAh4cuUnl63/sLZSGKJduCVbiHbPSD
	22PmKD9FJRDIHYGDviiUKXj9/CCWL9M2tHw5rS3ySg8iBdddqKe94S7Bb2FHd3ZWJIW1aCo6oYw
	d5JUjBIvaUzsVhoYMG5ss=
X-Received: by 2002:a05:600c:6098:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-493c234d6b2mr779825e9.10.1782879271700;
        Tue, 30 Jun 2026 21:14:31 -0700 (PDT)
Received: from myhost.localdomain ([89.253.29.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81fca5sm49402335e9.14.2026.06.30.21.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:14:31 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Wed,  1 Jul 2026 09:14:23 +0500
Message-ID: <20260701041423.7881-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The g_fbmode array of pointers to constant strings is never modified.
Mark it as const to move it to the read-only data section (.rodata)
and comply with the Linux kernel coding style.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e08..8f533f3b1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.54.0

