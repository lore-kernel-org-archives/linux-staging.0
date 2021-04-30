Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA2B2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:01 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a4so10478825ejk.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=DEmJypMjFobuOJ5XvhfnQZxA/esaVQyTR6yeWPnguY9pNzbHanD/tLLGrLbG1UGIks
         y9Mgd5AxPMDaKgzIfuSfpP8XDLNFJDY8XCgIWQGWpru9Xks0WSvAbhqSB+Q84iumQWZz
         Pf/gw2LFTJYRVtx+Sv1rMCqvKTCsy7PagZ5+yhMzVSpn+GZRRu3Nnh8lyOprAEGQcIDK
         IkP23cwgPhI5aA6qf7iqwg2iW737XzDIITh6cHFdJ9KAnrcX9I4g6LjziH3ZAbBVOrua
         GHs2CorUzxsM/lk/zEdGTHowgP6jPdp/u1/u8axH79PSXpmgs346p21Ex81Nw9vQf2Dy
         cwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=CQM3Bp00vnSwORkJ16h3GgVAxcZbd2ExKvDADeHI/L9OijUlyhdgIZj2DGqInfb8HJ
         cXdEh0UjT9SG5dTfxmiaoUuysJnNXMg1G1B64IQJ0GgmuuiePYl7fDrHjdB5MJZgA0Tz
         sRQxreiRNj5HMOeYynWP9sIvAOfD6/0qQag+q7+6xJwmIUVCTaijQ5GlcL7dDMcjBdNa
         WFZQE+yDlR8rxGfMWqpknfylOBPZeF14APP6SHeCE4q9BsK/5smLyCstouvCC7HSQ4PO
         bgC9oMMJ/5eMu5dqfj/NuM1r0bIDlaR7YDStr/WlAwUqRdZ6Vo9VR81i5ySYvcynUeRZ
         lNzg==
X-Gm-Message-State: AOAM530Vn9TYqt1Pr2Vt10q/AD3hXD4P0LoaEZ1HpwsuMqATpHhnGywM
	pyJfgBP1N9UGi+kdPKCE4fo=
X-Google-Smtp-Source: ABdhPJwU1vbd6lj4zVUm60cea18MSzq0YMBZ3IoSjLRGzRBSS+aXfUvXO4vdpXsrhGQEfziQ+xqZdA==
X-Received: by 2002:a17:906:49d3:: with SMTP id w19mr2917343ejv.116.1619768700325;
        Fri, 30 Apr 2021 00:45:00 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id hg24sm220684ejc.99.2021.04.30.00.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 33/43] staging: rtl8723bs: remove unused enum
Date: Fri, 30 Apr 2021 09:43:51 +0200
Message-Id: <61b92c9d686c28c77c591a82b18c44a85d2d4c8a.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c5444f965699..c4616a69425d 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,12 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-enum {
-	BTC_MSG_INTERFACE	= 0x0,
-	BTC_MSG_ALGORITHM	= 0x1,
-	BTC_MSG_MAX
-};
-
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
 #define INTF_NOTIFY	BIT2
-- 
2.20.1

