Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12C17CA3
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:46:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x17so13530633wrn.6
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 14:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loIlTu8AgTjjJ6bJKu7RkzWKYzkXqArC4i+/pF5KBwc=;
        b=oMkaIW/0mTFAA+i4rUf7b+aSV01mbdvY80WjaKdbE1lKG6728xGMJDvIHEJWKg8Unj
         0PpdDTQlSoXrkEL9Qc9gdm5BQft4jWf4YBsEcjZ7i+rE9nME86Wj0Va32womP+1zVUJ0
         8MZQ0n6zRjv4QuV2yX7LwKipH4ajoAJad0o+WVOQCvMIQeyMR0gELhclStesHLnG/FIh
         qGZhfLz8Yf8PHpMt0W/ieN5GeG/Pg1h/feOSt/Jgd25L/THlGzXYrRRggcPXmiNvQbxB
         RKgUlhuYK8xq2qS15sWFlF4fDkI4+Lrt7kezfBtxK1q0ZodaDODHvTQL5LLFiQOWFUvY
         NLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loIlTu8AgTjjJ6bJKu7RkzWKYzkXqArC4i+/pF5KBwc=;
        b=gVGgM5ScgsPl5lHQAhPhIAw9wMJADw+PvDHeV8pm+vMgeorCJjauHg/Zf/ZztNh6tp
         9uIDluzrekPcJhpMZPVt1SEVXRbqrynCo3Bhv+UtNMuPV7KLG/dmFMcSKaSffhyDhrvD
         azr1cxR7T7uV/pcpUfrtap1fBfaEHquvAOEaJE+S3W9rtmjX2aSYNtQ4nuOuABFM1Gk+
         URmezNgOuWLrrYxg7Zh8lhl78RLwa035GBEn6KXnvMI4FRK5MNl4d+zOgBQOibmYgqkb
         JsKNK+q8ngYUfWi6HTpJVAzta3a8joO+Z1FwPA9w1Z2JSCiWH8yFm/8kTVZK4K510V9N
         4BZw==
X-Gm-Message-State: ANoB5pmK/Gt+VpvTlkF+Njru0Iq7554+ArPwL5CSXmAZExXMBkNE+9ti
	xFa0AaMh46ir5ZPBH7Gau0rEYQX0/3o=
X-Google-Smtp-Source: AA0mqf6bsUikRzP+3fX620L7gB6pgldCvN4IFyO9E3NZs/QdGZGwZN8cA/zXdWwoubRAl+opBDkmWw==
X-Received: by 2002:a5d:4bd2:0:b0:241:ec17:6cd8 with SMTP id l18-20020a5d4bd2000000b00241ec176cd8mr191941wrt.108.1669157177281;
        Tue, 22 Nov 2022 14:46:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id j15-20020adfe50f000000b002366d1cc198sm14886700wrm.41.2022.11.22.14.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:46:16 -0800 (PST)
Date: Tue, 22 Nov 2022 23:46:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: rtl8192e: Remove unused variable
 initialized_at_probe
Message-ID: <4855b2dd5b7296b0eb10e697f605fb820e1dfc7b.1669156825.git.philipp.g.hortmann@gmail.com>
References: <cover.1669156825.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1669156825.git.philipp.g.hortmann@gmail.com>

initialized_at_probe is initialized and never used. Remove resulting dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 369a59a753fe..7b78bdfadc8d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -836,7 +836,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->up_first_time = 1;
 	priv->blinked_ingpio = false;
 	priv->being_init_adapter = false;
-	priv->initialized_at_probe = false;
 	priv->bdisable_nic = false;
 	priv->bfirst_init = false;
 	priv->txringcount = 64;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 54c7a2128053..1c00ad709a3c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -309,7 +309,6 @@ struct r8192_priv {
 
 	bool		bfirst_init;
 	bool		bfirst_after_down;
-	bool		initialized_at_probe;
 	bool		being_init_adapter;
 
 	int		irq;
-- 
2.37.3

