Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22264817
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jTIJQG2h"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35d77fb7d94so9914965ab.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296787; x=1703901587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwGDDgTKCqE/SRFB8yFUCtVd+D/7s93vO8AaImjZvSM=;
        b=jTIJQG2hBCkgbcwgpS9Gi5C8h3061KLngYTTIcrsb4nn3de+tJXoV/ije5zm8uKw6O
         zODkkfHI3HdO5eFoelXGZqQHoaxelU+O8pd8PyhQxArPwzFddTnK/ZmJ5VKypMgj8XaR
         WrR1gel5QnYMSI8dKEP5/wOX+BMQJ0Djy3Pw2LZLdWLXSgJDUb9m9nZTbQz8Fz/HrnyD
         VLW5XHi/G+wW8Z5sKLwf6/3MbV0Y4Z1bFViiDEas1qjswLMValRwB1B9ltf/Sm0Y0+Qo
         dGvT6CUZ8hOLScSTM+AD1GNI0WX+6A3mk2Q2CYTZYY4BycEu19lQFH+ohc/J/oZlCwJp
         76mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296787; x=1703901587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwGDDgTKCqE/SRFB8yFUCtVd+D/7s93vO8AaImjZvSM=;
        b=vAFJaVBBrv+8X4HVnry09FiqTE5Z5KP5qfnGuMiWOa9o3x2/TXYW1PUB9Y2emqO75r
         AQ4nHJaJjE9TuBvfm+IrNA+FlEDYjnB1kAFAjvV7CIKPoCHfN+NK2/ZJZQaiW2c828iQ
         KUuYWYftToK0uc5+S7lX+lFhJXCBVEtLcvTygjMst89bE168q2RNGp35hmC2utHNVsRg
         OkbktUxbVuYxad3i0iEwtB17CrAAuAPZ+G+IvRdBq2p85ttTUJwmRJdWDL8JragnfYil
         UuH3yfg6iCHTcQ+LHG+i/AtBNT6rumpFEFSOj6xWzi+/I2QZRAU4ArKMeu3MQsHdqdaX
         VqCw==
X-Gm-Message-State: AOJu0YyGwJnbLVEqsDP5v5i15z6U0UJ3tnb8oS/ptkGBFQV90WY8zy5P
	5+U1WK5IKeu2eIRcZQwmGshQNM1AMwXhwA==
X-Google-Smtp-Source: AGHT+IGU+bU6RpIM/OOcpaNDG6iNUJDjSy2tTUC8B5bDjod7aaglkBuT5fVifB7W30s5vMpOx0QRQg==
X-Received: by 2002:a05:6e02:148d:b0:35f:df71:423c with SMTP id n13-20020a056e02148d00b0035fdf71423cmr2134241ilk.59.1703296787380;
        Fri, 22 Dec 2023 17:59:47 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:46 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/20] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_softmac_new_net()
Date: Fri, 22 Dec 2023 17:59:24 -0800
Message-Id: <20231223015942.418263-3-tdavies@darkphysics.net>
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

Remove parentheses to fix checkpatch Warning:
Unnecessary parentheses around ieee->current_network

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 2c46906be38f..8b689e828864 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1219,7 +1219,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				if ((ieee->current_network.qos_data.supported == 1) &&
 				    ieee->current_network.bssht.bd_support_ht)
 					HTResetSelfAndSavePeerSetting(ieee,
-						 &(ieee->current_network));
+						 &ieee->current_network);
 				else
 					ieee->ht_info->current_ht_support = false;
 
-- 
2.39.2

