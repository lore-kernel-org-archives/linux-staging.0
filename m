Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5F7A;
	Sun,  3 Apr 2022 22:42:15 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id kd21so6222510qvb.6;
        Sun, 03 Apr 2022 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Ylr/q7X8v75OzYx2YPZzEqtYHesEZdwi5ZjBwvGkMpk=;
        b=VHzrwaEIoRFGPw+0/6o86lbnEVNoSpp9KxVUXEjK8HnYRn5OU7YLDiYjBHd3RGBdwl
         1IfnSaFh/5+DNFUHHYYOzcacLzlHR7a5oNw5XDf6/iYOB0OTB5vcstUjas81HSj1EIS0
         Dw0Zj0HMspIsnQkr3I+fUemNYTOB2Sz+75s3+Hn1tYCAuFMBDl4DSOgKZoEPrxhCOvxB
         Ev2OtF0GzOTUZdh6if9IHDin89gtNuxECbo7SFNeEzbn+7yKef0/jihuyL2bRiIhcSIp
         w1b2MJRW9UEtLwWQTZB76yblgLF/AQ+hg5PGNlzLO8isY9WWfgRjhcuOFrY5sftlq3ug
         7sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Ylr/q7X8v75OzYx2YPZzEqtYHesEZdwi5ZjBwvGkMpk=;
        b=F4XlfYFM0EFLNeBMuejMlp450xzqLEiJJjohES+iVMvl0LJ4Di0ic3FnYUXXlbkpIs
         01q6tcZiMYBV7jVzmziVEjGniBMSpQF9PF6xlF4Az6vaUStPV+iPzuCZ+2PIeiG0vuks
         dxqzF0+fWZ6BCGhJz9kna5K0Ndc9rgGNoUJiw9APPuBIExbRa9MweZ68nmAlKFs8n9Th
         FteF7UBagg5IJ5wrlQ9bGMCX/tDVOmXRGDhiBxcl5mptupeIQp6g8KAR95rlHCpQnEw9
         cy/F1do01VO0UZ7TjaNr1DczZKRiSe7vZeAirUlu2UI8hvrKq2xWO5+pOjrKF1JyoIJ7
         RGfA==
X-Gm-Message-State: AOAM5321DlzkPRPfGgG+AWn/9YGhuSC4jvFvHz099S0xuyrGQSr6mYBZ
	lTknxuSOFVklMClr9KoRfyaC+/WK61oBrQ==
X-Google-Smtp-Source: ABdhPJykPbgKEIE6CUeou3/iSifvRf6zrTNJMVFvxt7I57A0orWy2N0jeetD/xK4ObYXWUbxN9bF2w==
X-Received: by 2002:ad4:5be1:0:b0:440:a2ec:ea99 with SMTP id k1-20020ad45be1000000b00440a2ecea99mr46809616qvc.20.1649025734384;
        Sun, 03 Apr 2022 15:42:14 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id e7-20020a37ac07000000b0067d7cd47af4sm5165031qkm.31.2022.04.03.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 15:42:13 -0700 (PDT)
Date: Sun, 3 Apr 2022 18:42:07 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: simplify control flow
Message-ID: <20220403224207.GA397480@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch issues "WARNING: else is not generally useful after a break
or return" for the following code:

while (1) {
	do_join_r = rtw_do_join(padapter);
	if (do_join_r == _SUCCESS) {
		break;
	} else {
		rtw_dec_to_roam(padapter);

		if (rtw_to_roam(padapter) > 0) {
			continue;
		} else {
			rtw_indicate_disconnect(padapter);
			break;
		}
	}
}

We simplify this code in multiple steps. First, we remove do_join_r
variable because it is only used right after it is assigned. Second,
we remove the unnecessary else statement right after break:

while (1) {
	if (rtw_do_join(padapter) == _SUCCESS)
		break;
	rtw_dec_to_roam(padapter);

	if (rtw_to_roam(padapter) > 0) {
		continue;
	} else {
		rtw_indicate_disconnect(padapter);
		break;
	}
}

Next, we move the call to rtw_do_join into the while test because the
while will loop only until the call is successful:

while (rtw_do_join(padapter) != _SUCCESS) {
	rtw_dec_to_roam(padapter);
	if (rtw_to_roam(padapter) > 0) {
		continue;
	} else {
		rtw_indicate_disconnect(padapter);
		break;
	}
}

Finally, looking at the code above, it is clear that the code will
break out of the loop if rtw_to_roam call is <= 0. Hence:

while (rtw_do_join(padapter) != _SUCCESS) {
	rtw_dec_to_roam(padapter);
	if (rtw_to_roam(padapter) <= 0) {
		rtw_indicate_disconnect(padapter);
		break;
	}
}

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3eacf8f9d236..a45df775d535 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2594,30 +2594,20 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
-	int do_join_r;
 
 	if (rtw_to_roam(padapter) > 0) {
 		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
-		while (1) {
-			do_join_r = rtw_do_join(padapter);
-			if (do_join_r == _SUCCESS) {
+		while (rtw_do_join(padapter) != _SUCCESS) {
+			rtw_dec_to_roam(padapter);
+			if (rtw_to_roam(padapter) <= 0) {
+				rtw_indicate_disconnect(padapter);
 				break;
-			} else {
-				rtw_dec_to_roam(padapter);
-
-				if (rtw_to_roam(padapter) > 0) {
-					continue;
-				} else {
-					rtw_indicate_disconnect(padapter);
-					break;
-				}
 			}
 		}
 	}
-
 }
 
 signed int rtw_linked_check(struct adapter *padapter)
-- 
2.25.1

