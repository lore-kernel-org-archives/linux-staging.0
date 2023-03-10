Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3D883B;
	Fri, 10 Mar 2023 15:51:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h14so5479791wru.4;
        Fri, 10 Mar 2023 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678463496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpuN32VQrGcv/3Pj2zsLc3BfvbthJh4eelemNP67L9M=;
        b=EjgPufN/cGkNJlNHqYKe7Dvb0DPZVDoUQfE7cCDnzHUy5HZaHZxrDsNAUzRwAQrUL1
         i/DNPGm/Z4VM2zl0DJ936UNJEm4qO2uunUmPxw1Nyw7k1nH3csue+QAqkTJEpKNjVkz9
         bvXQtggu+bIZZ7pQ8mJ0rhogOJBh0VB+3gWsZCxs6Q+SRxwk1t7O7yKKBso8Z2urhAKY
         l4dPXw9Hs8vlhZDQjL80h/uJmxsngN3bvRzX6UckLTmjoKUpiQSS0H0rCrrLZXHEHkGK
         JbKgtiuN6nx7pkcIsCSJYuZAlqSlBiDbrffsaUcMfe/uN00BL+S8+pRHWLGR8Aw4UuuQ
         AQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpuN32VQrGcv/3Pj2zsLc3BfvbthJh4eelemNP67L9M=;
        b=0EwoLmtytCc4nvBeF+az8f4RNjfK44ZsqTHbuz25syKZFVLPj2ZnkSAtSdgamp0c5z
         bpnh0pue8OIpYVMqqlMetjn4LrjJLtXnq0/z2ebjJWE5NNsmHdOTfrAhfkZi+GzAGs9H
         b01mXk0gx9ZgSOYufqYKsz6qcFzK5O+4NhNE5xALbfhxmxw+pBb3w3MtmN8tao/MZaJl
         ESwLhvMfBgWyJDOeEOOMg7OzHhF1UdHWKdMnzAMI+Pa2s0FsiVZAt7lCH7sV9FtCWbrp
         0VTHCRHmvrKNNXVWu4mvNnKIUPmx+7CwK9uRJHoeXd30h4XGEa3I/+BmTbgrixMBtAXc
         ++Sw==
X-Gm-Message-State: AO0yUKUF4Q5fNSSSwYMHjSzsBQf//MSzwnPa8AybLPA85GFJMixCJahR
	H1/rD+I9RAmywynHmsTO63svb1svlYpnFg==
X-Google-Smtp-Source: AK7set+aFnP5rMPRo/m99shb4IMy/aI/Wc8HeEJBX8YkAaBNdpjimiY4SO5S8m3LRlXa0ZEhtAJyTQ==
X-Received: by 2002:adf:ee8c:0:b0:2c7:9931:4f7d with SMTP id b12-20020adfee8c000000b002c799314f7dmr16660450wro.18.1678463496288;
        Fri, 10 Mar 2023 07:51:36 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600001c800b002c7e1a39adcsm140139wrx.23.2023.03.10.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:51:35 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
Date: Fri, 10 Mar 2023 17:51:25 +0200
Message-Id: <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " CHECK: Alignment should match open parenthesis "
Reported by checkpath

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index f562cb12d5ad..0fb15a60412f 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}
 
 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_download_request_handler);
+							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
 				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
 					PTR_ERR(connection));
-- 
2.34.1

