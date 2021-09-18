Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D93FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g16so19147479wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=RhH20UWzxUdIHzSqG8Jfv28eEPddJ7RwSKXeLI7pmKbUh40X2/GPBcMxi50TRo9kJg
         +WHVhr6azWhyPluVjp94kCTsdI/bsCMYlnQ39kTZkS0bgYRVBvwfq1jod/yd5jg/l627
         TN6nfcCshsfeTcN3RAuMI1fYzEbliMsLlkW5b08EaVCG0KrYOjHmTjxVg5U5PuF9iy4g
         q20GyTGJ4mFYDyB7aNGiJlojkR2FvnP5Xuj+DV2eV3Whliva55Cwx7aFn0DokOd+miOw
         ab2Y9ofytmN87msYxE2uCr1VyTeHVgVt/00h9Tr8n8iqhvfRcHa68yQgvGmB/6q/mvxQ
         FRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=qz8eVlMCmHIGSWul5os7OeiCTNzKWv2R7bh0xwBdWSbZcGds7ViUfiA6NYbmu7Jn3l
         R03VzKGamkd1Mf1Czw0xoPAnYaY4yXZQOn3YvrpH5aqCSKkW4JJ5jdFuzLoe3b3c7/1p
         nWNYXSg/ozwEBlNFPava5FvNrumlT8EdawjpSfJdRPn+5exe1mgUemVky4B53/UxVMRg
         MD8A4GEgxkOuzekbAq22Zq4aeDwtHwULftQ7rJZ07jopuZ/ifjL6Baot7+JDxCFNmTIH
         d8ZPEPPjfv1Se02wAMFpX0Coa+v7wYFf86I77qO8Tn6RCSfx/jn0uEvk4ozH4LwS03oh
         uApg==
X-Gm-Message-State: AOAM531j0h2neExQf2meMXHpCfR9veqh8yYtd4gZr5aba1Tro8Ysq+vY
	UYBWlSME9Shlo4K7VRr7RJc=
X-Google-Smtp-Source: ABdhPJx2aXH+b0iiDNctevxoA3mk8B1wDHbFhdDNlOG0QToAXKOEJnYRiWT8/HtF8CYvF8M5n10+Tw==
X-Received: by 2002:adf:d1b3:: with SMTP id w19mr17002660wrc.152.1631957106147;
        Sat, 18 Sep 2021 02:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 02/12] staging: r8188eu: remove unused macros from odm_interface.h
Date: Sat, 18 Sep 2021 11:24:33 +0200
Message-Id: <20210918092443.8724-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros from odm_interface.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index efc2ca069a3d..d3e46b2a4cea 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,11 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _reg_all(_name)			ODM_##_name
-#define _reg_ic(_name, _ic)		ODM_##_name##_ic
-#define _bit_all(_name)			BIT_##_name
-#define _bit_ic(_name, _ic)		BIT_##_name##_ic
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _reg_11AC(_name)		ODM_REG_##_name##_11AC
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
-- 
2.33.0

