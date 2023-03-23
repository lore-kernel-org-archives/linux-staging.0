Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC435C959;
	Thu, 23 Mar 2023 19:20:11 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t10so2074573edd.12;
        Thu, 23 Mar 2023 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679599210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=OJIo47Myz01VHL4lrQeojnyEpyLvmvQXDDd6hHSS/33DZtiIbZVU7qBQHVeN4eZmqL
         pI2LMQEvACyay5EpO7m6NGMH86o9x5+k7B9iv6q7KUkN6DVpgEls47lJsY7TVbLUuYYs
         EgX/06Rd6Ojoal6cMZxhPVS3xQDwCs2aWpLeWE9CozYurmhRzls9imDtcCRe2uLvVFDp
         J1agRigoHP+AyEzl9XD55oHW1M1J+5dFbufDsoa0zPDlhs8FzN2XvXMVucbHr5aIA+MH
         ryYX++TbCXHWoTO5zgUPCSntzQlRZJShFvrRv/YZ10dv8/2LwakQd17YgLq3BiwvLzBn
         yYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679599210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=PJKd/XabY9TIHjvLywFFuMYeNRNLKF/gMYY7KA5/zHmHRpfePzpZXIakkgyQ9JOeYP
         r55ErCsYRN5/Qj5hW38L0C+cq4K4ycM1TDRXFbP0exiWUQx0zkKpR+hgFU0374Ml0zqb
         Mo7K2+IJ9wtuy0Mhgbz4Ux2mX6EJ7kff40q/CHKDR34pWX4+jMrbOuvcqpXElQJZyPce
         OC3ygCTScMD79j1TE4jR67zODADEf0JnejuVMqZLY7GLQ3gTjwTk0cESlvy2dO4hVqAQ
         cKoHtP7O+XTNUMJ8V3bhXViNrheNfl/R8Wv35cHJWi9v9sr+P86P250LnQ7ULZdbpQoF
         Ez1A==
X-Gm-Message-State: AAQBX9eaKg7d0JJw2jiWQI6ExU+V/bXyGggzDC5KyUAj+dkdql12Jyl/
	MFw+wQa/hL7dZh3TP+Kn/xaS0LwBhKVpT8ys
X-Google-Smtp-Source: AKy350aEDwuUxxMp4nnwx5P5DHdZ0chMO6ZyhQIUZoD3U+kI9JNHF+uSmtwf+ENiSGPY9Y3xEewkHQ==
X-Received: by 2002:a17:906:3592:b0:932:ba53:83ba with SMTP id o18-20020a170906359200b00932ba5383bamr126094ejb.34.1679599209880;
        Thu, 23 Mar 2023 12:20:09 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm8161409ejc.51.2023.03.23.12.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:20:09 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] staging: rtl8192e: add blank lines after declarations
Date: Fri, 24 Mar 2023 00:20:00 +0500
Message-Id: <eae4647540b26afa88ee99209e39f5b461e7132b.1679598576.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679598576.git.kamrankhadijadj@gmail.com>
References: <cover.1679598576.git.kamrankhadijadj@gmail.com>
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

