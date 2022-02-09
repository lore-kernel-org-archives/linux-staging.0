Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B82F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:20:28 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id t199so3690367oie.10
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MLbUj1+WmHsBpRePIsYDuUfH8mf0cZbbbnuejmwzm9M=;
        b=qYk3kQgpb35yf4/lPoDS2vVGGv5guIlpIz/GvFpVTdQFiUDDzSnIOVGIacsyDWIV05
         MGMTDDH+KrGWFyzekXoO0Vx8m6cN2Q/rzm0smw9EY+5hFQJ6kgvt/RQMyDiWru8XhK/R
         nQ80LHUozomMdgUi0V8RbLsKASJl530bP6YZgsTmVu/e31/NWpdAV7XJlY94uYr18QQm
         avbzxDx3yaL3v/6L+1qcCku4cCckaxJ6I5UnohgxhUn5+CgVdEAV7/LvAf9ieSi/+Vsi
         E04P5eekYUG6RPzsDRyNDOMb3Ex+BPkTaQ8erl8jCVwqd2S507T5VsDCAU3GysTkvV2D
         mM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MLbUj1+WmHsBpRePIsYDuUfH8mf0cZbbbnuejmwzm9M=;
        b=U+Ygz4V22YiJ2LSr4akMKu2woYTyte+VIFc0TiY7VWzoIxyiQLET0RdyCZxwWUhBvI
         OW9U5IWd0E6yP2vVDFoP855O6Tda0q+zv4vDJREILnv38q0CT8x6BtlY6QwrFurHaQZp
         X4ktfy7firuZQxe+Vx/jeqjfdRVW21Wv++fqrW2xNNPDmWauQBC9bGxPR0iQYs2rD1H5
         TtKL5Hz8Ix9qBV5RgTKcd5p8E2e0BNEwwx0wwKnJcwVeREG9mf7PIbqmwjBcNbHtaOj7
         +/NX1FQIhDEs2LyHhAYI3OdjAtKe/eHYVOeVI8LQWKAJAqRzLtGCRpGOBZgE9hADXFZW
         N80A==
X-Gm-Message-State: AOAM5301N4fpCuLLy64IWtCseO/N2ve5bsFInPGNDNblU3+OuqlzZpz0
	htUjWtuyUG7birnwspcDomw=
X-Google-Smtp-Source: ABdhPJx4gwWxXgyRsdL7daKlnXfpkyBdayhaoW6BvIlwKsm00olzFU6iKZ/jXm3RnzNCDkjuzyVJRw==
X-Received: by 2002:a05:6808:1890:: with SMTP id bi16mr1701247oib.1.1644438027901;
        Wed, 09 Feb 2022 12:20:27 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id l22sm7104120otj.44.2022.02.09.12.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:20:27 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Comparisons should place the constant on the right side of the test
Date: Wed,  9 Feb 2022 17:20:15 -0300
Message-Id: <20220209202015.29156-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c7e8602d2097..a9a5453aa1cc 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -188,7 +188,7 @@ u32 rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	cmd_obj->padapter = padapter;
 
 	res = rtw_cmd_filter(pcmdpriv, cmd_obj);
-	if (_FAIL == res) {
+	if (res == _FAIL) {
 		rtw_free_cmd_obj(cmd_obj);
 		goto exit;
 	}
-- 
2.29.0

