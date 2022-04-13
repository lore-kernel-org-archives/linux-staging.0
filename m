Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97423CA;
	Wed, 13 Apr 2022 04:39:03 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c199so567532qkg.4;
        Tue, 12 Apr 2022 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WErFaGsZeydU2G+yqS+vuepSAgxDO/xhmvr6tbUUEKs=;
        b=LgxEj98Ue+g5tZSw7pySZKcC+mlOTyCjF2bv1rvWqw6PGnNi2GVJ5cpx+jrwapHcM/
         PV/bXRZy+w6MedYIUuVPY4LgKFXnxZUmG7cpwqgTs2jKKRFDmS1AhZmIlypjvT+J7pTM
         7oP5PTIvF00mvMNY4oQHnPDoXmX8v0pZ071h/n9lKPulEJVzg10H2def68+nn0gh91oe
         GquCSuwKEWYxcXymRDx5pLKHst+rNIiyHX7fJIipX1VDX8WTAEre6BAIXDI73ciXgd6F
         jHCjVzkxB1H9WbaEbXj6i1lfp/VQVMKxAWTfyAqvgKs6EQbzJSNYJZ1yze9d/1Mm4+gc
         3EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WErFaGsZeydU2G+yqS+vuepSAgxDO/xhmvr6tbUUEKs=;
        b=SEcqp4CA/ou46ZATrmI6Lf46br0PUXZ2TtI+tCEO7yIILOAJMCHdsD0GDrcDuhi5uG
         6gHBo3QFZqFswehMqZcnDNJIsAsXCPZFZRV1lNbdZ2pgfEGxKRo3e8Wcm8FPsJABNvTS
         NMe4ajRCnoDHbWqndh3xjklsoreIVxPkcNKoLezblRh5Li5sck6OLz3pLrpUNCTTfIjo
         Bj15RIEukaZieumbgkz7lUIM+YcUGB5cibEUHw13VkuYjsYfmbDBmzsJVc5lLImIlzNG
         r3zYtnoMyvkzPfogoX+MxK1mxOKsdrg67wAXpOk0akNlp4dVKi2C85S2SH8ooQT0ba3z
         RHtQ==
X-Gm-Message-State: AOAM533tNMvLXoQ1bR8w3wDzchI4WhViPzlYWvRgiC8JWRY7hlLZ9mH+
	Od2Bf4nEXYzMvAoSdnAeG94=
X-Google-Smtp-Source: ABdhPJzMUjmFOWMutAiPHFw3TfOyB6lPTD/Bv8L4/M11SKvSvx8jIlR/T0XmQ2lqWc+oLQYEgEL3sg==
X-Received: by 2002:a37:4349:0:b0:680:f1f5:23b0 with SMTP id q70-20020a374349000000b00680f1f523b0mr5388159qka.530.1649824742805;
        Tue, 12 Apr 2022 21:39:02 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id d126-20020a37b484000000b0067e60283d08sm21984056qkf.40.2022.04.12.21.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:39:02 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Alex Elder <elder@linaro.org>
Subject: [PATCH v3 1/2] staging: greybus: correct typo in comment
Date: Wed, 13 Apr 2022 00:38:51 -0400
Message-Id: <2feb03de97ca4dbd27c22cf40f8e185f7dfaae29.1649824370.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649824370.git.jhpark1013@gmail.com>
References: <cover.1649824370.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a spelling typo from 'Atleast' to 'At least' in comment.
Issue found by checkpatch.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

