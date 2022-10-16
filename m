Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C53EC1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 11:07:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so9945665wma.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLbBe121uRFsJbHs/Xv1Uj0I3sCmOsIfcULw882wYaU=;
        b=DZT2hvBBbp7VdsFe6JnTtn+7X3CQc/wPPYYjEa2b6td+qRtRYCYq/wvRaCNHoMEcpX
         DlLIa19Pj66PE1jRxl68KMWw4b5yGeWt5UBXCJO8KeHW3UpCae41hot5aPRhU9hp5pqw
         pndu4rdJIu12xKbSg6xtXg/PvER/t6qI3Y6GwABlh7F/8UENl0vLh/xCOlMluwEQBNNK
         4SIVLhzHtA+er9sK2ClbL6m/WUpDsakFyQfIPxHRJuYEbfpSb17vvz8gcWFhMhEyIBDa
         5lsb+2GKjjXDw94KNmswKHQcEZxF4xOOZhPgnrPVUM4pGfkp1m9QmH6wgDwaLx8NGghN
         jBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLbBe121uRFsJbHs/Xv1Uj0I3sCmOsIfcULw882wYaU=;
        b=BgPpXY6DHQyymt+1ipjb6rYMIz4C5NwHo2L633/wg2MWmDHC086hXsIJbo3eHmiRf6
         4+My92RhzMO/bbhFPnU7notjSuNvLsD14Vg+5rnB1usxWB/SxKrofVVWjzR35Fsm6g6m
         orrS345Pt3liU1UxGLDZz7NWdK3wi0t59RVVzGBUZH/x38nn7/WFcCUAJD857HYWaVRH
         zwouUVLmCrSwXu62eYzng5d2tORZ1pc//IA0HV92gI9PGoFkWRfEPlM8xkEXhj+Pq2Lz
         E8c64187ZaxcVB2dN4Q2wfRKLK9bmyuLScSlD8ALssGHXr2jMbTT80VaTqcKDemYNL3W
         E08g==
X-Gm-Message-State: ACrzQf3coZdT3ru4qvceKkgtLnrxzc4MgBWx8IiEczfQiLuQ+iEl1PnV
	XQIhCUIs9a2XtyehcPd12Qs=
X-Google-Smtp-Source: AMsMyM4jsu2zFK/Ju8xAC0kC0utbVOaoafyN+oBfoO1IQpDfZ8tQUMhWcw/8ZnsorEeG91Ssam9d2g==
X-Received: by 2002:a05:600c:19c7:b0:3c6:dd03:2b26 with SMTP id u7-20020a05600c19c700b003c6dd032b26mr11855016wmq.37.1665918468205;
        Sun, 16 Oct 2022 04:07:48 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m19-20020a7bcb93000000b003c6d0f8c377sm7123762wmi.7.2022.10.16.04.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 04:07:47 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/4] staging: rtl8192e: Update the TODO file for this driver
Date: Sun, 16 Oct 2022 12:07:41 +0100
Message-Id: <20221016110743.1448067-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016110743.1448067-1-pbrobinson@gmail.com>
References: <20221016110743.1448067-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver directory where it was proposed to move to has changed,
while add it add some more pieces this driver to update.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/staging/rtl8192e/TODO | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/TODO b/drivers/staging/rtl8192e/TODO
index d51f159d1adf..7221ae65d63e 100644
--- a/drivers/staging/rtl8192e/TODO
+++ b/drivers/staging/rtl8192e/TODO
@@ -1,2 +1,18 @@
-* merge into drivers/net/wireless/rtllib/rtl8192e
+To-do list:
+
+* merge into drivers/net/wireless/realtek/rtlwifi/rtl8192*
 * clean up function naming
+* Correct the coding style according to Linux guidelines; please read the document
+  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
+* Remove unnecessary debugging/printing macros; for those that are still needed
+  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
+* Remove dead code such as unusued functions, variables, fields, etc..
+* Use in-kernel API and remove unnecessary wrappers where possible.
+* Fix bugs due to code that sleeps in atomic context.
+* Remove the HAL layer and migrate its functionality into the relevant parts of
+  the driver.
+* Switch to use LIB80211.
+* Switch to use MAC80211.
+* Switch to use CFG80211.
+* Improve the error handling of various functions, particularly those that use
+  existing kernel APIs.
-- 
2.37.3

