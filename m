Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89A6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 9so2618895pll.6
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wPdZrUH5dC0tchGf5qzbOv7p7DaHnxymvDfUAfQt99o=;
        b=AssglXsU9fXqZvcQQMStPSUTOqnOLUBfpeChIVkRC8RJ04DfEN1n4ffaZxZDXr/JqA
         FKhbYNI+qetaonyUNozQ+w7hZ/3WoB4eB5x/iQkQtXH7WFEnbcy9drt6e7p4O52gby+w
         xenmmadIDhsIdObouASmKIRDLJc8+B4tiSkb9aFD4g107xbfIZvSc36PqFwAxYl4EfAV
         21aWQbMLpDxXCJFb/wVVZxdNdjfd/a/EWc81aGQXdw8tmtanEQ/jX5Bff655thN1z+0+
         C26cZMKevoRieTHgLMQy3p1jW8Rt7o0rLTx23WTRDSzjo/bHDcjpZ93lYX8cvflgbVLl
         MfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wPdZrUH5dC0tchGf5qzbOv7p7DaHnxymvDfUAfQt99o=;
        b=04vZzg3sl9PWegin5LAnk1rG5OY/ayV/kAHwPsLrhJK3nO0yx9sGA8pV0ejtC2IVNm
         5mf6R98KmH5q4HwCbeiP83dbtqUiq4yv7Z5EAgwEacFDLlE0FdAZlTEGz1xGP+cr5PIQ
         dZtL0XDPfb8tQM1sUcLA0iYZh3arWuXOP7vdspOj6P5dbc5naKkYWZs7TPhaQWjAJraN
         xVc1Mg4EG1ADtf2wuqdWfLoQ5agRf7tyTEJUa1MjV132LpfLoVxkX10nK3FfGmdr9BSq
         Ya13pNAGF1O0gkhUVWcR79Deo7VIhKGeAzSM1YCROg7XCXV+tUikIlg9rrjAXu6go6Pw
         +OWA==
X-Gm-Message-State: AOAM532iXHguw51QhytF9rd6x2zPZru4AMkvhyPf7jxymmfmCwXb7GCu
	tt3JwG13TWk8u3FMTo4YRe4=
X-Google-Smtp-Source: ABdhPJxV4TiR8bEBi8TABZ3dwLLR8EJMJMQJ+fYe8mWXWi1F+cdmXEicbSFUJE6Nnf+gUdc3vLp4pg==
X-Received: by 2002:a17:902:d4c6:b0:150:15ed:3cd9 with SMTP id o6-20020a170902d4c600b0015015ed3cd9mr31948269plg.2.1646254120907;
        Wed, 02 Mar 2022 12:48:40 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:40 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 12/16] staging: r8188eu: mark rtl8188eu_xmitframe_complete as bool
Date: Thu,  3 Mar 2022 02:17:33 +0530
Message-Id: <20220302204737.49056-13-makvihas@gmail.com>
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

Mark rtl8188eu_xmitframe_complete as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 2 +-
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 69b66eb45..55032d7ae 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -376,7 +376,7 @@ static u32 xmitframe_need_length(struct xmit_frame *pxmitframe)
 	return len;
 }
 
-s32 rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
+bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapt);
 	struct xmit_frame *pxmitframe = NULL;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 85eb0aad8..8adb672f7 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -143,7 +143,7 @@ s32 rtl8188eu_mgnt_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_xmit_buf_handler(struct adapter *padapter);
 #define hal_xmit_handler rtl8188eu_xmit_buf_handler
 void rtl8188eu_xmit_tasklet(unsigned long priv);
-s32 rtl8188eu_xmitframe_complete(struct adapter *padapter,
+bool rtl8188eu_xmitframe_complete(struct adapter *padapter,
 				 struct xmit_priv *pxmitpriv,
 				 struct xmit_buf *pxmitbuf);
 
-- 
2.30.2

