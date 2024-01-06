Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277D3B659
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="EwwLfDeS"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dd8cba736aso184141a34.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520576; x=1705125376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj0JkenWNM6rWbuHRbMOTpCWBtrPTE48Nz+nx7XWeWA=;
        b=EwwLfDeSzi5gSDpBwFw5Hf6NTjG6yd5Re6QK5fJagGpNqn/kblMjG0dLNJ9OhhiBbg
         k3MgonIsVAs8+4pVY473R1x+h9kh9L+ymLd3QEs2+ZBaUjHVhW9+P3pdkkEsIKgJ3Ac7
         Eukr2Amxyduc+kODA0fGgzvBkj3DXeTrq90UTtGYQuqt0VmDAiFkc8HJDBdly7GvjtEB
         O9J8YKt9jr8KobK9/noSt3Ppd6tUj9hwGCvCEr7EIhLhINU3vyA5CQ+lGD3Lq0bFTtQ4
         tU1hpQXQabqDAoaL8FEnHYuO5Ye9IbsHQiiML6nc5kC1o5t+UEUhn/3T927fIhXZUSlm
         at8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520576; x=1705125376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj0JkenWNM6rWbuHRbMOTpCWBtrPTE48Nz+nx7XWeWA=;
        b=tJhiPcap69kJY8dfyNtRWz/lUAUSKHxDze6ZNRPEneqHsqldG/DgvLpbWG/jtbzQOJ
         yHeP2lEBYvRRNh+kYfwPHcDhBFkvXkNXsD5mA2M411hmOjuRHl0KQkokkaCoa8sqqu3R
         Lk0gGa7rnZccAJND7vY5YNNsgm3LgAppxocKhHGdCIimbR3FMvQ4K1tOK04M1jJ8ltr+
         2pmyswfUln9GICR9Z5YnqiuSiXSlnulPNGEfLXUHVkWVuUZ+W7EKx3NiFnNC3Uw3xqGi
         aMn58GE1zDtBSjNdG7PC7aW/Oi4c9sTYRXzBIUXOLd6TDpJia/nkyOiSAsaIchEGBp0E
         3ZrA==
X-Gm-Message-State: AOJu0Yxg1pA4pdKhOqopYPsjOKfP0JiIoEsVLhnjnyYtU3RiTtSuC5ff
	KbpQuG6167vgVC+OCfwPaax9aKkIhXz9cg==
X-Google-Smtp-Source: AGHT+IHjWQj39VdU6KYe/JAc1tlHNiJcMoRhiGMzxU5WcaqWPpj2L0qmG/YlumqV/TEs4CIyAOjzmQ==
X-Received: by 2002:a05:6830:84a:b0:6db:e1d0:6628 with SMTP id g10-20020a056830084a00b006dbe1d06628mr488203ott.74.1704520576375;
        Fri, 05 Jan 2024 21:56:16 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:15 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/21] Staging: rtl8192e: Rename variable bFilterOutNonAssociatedBSSID
Date: Fri,  5 Jan 2024 21:55:45 -0800
Message-Id: <20240106055556.430948-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bFilterOutNonAssociatedBSSID -> filter_out_nonassociated_bssid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 3d7fad28c414..98c1041214fb 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2267,11 +2267,11 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 
 static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 {
-	bool bFilterOutNonAssociatedBSSID = false;
+	bool filter_out_nonassociated_bssid = false;
 
-	bFilterOutNonAssociatedBSSID = false;
+	filter_out_nonassociated_bssid = false;
 	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_CECHK_BSSID,
-				(u8 *)(&bFilterOutNonAssociatedBSSID));
+				(u8 *)(&filter_out_nonassociated_bssid));
 	rtllib_MlmeDisassociateRequest(rtllib, rtllib->current_network.bssid,
 				       asRsn);
 
-- 
2.39.2

