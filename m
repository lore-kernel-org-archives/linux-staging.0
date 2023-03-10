Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46398E4C7;
	Fri, 10 Mar 2023 22:18:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so5448403wms.0;
        Fri, 10 Mar 2023 14:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678486687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNL5tb1P3HVDygsPysD8xPwAJ0vtyz597vInjuBEdDE=;
        b=EolZ2GUxSxBNqUSHRcX6PIBE6bNo6syz8kES+5pER0SmCZatB7g2mSqteLxvKUF0Vp
         ak8AKBk96lIn4UtndtJt6x1MncJG+U2YhKvlCO6r93Q7zLjDlEdyvywJSTiJLF67y56C
         WqoMQX/hT4KkDwftrxegHivk0n6FxK9UDXf/z/DM66Hnk3o657V8zNK0yh5L9RMDftNN
         eFaulCaRaWJashCNGFT3L05ZWYxv+jIuDYrB2FwNPi0Wkn99CyKIJOxKk7kPpIQ45LLQ
         j9zk8rdyZhOcyNrtM+bCclUzsbhcppu2G074qZVRAwlbQdNrhG595+zJmTobQnRUiXUs
         E1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678486687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNL5tb1P3HVDygsPysD8xPwAJ0vtyz597vInjuBEdDE=;
        b=OdYydD9apHLp4x3QDDMfCRAPagUCSQZbOnerUitfgJzBdW0OpFwif4ceCPM0K1Ixe5
         Nd2igU5ufh39yhS/a7dkytrEjCnLwpIk0P6qDIbxemlyYwCVjyeLH0NKZGDOKWiTvb4Y
         bo/GJhhR2KIINt4AKLlPvQ8/dvWW1/k9/OTf7lF1RrYjkLZLew3JOvNtw65Y+367K7HU
         olm/ISxT+5AbQxhLOvRTxNHCM8dhEEq4EnJx9kzg11WSOT8HuX9uSHwL3X4PUZC4R/6/
         CDNYSFuWwtuKyqKEVGRJGs+Xbmls5D6hFFedoIEquLkUTrVQUOMqQYSADX8mjOHJwEIS
         yd1Q==
X-Gm-Message-State: AO0yUKWejbmlb+56uqbOZIZrtzrSmeUEVSnP88Qeq5wF/6Zdw/TeTxrT
	k8XP6f2W0zT+W/soSFzLp3U=
X-Google-Smtp-Source: AK7set/Ulh7uhrPNen1gDfIDPuRQqFNE+Hp0ld+Z0JAMHiM3u6WevTQQZ4mMtbs71khUslIDVK97Tw==
X-Received: by 2002:a05:600c:4453:b0:3eb:1432:a78c with SMTP id v19-20020a05600c445300b003eb1432a78cmr4046508wmn.37.1678486687338;
        Fri, 10 Mar 2023 14:18:07 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600c2f8100b003e896d953a8sm1126429wmn.17.2023.03.10.14.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:18:06 -0800 (PST)
Date: Sat, 11 Mar 2023 03:18:04 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In file drivers/staging/greybus/arche-platform.c,
- Length of line 181 exceeds 100 columns, fix by removing tabs from the
  line.
- If condition and spin_unlock_...() call is split into two lines, join
them to form a single line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
Changes in v2:
 - Change the subject and log message
 - Merge if condition and spin_unlock...() from two lines to one 
 drivers/staging/greybus/arche-platform.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..00ed5dfd7915 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 * Check we are not in middle of irq thread
 				 * already
 				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
+				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
+						WD_STATE_COLDBOOT_TRIG);
+					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 					return IRQ_WAKE_THREAD;
 				}
 			}
-- 
2.34.1

