Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827E3FC8
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c21so117147edj.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O516dRas0PleKnQD2Ngp8BTWaQ5AdYStSXmf67/51c=;
        b=oqsmYy/6SUD3hUAmrcTAMSupwoqpojay5ajo36ihbT/fIUKNVLCf/kPp8jC/ndbA+w
         9h4IP6PF4UQWqvZN6U8nxEK8gRXqxRBaQiAlOH1dYHcT8MragPGZ+RImcT8jOWECRT78
         UTjnoAcQIPDdhflM2+RWMixNQMyHYGFY4pv1LBV+xA+sEyRCEHYjjZ4sRfNzcGIR9+s5
         6z7c1lSCXZfqFTu77Dm9yRrSgZypDNq+dCvWPDwoBevIYrbYX3jUp2ui19ECiMZ+Dj2t
         0eG4hNty/3Vw0nGZc9NjW8uxNIvDw0Awnn6CEaxo80RoSROACkZIcCxuKH3UKpWMA9wh
         G+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O516dRas0PleKnQD2Ngp8BTWaQ5AdYStSXmf67/51c=;
        b=3y75OQP0N7AEiYwc/Rmvu5vkZJuRZmNYZPanKmKxi8ibXlQJ3TeYU0v+yRrCsnCElP
         6iPkbJnXH7FueqMweyifrGR+kTtZjtGZK4mEmlNSpL1IVu3PKAmyzkfaH7UnxCYFRoct
         giLf66ZhkZLK9itoJhG7aNuJGn8Ds/fbJQheBIBCWlBqwwaOR0hb3UayLWk1w3N0fSl/
         rzMlkxUkWGA4yMqe6aZANDGBx1oa21jzRRhFfEs6W4+Hz4aFKhQ+QcefkKtDvkqAi+jy
         KSWwev6gnMMX8C+GXHJNEXrAslDeyVhlfmalpu8YelyfQXoyAls7vBpCony+x5bfMeYd
         MzWQ==
X-Gm-Message-State: AOAM532fWgd8G+yjH+Mo3gaO6Ydh8B78mhYhs3+5injEzsMf8k9Tc1mH
	dtD1EX8np4ZZJTWpwxYoyCfxOWd/A9E=
X-Google-Smtp-Source: ABdhPJy9nwmv9h7+IIW2qIR4nN7Ie8v5Tsn95/dh2n7QCJiwTlFtt4JFkbIrI5aPXQHuypr2B+++qg==
X-Received: by 2002:a50:d88a:: with SMTP id p10mr32857947edj.274.1632248348706;
        Tue, 21 Sep 2021 11:19:08 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v9 12/16] staging: r8188eu: Remove a test from usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:30 +0200
Message-Id: <20210921181834.29677-13-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary 'if' test from usbctrl_vendorreq() because
"length" is never greater than MAX_VENDOR_REQ_CMD_SIZE.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 04a878c1a87d..b3f8a76b5db2 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -23,12 +23,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 		goto exit;
 	}
 
-	if (len > MAX_VENDOR_REQ_CMD_SIZE) {
-		DBG_88E("[%s] Buffer len error ,vendor request failed\n", __func__);
-		status = -EINVAL;
-		goto exit;
-	}
-
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
 	/*  Acquire IO memory for vendorreq */
-- 
2.33.0

