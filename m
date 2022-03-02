Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA76136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id p17so2605462plo.9
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=47enilufvb5BapansswjqF7Mys+r/uaDJhXNYG8WXSg=;
        b=XHOG96zu7g7EYkpVVmPw79Ey0bGouFPE6g2Hu6dof/IEIpXZy9wZMQZ41LjTzgoXmK
         yOvd2nsz9xRGFBF6yCyRWelXRaf6j0cq5cqh8vnGWI5EV/9h6YI7A6Lr/tZ4122I4jO6
         AquLeUk3Qtn3tdhARUtmTZq9cSdFmzOCwC4SPrnrLHOyXHndpci49F2yb5s9qJC/JP1Z
         w7UPO3wKmK+yQnn4aEtDn4SxMdrxsvU6q/AyJCtQz+UkMrTAy1iAFUpRt/+ME4+4TKXk
         TZr9xtUlRFY/DSA0xjvvEQ9ntd1ssP0+gXOPG9oNeu1H35O6wsovPUisgvajJlP1LoEZ
         z8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47enilufvb5BapansswjqF7Mys+r/uaDJhXNYG8WXSg=;
        b=YOferO1u2Rv6oS2rMjNY1HzLu2hpxFDiGp/tfiWTLfzO3JKAtIoZR1X5Wv4n+XLE/G
         eeRZvpiuEGRtxQeJG3mQ/X6Z7L55M2GLaTE9z8A3HR0qLONy88wAx5SrIZ5DHiLGLLtz
         11nBxklhJ9nCvCtnJgDy+hq6U5Tahl1sFlKGP5I+XY3ahV3yTigYAPKueQ0/7zsSKxqT
         bvJw+rNUJpbs6iyPJYVzwK2lXvlxoh0PBhznVvuoQXdnoB6Vegklf0FJHo9aKumYag+X
         0HcXnhRIUHL9VuoF8+FOp8vsLx+cwAgRmygfGn5Vtp2NWNg75pHFOkKJjY1+Xx26VJGE
         Bqmw==
X-Gm-Message-State: AOAM533/IfTLxO2cs9uCJg5FsCGfsXY2vc06kin2NZ4P4UrZhUIUiRSJ
	C+AduWUu/wKUC0rm1robGVA=
X-Google-Smtp-Source: ABdhPJxPbzO7jugROjTOhIAlRLlpI1xSn+laZgNFggGEHyCAuiLE6/hCUJgqp+4OXDkA7Vx3rB1CXA==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id n12-20020a170903110c00b0014d885905c8mr32843238plh.156.1646254105346;
        Wed, 02 Mar 2022 12:48:25 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:24 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 07/16] staging: r8188eu: mark recv_indicatepkts_in_order as bool
Date: Thu,  3 Mar 2022 02:17:28 +0530
Message-Id: <20220302204737.49056-8-makvihas@gmail.com>
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

Mark recv_indicatepkts_in_order as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 81ff22d0e..b6ab2db6d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1525,7 +1525,7 @@ static bool enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, s
 	return true;
 }
 
-static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
+static bool recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
 {
 	struct list_head *phead, *plist;
 	struct recv_frame *prframe;
-- 
2.30.2

