Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848651;
	b=KxJknmppzdIyb3aBeMnfZvuJJBhc0QtaQ5RrRUPaber0rFf67Jp20aL9lmLeVHQcEykv
	 5/wzSedUf84JPQJpY7vKNatSEiQIiWlRA5Bu3uwEp2FkJQnHYHE6Rg8iGHP0CohkzbtLl
	 ojXoW7pfJ7wkCS2OnJIsmtQ9a7HQtywT+PJGDUsWRABsK+wn9JFlgO+4PRF6i7/S8kazV
	 /jxQZpMtYnvndNFFh9HVyv641nr+JpjGVwuzigDe0pds0MPRyurNu4OX80cjN9UtvxETB
	 eb8RvuXZuB5ya7UWuzsY3uygn/z4SvdWzTPBbkhh2jsNQVyVMm/uBxwhIMXbrzuzNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
	b=nD7J24UA/pYxSn6tKDKMFdm5+/HC1XMuv0uWBxzCwME8fhyPka2Yq/ftRJXnkS/YZz3s
	 gvu8Vdv8Dlaoov7SCd4T+yP8tHXEqb1cUXDeBdZTvF6fy8YF2pMELfPxRQ6iXtlsTw10w
	 IHEgidtLW0+LsrrP9JVt0k0a9/r7VMZ0AHehhN4PytBl6T7FOh9wv0R90ez+UmJ3wZmc3
	 lBuPloYnmyIbuOkzhKvT42oHTaLDYaWIubMgay/Cr5urC9+lqR4ZiU2v7U40C/Hs0qlij
	 U7a5s17Tx70WWJSnV0aTPL1rNx6IdOvumi8L2OECRZx2Q5a7l/uoX3JhQ7PprXDyR6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p+vB8+NQ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD97606A324
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 13:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD97606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p+vB8+NQ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso5416eec.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848651; x=1793453451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
        b=p+vB8+NQYxWiF3W9fL9CX5b7gKQJ9ObBFoXuvvpPKQbxB62MPK3GGT97040Y9CrBZH
         xLKbcbkABXE+mDRuF22jQsQ3yy+mBHevtA1wm97qET8gFVRx6Sg8kcLKbtv8F1B8JMlj
         Cj4AsGCP2zh0XzaJff48vrJGVnpHyxQOuXz87grSu/DNRIWSVfkXq/eXTzfcjVVpUMQx
         Z4bu8HBkiyvooADRvVEm9TyCkyGLzMAB/vnGTrdi2UxhkZp7YLdKTwUn2EaX+7ZXmbGh
         HdLqUMll1kVr1Eq4D8kKmmJavgGn/vz+XPpZnkBjapABlB0N7vMwlKgHMJc/u7OULLCW
         E/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848651; x=1793453451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
        b=0l00bpTA3wj07FBvwO7U8RacHyE6sjnyERucBkC7wJopLzqqnl45FHJ7Lmab4DjHd/
         CgkFvuhxR+6h7iaDnuGsIl70O87zxFFL8t9aoVir05y4fUaOvzLRLYgQLpfVo16yJHU5
         zrbK27iIoIKjqw1m6KDie5tQRt4/sOjQApD7/Lfa+deNOUnXkh6pSZ1vE9czO7PXQrnf
         lYDCMtertty0/NKpStbvz5/6X+FahXsXxuFje+EyI7V3vptUxmN8ghq/JyjR/okxUi/0
         ubcts1OSGQHnKOED+y0lgjuD7ig5QHa3DZEg0hdoV6+/OTd2YUY2qrTbXqhPurhRuWY7
         gluA==
X-Forwarded-Encrypted: i=1; AKwUvBwk7qCli9tnDKdpNFN/jL2Abdz82nfTzf1ao7oJFOv+n8Kia7Bu/eSgZ/72Nv2zVNTeZOUa2wk2PaYfoT7H@lists.linux.dev
X-Gm-Message-State: AFq9FYKKMfG9xI0uz4WL7dEXOIAxjGki3y4T38Pw/cJcxG365Q1+9huN
	b5J0FfGWO4RbBk3DGBs8OKoZVpA/AieLmL5+O1+oUFgE4frBhnp0Fnm1
X-Gm-Gg: AYBFou25yQO3FrVwP0LXWb40cmyUNdv3W+dAvRgRkM9mV3HmNW8uV+I1x+lbPcfn6Kd
	2MOAGN9HQh7N6rjWu2OPOnOSRqRs2WCqSDulPkbdMIfHTDnu/OqcOyPCPBiVDXywGqI2g+qANjK
	8f1MGLwShIsAG4fzEX5yzReX2EBZ53bL13PAJ7B0SF492N+CyG/Sl9RiH1A2KP6kJUj2Wflanuc
	zXuWSdAKAMglDw9ZB85vNHq8LfBwBKkNhOcd6b7cMSNVn/VQyXujhDdIEyrDORx+hDw0YVrLwaS
	kiaWS2XMX5sWdiTcdOX1OzkTUjrg1JeoKGXoNI4NIuhh+Ns23zxkSca9QkmeeP9GCWhmw1sd/6I
	G+pWqq6VvNcMrtHM3SxOLTslDAH9NN8fww4RDvEFX4x1KJOqnKz+X5m4/S3KvofqyXU4vFI5obO
	mC54DzYHuptfJ5UAjyQs0t9YBnceanWDWWMW5LJWzdj9gz5MKFZazOhNEQ9hyOiEjA1FYlOQUhv
	i3q3CYdlxlTqYA2WKO6WJES0XlQDhs6dmFUs029GtYovQxuLUgyC/M=
X-Received: by 2002:a05:7300:1c1e:b0:360:1637:404 with SMTP id 5a478bee46e88-369e8660d3cmr3083001eec.33.1792848649998;
        Sat, 24 Oct 2026 06:30:49 -0700 (PDT)
Received: from myarch ([49.36.79.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15908129eec.23.2026.10.24.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:30:47 -0700 (PDT)
From: Aditya Nagar <dev.adityanagar@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Nagar <dev.adityanagar@gmail.com>
Subject: [PATCH] staging: sm750fb: constify the pointer array g_fbmode
Date: Sat, 24 Oct 2026 19:00:37 +0530
Message-ID: <20261024133037.160112-1-dev.adityanagar@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Make g_fbmode a const array of const pointers since the pointers
are never reassigned after initialization.

This fixes the following checkpatch warning:
  static const char * array should probably be static const char * const

Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..c3f391cdd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

