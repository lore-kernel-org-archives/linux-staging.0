Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0E259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id k128so4593752wmk.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SpB21ddvVB478zlEeuyOklnuQn3Gxt8QZHrAoTlf3oo=;
        b=HctwjQkHD+k+CMCkTVYI/r1VtxPV/Dl8a+E7V5gjsSxwQTLlAA2RNaWAtOUZcfskOe
         8s107K+GenCYTcWFuiZZdFQns2X35RlGiDgQek4OWDkQj1kIWTpPa5ml9cchEoizbcTG
         GSyXx4phqUxahIHTioI6QfKCwiuOTgVz4uP9Y1qeK313yZsIPCHzzw3/TOnc1AyOeNfg
         mVGaDQyqbLn/lqacVeIqfu5gz84xmTEifUkJYpp8eENC7RcS9fzNPJkpVAztLjh8LKGf
         AOsyqGfdFDBNUB7Z/Q0IhsckV0UrmLl5hsJoSg3yRbjPWG05oWFKThQR/F/zsDn2cbR7
         LTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpB21ddvVB478zlEeuyOklnuQn3Gxt8QZHrAoTlf3oo=;
        b=OD8bAeiQAalM30raPYdmY9p5INgcO7SU3z/agApQnmOlM1WjL/X02ejvlcd9UXIN5x
         2+d98sUUrtZMkDsNqi6tQh8n64aaEnMZVr6AYyXSgO5uDMnfLiJnvu1N5itihewqxapv
         T4vR9f9lhI4fozeUP+hJDImbBGGBFjxQ0WHggdw5CG/shURWCeyq0jJPgVSCQCGvNYLW
         ISbhAlvlqXrBiwQAfXVajYkoq14dzGH/ClF6WX6XlP7xdU0EWqaPC8p1hO4DgjGonZJh
         mNBUiLKCGK1wNecZX9HwiB9rn3P/uwtrLC+PBxRNtPU8QGeVU6s5qSqet1npOgoCdhAg
         0NxA==
X-Gm-Message-State: AOAM531TUXjoYJempBwLQk289DH95smozHY/zo0I/7rXq4BhliSgjGhA
	HSD5v8rMP4KLJX8hRp1f8Iw=
X-Google-Smtp-Source: ABdhPJzZGzMgoksgLI6Bqv2AottamKK5PDZ3HLN0LB7ke1JgauaX5zqFmR/qAkLAhTNwUW9MATZrWw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr21219632wml.123.1617545398905;
        Sun, 04 Apr 2021 07:09:58 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id l5sm20022342wmh.0.2021.04.04.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:09:58 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 05/30] staging: rtl8723bs: fix spaces around operator issues in core/rtw_security.c
Date: Sun,  4 Apr 2021 16:09:21 +0200
Message-Id: <9143a02ae6959d4deae6c22bdba42041bf6484a2.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post commit hook checkpatch issues:

CHECK: spaces preferred around that '-' (ctx:VxV)
25: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] ||
 			                            ^

CHECK: spaces preferred around that '-' (ctx:VxV)
25: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] ||
                                ^

CHECK: spaces preferred around that '-' (ctx:VxV)
26: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:730:
+			    crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])
 			                            ^

CHECK: spaces preferred around that '-' (ctx:VxV)
26: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:730:
+			    crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])
				^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 663a8ea199ee..6c74c0444abc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -726,8 +726,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] ||
-			    crc[1] != payload[length-3] || crc[0] != payload[length-4])
+			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
+			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.20.1

