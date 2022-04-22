Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61242C80
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b7so12978028plh.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QZuIM4H3I0u7C5gWHQSYMoqDFBwcnj1tL4ssQv+FDjg=;
        b=C5zEIjuqLhF0O8OKX9K3xRWoxxaX+MOE9Ljz8iGorUw8xRiMnnoQ+N6zMUdHp+R4bz
         XUqG7zUmnB7keraNYNpA+u8FegVcu89NqRIVShyydZvHVFAJL3TzjPV+cIi0MtsfqtJm
         xCDtdDYK1ixaLhJrwfGmKs1LiHox8dQvj9mcsFEm4mYSk2efgLph5d517g9hn2ubTCcZ
         ahGV56nMA5IObW2QiQ6UuEdOmzxrHOaWbYn/bxMcw85fHfiNOBIq6Ze/C316rNCSqGZ1
         NxRkvaCrN/IvWXZOTV4bCaty8D0D+Ldsl+2ubaMG3D8dZDXuzEEY3sDXecPilgMXMUxL
         3r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZuIM4H3I0u7C5gWHQSYMoqDFBwcnj1tL4ssQv+FDjg=;
        b=y0IM7mX/aARaqDfbQetWgMt3m/qqvKzRJmUAmtdCMCc+h+SOf/qBID/wg3flalAHeq
         JYoFJwX7wnrAyWy0Fzw8PTmAvNZqjsYZkL1qzxoBAkqWHcIeWP2dKjKuNGjNDOMAC3gR
         Gnu/lKkZS9hJ/YtGTwTVHT81WdbnqL6nRkSyUqzJnzfaNWAsdlZV+HVLzeHpD/UyGTPy
         1SZgeRgMVRI5w5U9Evr8XjZxOYUyPZXHqrOAQyvF97hp6Uwvxg8K9ifFWoceLsAmBzP0
         +DpgBfQj06HBKUdIQQWtsvDwUaPtPP6O0vw4Upivr65JWaJzt7aYZ4jfXCeaHmqIOG9A
         Quhg==
X-Gm-Message-State: AOAM531Wme4sdEBC5TwUuKSuj/K3VHwuzb4fkXJ8eFuEXig0QEbnie/f
	VUPRaIFNnfp3YWC5xcTgExXszD/qo4NrFw==
X-Google-Smtp-Source: ABdhPJylTXse+Ff0tFYd/5CXjfUZ59tlKiBuN9JUvi6oAr0HbyHIegGeg/CVnJp4qYUocR2Z79wWaw==
X-Received: by 2002:a17:902:b7ca:b0:15c:df6a:be86 with SMTP id v10-20020a170902b7ca00b0015cdf6abe86mr1095811plz.70.1650655957313;
        Fri, 22 Apr 2022 12:32:37 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:37 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v3 1/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
Date: Sat, 23 Apr 2022 01:02:17 +0530
Message-Id: <20220422193223.11948-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422193223.11948-1-makvihas@gmail.com>
References: <20220422193223.11948-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_free_cmd_priv and move its logic to
rtw_free_cmd_priv.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ebe2479d1..32589e76e 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -87,14 +87,6 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	}
 }
 
-static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
-{
-	if (pcmdpriv) {
-		kfree(pcmdpriv->cmd_allocated_buf);
-		kfree(pcmdpriv->rsp_allocated_buf);
-	}
-}
-
 /* Calling Context:
  *
  * rtw_enqueue_cmd can only be called between kernel thread,
@@ -159,7 +151,10 @@ u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	_rtw_free_cmd_priv(pcmdpriv);
+	if (pcmdpriv) {
+		kfree(pcmdpriv->cmd_allocated_buf);
+		kfree(pcmdpriv->rsp_allocated_buf);
+	}
 }
 
 static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
-- 
2.30.2

