Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FD7B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:18:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i82-20020a1c3b55000000b0038ccb70e239so1023835wma.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3r7O9jHU98BWgcu+jBEa/rllRwW774nvph0dWvI3Q58=;
        b=ewn8QLRlCSPgCWU2xGDKwaGsKBJvKuehotVP23Tc9czCjucDaQixnCkYBFqOh5Lorg
         OBDyN93rY2Srmdv17UVs3oPZri8dyuuZaj9ZTADrJteDGYrG4ITPCJ4vVPEpAHPzeKfT
         1erhhKcK9e9jmaDpHhfCwJ2JCZCSYKWrAwAqql9KvcOCB3OkYViPKPWWPTVw56ehd88w
         JBJ05Mli9oYcr/tSB56DIrqIbr+okc2ZgnPX3JQ9eCIQ46QqJ13oTsTDrXFI+xNBLisF
         CobF+xlEVB8LXeCRtZrhuHIsZs0i/RlWmyR4cVWo1crkT3519dKLMSecQGvlTIs6zWJi
         Sq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3r7O9jHU98BWgcu+jBEa/rllRwW774nvph0dWvI3Q58=;
        b=NE2lmGbiGM2/8AFcR+IP6Dj2gtDWL2mJ63g2Ns42GGuUO5e9nBSonjenRCHAn5QraY
         edPwAtH4mSN1O/GfTa0ElQySBhQKWnV2yWIJaUrEx6+0EKrcgffPYNo1uOIrI0f75Ue9
         hUwv6m9DiVnQ/kxgkzdw7vZoBpFtdix8B1PZlOxtTnCEWBz6YLaFerfepVUi+pk3JQBT
         WOjZ07ww1ig1U6npch6OBq4QKpJtLanSAb05qskm3ILC12Yy4QbthB4r22APtuM+npt4
         R2yEDjk/u1epGjrI1iDZ+cmrZnErzFceYElOdN8Pgcy4gGD8vmLT5KnZPrsirGOXfmsN
         72pg==
X-Gm-Message-State: AOAM531LpkU4OxaRXkcpWLljZGa/1HIGHlQ9HIjROYC4FScn1D1KqEwu
	LykF0j8zGO4K/ul2rkIBqBs=
X-Google-Smtp-Source: ABdhPJzmHm+1Q6N/ukniEJqJEgv0gHvZkFocvlhvKx1KJWDfVWoIO8oyF10j0cQgKu+jK5zR9YqGEQ==
X-Received: by 2002:a05:600c:3ba9:b0:38e:c8c6:ae0d with SMTP id n41-20020a05600c3ba900b0038ec8c6ae0dmr2466305wms.120.1649931519234;
        Thu, 14 Apr 2022 03:18:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id r129-20020a1c2b87000000b0038e6a025d05sm1777745wmr.18.2022.04.14.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:18:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: make read-only array EWC11NHTCap static const
Date: Thu, 14 Apr 2022 11:18:38 +0100
Message-Id: <20220414101838.296944-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array EWC11NHTCap on the stack but instead
make it static const. Also makes the object code a little smaller. Move
comment to clean up checkpatch warning.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index 358c35d9589c..b4cbe499ba37 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -480,7 +480,8 @@ void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap, u
 	}
 	memset(posHTCap, 0, *len);
 	if (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC) {
-		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};	// For 11n EWC definition, 2007.07.17, by Emily
+		/* For 11n EWC definition, 2007.07.17, by Emily */
+		static const u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
 
 		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
 		pCapELE = (struct ht_capability_ele *)&posHTCap[4];
-- 
2.35.1

