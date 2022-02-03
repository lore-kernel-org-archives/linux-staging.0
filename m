Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427D2C9C
	for <linux-staging@lists.linux.dev>; Thu,  3 Feb 2022 19:22:05 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id me13so11817519ejb.12
        for <linux-staging@lists.linux.dev>; Thu, 03 Feb 2022 11:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=YnamjwK8jac8VMGcddEQMuZZzkDqdQtjPGT5HOzqnyA=;
        b=dZBRrD1sg7XDLYXmoaWYGCuuxOZbQmxERTngTz23xxfweSixACEGf+QcYQSNv7f7VG
         fFc89935UFYKIdky/sB3SOKdzrwp3gPryih05ZjqvaVj29WHTlFads7HSrt6L+OdH+gE
         StXpIJrNeZ56OKwgOVmgLQSCBHuVsgAEsv4/ESBRATUJ8/dQYcRl/mswRrW44UZI7Bta
         /3vkKIa/0GENSNLZVHMfnufFbPSPV1HveGDYHdAbUgvTUWeHBdO8qccGdlfMO3zLnSev
         XcfQcOxJahg3raWFGyAAFy216c1Asm3cZO0v5Bzj+kym7jxE+IvadrQEC86u8PEcQn3P
         QCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=YnamjwK8jac8VMGcddEQMuZZzkDqdQtjPGT5HOzqnyA=;
        b=0sG/ALRXNd7BI16PY6tnKymR4+R3LmL4iMZVnTKT+2TzTiiXwMoXtlgKPKBymfwbAb
         9HQ9/EltRJKzU5DHhY909sacHLxBOl6x62UiYDuz1CIY9qk9DmwAmju32MHSIUBWrEgs
         Zg5zvNNbku6Jj13Xmhx6WhGVk08isltaVkP7xYlmhMaEyhGsWkydkI5cRYF0WDPOf0I3
         LtocsnPHHCcnsa7kRBYcQPVNeiqQXVn50N3bKmWJjqo8eGDt054zhsm+e5j8e1iMtHTn
         yVsS+Tyo63yjAVXgmq0LIvTa46PNWsmoDs27xfbTmjL8XjzBps0wbKOyCKg6hliPFrQR
         mlsw==
X-Gm-Message-State: AOAM530mX7vcKvoQ6U9pUO7UcPv7xNTmGppE03IyDUrMEy0Sss0aALaF
	FIGxu9TGE2grqtE0tQOVW/4=
X-Google-Smtp-Source: ABdhPJzZGzBzocy0s6F8V3moHy8ukluUcy4G5rEs15hnduJD0mG3YyohXcWOILgzp3+ExFEmiRjUKQ==
X-Received: by 2002:a17:907:3e9b:: with SMTP id hs27mr30799212ejc.72.1643916123500;
        Thu, 03 Feb 2022 11:22:03 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p200300c78f4e069597fe2fbbbc37c063.dip0.t-ipconnect.de. [2003:c7:8f4e:695:97fe:2fbb:bc37:c063])
        by smtp.gmail.com with ESMTPSA id lc22sm17055801ejc.74.2022.02.03.11.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:22:03 -0800 (PST)
Date: Thu, 3 Feb 2022 20:22:01 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6656: Fix crash when WLAN is turned off
Message-ID: <20220203192201.GA18509@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Stop submitting urbs before calling usb_kill_urb() and usb_free_urb().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/usbpipe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6656/usbpipe.c b/drivers/staging/vt6656/usbpipe.c
index 7f45734390f6..d505b4b69ba4 100644
--- a/drivers/staging/vt6656/usbpipe.c
+++ b/drivers/staging/vt6656/usbpipe.c
@@ -230,7 +230,9 @@ static void vnt_start_interrupt_urb_complete(struct urb *urb)
 	else
 		vnt_int_process_data(priv);
 
-	status = usb_submit_urb(priv->interrupt_urb, GFP_ATOMIC);
+	if (!test_bit(DEVICE_FLAGS_DISCONNECTED, &priv->flags))
+		status = usb_submit_urb(priv->interrupt_urb, GFP_ATOMIC);
+
 	if (status)
 		dev_dbg(&priv->usb->dev, "Submit int URB failed %d\n", status);
 }
-- 
2.25.1

