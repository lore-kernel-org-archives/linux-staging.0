Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23553EDB
	for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbovZwBG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c9bf22fe05so22224005ad.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697376961; x=1697981761; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWM7j+OZCwLtm2rLuGsJS/VApTDDC6NKoILtMy2P7BE=;
        b=ZbovZwBGVvsjGx6H0tBt9gT65uKxWKzvbuOYpftvjLsyfZMmgq9AMWZ7Fy/f+34Zqu
         O3D9syy9LMSkHtUgYfJCQQmEoFNA61zzU603lZQR3NClw0Fp2R31f+zbVZfjGBSn2UDH
         mS8rwmU99PqjStdpJHwzahT9MFgl8Eh78d+YE+6IZNR1WIyfTDye3+LU2gH+9iNqd07k
         IZXntyFaR8XWqIhku5L6QufOmmGQwtq4a9IsvpU9FWWAFZMeU1aGYndecs1I3Sk8wqso
         mwlJuUQB4B4bgVnTGyn2aeR56oPArSot/D1vDSFefKW74I1wsdxUWW7aX+em4FWIvSEu
         POtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697376961; x=1697981761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWM7j+OZCwLtm2rLuGsJS/VApTDDC6NKoILtMy2P7BE=;
        b=Kxrtsu/sqdMaOi3QmxguZlwwm/fs3u+ILQWwclf6r16yJmkmnYJbrR+b/bRDntaxA8
         8PhD0h0Sdoou+nILH3QQncqEQ2gxCpgb1KRsKshO5ruhKEluILwweRlBXXu7rapcAvAv
         ZZSFtrf+MEzI3RQ+5g8Bt9r+Vr06cC3blQYotd8Y5zUuKT9UTXx5Uu3c/epEBTP5gzSb
         aiJ0kk0Qgh2fZ0zafiPNkDHYMmA75zgOxUHIULwjCgt68Rbm0J4UqH+ueBJCnjUr4mME
         C72LEIGgQxveeF+qETYrjmHc1Fl2dlTForc7ZF4Oh08b7IfM9PK8JBGkQkarB2qKKQPL
         Y+YA==
X-Gm-Message-State: AOJu0YyrAsuUx/iJ2lDEAk3ZTvdnW92uQewDCtFqZePf2ByPynWswC8J
	WGM6D62QRbXabPbm9pr0vEo=
X-Google-Smtp-Source: AGHT+IG3EY/GYPlQhjDKMrD7ydfH3jXllsSUiuQpVP2X+ZvbgJar2DW/73YFnlgwQl6OJ3GDzD4a6Q==
X-Received: by 2002:a17:90a:1541:b0:268:1355:b03e with SMTP id y1-20020a17090a154100b002681355b03emr28186055pja.38.1697376961266;
        Sun, 15 Oct 2023 06:36:01 -0700 (PDT)
Received: from ubuntu ([122.171.162.0])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090a804700b00263b9e75aecsm2966806pjw.41.2023.10.15.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 06:36:01 -0700 (PDT)
Date: Sun, 15 Oct 2023 06:35:58 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH] staging: qlge: Replace the occurrences of (1<<x) by BIT(x)
Message-ID: <20231015133558.GA5489@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Prefer using the BIT macro

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/qlge/qlge.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index d0dd659834ee..69c5b332fd7c 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -1273,7 +1273,7 @@ struct qlge_net_req_iocb {
  */
 struct wqicb {
 	__le16 len;
-#define Q_LEN_V		(1 << 4)
+#define Q_LEN_V		BIT(4)
 #define Q_LEN_CPP_CONT	0x0000
 #define Q_LEN_CPP_16	0x0001
 #define Q_LEN_CPP_32	0x0002
@@ -1308,7 +1308,7 @@ struct cqicb {
 #define FLAGS_LI	0x40
 #define FLAGS_LC	0x80
 	__le16 len;
-#define LEN_V		(1 << 4)
+#define LEN_V		BIT(4)
 #define LEN_CPP_CONT	0x0000
 #define LEN_CPP_32	0x0001
 #define LEN_CPP_64	0x0002
-- 
2.25.1

