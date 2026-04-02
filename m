Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA116A001
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154870; cv=none; b=NONo0uleipzzyImUS1wUkaiXqQfKiIE2+WTSo7KFskVanl6rhJcpd93uVwRZhOeqxL/N2YuKf03llfFxwlv2GAM8Lp6/bqdqpOvcoVbMQh9cPu15cE9u2KvX0Stv1F3lIhcTBo03bt7EhPZ3gnJ0m322OtnzkahhG3dxqeKh+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154870; c=relaxed/simple;
	bh=CVvofp7Vg74mY4dHHHowldMJYz2mg2rj011qUi0dVn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seuNGyVsiPejJobMMsjrgOGvS979zuJBkOmVpnP909cFrIw9DCu/KHWF8fCzU77vmChhDFi7U2rdGHanaWHFhVPaj/77Hb6SbFlG+N/iVe4yMkevlu9H20q4nlJETKVb/pDeTwSLhf7/zVooFb7JaIe81TYrejk4xLnPCfdL4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITQMUNir; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITQMUNir"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso11275165e9.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154865; x=1775759665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6esEg14STtARc9s+P9up1gj8wPgvzwV1KQLA/9K8XI=;
        b=ITQMUNirWeBdj8JtbSAfClStqQi3Xhmk0hDfLe1U/cFypvRJs8OQ/QF29wqKu1ae3n
         cFKPBPBdG9A2LWJFN7Aef23nZDHZv1Q5SgsaXTb+v577ieN6Al6mlxj3GoYgynTpX9h5
         U3XQNZ+AjnOfsUPQR2e/lnlJmMyqkxMCfcjtgEAMhUTxhteOAV6gf0V/j3cXSvbcj26t
         kxDvyHglWnDHiAtvaRe7mKu6s+eItEYk0bsUmLe28Va7CKdcaNaW8A+z8CZ4JswvRlKS
         2oFpHbboNsnChA1YCrcuauJ1GaXeDk7ptDIvy+ZMeq09VwxAT5ushrqKpm9SGHMLA/Bw
         0vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154865; x=1775759665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6esEg14STtARc9s+P9up1gj8wPgvzwV1KQLA/9K8XI=;
        b=kk2NSOCHF/8S6Jyvbl2zl2QQ+GOeaOlj7u+HR3WBPLFCgiCxjYi/p+SAalPATXr3ZQ
         5n7IQD40CPYzCvgizxQ+w6tEX7X2PYoueHbqbLcICuWneYpjrY1iP0sPqRF12LckLCUa
         gWtZEcc8CFRSqxxvuBCz6K+ZWqktdVhlW3dO9keiPetU/6jc3olAQfAdAiVPV04Pzm+h
         8QE5OL351A8We7QaA8OCgRzqGSJElKBhwWmMSui1b4WTvl4FCRqAXWTeKQ7TsaZHP7Zh
         2+uevTYc9HSTyU+Q+XGVJ4Qwjb6KiChIAi2wNFWqUeeodtzt+w6Hg3LcgNkZNRPwGpTL
         Xl1A==
X-Gm-Message-State: AOJu0YxGbfWChR05Z+Ouh1grY1Kf7cYg9EoMwg8kXJtGcZ4OimaAoWyg
	6FbeANktoxnXL7Ayzb88H3fMFj4cyyHvmK1iEX0MioGyeFKQxYlE9lkYabBoOg==
X-Gm-Gg: ATEYQzwd5T7ksbf0fagkadyUjKe78rxItaTTzuVxo+pbuggRQF8b452aFcSd7yledVn
	nkQfONWUD8T9Pkjvb0nhXZmBJbYvOdH0Le0ibMqX54lIWzgxfzD6H1VAKhJeRI2ulIJ3HRWeCED
	p4K5eeSrWbGyWXxT+UJzPXk6b0YbJxwgLzuSqNW4KIAR4JZesdNAAHBLgIwEWn7886TY2lSJAGJ
	S4dC8LgJYgDDWpA2+75ipVSV4kN7nx15RrRMP/7bNGcnqY3D7BwEvu3WaxD4XpDJADehtiNNTkN
	jOP7l4+ILnObnDN3FncNBGRcfyaq/A/plDUymeM2GkmEBwSeF3MpWMKQkvlilnfblTKkODTE6F8
	9XeIOZCDWt0SYqraNy9g0oTR7AAP9JtKiow4FIwTUKk0QQMUkb9waAbZ5gll5QxDVIifvzApz53
	vsl2Vf0fWzghC/ulj2IFpaTnRkItF1G3fCCQnJzZxaus6o
X-Received: by 2002:a05:600c:4e14:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-488997a44edmr1227295e9.21.1775154865307;
        Thu, 02 Apr 2026 11:34:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:24 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Thu,  2 Apr 2026 20:33:45 +0200
Message-ID: <20260402183402.444630-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402183402.444630-1-azpijr@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove the
redundant call to simplify the configuration path.

The ia_css_output0_configure() function acts as a configuration setter.
It populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. Calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. It has no cumulative state, neither does its order
matter relative to ia_css_copy_output_configure().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index abdffff41ae2..2beb7168517f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -792,9 +792,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
--
2.53.0

