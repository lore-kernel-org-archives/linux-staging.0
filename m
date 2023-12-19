Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6F1DDF5;
	Tue, 19 Dec 2023 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvakJZlf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d3eae5c1d7so197615ad.2;
        Tue, 19 Dec 2023 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703002449; x=1703607249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdL75RZ+5hKYU79DC1Z95eLZT4SnTmp8NGTefIW9pcE=;
        b=XvakJZlfGHAIsHB+tCKKSvSbwm4GDIpye+YaCc5ThO4ZQdDX/S2H9vXXXvuIomaE1k
         k+QOZt6TL60k/uGSRyPUAF/27DIltIofVsyryMW0tAkSIHTtSlWcWU0M56y4Bk+y+WgR
         bL824kBPmE0aStKvAX9D39pUjUbdTdT0X2eW0EBvtjkb/+P+1s0YhNNRnx2kd8yXky/V
         QW/Ha90fLc2IISOjqdDqzntvyB0iGQFM0lfnp6OZsB8S5xf1EvstTivKQbZQp17L1qEQ
         BssmNnU1PQyvzWFyiEs5kd4jZwVcctNPcbrp2zYBpwby+7TXTllHua/2BysSaRUrKIq3
         JdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703002449; x=1703607249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdL75RZ+5hKYU79DC1Z95eLZT4SnTmp8NGTefIW9pcE=;
        b=BbqkOkgNP5NdwFgN1neikthdiBbdFbEPFDWZyzDPKOcs7JseYTqyGnJ5eYpvw0NWgw
         BGghG9RkztIFXftrRiWL0WBH27jK5DnfCzPiNJvvrqXJ21mzViCbOXcdq3/y2i2GR4MZ
         I7tHKh2wxiakKB6OfN+X94o6kLDNC+Dgm4fofBoRFY11tlzqMrx6/AdzMO8qosgtdBWd
         tNOb0i40t3/fEjc2g+5/DLbbN9RusqcTzFC3UkkkiZ3H469HUtBAuuN1xSyxffHlb9e8
         QCHyaA47rOFQj6btXyyoyCQSMUGG1k53aJDrI5ZplxsxU6SjjSHnNzsARHtqE0fvfcUP
         wRSQ==
X-Gm-Message-State: AOJu0YzrPH457aS7hI787VZCiiUA1Kf/KkwTbZkp9AJzttpRLgFyJ63O
	/dI0sDz6EeE77bZ8pNg3CEI=
X-Google-Smtp-Source: AGHT+IFIxa5c5QlB4jj19PCj9xVWdx+ESK81oNfGXCP9AEmKKNNhniCCf2yDQIsPhY4SAb+aHkH2uQ==
X-Received: by 2002:a17:902:b708:b0:1d0:76c2:e352 with SMTP id d8-20020a170902b70800b001d076c2e352mr9336265pls.94.1703002448858;
        Tue, 19 Dec 2023 08:14:08 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090322d000b001d09c5424d4sm21161036plg.297.2023.12.19.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:14:08 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 RESEND] staging:vme_user:Fix the issue of return the wrong error code
Date: Wed, 20 Dec 2023 00:14:02 +0800
Message-Id: <20231219161402.50510-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the issue of returning the -ENOSYS error code when an 
error occurs.

The error code of -ENOSYS indicates Invalid system call number,
but there is not system call error. So replace -ENOSYS error code 
by using -EINVAL error code to return.

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 v3: change the description and format for the patch.

 v2: split two different changes,
     only fix the issue of wrong error code.
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5c416c31ec57..9bc2d35405af 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -341,7 +341,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 
 	if (!bridge->slave_set) {
 		dev_err(bridge->parent, "Function not supported\n");
-		return -ENOSYS;
+		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-- 
2.25.1

