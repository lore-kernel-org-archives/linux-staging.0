Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75AD313
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Xr58dUPg"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7d65d4eecso97310539f.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296795; x=1703901595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK33ly1MosSrec0UdEAxdptOYynizC2ap2lje80pN3U=;
        b=Xr58dUPg+qcZPcL4Jd2X8NrB/O8KovrLCNqFAOhZgpzI6sTN8F1QyRryQrQ+/IwODn
         Je23wrgQUa6ajjy1i6noWzc2rYCua3yv5O9QmSBr96uP+IzDRbfxOuIzsI69aV+G7xNU
         Lzc4otijOMe21qUDrf3g+KDYCpzemiIKfbpLSPrdeyqV5fgIxBu7a73sbp56dnp24Qau
         3/QclPEiPsWDgaYwXMJJozN+q25M8a3KMFfl54Wewe8Of3RDVfjqAg5NlT/hwGUGfb97
         WvaOq/2HjA5TYAMzYNfJhE220cY9WOklqK9QVZIS9j0kJgnhQaH3PWys9nw93Io2kVTY
         Dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296795; x=1703901595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK33ly1MosSrec0UdEAxdptOYynizC2ap2lje80pN3U=;
        b=fitRnUxfcMykYNQ9WSiY8GtkpajT24gYMB58P5wIl41Oylh1/di8vy1icaXo7p14Yv
         megYcOoJ601puKakhPoVn0B9hkjFW4Y5TNC4EZlYPymEPKK68sbRnSzOqJIlardG6amQ
         ls5wx5OvumbQMFrMunyNwEFRFD5bXfeEc8l/eggrBFoOvdLmIu+jilb8HNVNJXtw0w1/
         O9l9KgyJYY4ILF9DD0maqGz2J5IYbkVNyuPhlprhjxeaLd6GTnGeKhEe/TKlBizItJNr
         oYVcz9za4sOevliVcdgAu5l+mJULqLyWkSANFRwXU61M3WfA47KN7vwynZifjBTNoAUb
         QNww==
X-Gm-Message-State: AOJu0YxJsIZ4VFCU2Mrg275cDU1+RpL/O/jrYpIgsivHLGN6+8Pk2zSD
	pjj6nvU1eaduJPMJoemy2hi+Ki2f28jtTQ==
X-Google-Smtp-Source: AGHT+IECAxaMCg5nwzs+egYRazIwcfuxtVkST6lQYr5PcSec0/NZMr7/OMZy+xMwprzqgJTQP88oLQ==
X-Received: by 2002:a05:6e02:16ce:b0:35f:a1c8:a6e1 with SMTP id 14-20020a056e0216ce00b0035fa1c8a6e1mr2796020ilx.58.1703296795375;
        Fri, 22 Dec 2023 17:59:55 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:55 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/20] Staging: rtl8192e: Fixup statement broken across 2 lines in rtllib_softmac_new_net()
Date: Fri, 22 Dec 2023 17:59:33 -0800
Message-Id: <20231223015942.418263-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join 2 lines to fix Warning: Lines should not end with a '('

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 5d14d7c0f8c8..c268ed6451af 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1225,8 +1225,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 					ieee->ht_info->current_ht_support = false;
 
 				ieee->link_state = RTLLIB_ASSOCIATING;
-				schedule_delayed_work(
-					   &ieee->associate_procedure_wq, 0);
+				schedule_delayed_work(&ieee->associate_procedure_wq, 0);
 			} else {
 				if (rtllib_is_54g(&ieee->current_network)) {
 					ieee->rate = 108;
-- 
2.39.2

