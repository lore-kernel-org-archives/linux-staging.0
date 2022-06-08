Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F97B
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 02:38:46 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id a8-20020a05683012c800b0060c027c8afdso3988388otq.10
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 19:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=seHIkk6akkyF7CqpwiNW+0WVZl9SkWhR+b/C+2qe9G4=;
        b=YOK0HcWAA90YodJ2nL05eBhKnHKJXgatVghFjMzOLBeY1sO5XlswkS3tJx5kaP+cq8
         suzLXkqWriK1TtM5RyuKk7dlUms0biHQSVFubv9pd/lZ4ICHLX3jIZcWhj5dQRY7KOhQ
         4ygfWNfkBaNSLhxl7blJ1A/0MP4kSfJFSYzACHbNWt2lBMuPcRdWGA+7kyGqaV+qkk8b
         3Y3UCQA39cbugLFYyUAdFWpFsju0CFIyOO9TY/V5nRn/NjvSkDKyFtG6k8deDQ+DLl+i
         /h1JDHTv1Zf2WN6KHBMakK3bufIDewRW1DlTP+qPYaNmZHSbiKPRQEdDs6XsKe8vDfJ6
         3Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=seHIkk6akkyF7CqpwiNW+0WVZl9SkWhR+b/C+2qe9G4=;
        b=ze2mKs4QNr9N7vF4a9z781WX961oTMyt/occTDzgp+TVW1E/UXBE2ZlRBi4QIL0tI/
         84WBjjGda7nzFUEcLeprLyXq18ng8P1ozshjJOEUZHR3n0wuMTKaTp35hSGjs5RxjLpZ
         MNNZ6biPFUAQMWSdihwFkb620N58a8jWFBcZoGkT0XRFNVQaI9wie7l4U4pUQsw/F+VG
         IZvMamd1fPPM+frYqIrapje+ALAQMkG4NKMlwG/E/m9IwOYtvFvD7QcobzNZRnt8Fyr7
         K+KAuEF0XRc+Z4F7kXmhTioTdOj7+VPHhXjNBn5ezt7EvFZj701kPCOSXlX3cARDK/eX
         3fBw==
X-Gm-Message-State: AOAM533a9eynBaZYHP8Ti54gN3mGbIv5QDozmm7nsMzq8FJ6GBgQ2g+4
	LxCOtzpCvYz2avmQzCJo86A=
X-Google-Smtp-Source: ABdhPJwN579Dw9mL+NEXRXZaW2uFpTDJdVCKJLuPfabUSx+mjo9tNzxNHAigIK7k4SvU6sPAnbQIKg==
X-Received: by 2002:a05:6830:919:b0:60a:fe63:e321 with SMTP id v25-20020a056830091900b0060afe63e321mr13208882ott.227.1654655925801;
        Tue, 07 Jun 2022 19:38:45 -0700 (PDT)
Received: from debianmain ([190.236.207.56])
        by smtp.gmail.com with ESMTPSA id eg21-20020a056870989500b000f31e826f15sm9015107oab.24.2022.06.07.19.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 19:38:45 -0700 (PDT)
Date: Tue, 7 Jun 2022 21:38:43 -0500
From: Rommel Rodriguez Perez <alrodperez@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Add blank line after declarations
Message-ID: <YqALs/7VkGsYUngw@debianmain.debian.pc.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch adds a blank line after the variable declarations,
it should remove a checkpatch.pl warning and improve readability.

checkpatch output:

WARNING: Missing a blank line after declarations

Signed-off-by: Rommel Rodriguez Perez <alrodperez@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 385a9ed8eff7..bc8543ea2e66 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1048,6 +1048,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	unsigned char *pbuf;
 	int group_cipher = 0, pairwise_cipher = 0, is8021x = 0;
 	int ret = _FAIL;
+
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.IEs[12], &wpa_ielen, pnetwork->network.IELength - 12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-- 
2.30.2

