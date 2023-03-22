Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B9BA4A
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 22:07:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b20so45971284edd.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seecs.edu.pk; s=google; t=1679522857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=Tu0kJyknJ1v6iH//+q5ZfDMvt0rY1p/4T/YYsEa/38n9mUAQ+R51ip28tUYR6N8OtW
         ZSV1sDRWvKVVPPGh6n3KkRyhLonpqmarMlDm3mNzO0gM1d5SU1Sevp48Yes1YW1ZlHrv
         fLgiz9w+NNBQJ5wx7ykUxmSJfRYuhC2raDpUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=QjfSF/OfZ8i76Kn2uBSszrki+RX5zgGBYOaltf6xgjHOOSF5Lbj7jEF//5HUx11xqb
         8lFH7qNEm49uKIcWnOaY4XgQqowfbGSi4W48YUpd1w/LKeYZRF8Ti3eQoCU4mkVh1Xzf
         jv/wtzytm0+beuGYJwdXQNseHFjPgf2MC1oL1/2l8oFZbhjiblypn/zQ7E/XiFOm9c7Q
         VMMeyXWSaJA+Q3y20d5LgV1mrt7zU37LccDHJy15U1AuubAdmtr9ZO9iD63Z1PSObAZt
         yFLWZgi9SmxNvEm5+TLHxRxARpp80woP1wpyefgm30kbIi/MyTma58bWUezL2kk/ttl6
         aq4Q==
X-Gm-Message-State: AO0yUKV1e7vbDGEUK1/terWinGZOcJVYNgyYXL2YpDQiC39SfwEUMerV
	SS3AorD3axVAxsZrQhWMK1gQAA==
X-Google-Smtp-Source: AK7set/Go4nTDvGsSsr8EOi4LAu7QSXAanN9vrFV1yKOh/zWi4mwbDzpIza4iTG9e7p13fUM7x2A8w==
X-Received: by 2002:a17:906:9493:b0:870:b950:18d4 with SMTP id t19-20020a170906949300b00870b95018d4mr9240963ejx.5.1679522856995;
        Wed, 22 Mar 2023 15:07:36 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7787935ejk.114.2023.03.22.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 15:07:36 -0700 (PDT)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>
Subject: [PATCH 2/4] staging: rtl8192e: add blank lines after declarations
Date: Thu, 23 Mar 2023 03:07:02 +0500
Message-Id: <eae4647540b26afa88ee99209e39f5b461e7132b.1679521517.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679521517.git.kamrankhadijadj@gmail.com>
References: <cover.1679521517.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines after declarations as reported by checkpatch.pl

"CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c6114d99829b..7144a0630ea6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -231,10 +231,12 @@ rtllib_rx_frame_mgmt(struct rtllib_device *ieee, struct sk_buff *skb,
 static unsigned char rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
+
 /* Bridge-Tunnel header (for EtherTypes ETH_P_AARP and ETH_P_IPX) */
 static unsigned char bridge_tunnel_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0xf8
 };
+
 /* No encapsulation header if EtherType < 0x600 (=length) */
 
 /* Called by rtllib_rx_frame_decrypt */
-- 
2.34.1

