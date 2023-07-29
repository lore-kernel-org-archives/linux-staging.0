Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBB1FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:19 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-94ea38c90ccso79506066b.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617198; x=1691221998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z67sNb2ca9lHFDIHurmdit1dilARScJ78IbTHBwj2o=;
        b=JoAMObnuHO/2LNJ6xIuJ89HH9EW+jUz5zpp1GKfmrK4Wsp2Xk1yJq9dRyyYVjMjHW4
         /U6QqsFzDGsjuo9pbb2+dQXHhDLcRbEigBe6tcTmYN++TrM6t0FP8ZlhKOTfl43YoMvf
         0Rv+hthKNOdIanzQh2EOZ/pxGJjdKN/7mE0G/7P3vg0yRJ/g2Scp+PK6E4+zMub5WAyZ
         iJY6qJXRdNHoYXf14Hz73LKAEYqVeToTGICm7wf65oAIzeLnrzuxO8yUV9r0t1NZ40jx
         o5a6v4pNOz/pIjs584ukuUk0BDQXjnAAJah2VF+ID2Ff89SAOY6Kehy/2hjgeG3LW01y
         ny4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617198; x=1691221998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z67sNb2ca9lHFDIHurmdit1dilARScJ78IbTHBwj2o=;
        b=ZLrALe5XNg8OCCA6pcfYd4parAmzNX94FdW8YK/mNi998Cwm6R4SfcFbAabuZvuDHG
         W45E7+sV7CdYOBJrXNXMToOty+QAHoMzRGT2A6tbcka7tEs84ksXol6Cu/+kvs62aKAu
         CEnk475sz4kyyhyg3AaQO2333/64t5Y+ii9VmdcsUwY1Dasc19WQies7FENUAgWkboxS
         DSvX8XFEkRj5b1RXOV/H6GwAiLr+Hf0Rfl7p1SLEBzKP0BRWoRk8OUTsqxrYGKZOetUh
         WtDmWT9V/vQMrkDz9E6XwEt7Ev3xVJGm9OqSo5Jtt4tuAHXII6foABnI2ULeijkTzuAb
         bzvg==
X-Gm-Message-State: ABy/qLYFLblcDRRFT6J3hlqZasiayIVK7QeUKA5gQzNzTk9CDykv50H4
	4V+9Of5G4o+VFMalr/E99KE=
X-Google-Smtp-Source: APBJJlEHiNukjkWDySoFY2Jcu0Co64zuCrz4VCeELVb5MMsnneo1ivRg9/tHI0Ut/PR8xhHi1PG4og==
X-Received: by 2002:a17:906:64c9:b0:994:33b2:c32d with SMTP id p9-20020a17090664c900b0099433b2c32dmr1197040ejn.5.1690617198132;
        Sat, 29 Jul 2023 00:53:18 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id a26-20020a17090640da00b009829dc0f2a0sm2992359ejk.111.2023.07.29.00.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:17 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove unused variable is_mesh from
 rtllib_send_probe
Message-ID: <5b1f4b9d8f81790c151adc7f9b6611f0b5cd94a5.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_send_probe() has unused parameter is_mesh. Remove dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 584371f0ce57..06b872c1ad68 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -449,7 +449,7 @@ void rtllib_DisableIntelPromiscuousMode(struct net_device *dev,
 }
 EXPORT_SYMBOL(rtllib_DisableIntelPromiscuousMode);
 
-static void rtllib_send_probe(struct rtllib_device *ieee, u8 is_mesh)
+static void rtllib_send_probe(struct rtllib_device *ieee)
 {
 	struct sk_buff *skb;
 
@@ -464,8 +464,8 @@ static void rtllib_send_probe_requests(struct rtllib_device *ieee, u8 is_mesh)
 {
 	if (ieee->active_scan && (ieee->softmac_features &
 	    IEEE_SOFTMAC_PROBERQ)) {
-		rtllib_send_probe(ieee, 0);
-		rtllib_send_probe(ieee, 0);
+		rtllib_send_probe(ieee);
+		rtllib_send_probe(ieee);
 	}
 }
 
-- 
2.41.0

