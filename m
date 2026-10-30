Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357302;
	b=ZFsae62PjMaCbQqxssbFuxJSXW4IRSeOV62rj8iBZ8SG+t2AQOY9mZhxIzlIl/i3HgPD
	 Yl3BchXyEypALDPdFL/onOltJCTDUXi2/wpmsphkwh7GzmglHOoh/uKrDH+x8TfyPBoVt
	 TNoa66Tdf2pBH1eoDEVCA8bS60HrAN2ouvmr2/yXGXFqkLRtoiVt2yf6USqPH9OEylGQo
	 8w+jk6cmj9BXv0GBpCX+MMMgPu/y2xpJQwg2otb+SuddDzCPUdE7BKwl2F/gwNL95+T6N
	 fQu6YSjSNgkseR1oguxhYNniSinrkll0z3YHndaCtAECQyivKY/58Q+z9Be6plN+lxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
	b=FQ3UCByViRCDUJkdXM5ZiFj8i1e2Oqi46CYPllQAVPwesEMy7ZhiaiMaTVQqO1sW5Z+/
	 MNmFRTN9YrG0+bLdbSuluKS3G6I+RnWChwQU4p588z5wobmqun2oZNsyTkKBB6Ev4Ye49
	 9GxLBlHFyEMIebW1XMx8WmN02o4Tco3rx1zMbOpwuHoYyojJkglmMJgtUbR3im13+Jcw0
	 +vH+XjIu+hdySuQAlq8YB77kpQi8NJkQncRTZD7uojuFR/9B2G2J0V92LEf5Yy1Pkbmvx
	 jUY6pbsQyz2thUu/jR5BFFjb5GBz7uS9Z3guxxFWOOkgOp8i21QJpE1ZFKRTHcafNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4SjggOA;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78390606A31A
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 10:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78390606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4SjggOA
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so465868f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357300; x=1793962100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
        b=R4SjggOANiJQDpgPESlC0/LBtgVbQ23Nv1JbdAwFrSvEdT/Ts+zdIQrVWq5NGbrVZU
         QkDDW0g/1879hDG6hr2skczcrfUx8mvmhfwoCnRY9cpHmL/onez4cE1KvCAHGd1zqKaW
         puO0hr+BmdGAJJJF1VZEHgtOW+nnU84Lxx8FABEnVcWSmT31Iu/8x0rH1bDFC2+E+H1K
         6yZeADEC37efdR1q7w7joNOOSDq1HjA+DMbbOVQvVL3h5hbb3rXhN3Kg8uAsXzyyz9zQ
         u4hJ7no2SS8999hezuSpS22V0NTv8mNIJYI72T+0MwBrFSGHbdMi+2+/6Iz8SN/Bz9Ew
         x66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357300; x=1793962100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
        b=o/TiN6j/I6kz25dMDBn+CcMi75XJju4YNMd2H7sUgdwWFU0Nf2VemMFzvqIjvRAJAc
         VSNwZF6bt4SEjbBGLIHek3EIPI1QAr8Y/+jOMxp1xg6rI16BaZGi6UF2CvZYHZ7o2Ea6
         BhJtW6FST7MthIul77s//edzkpoUlo+yOJrIKTQDHX1MmU1XY03/6k7TlNpzHWXGzWsL
         uCabH0cQ2P1nHEwPVMhvmFQ7wd5KbjMVwqaCQZzGqe50AyDIfoY7jh5X6YT8LeeQoJN7
         1JL5wdYhPbyeS4IO56NX0rDQ63qyKuPGoDymbzHZuE+PaZrcmns9d8Ij6+zcoWkR9Wz6
         Tx9g==
X-Forwarded-Encrypted: i=1; AKwUvBzidQQftkm16Z+NvXZyJ33DN9FnQt6pXqE8EuFjg9L2FflYbQi6G56h61IEog6We+Einpw31yY4YgXQAB1h@lists.linux.dev
X-Gm-Message-State: AFq9FYKGHKGmEiLu6hxzCWBftqoHOpttArL9Z6xCeLssI+xe9/Ou2pCA
	JMmdxofAE2GBFSdfrHoqJ0Vor314Hs0aREZWpJmL1/ZPSX2afQ2nZLKv
X-Gm-Gg: AYBFou3Q52EsmGF/4BKw+BiYzEvD+kJEJMSZX3ThWWoXgV4TOurT4j0q6wdxC4cNDyq
	wPQ/RWsJMvjnPxNNP+ROJzALvFSm8lTTrQSd6BxTjP198V/UV0F9ezQU3NCu4/1AYSxaqTs9Tmb
	gAAB+Rz/aqPhrjn04ZMdvgDsXqwPD6YTAmXbfoU1EED/YoPn1PS6HBXELaKJtUq7RaH8u4TAY4N
	TpXFF7/9AO4rA3368NVbeMC+MFls2nAo+TzAclfYjRAejKP90KH4RDUw3UPRlJkvGYyAR2Pj2VG
	ySIZdhO2JAYjAItN9HOBFURefG4FP2B5q0i6OdM9GcrNH321RTVW7GDX66suIUnvstpe882KJM9
	M0kOFHs13gzCuluMaw9mHAgmRz+QAivVjIxQWhVVyv6dlerQYYR5uhHvx0c+JlCjIJfu2hrVCZ2
	ZMAGANxE8+f+bWXb/fp0t/4IaUQwB+6Zncq8z+E9kdyZzKMg+is/PvPeuyVCshxENXNVv+4NXTt
	tuOrJ7IEeuqffiTwzfOQ0g+Axm0muB6GnmF51vz6aUTJBbhYwWuIP0Dw9y5mGbGcQ3Akgbqk5ME
	jpA3/SDwJWQVVEIe5ln6pOmVHFzHk5Y6jwSy6TA=
X-Received: by 2002:a05:6000:26c5:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e6e50d8a5mr4237079f8f.36.1793357300391;
        Fri, 30 Oct 2026 03:48:20 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:20 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 1/2] staging: iio: addac: adt7316: replace kernel.h with bits.h and kstrtox.h
Date: Fri, 30 Oct 2026 12:47:44 +0200
Message-ID: <20261030104745.16693-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
References: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the proxy header <linux/kernel.h> and explicitly include
<linux/bits.h> for BIT() macro and <linux/kstrtox.h> for
kstrtou8(), kstrtou16(), and kstrtoint() conversions.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..d4b759ef637c 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -10,7 +10,8 @@
 #include <linux/irq.h>
 #include <linux/workqueue.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
+#include <linux/bits.h>
+#include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/list.h>
-- 
2.56.0

