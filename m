Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C8F9F3
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiwOyxyq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9c6f0530929so74968966b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297516; x=1700902316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vxxrVa0KzjOY+CRU8JP3B25+gW4kOUQEfZfS215afM=;
        b=SiwOyxyqJoMkJUtn0SnMn2R16ANW7cu3sHidaaISRhpQZQ+Lt9G8p2v/PzDpbOgfPx
         31HV3kk+QynCnwVBg/kLUE8tMXUObj7BjN/KTPZkbJTjmH96lPY4znZoodMwcD/eKJSb
         cVf9NxUCM/77aPo8ssPAb9jVpxu7Nhal0ZQXTkm1B4mYtajVGgGt0FRciJ0fUk2tuCFt
         uFA3QFHgc6FAayPfWlPDyyoEdwayNCLhKGSCU9+0Jj01IqvEg4TBhyiFe7WjKQluV/Kw
         1+ZsHL3Hx5yf9DwiCZS+Lq+fiGodEsDErUAKifw3X49QYspyl6RlVi8+VPgDBJU4r6Jr
         v5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297516; x=1700902316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vxxrVa0KzjOY+CRU8JP3B25+gW4kOUQEfZfS215afM=;
        b=sbV93hk2JYrkl5MAKglk8LNrIzRh9p46OT1Zqr4YckBmeyofCT4qUtiJeOTqtHNS7n
         BPopRZbGps1Fz8q3xosfrMHIPOSqbR+rICJfVtq5aIplVFp03wriGmvZW9DCzae5woym
         IoPAkX27X2rdtY2qNmVk46Tr1+ahmSyznve7InYAoPwvU3Zd5zxloOlmzRa/dgbAIJhJ
         0xw9TbU1cLz1HRC/EeZ9I2VVmH7bDiAELxrTHqSUNUOJXToiVnKZQnySD2eFusl3r/TQ
         6XcvaIdwOJ83AHOM/YqVW55gIbOUzxRgF3qpVIPULWE4rU6rbFt6+u2mMvHUH7XFAY/1
         mZ8g==
X-Gm-Message-State: AOJu0YwF/YdK0x6FymB/ebtyMq+ZIfCIlAdd/IRqhCkTp3HiViza4lwK
	hVzuYwVDXOkszYTZ6YWLHBDT5vuvGRo=
X-Google-Smtp-Source: AGHT+IFUVtH44rCt4LCqcxa/bLquM61Di/hm60eUMdgP5qLDmyjsQR0cb0wba0hX0lazKaTTYVzrjQ==
X-Received: by 2002:a17:906:cb:b0:9be:f78a:d438 with SMTP id 11-20020a17090600cb00b009bef78ad438mr1422200eji.5.1700297516390;
        Sat, 18 Nov 2023 00:51:56 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id bt23-20020a170906b15700b009cc1227f443sm1672692ejb.104.2023.11.18.00.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:56 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:54 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove check if
 channel_array[channel_plan].len != 0
Message-ID: <0cfcc32a06033908c469ef0273de2485dbfd6b82.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

channel_plan is constant COUNTRY_CODE_WORLD_WIDE_13. Remove equation to
check length of array as it is always not 0.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index bb7b5c793b26..b515008045bd 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -55,13 +55,11 @@ void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 
 	ieee->global_domain = false;
 
-	if (channel_array[channel_plan].len != 0) {
-		memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
-		       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
-		for (i = 0; i < channel_array[channel_plan].len; i++) {
-			GET_DOT11D_INFO(ieee)->channel_map[channel_array
-					[channel_plan].channel[i]] = 1;
-		}
+	memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
+	       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
+	for (i = 0; i < channel_array[channel_plan].len; i++) {
+		GET_DOT11D_INFO(ieee)->channel_map[channel_array
+				[channel_plan].channel[i]] = 1;
 	}
 
 	switch (channel_plan) {
-- 
2.42.0

