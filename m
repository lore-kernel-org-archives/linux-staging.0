Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7170
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo4406828wmq.4
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+B50OlP0mbNlY3ZpuKmy0PR0wesCkBEM9mRsTuG7r/s=;
        b=cLF4ZvJd3oOdxp12wPyevecFxL41FXAWHY3f1UviAUJXDUUcFvINtwbyScvRZj1jlQ
         Cf86zxWwvSxZ/fgYi5GPuEl2l0JcZZ0c3u83Nm9O5IclwiIs9o3ymg0sGA/UmBBL4d8a
         JeCkTxhwswCAwwwEFrV2aLPwAheRaV2lgWfiqoedA5QMLAbL00Ufw+DkwPFbl0vaRdCl
         +VBbU6m63q2NFGFh8LQG8iOtqJ7L5h0Yq9IZ5fzsUWCtcdeuugk/l+Eu/DmSs2ELyQgM
         BoByzIczNmhrsjGAHsILkTlfI2rQ+s9ADHMgLwP0NWV6FYvdGOMMSiX5m7cZr9LOTtnv
         w2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+B50OlP0mbNlY3ZpuKmy0PR0wesCkBEM9mRsTuG7r/s=;
        b=ky/L0e09u94FvLs70fHEQ6A72AlutcR2IYa7uvWO/pqVMV5TV6kdNUa/xbJacX+Oos
         6q1fVn/axH5UgwygGAs2QPv45zAKIuNlu8YNn3Cmh+vTGUR638xYUdgAd5U4bO7SIA/t
         2JyQmyh6gRG++/jj8Y0nKSNh7x7QPPzFmDsBj0sWMMrQqT5nIBBdkHMBoWT6pJy0/GC+
         1Ye/HRmsdFLCPTqmFOvoqRpEYCrCo6CZF3gI8Xbw/Q9H9CKallo+JZ5Cf3n2j2dv/mOk
         cTkBTXR+SMOxj5zMk1fIRU4cLf8y5nJ2P+zdsQHfVN9k+4w88rjD5RpdYjOam8MMG9oi
         BqZA==
X-Gm-Message-State: AOAM531uKfu7TrDsTrRSKdnNQyofrPH2/DwNby/nc7PimAN+xC3Bfw+m
	RI5+bSv6BRArDd/tsscbJWs=
X-Google-Smtp-Source: ABdhPJwrjvHrTxyH1wvye4zHOAGtFR5RswjYfPkun65j7gYVBS0FXwseHs1H51ogZCHqxJg9McbrdA==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr17384119wmq.18.1616855081100;
        Sat, 27 Mar 2021 07:24:41 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id u3sm19442096wrt.82.2021.03.27.07.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 01/20] staging: rtl8723bs: remove unused macros in include/hal_com.h
Date: Sat, 27 Mar 2021 15:24:00 +0100
Message-Id: <3914fc4c7182988c92b794357c7a3e4ef3b484d6.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros in include/hal_com.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 3629b912698a..dc023dd17534 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -181,10 +181,6 @@ enum rt_media_status {
 #define TX_SELE_EQ			BIT(3)		/*  Extern Queue */
 
 #define PageNum_128(_Len)		(u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0))
-#define PageNum_256(_Len)		(u32)(((_Len)>>8) + ((_Len)&0xFF ? 1:0))
-#define PageNum_512(_Len)		(u32)(((_Len)>>9) + ((_Len)&0x1FF ? 1:0))
-#define PageNum(_Len, _Size)		(u32)(((_Len)/(_Size)) + ((_Len)&((_Size) - 1) ? 1:0))
-
 
 u8 rtw_hal_data_init(struct adapter *padapter);
 void rtw_hal_data_deinit(struct adapter *padapter);
-- 
2.20.1

