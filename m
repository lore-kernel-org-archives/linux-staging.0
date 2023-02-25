Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19346566E
	for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 18:20:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p26so1785172wmc.4
        for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677349228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnW67Brym0rTte3s6ZMNuvgQG+ROp2tdxsefdMGNTV8=;
        b=NZhcDZDfytB893Ktd/pgFJyS5ahFaO1+D8YiuVboSS1NRtFIFqvC7NbTVO26Poy9vh
         aKJsl3ZroXTJW48lFFMibRguc0s5hXa3w9361UGaKcAvq9UeijVYp4biKlP20EzyIMLn
         erVJYuvHniXd+e22QumfXwggItsIJYK1GN+Nl6esitBjv/F8Zl00uUFIPPopAmXQYN9g
         OUFysrssZYjk+GJHqVLUJ1VcspDApi0OyubNVRgkW4EeOWj1nqmY/UVp6tIm1zRrJvPf
         0opy3U6HIPCBLS52fQErc4Gs8axo/XkaNj9LkdhU0jz6pJor5xu98i3eSPwUquE0DhrH
         cDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677349228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnW67Brym0rTte3s6ZMNuvgQG+ROp2tdxsefdMGNTV8=;
        b=tEkUdQ3AgCsQ1Pvh5/riiD/ZFHdWEeL+yIBKgDXOFz8S/S/saZm7s38flwOwThortg
         n40BXm2s6MCkHOcoqDbWSynJ1bT9MuvPC6ls53Js7K7UpnYHve2nSrMBwxr3Wr21fvWq
         2E3k8k8vIoQMSuJIif4Jk0jMqHjfWd3jJuj47tihciz03l4eGD5tOne/Mfd1+XZuyvIY
         XU96YV5uCjXjTTZ0V/Y3TK02n4JGUgVpBws6OBM6hiEyKW3hPIA1aO8wSknX459hR8CW
         eyGtEW3uvegsgdL0XO3cA4oczXBNprtkFUpXtDgEKGO2s7t/YJP6o3+boZIscgwdSoXx
         zTNA==
X-Gm-Message-State: AO0yUKWWUEo4y+MQBex/LD3KvPEySlC2a3vfYfEJCNNkNuz4k+NKMONb
	DGc2Ob4VUiG8NYwqt98johA=
X-Google-Smtp-Source: AK7set//DJNiYuqmzRGc0wVCg3vVA36d1USP3IqRtTSm1hu14l4IsefYh2k1ElXOxwCD08PiWjeFtg==
X-Received: by 2002:a05:600c:4f4e:b0:3d2:231a:cb30 with SMTP id m14-20020a05600c4f4e00b003d2231acb30mr18386165wmq.3.1677349228365;
        Sat, 25 Feb 2023 10:20:28 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ja6-20020a05600c556600b003dfefe115b9sm3486834wmb.0.2023.02.25.10.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 10:20:27 -0800 (PST)
Date: Sat, 25 Feb 2023 19:20:26 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8192e: Remove checks of pointer to
 handle_a.. and handle_b..
Message-ID: <5c0fd114c24616bc03271ccb0a72a6bc68e45d61.1677345331.git.philipp.g.hortmann@gmail.com>
References: <cover.1677345331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677345331.git.philipp.g.hortmann@gmail.com>

Function pointers of handle_assoc_response and handle_beacon is set while
executing the probe function. Therefore a NULL pointer check is not
required. Remove checks as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c      | 4 +---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 669e74a67190..35b36f7c0f28 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2689,9 +2689,7 @@ static inline void rtllib_process_probe_response(
 	    is_same_network(&ieee->current_network, network,
 	    (network->ssid_len ? 1 : 0)) &&
 	    (ieee->state == RTLLIB_LINKED)) {
-		if (ieee->handle_beacon != NULL)
-			ieee->handle_beacon(ieee->dev, beacon,
-					    &ieee->current_network);
+		ieee->handle_beacon(ieee->dev, beacon, &ieee->current_network);
 	}
 free_network:
 	kfree(network);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 2552aa089700..d697089e0cad 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2241,10 +2241,8 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 				memcpy(ieee->ht_info->PeerHTInfoBuf,
 				       network->bssht.bd_ht_info_buf,
 				       network->bssht.bd_ht_info_len);
-				if (ieee->handle_assoc_response != NULL)
-					ieee->handle_assoc_response(ieee->dev,
-						 (struct rtllib_assoc_response_frame *)header,
-						 network);
+				ieee->handle_assoc_response(ieee->dev,
+					(struct rtllib_assoc_response_frame *)header, network);
 			}
 			kfree(network);
 
-- 
2.39.2

