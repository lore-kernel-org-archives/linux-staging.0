Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9586D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id bx20so23680383edb.12
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=noS6htpFhE5xXrKr2Fo0hbzNkPnB+LkaIWg1CiOcABg=;
        b=WvPSOj0VKYUNNmMj8epu/PxCixr2OutlStvHzCI/+Snq5Aka2T5xfgDCNfc6LWKgi7
         3dXWztuHPedzEubNNHJrbMloW+bRNl1QpCfxXWuXwRLoAZyon3+vywojF4FaauUHOvwT
         1SC1VwQniXH/KN5GurPyihk38rZJMqFxWvwkh5FMSpaTlkLYVZx3WHOxRtJydx5+iojS
         b6+0quj21jvftbY9ISKq8It5hijAeim36LZzzHxgqmJslgwZUakioiJ8YqMEnqJNqCuG
         BKO9GOrdSE4v5n+JkvVyP7PJPdypZ2KAgiSkdnEVAtZ1I4oJqHXgB567jJxhprTkzsNF
         MqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=noS6htpFhE5xXrKr2Fo0hbzNkPnB+LkaIWg1CiOcABg=;
        b=lodHNRLwGIiNXfkCQ9u7DJGZqUdXM1kkwOHxM9g0taQDqCnWTQK8h1inaFTO5GATPW
         +XhKWdYw8C0vlIcczyy2C/u3myox4rEgwuobVuc5Zikx+aomY8Z/don5U9M9ivydGKD7
         pwVIx/pgsHe9x40hBJ/Pg2hgK2MJzMgj4/l5Vz63XCZ2BGV0OZqLGA/6gkF5JSJc2ePr
         H7vm4sSLUQas/g5pLgGMd8nluS3PTf/5+qUN9Qb8dJaV3ynmu+xxq0i6nUk9JNNdKak2
         7fmGbveC6D93ddbuoEnkcYOu1u6T353KAOoBqQgWEDz7EwodEl+kf95ooil3+KThmH7c
         a6xw==
X-Gm-Message-State: AOAM533RH97FBbdIkvfJPGWsBYMuvt5g9h2ofAB4yogON3Fngofm3Sxx
	FqGEeO1bEVFGq3LS6YfvOFGiBUGXxmZMHA==
X-Google-Smtp-Source: ABdhPJwxA+9pLy8rxD0ajLNPjkVOE9I+E6zRjITvFxSTLTvOZkjksa2nthSaT691y9g2RLj0bSB+yA==
X-Received: by 2002:aa7:c247:: with SMTP id y7mr152482edo.305.1618423908344;
        Wed, 14 Apr 2021 11:11:48 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/57] staging: rtl8723bs: core: rtw_recv: Mark debug variable as __maybe_unused
Date: Wed, 14 Apr 2021 19:10:45 +0100
Message-Id: <20210414181129.1628598-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 from drivers/staging/rtl8188eu/core/rtw_recv.c:12:
 drivers/staging/rtl8723bs/core/rtw_recv.c: In function ‘rtw_signal_stat_timer_hdl’:
 drivers/staging/rtl8723bs/core/rtw_recv.c:2341:6: warning: variable ‘num_signal_qual’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 668a703dee7fd..f15cd7e395211 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2123,7 +2123,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 	u8 avg_signal_strength = 0;
 	u8 avg_signal_qual = 0;
 	u32 num_signal_strength = 0;
-	u32 num_signal_qual = 0;
+	u32 __maybe_unused num_signal_qual = 0;
 	u8 _alpha = 5; /*  this value is based on converging_constant = 5000 and sampling_interval = 1000 */
 
 	if (adapter->recvpriv.is_signal_dbg) {
-- 
2.27.0

