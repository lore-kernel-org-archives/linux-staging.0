Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CB70
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 06:30:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso7188820wmh.4
        for <linux-staging@lists.linux.dev>; Thu, 03 Jun 2021 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkXvYf6Jy8YFgYhTbNEV2GnzgZgt8NEIXbEHk2q5vQ4=;
        b=FMaRxx5NvoqG66JrRJ7YoBeIJ1Abw3VbQU69S2OK2c/CPe7cH0dwQsKRnQoRq0CZje
         eLXID/IZykhEOE/5JIKcGUz7lYTZH8B+Hdp1WTlS/avyXeavfJN7q4aXfdv8dfC0hCrQ
         KSGUdcal/ilFWs07+G0/IEnj0U+XOJ1iBmwd5bSaC767dxjIPP1MAIpByt06+37HGc1e
         YuVpAHl2Yi8/I+GVk46UX0278g+PQkewLw+t9cp25ch9Z07Y7CzbnIqHIB1Ae5SKmcE4
         6rxgGIOlOdMa05oA2BM8efJa+yT3dtpW77hS/ItogKqoC5o6CSoAkzdYW4hXoBB07lyA
         HsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkXvYf6Jy8YFgYhTbNEV2GnzgZgt8NEIXbEHk2q5vQ4=;
        b=dntSnEjw0nnbopoaBk1Orgz7qXebSog2HuqNATpCMbJiwdV0d+IJ27FNr6qhlvvu1B
         2fZUTmQISGSDgx9Q/tNCpEl/ditrI2P9mWLJlVOBNglJkVk4VgFcJYtwQ5ET1pAxMn0a
         6CJnHNlzxO7FXn9r7nyl4RI9Zv71CrLamQa+juZ2l5zraGQ3K1JhclEkrjcxaf8qIkKp
         oFODCGq2SQZjrP34GvA8IQHFXRofSOZkXTMKDJ4OxiPPVu2aEZ6QxJhr8yZVMCnmGL89
         dKCdJ/ArCnffctkor46sSaW48m1scn9TjoYxyWacJQRwpqfc0DcwUT7SURGXVUIcfpZd
         0S9w==
X-Gm-Message-State: AOAM530MyZXnvKp6W0LPZp/Jg27E0D/gNYs3HWe4453r+30eGE91A+3G
	RYfy8a/d+zD0V6eZMa06PC/tG5ojKY+hrg==
X-Google-Smtp-Source: ABdhPJyIMJi/shWdVn8MCGJvysG+WAOp5GH2fXyvFSxIE6JFY1NuMERiwUNVCAALoYhYqdPXAHdz1w==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr1925864wme.40.1622788233648;
        Thu, 03 Jun 2021 23:30:33 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id b26sm7805323wmj.25.2021.06.03.23.30.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jun 2021 23:30:33 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: review pcie overlay in 'gbpc1' dts file
Date: Fri,  4 Jun 2021 08:30:31 +0200
Message-Id: <20210604063031.13599-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcie node is being overlayed in 'gbpc1.dts' file requesting three
gpio reset pins for each pcie port. Gnubee only needs general
gpio 19 to properly reset and make all of them work. This pin
is already requested in the general 'mt7621.dtsi' file as well
as is the pinctrl pins. So we only need to enable the node
in the overlay and all the other stuff can be safely deleted.
Also, pin 8 is being requested for gpio-leds node and there
was an error on boot before this changes because of pin was
already assigned (EBUSY):

leds-gpio: probe of gpio-leds failed with error -16

With this changes this error has disappear and the board is
properly booting without any other regression.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index 7716d0efe524..b65d71686814 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -101,12 +101,6 @@ partition@50000 {
 };
 
 &pcie {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie_pins>;
-
-	reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>,
-			<&gpio 8 GPIO_ACTIVE_LOW>,
-			<&gpio 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-- 
2.25.1

