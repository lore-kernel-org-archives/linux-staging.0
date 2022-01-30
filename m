Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10F2C9D
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:36 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id u24so22365109eds.11
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpjEU+HIzlgzBoge8WodNw05G6vDhZ9EYEyUvkNOGoo=;
        b=naQ3ofGHLF180Kudff9gq5aGmb5N7VtlRFVbdjziOzgFQpXE6F4uWIZr7W+ur3F6vI
         e3b0tNN6cy+yyscOG17KL7HSVODDRGynY2VEm7CqYaTUJ1wYJS1/6ZIsjzvFD3MlpwY5
         gcFE3rXQdgMsU+HDn8KG27NMvZ2cTVsBW0LXZ08McMbEc0f8cghELdg5x2VNiMb2h3eS
         CeMa0jhVfFybb65+tM44YeJZjEpLxIQyG3pfpKM9EOIUYAkVJUcOlqGi/Vr1X4y5Ymv9
         vxWvf0AdkS2PQwEYsR003Wd+BRetW6w5NqA/1+gRzMaol8hCAGxH9bnD2CqUxbaDL/dD
         FI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpjEU+HIzlgzBoge8WodNw05G6vDhZ9EYEyUvkNOGoo=;
        b=I1Ccq8UapyAWQ1skjrnjtBSApbEnPLO2tlz2Ie/3pPizIIn62Gokgi/HCni0Fpif8a
         L74RuVb4ft8s84k77TrBL4GQMZIC389CTEIH0Ov4jm/fyk+pPhAciAwr8M0Ov1fw4Qhn
         r1WtpImHelmR5Gbj+rHS8MpJcv1wgzUseI19kdanF3YfwYRdt63j0vUeWa/uQWw38u3P
         vGsFATISc55erlq3CyYIzBYT3vTBpTnb9c6rMfprj1lKLeb84tfrJnnD871OfHwsWyAM
         ho92BfsQhcaGrZaG9x8N1fv9AMAADpx6oqpT4Zi4cTVXt58+On2tPChrCIG7gxo9Ql27
         28LQ==
X-Gm-Message-State: AOAM532hHnt3DdUWQw/k+2hDOinSARqX4JG2py0HjEiRVzx5qY7Z1iMK
	OJS8LX31S+YpigDQpXvULZ4=
X-Google-Smtp-Source: ABdhPJwgn4s4l4xW0DYeD7BDUIO5LZxcNr4KsaPnrESap+vQCq1swDXv7rQGG/omvrlDka+XZMxXxw==
X-Received: by 2002:a50:ab1a:: with SMTP id s26mr17283316edc.85.1643569414894;
        Sun, 30 Jan 2022 11:03:34 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:34 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/12] staging: r8188eu: remove HW_VAR_BEACON_INTERVAL
Date: Sun, 30 Jan 2022 20:03:10 +0100
Message-Id: <20220130190321.7172-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_VAR_BEACON_INTERVAL from SetHwReg8188EU() and call
rtw_write16() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c   | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h  | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index aa5ed6ecc432..ca4135ae587d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7053,7 +7053,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	SetHwReg8188EU(padapter, HW_VAR_BASIC_RATE, cur_network->SupportedRates);
 
 	/* BCN interval */
-	SetHwReg8188EU(padapter, HW_VAR_BEACON_INTERVAL, (u8 *)(&pmlmeinfo->bcn_interval));
+	rtw_write16(padapter, REG_BCN_INTERVAL, pmlmeinfo->bcn_interval);
 
 	/* udpate capability */
 	update_capinfo(padapter, pmlmeinfo->capability);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 7043dd603c11..95e89c3063f1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1246,9 +1246,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write16(Adapter, REG_RL, RetryLimit << RETRY_LIMIT_SHORT_SHIFT | RetryLimit << RETRY_LIMIT_LONG_SHIFT);
 		}
 		break;
-	case HW_VAR_BEACON_INTERVAL:
-		rtw_write16(Adapter, REG_BCN_INTERVAL, *((u16 *)val));
-		break;
 	case HW_VAR_SLOT_TIME:
 		{
 			u8 u1bAIFS, aSifsTime;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 40e1f98f9587..f5a6cb9a03fd 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -20,7 +20,6 @@ enum hw_variables {
 	HW_VAR_MLME_DISCONNECT,
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
-	HW_VAR_BEACON_INTERVAL,
 	HW_VAR_SLOT_TIME,
 	HW_VAR_RESP_SIFS,
 	HW_VAR_ACK_PREAMBLE,
-- 
2.34.1

