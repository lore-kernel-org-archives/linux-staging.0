Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7670
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 02:09:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id h24so17314854ejy.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QoZwyY0YMTAjuynEGdDFK/kHrkVCqwMZmCiqAO/T6oc=;
        b=QbxVEgaCh1v88CWkfJOjrIZdsyexbMt7d/1A99c9zBL40fQ9uxn6EvDbj9ZXpkyO82
         9o5TaptL2Jr6Vpiw1NHb04nzLkSCxGOj6OKKGOQwWG5dZuDZm6eTuiC32Ju93Hgwy6Sn
         eo2Ge0Qm7UQKCxjbrobnkR9l/3SUyidDRi6cdn2Way9oy0elQBheyFg9jl2hNcaF6QiU
         2UDuyEgqNl4hPHMoS4BllFKSo1wckKxPtM+ax3+u/RWWM3qUgtKcwIja4nK3ihA1bmwK
         UgckFLQ2ucIsNeeAp0BQMEbdMQgR2VOOrEa8dVuaoIQVma/u5rc/ij0aHJU4KKvUXiOX
         ktJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoZwyY0YMTAjuynEGdDFK/kHrkVCqwMZmCiqAO/T6oc=;
        b=jUrO6pxjN1h/RNVbyIebnNtaV1gzWlAGWcIRUPeoOwu7+LCS4omGODKTNVGos4/BQO
         wJzENnPGjDprF0PjDle1MtwQ4IzAnv+DxZoUC03afwU2cKc8j7QowFpxzDDvMo72v9Ho
         TMRNRjDkHxrQKdwLMfaasmAmNZIAgvKubsgn4FrvarD5CRN0PFIi1GiWEiZKJyXD0G8e
         TFMmW8DKohsnTnl+XPvxso4FIptQDArJX0AxmsEa1mrn8fb9uzfEizJR70vm3Wp7TfVU
         iG+0mdX3xcoivoe66158YHwll4Wlw9k1sLJDhZOB7DuEwVa4eBNKpDTlS8RboXdblx2U
         PVDA==
X-Gm-Message-State: AOAM531HotUQmMH+OmD2+fxDiL8MlBr81fnx6JtLiZ40kEp9yGGd/BQo
	/BgrAk/0dbtmazmLr27fCDE=
X-Google-Smtp-Source: ABdhPJwFyIBQzaujPbaRHCOrVPlhW7gxkQFi6LwKnhuKjhF34suowYfruJICvam4bz/Bf9+88HvITA==
X-Received: by 2002:a17:906:2c4a:: with SMTP id f10mr6923021ejh.493.1622858944837;
        Fri, 04 Jun 2021 19:09:04 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: pci: Remove checks before kfree/kvfree
Date: Sat,  5 Jun 2021 04:08:54 +0200
Message-Id: <20210605020855.1065-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed checks for pointers != NULL before freeing memory. If kvfree()
and kfree() are given NULL pointers no operations are performed, so
there is no need for the above-mentioned checks. Coccinelle detected the
second of the two unnecessary checks.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---

v1 -> v2: Added Acked-by Sakari Alius. No changes in code.

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.31.1

