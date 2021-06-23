Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7172FB1
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 13:01:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w13so1579924wmc.3
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ffHHvblSbftugRKNFHdCEz54FjByJU5jPBUJvQCLlKQ=;
        b=oyyFAIRvKscBPkw8wh5lHltPrhJujf66ARDgrmsGXfZZkEDnR9EdbD8p4USEHKep9i
         pNglgshUvSTw+JnANym/3qKYIOOJUShQiguybMK3lGMupsNjn/g5Sz1v880K5SdKsc0H
         PBmlcEi95+urYSkMZzW+hRQl5NiBJOGtVb4l+jfsJ4HNSeQGLOFRQ6pU3nmwoMmWNHyp
         54ANU6cb1slIPjkqZAx1c+EjOvf/jEPbZoM1Vh7eyeQQnZtfanHfQyVzT9DGIPWg+LFQ
         pZcxER23meMDlHIEIYG9Z0aU90B3F6oDeN+smOBEHofDrWumsII0Swobb9Diwf0sHmrZ
         ZWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ffHHvblSbftugRKNFHdCEz54FjByJU5jPBUJvQCLlKQ=;
        b=IUspsWeTXYDac1M6KL3UFlyLEfE9kzOIbdXQoiwmTJGr2sp49NEmcN+odUD6sDp71A
         3mgSPsydcdRDdZrrecIT0EDeqG++SkEt3J0U4Mu2qnOwX/UWkeAWdKPDeTUMP/h4VKG4
         x+6c4+YPn3zr3n6JAQaKRGmxGQrJkBBEGy5kJ9egDyioCl3x2q7ABGlE5Hga3vm2s67G
         8ax3UPg1I2HBDOWae2UsMusWXFcMQEcwc3vHBnLgt/QOUrHOXt5Cbz70PP7/HRL8MRb0
         KGZaNydMbj5ou/ilFTHvqQxuTAjiLJXS1oR1Y9Cv8AjYZGkdLWunCMVnv3TnIW/pH1p6
         KRnA==
X-Gm-Message-State: AOAM532RvzQL65b3Fmu+eY61ZfjcGYIvZuHsicibyv85YtOeRvZduxug
	eV6L0wyXYA/UcuPMq12lVAU=
X-Google-Smtp-Source: ABdhPJyfp7sk2hIwqXsoJm9h+R+fkogfD0djsKDKd5eRr/WPRXfmRcg+OEudeCqk5SS3L7Rs+t7V0Q==
X-Received: by 2002:a05:600c:a01:: with SMTP id z1mr10878368wmp.77.1624453265743;
        Wed, 23 Jun 2021 06:01:05 -0700 (PDT)
Received: from agape ([5.171.81.217])
        by smtp.gmail.com with ESMTPSA id c8sm1946696wri.91.2021.06.23.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:01:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: convert function to static
Date: Wed, 23 Jun 2021 15:01:03 +0200
Message-Id: <20210623130103.7727-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function chk_sta_is_alive() is used only inside core/rtw_ap.c
so remove the prototype and convert it to static.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 23bbdf084631..3e2d8b735fc8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -164,8 +164,7 @@ static void update_BCNTIM(struct adapter *padapter)
 	pnetwork_mlmeext->IELength = offset + remainder_ielen;
 }
 
-u8 chk_sta_is_alive(struct sta_info *psta);
-u8 chk_sta_is_alive(struct sta_info *psta)
+static u8 chk_sta_is_alive(struct sta_info *psta)
 {
 	sta_update_last_rx_pkts(psta);
 
-- 
2.20.1

