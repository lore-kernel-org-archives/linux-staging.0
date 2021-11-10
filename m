Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBFB2C82
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 18:17:27 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id c126so3456244pfb.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wst9WkhAE8w1i/iSuQ87C93Angtcy1Vxyzjf0uVZUto=;
        b=asUSG0RWhW2jWvbq6j4Ej9ikPSJaUQSEOYrJMLM0+6I1GuHPOGWkSiwni4tKNBOQvx
         JWYtr0LqOfW0kNrFuGCK015moQRZtxfPsCtcP2P9kQNQEE43W+NNxIC50h7SpIkAxknW
         6CJ6oTFwQIgvJKWuG0WaoxSKqPBxa5cMhYAQFY7nG5UsEveLi9kHC/n7izVoWK9UMWmG
         L+kCo5S4vf7v7Ih9TASliMzze94ck6dpK+NKzxJjW+WgUMyCvLgRKSkiCn2yrTliAXQE
         T3j1PcCZ+Co0b5QE8mEh4fHL0sf2btHtjb01yDHrr+aQ+cBI1eanf56NrPeHLsiblh94
         jJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wst9WkhAE8w1i/iSuQ87C93Angtcy1Vxyzjf0uVZUto=;
        b=AKGBY6Vq+Xf2W1tKOaWd/UaLB+WBRksiCFlPvsM2jT2fK2IHpoia6Zht9Ltyg+lu+R
         bAXqK+dgIKUj12vVSrkx5k0zRF8KFYCLrT2EiwG6l8D0dCxyrLVot/yg1RgcUuJvjIZT
         FUUe7DjQKN4VxImyQ8MiO09GttqgihPsKZM1itMefT7oS2KJWFJeAziV/BC7rXGERnPw
         VQ4Z+B7CTJ0GiNReAA8GzH+1BAgUr5DtoIwPRGcdo3OG6NfMg6udoyyjok+szT/4Sj4n
         GIwzxq+jfnTrg6Tfk0Croo2xr9daN5+NnouEzPdA8pT7wMaIsMaWXD7Ki2CzEJowIygb
         fdgw==
X-Gm-Message-State: AOAM530RgXtL0vNtFWF8yYf30BU8eYMnkhe0qF1ElJrTkTIukvpocFjZ
	DvkF3pN63xluqNrNSDYLdXnEd8QrHkc=
X-Google-Smtp-Source: ABdhPJwrYIjMbU4ewGuA3wIyTKMdc7otU+FFoJxpWYkloMx8VIiOCMTVADOkxI1xhRdMOJbIgCIang==
X-Received: by 2002:a63:7e42:: with SMTP id o2mr549436pgn.296.1636568246842;
        Wed, 10 Nov 2021 10:17:26 -0800 (PST)
Received: from Sauravs-MacBook-Air.local ([59.95.84.75])
        by smtp.gmail.com with ESMTPSA id nn4sm298205pjb.38.2021.11.10.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 10:17:25 -0800 (PST)
Date: Wed, 10 Nov 2021 23:47:15 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove goto statement
Message-ID: <YYwMq15pQYf7nvt9@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the goto statement from _rtw_init_recv_priv(). In this function goto
can be replace by return statement. As on goto label exit, function
only return it is not performing any cleanup. Avoiding goto will
improve the function readability.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 51a13262a226..b38af76f3a67 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -58,10 +58,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)

 	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(struct recv_frame) + RXFRAME_ALIGN_SZ);

-	if (!precvpriv->pallocated_frame_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!precvpriv->pallocated_frame_buf)
+		return _FAIL;

 	precvpriv->precv_frame_buf = (u8 *)N_BYTE_ALIGMENT((size_t)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);

@@ -89,7 +87,6 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	precvpriv->signal_stat_sampling_interval = 1000; /* ms */

 	rtw_set_signal_stat_timer(precvpriv);
-exit:

 	return res;
 }
--
2.33.0

