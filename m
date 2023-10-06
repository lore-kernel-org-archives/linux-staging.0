Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3638F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVI/W3DW"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b2d64c9307so97633766b.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619109; x=1697223909; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frWFn5a7WskkCNBBns5qHFEWZyzl6mTq0HND4RnFXso=;
        b=MVI/W3DWVNwjM0oPJjlMSLSCow2Z9920mhf36oyYAVmRvQeYiRXgaue1MvcItdwKyu
         fJaRagtThqdVszlCIJ6Pwk13dqd1kdqK5ZvZXoV1Aer3lRajz9pBVIvDUTDKLBUdh9x7
         1a4+tokc5I+vA+oyU4prVu8+pQu2j0qvezGSQM0XbGHADh9l0GkiNMm0nUdas+YvnRGs
         b3YQ7KWWgJkBiyD/3TPFbFCKldoVc2ZC1CypWqa8OhoSpoQn/H9mmeUjSeoT9j3KtIBi
         xCLYaWUrm/j9dl5fVO3DbkOoa4SIMfliDUBXaW9pi9sosZb8ToGb5t0HPtsFH6WTLPfM
         7zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619109; x=1697223909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frWFn5a7WskkCNBBns5qHFEWZyzl6mTq0HND4RnFXso=;
        b=VU7k9zQ2rdc/AeQvDNATt17IgurK83AaJ80qN7JYYDkmE7naX1ITDCWxEICE1KkUJQ
         QZCTfNRKEjwsXvJyemHRnDG9hPJ72YcfAGdsWVH/COUKf9EyzmMKCnPYmZQH19/CCvo0
         DEHOpNedJsm5rbdjurFtGmYqoCdwoRQpgMl3UOmE5NlY/2vlWiF+C1G73vpE4m0SSj//
         ZnKMmAfE5Bx4Q/Nsrgs4jvLIWjnwc+DVeBvv+e6U9+nJLXMTIS0xIgrO5UdmpMHfuDXb
         /Ef4ZHL0OGXHTvY/ersEJEmv8ymedBAqR4y+ZWxOQYMNzMqO/T1D/YENUt/m759HDfip
         w5sQ==
X-Gm-Message-State: AOJu0Yylqy8nUj8JVeD1ef+3cys2CZbW2kwU9yTWfDeUzYq60SytMFQa
	55bpnps/SbxJ93PgwWaQGvTvu6YiNFg=
X-Google-Smtp-Source: AGHT+IElU1Lkaos/3KQRc7F70agUsD4OHvfRx5rL1+pRjH3SdB3TUUx/0dLm38nyPZ2EAbQLkb8how==
X-Received: by 2002:a17:906:2255:b0:9a1:be9b:c935 with SMTP id 21-20020a170906225500b009a1be9bc935mr7672676ejr.0.1696619109546;
        Fri, 06 Oct 2023 12:05:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170906ae4800b00992e14af9c3sm3326901ejb.143.2023.10.06.12.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:09 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove constant variable ps_force
Message-ID: <ecebc90415c202e4e465bfb5b10c54be8b42e684.1696548527.git.philipp.g.hortmann@gmail.com>
References: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696548527.git.philipp.g.hortmann@gmail.com>

Remove constant variable ps_force as its value is always 0. The equation
results accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 4b2ee1684dac..d4e998cfbefc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -263,7 +263,6 @@ struct r8192_priv {
 	short	promisc;
 
 	short	chan;
-	bool ps_force;
 
 	u32 irq_mask[2];
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index a4da11627199..44a9fe831849 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -181,8 +181,7 @@ static bool _rtl92e_ps_set_mode(struct net_device *dev, u8 rtPsMode)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (!priv->ps_force)
-		priv->rtllib->ps = rtPsMode;
+	priv->rtllib->ps = rtPsMode;
 	if (priv->rtllib->sta_sleep != LPS_IS_WAKE &&
 	    rtPsMode == RTLLIB_PS_DISABLED) {
 		unsigned long flags;
-- 
2.42.0

