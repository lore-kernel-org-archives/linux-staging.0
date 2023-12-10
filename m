Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B36FAD
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="VPZyGIjn"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-286f8ee27aeso3869195a91.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 11:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702237030; x=1702841830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGvQkmHI/tfswWBbqQpidgaN+RSpZU90FgpOfkdldLY=;
        b=VPZyGIjnF2Hict5dARvgj0RxgHCxWUigzkjfSm6CkQQKaa9pDtOYOp6Vb0IQx7yfPD
         6jdtBXUIlHxvjU0u/kA/WxRzwThnWKZr7Moz2el7vVO5Gk8IorcEwHO531M0FVhDepen
         Z0UGYe45Uhh64LAIspzj4vX8KFKMadrSk8+fsadlh1sr8wgzixrXY9k7i8RaaYDfx5W3
         kZ7nm6yBY81vplW28ITPPFlQhCcJzwy1RZ+u7gATlZ1Dl3P5+psyNp2iXUkaa0wI8YAU
         4yjPeKbPYwWXLLe8/po4rAQsYkqSg5bqWiikvy7yg5Fdx9uqbDc7H5e/+26PupjnOnzp
         YXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237030; x=1702841830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGvQkmHI/tfswWBbqQpidgaN+RSpZU90FgpOfkdldLY=;
        b=E0qPODRVtTPuolLl46tC2C9tso/cRAVXipd5Hd8VKAZ4sIZovhLBSx3CRzOb0FZgJr
         54bBFxFeWczXEBCG2KX7eFc1Ee/qTfxMmg6l/BSE4JBYv79o0z+iJr7USR3qAMTQMOOd
         4hwWrFt/aCErlI6vwUXWt9zZCUiLC3JGzEpnIFAlDgWiYhWEvWMAVb25qcHMd2Vs6QGH
         9iml5PyQUAfNQhHFlo0iKWhMLAgDErCUsus2/pT680rFa7RZ0OMcJrDzeupi+xuKYH/k
         wjmBU6zSYlYaO8bA6ds5HcqTnHPOAsY17mpGwDKVyEOdRVgmEpKSbQZoJ/2PrRsbgQVV
         PCpQ==
X-Gm-Message-State: AOJu0Yx3DMtfJa9fv+ykNwaLUff6nxPIJt0TrsVMu+o5iNQZ/RF42HQ/
	+2V7w0wsVSa9IxLAahOMq7ccgA==
X-Google-Smtp-Source: AGHT+IFn+Rbm8Lhkot6oQkSbdtOhnzqfLtM6bPltdj5vLC0YYwYcnYzpWCLBpXMRePkV3WAlXgjBFA==
X-Received: by 2002:a17:902:b28c:b0:1d0:6ffe:a16 with SMTP id u12-20020a170902b28c00b001d06ffe0a16mr3348585plr.116.1702237030045;
        Sun, 10 Dec 2023 11:37:10 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm5117419plk.171.2023.12.10.11.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:37:09 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/4] Staging: rtl8192e: Remove variable bFirstSeg
Date: Sun, 10 Dec 2023 11:37:02 -0800
Message-Id: <20231210193705.2131807-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210193705.2131807-1-tdavies@darkphysics.net>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable bFirstSeg as it is defined but never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0a8c44e497f5..c0a24826cd3b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -103,7 +103,6 @@ struct cb_desc {
 	/* Tx Desc Related flags (8-9) */
 	u8 bLastIniPkt:1;
 	u8 bCmdOrInit:1;
-	u8 bFirstSeg:1;
 	u8 bLastSeg:1;
 	u8 bEncrypt:1;
 	u8 tx_dis_rate_fallback:1;
-- 
2.39.2

