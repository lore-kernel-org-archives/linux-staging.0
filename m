Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816923AD
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 08:06:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id fi26so8828589edb.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 00:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qziGg2cSFU5vnpf88of+jda4n8gpF/R4RPkurqZxdw=;
        b=Bq4lNcFeMqwx8VXJ1FRr0MF65ZNSu2CaIR/OqWDdfZ2tSFEE9s3VLCGICyvbRhk28q
         pwpj5lwOiVIK8DV9TEEWHy/5UaSQNXqezvNwQu5ibuXrgdVY14ajHD9FLUq1XjQLkPlt
         AS6MRm9t7lERH1hjm48I3qrXq/RohGd9I3/cBfbgA2ieDaN7I9GEa021YiyKM5ARYabv
         v3uy9g7If4rzB/dXmGxS54YHjdUja0kNaP+guHOKyQgnS8leg0xGZoLIOTED73/g7rPY
         /LryiHeO6O+SV4Tc9kDirM38MW7LohrEUUQdaIm823ule0ys3tG0pd8RHIQdQQYHdXy9
         8QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qziGg2cSFU5vnpf88of+jda4n8gpF/R4RPkurqZxdw=;
        b=zZmf6jyu8rGZbIzetPFHj3jk6IyLogkz+RSYygxsZih85s9QQPidcFv/zCmQZg5Ztg
         nW8VDaD+Pi0VUz3DKAyEVuJi6SigyPaYlXINotm1LgNa/XrWDoFpHKX0mxJovJ/p8e/k
         od+KG4t09l6h/dsZshGJnrJEe58Cu1IBq61dY7iFnFyO3tPgORqdo+o2mFeqLijQBitx
         Jd3wPRu/4RQZToib22Pt/kqfqub0OWN29R4CHJ6r09oiQRtGNCVSBjx4Bt994guki4xb
         sFzXywTNoBQ4IiFUMohJbp+1p4S8U2rojPGhUfYhP2MdQpxI+UP6ilPL3Wa1OYNcVbRr
         Sytg==
X-Gm-Message-State: AO0yUKUNQQynQdFIwf4A9DKzyjEldCelASmUywSn2eK6NvqfPH1nUjB7
	z3LHTRNMYGsjONdWMUIUmuc=
X-Google-Smtp-Source: AK7set82cocJLwg7jKmHkAnixiqqMkQbGSEdEbxeR7NAHASHAVwBj7PQs1ZU1TJyFEqPpH351NaLWA==
X-Received: by 2002:a50:9f26:0:b0:4aa:a216:c15 with SMTP id b35-20020a509f26000000b004aaa2160c15mr4058858edf.10.1675584371450;
        Sun, 05 Feb 2023 00:06:11 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbf9.dynamic.kabel-deutschland.de. [95.90.187.249])
        by smtp.gmail.com with ESMTPSA id q10-20020a056402518a00b00463bc1ddc76sm3441379edd.28.2023.02.05.00.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 00:06:11 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/2] staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
Date: Sun,  5 Feb 2023 09:05:58 +0100
Message-Id: <20230205080559.8319-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205080559.8319-1-straube.linux@gmail.com>
References: <20230205080559.8319-1-straube.linux@gmail.com>
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
v2:
no changes

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

