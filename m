Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC152F27;
	Sun, 27 Feb 2022 14:50:40 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id bg10so20082482ejb.4;
        Sun, 27 Feb 2022 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JnzEjils2SDzogeoSREvhcmiHUjDXu33htT9pPxePe4=;
        b=m6Y1LV2epMZzSJyQq0X3DAGh8KCjFJY62r3nYRRB9Zo0o51gjA0BGoSRQGYpvdc07p
         dVQ8R8CJsDb7DddzgpOBYB3fkV1Bh50ROZNJZFfWPTsYsLOICFsID4sXsrkmSSNpP6gb
         dfMV98gTBsKuucYg8YqWiCrxU3qwLd/NziUpBqFPNGH02N82YZ9RqRWTlMwcw2xjcHzg
         KJ4FBy9RCw9WDFGgRdljcjr4tkLhlReb5DtyOEcqfMKubi5aELqKNsDLtwBR7CK+ymKv
         birbV5SOVJUOl3VDquTajA6oUGZbrELv2cOQ+jqaBU/RWOZLuiWFO4CKAUxcoR88j+Kv
         iXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnzEjils2SDzogeoSREvhcmiHUjDXu33htT9pPxePe4=;
        b=2Etgz2/b4I7kDEk+/p4ZiafcpZav1etBg339P3I0ktRkYw+bf2hT+31ghnQNJOtq+d
         AT2AiQiBMpLQRFgyhIpDcnTAe6BqdLKSHnWf3COfIoLyfA72H8MPKfC1YnzKmdMgNh6u
         EqqKB3gX6relvSXTAv1z/7E6gAFAkcAxSC7TUQ1niReXhl1epkCbbfEVa8S6zw6sdNdt
         05r3mJPzKrdqc232X91eqKxaKH61V4M9QDjT9jSYRpOUQogTiCXDdPm5nN+3+iMKGQOk
         17u2AF1nGYM1QudRbHzVVhKR0Ph+g7hpzhXLlr/A7OUBg7jJiKnTLEriZMy+MUAXh9Vn
         QnnQ==
X-Gm-Message-State: AOAM532FyoDcQ4PW8Rf91k3QaMbFMmmvDOPiiUSLIN/4xmdv6xp2/ZLA
	8Ketxvl4nR+QGsRVr88T4iE=
X-Google-Smtp-Source: ABdhPJwgCbRgGf3irdtMpQv3bFTprq05+49kal0GzQYFZiM7sAzIqFstRyzM4xfgu4hDpCCw86KV6A==
X-Received: by 2002:a17:907:2087:b0:6cf:e170:171 with SMTP id pv7-20020a170907208700b006cfe1700171mr12676273ejb.163.1645973438900;
        Sun, 27 Feb 2022 06:50:38 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:38 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 8/8] media: hantro: sunxi: Increase frequency
Date: Sun, 27 Feb 2022 15:49:26 +0100
Message-Id: <20220227144926.3006585-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns Android boxes use G2 core on much higher frequency. Let's match
that here too.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/sunxi_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
index 8d8a8937d6aa..c86749c406fc 100644
--- a/drivers/staging/media/hantro/sunxi_vpu_hw.c
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -50,7 +50,7 @@ static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
 
 static int sunxi_vpu_hw_init(struct hantro_dev *vpu)
 {
-	clk_set_rate(vpu->clocks[0].clk, 300000000);
+	clk_set_rate(vpu->clocks[0].clk, 576000000);
 
 	return 0;
 }
-- 
2.35.1

