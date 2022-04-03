Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5757C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 10:37:28 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g22so7835925edz.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CeHrH9AyErjOsSwe0qHXd6MCPAxnuljDNt3j8YpWHW4=;
        b=kUyL8cKCkOZ0e5nCDshMc557Qc2wIOMDmGkTTdIq6raZwFSbxRIzb2YMHyJwoPDR3o
         ZJNuGJdmPBFKAhDc840JPL55XWgVusoyesyYZ2iPqxWWjgsUqDFDC8w3Hz8FCUZwCawM
         vANH1ceuBnK6Y15Di8Y2QyxBB9vbHYGBUQY4dW3QuOXom0R5MkuvkSxBu3fUedqfoCvU
         y+6b5XGlR88956WUWo/t4ejbgSezOMBhBm7nlZNa2kCft/40BGouGdcoh5zKynxp0rNt
         WkqKmDaeSoUVUQGigBKu/u187PhM9/hT16TvK/0qQhe0ZRnXJC4yv8NRIUAvrmCOBasW
         e9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CeHrH9AyErjOsSwe0qHXd6MCPAxnuljDNt3j8YpWHW4=;
        b=V844HwW/n1JMqr8S/WrTFKiBSP6tS0kzLKmGFs5WbFqf/4Quq+5P8yJ/I8zDbExWcN
         AIcUSGgVwKfDtK0948Y3qBGqtlPs06AZjdK6cq7JoBEey0AZrG3aVGHU6zJc1i2PRKse
         dTZZmYRvhPM3Q6TKX52QUSVV8JlaOauVn/PKQfUhBF3wgYElxojHwRQoTMfAhUhx9Kck
         hYTfc+XGsuaNgHPx6NISFWy/N7EolLDJS/89jRc/Wn059WB8kaRdVYywr+L9PD5ziSqO
         CvYgZQVkzPE08lLxWqh9dCoPUcN0xfSG871C6M1aJ7hm2++/HkOTjV3pZ2DZypJ/0kEr
         Elyg==
X-Gm-Message-State: AOAM5325q4zBYpHWncpzti90XdgrhLCb1RE7n8dr/1clpAiI1eSvmPDj
	vC0AnDu5tB3rUpYtCj0W3Mo=
X-Google-Smtp-Source: ABdhPJyE4Mr9xQ2xQrzByTeSXfvfEmBs7u/fI5qQoOQqH70vroHVLQXum6JVW+ex58k8kUVFptLIng==
X-Received: by 2002:a05:6402:3495:b0:419:1ff6:95d9 with SMTP id v21-20020a056402349500b004191ff695d9mr28492140edc.249.1648982246535;
        Sun, 03 Apr 2022 03:37:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b006e1382b8192sm3130751ejc.147.2022.04.03.03.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:37:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: clean up comment for rtw_pwr_wakeup()
Date: Sun,  3 Apr 2022 12:37:13 +0200
Message-Id: <20220403103713.12883-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403103713.12883-1-straube.linux@gmail.com>
References: <20220403103713.12883-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the comment for rtw_pwr_wakeup() by removing obvious
information.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 6f97c7a879a5..ac54cfb63fa3 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -346,12 +346,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	timer_setup(&pwrctrlpriv->pwr_state_check_timer, pwr_state_check_handler, 0);
 }
 
-/*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* Return _SUCCESS or _FAIL
-*/
-
+/* Wake the NIC up from: 1)IPS 2)USB autosuspend */
 int rtw_pwr_wakeup(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-- 
2.35.1

