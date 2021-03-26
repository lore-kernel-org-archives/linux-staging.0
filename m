Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3F70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so5551661wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tjZ69b9hxFcbktSVpwV434OeU24igr5zjHI3bGPYJis=;
        b=OH7MgcVz9FM55iQRiRxGIQClKespOVCuKfxJ7xc7GYQLdg+zzffre5JvtyQ92F8RLX
         Eszta5Ytn2/YJWjhmX51LQQQxkRottUxlTWAnSRffNjM+1vdV3qlZtF+8iK96vbTuv7v
         9f+KwmxsNz1YK9r8AXn+2wk3F1My9YHrHPs9t/P2+zfC7aTwpF96XF5IbbIg3X2IfH7z
         umGWsLpHBeILZ3y+L0xc4fFLrTYYGOHkA1d4Dn9PyoXEbwuYo6UQCi1ThU+Ko+H82SHL
         f0eTNpuRZVqtM3qN3V2W6W2/XinaMrcipr+qsEi1fHNOTp67aOv53/nsNVk1jX7RvsLj
         qRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tjZ69b9hxFcbktSVpwV434OeU24igr5zjHI3bGPYJis=;
        b=RO/KSbbuulNiGIOlUVCUQevPSCnW4/r2fEkZV9rLvET7OGwlreMr1cixoO/nTirm0c
         eJbVai3Dj7GvfzWlrgEiSCswY22mzc7+WtzZMZ5BLnqvkplWOutCDJLO1eDKINfIiQhv
         icBAlzqDFVxhfx0Zv4OBfIrODRar3wKNMayIvmvvwZNwftVqMno/ntg770Nxs9AM88uE
         f+J3FDU7HJx1I7t5tLc2FYgt5uXRsTh25T9w0lokaM7ua/pE5B1oxK5ualZN+FJI6YlM
         aif2fBWaXHOIEzQ5mK8wsFAAGtk/7IhhsjvcQKvfLxzg3J6CIvHIqDhlgLxNVxWY70xI
         io+A==
X-Gm-Message-State: AOAM532neWiWjd5y+aWiC72UolbpFGj/XUkvfWF4gCwEEO0lCjyftbj6
	ntTWyLq9Ir75QTT7UwQbeZzI4DHHm7R2XQ==
X-Google-Smtp-Source: ABdhPJz5OidpHOTwbywGpTvzXE+xAdqUuLYuORVr8mHw0pE6SenXsPS3WQbRcuJK03T/+ZaFakCLuQ==
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr11437608wmc.89.1616749796741;
        Fri, 26 Mar 2021 02:09:56 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id o11sm10933234wrq.74.2021.03.26.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 10/15] staging: rtl8723bs: put parentheses on macros with complex values in include/ieee80211.h
Date: Fri, 26 Mar 2021 10:09:17 +0100
Message-Id: <f0cc55b99577f28f4f08bc9c0346ec97997320c3.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
823: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:823:
+#define CHAN_ARG(channel) \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8a10bca876b8..80df24c1c6ed 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -823,8 +823,8 @@ struct rtw_ieee80211_channel {
 #define CHAN_ARG(channel) \
 	/*(channel)->band*/ \
 	/*, (channel)->center_freq*/ \
-	(channel)->hw_value \
-	, (channel)->flags \
+	((channel)->hw_value \
+	, (channel)->flags) \
 	/*, (channel)->max_antenna_gain*/ \
 	/*, (channel)->max_power*/ \
 	/*, (channel)->max_reg_power*/ \
-- 
2.20.1

