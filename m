Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E933CB
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id m22so2888810pja.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2PjyD0od2VK8o284HiNQaL0WzyAhAStKIsfNQ9ArB0=;
        b=fFFvQBPJXWtHeQCHONh5v5ntNQ7cJ7QvCYiq6WK+gC/ATdr+H91A7hxohgKSGkCjnb
         xgtsiJc4Dp8lwSF27XNZmzidsjUaNfGAmD00QCo8TevAM97WCCttzFNmDfoaoxIcJp0g
         kshI5tLlcNCj34SWtftv7aFYUdhqM4ZdKfswP5l12ZQk2qKIUvY2oXLtaWwzLZzuoIcK
         LALepfGbRRV3mIwhyupYCRhqZLBtk9KK3uFuc3hQehuM0FN07cke9zPUtkWP71DzyVtM
         c0w9UfUsd64qNRkoj5a+9gTz7yMz/o/Uuf5Qp0WuoT7eKq8v8L2UsxMytd4mmn0zr9m9
         fQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2PjyD0od2VK8o284HiNQaL0WzyAhAStKIsfNQ9ArB0=;
        b=K4R+AhBTA1mrGRbrja08obuqGzryVuB6Nns1slyGVc3xBuduEh3LStTfEwaIz1/MMa
         ykddTY1pm1A3xNpT/tYJPUgQUbv9PvHma/N16qy8omXulZvauRPtkrtnbv1pR+qAFQMN
         a7r08/sC4t1gQX5dZnboSx/abdFLyScv0AWEUFW03DnwDSMMoyY0Aa3r6JV4AHS3fcdr
         YQt1PJ5eYwjnWGuRMukcCcLqWXrsnskQ4J1DFPHhuJSfPA6sLgeElgA+oUq289gpjeiL
         VHxd/GLjqWWXkt1DRDP9tiYQHIJ1xnNxag3DPwVQ4u8ePCZiqswxeeMltcu2S95KMsuS
         CbfA==
X-Gm-Message-State: AOAM533qHCbxJRc3zYyF9xjafSUvZJ5Y1wFXa0P19GPGUENG70vWKeHB
	rwDqw6j0OwqntuF8Id/4nZs=
X-Google-Smtp-Source: ABdhPJwbO+QfDmpfMX0CCubakQuZwNurnyfYXKq6QOhwph5DJInXLiLWQi2dwkcZlBhLM6n6kVwCMQ==
X-Received: by 2002:a17:902:e747:b0:150:2a7:735e with SMTP id p7-20020a170902e74700b0015002a7735emr32418436plf.32.1646254086383;
        Wed, 02 Mar 2022 12:48:06 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:06 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 01/16] staging: r8188eu: mark rtw_is_cckrates_included as bool
Date: Thu,  3 Mar 2022 02:17:22 +0530
Message-Id: <20220302204737.49056-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark rtw_is_cckrates_included as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 62354c319..a7b7b0f14 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -68,7 +68,7 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 	return 0;
 }
 
-uint	rtw_is_cckrates_included(u8 *rate)
+bool	rtw_is_cckrates_included(u8 *rate)
 {
 	u32	i = 0;
 
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 3a860e132..1a15db097 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -872,7 +872,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv);
 
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
-uint	rtw_is_cckrates_included(u8 *rate);
+bool	rtw_is_cckrates_included(u8 *rate);
 
 uint	rtw_is_cckratesonly_included(u8 *rate);
 
-- 
2.30.2

