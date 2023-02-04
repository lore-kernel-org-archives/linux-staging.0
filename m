Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B61FB3
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 10:17:02 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id me3so21707439ejb.7
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RXm6Lsoznyg1+l0w/MAUy9nfuZ+z0HNP/nxhYlCK60=;
        b=jDQR2YXBY0vow0iYqDSlsL/5aCNCEeXev2H38cUYTDwmI7nDy+HUF69bToCKQgrmlb
         5T74kOp5VvKhzuTapNB6oj6uC00CFOlYcw8R5pzeY/9wi/PoOo3yjrjzYp3CORNTxzhS
         pomlTYRsMYj5cZJZwGJEukf4uf8IJ/7dohuANCAqrilAVXWYA5twsbLM9rERkezq3oIU
         GeJvoh3cneNmBQ+xTqR7i0g2F1+j7G0+exwBGyKHJFg2lRZHIbU9RtelYaTuIF7zwSNW
         +hs0ox6l7D4JgzQa3B9D3+qITF0p+tRkgrMO2pdqHqN+h1ONkwE5TaNoBl9YZyhsle1U
         PnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RXm6Lsoznyg1+l0w/MAUy9nfuZ+z0HNP/nxhYlCK60=;
        b=ebWtEVhnFHowPZH1a5D7XSiQap9Fd3h/3HDf09CDROeJQeJjUhLWj9AVaOSlnVF5Mh
         1pmvpw4hxBqBBdUk5iDBIrmkhnQMZM/7PWrdh0HHKmKEW9ATSKkZfq/CyggYAcs3tfbc
         1HBVvSbqg8LBVkhI0BRRRJQxDt+mGzSGJReiMXtF6SfXTJEoU65pPmxTMH3uDxtv8/yV
         LKGbByzr7EGMKk8TdL/vCbvGr5DP4Gy1txufg7VpXY9qPCMra1JQUEmg7HhgyniMXWak
         uZoH7tdIXOdF2/QEmRvADnRoFs3fC+8m0D7CQucyLOV/nuTL0HXR5dljExxLQv281yP5
         o+Jg==
X-Gm-Message-State: AO0yUKXH8CfGyKZo4KoRBLZfI459n4ZZVuqghBEpv0WR4sKVOhFt5u4t
	ZyTRWhGzbA0/z9ln1R6DQU4=
X-Google-Smtp-Source: AK7set+gTHDdvdjvnSR1lvMyEf6oJzMST6F4DGgd9RoQt4+ql1Hwm7WlSWnmQ/u9ST7VV1bbKBQJ1g==
X-Received: by 2002:a17:906:4993:b0:88a:b6ca:7d3d with SMTP id p19-20020a170906499300b0088ab6ca7d3dmr13003608eju.8.1675505820728;
        Sat, 04 Feb 2023 02:17:00 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbf9.dynamic.kabel-deutschland.de. [95.90.187.249])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709061ed300b0088ed7de4821sm2632378ejj.158.2023.02.04.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 02:17:00 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
Date: Sat,  4 Feb 2023 11:16:53 +0100
Message-Id: <20230204101654.10232-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204101654.10232-1-straube.linux@gmail.com>
References: <20230204101654.10232-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtl8188eu_init_recv_priv() away from returning
_FAIL and _SUCCESS, which uses inverted error logic. Return 0 for
success and negative values for failure instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 631c500dda42..70d43c10e53d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -38,7 +38,7 @@ void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 {
 	struct recv_priv *precvpriv = &padapter->recvpriv;
-	int i, res = _SUCCESS;
+	int i, err = 0;
 	struct recv_buf *precvbuf;
 
 	tasklet_init(&precvpriv->recv_tasklet,
@@ -50,10 +50,8 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 
 	precvpriv->pallocated_recv_buf = kzalloc(NR_RECVBUFF * sizeof(struct recv_buf) + 4,
 						 GFP_KERNEL);
-	if (!precvpriv->pallocated_recv_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!precvpriv->pallocated_recv_buf)
+		return -ENOMEM;
 
 	precvpriv->precv_buf = (u8 *)ALIGN((size_t)(precvpriv->pallocated_recv_buf), 4);
 
@@ -64,7 +62,7 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 		precvbuf->reuse = false;
 		precvbuf->purb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!precvbuf->purb) {
-			res = _FAIL;
+			err = -ENOMEM;
 			break;
 		}
 		precvbuf->adapter = padapter;
@@ -94,8 +92,8 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 			pskb = NULL;
 		}
 	}
-exit:
-	return res;
+
+	return err;
 }
 
 int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
@@ -141,7 +139,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	}
 	precvpriv->rx_pending_cnt = 1;
 
-	res = rtl8188eu_init_recv_priv(padapter);
+	if (rtl8188eu_init_recv_priv(padapter))
+		res = _FAIL;
 
 	timer_setup(&precvpriv->signal_stat_timer, rtw_signal_stat_timer_hdl, 0);
 	precvpriv->signal_stat_sampling_interval = 1000; /* ms */
-- 
2.39.1

