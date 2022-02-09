Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BA2C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i6so3307865pfc.9
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mG3qP+QrOSaboEBGdq6nQWobBpgHojm9ly6BViVKhnI=;
        b=iGmaY8/LbHXSahcXRwibEhuKkjW3drpXi2oD9PnOA1sTwJIq0H3HyYB9SQkBujf34I
         DjvD0PtveUK2q0S2uwwc2NbvRmZTdHdEeH6Wugelfd1pjVDxjZdQK8NPnGFtbrS46aXH
         V754YgJ/3MP1GMhidVa9nFdEAezjpbIdqC4SucMqI3v0/ptAfng5bpf2zf9cj8Nw0agS
         GMDxdS0PmfV5i1DCxmFBOjcTKrHkQJca10HyDQDnK9dQ6rFnWme4lMtdcPChbFemwmxf
         n8l2w51Bps+9CEKZtIf/JvhmKtMt/hPBcTaqM1KyoRpb0FQlraLyBz7nOdYRLyEFiXAv
         hj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mG3qP+QrOSaboEBGdq6nQWobBpgHojm9ly6BViVKhnI=;
        b=QlJ87zdQFt927FWpedHMmMc7ko5W1vv4lBhe2TfUa+6WnVGLdP9D51YYS7jnRvn8yM
         6/j9Y72n0HZ7O5dkMC6wN4kPMaKu8pwO3upB8OgaE6d00a5c6AEc3oLx39A32IWH65eT
         k7e+JPKJOoyBdP48A+f//U1mSSA1uScTFnBV5etBw4XsnOEdRIhd7cCgJ2A5LCLkIqF0
         zxHzOAPuQX4VEcxy+bnb010xLmfJYwFr19QQUHPv3pN/7GRfZ9mjA0x9AvgRJ21tqXNM
         AdUWV4O9jc7XsCsIX9BBsbN9YKuhqIsDP1IG20mTGVhdHnFnS+Ea41ZNWV0IeQIllUZP
         BAQg==
X-Gm-Message-State: AOAM530Z3kwyE7IFAkRV7AntDhTsBDzJYZzvNUchu9I+aDiIZ5fzWx3l
	L6ZrLspj9AfjeG5DJ/Jfyow=
X-Google-Smtp-Source: ABdhPJxC2Lph/4BCmF1vTLO7c0xSu3cjJFT78SsazSwJuS6z7T6gYsvRk0BbPcls5rNtFb1swvQKOA==
X-Received: by 2002:a05:6a00:88e:: with SMTP id q14mr3094913pfj.47.1644424658229;
        Wed, 09 Feb 2022 08:37:38 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:37 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 4/9] staging: r8188eu: remove empty function _InitOperationMode
Date: Wed,  9 Feb 2022 22:06:02 +0530
Message-Id: <07083cbb8b09957d2fcf9e5b70e0fd832ce53f35.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of function _InitOperationMode is empty. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 659e0f26db29..66e90c6928ca 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -449,10 +449,6 @@ static void InitUsbAggregationSetting(struct adapter *Adapter)
 	usb_AggSettingRxUpdate(Adapter);
 }
 
-static void _InitOperationMode(struct adapter *Adapter)
-{
-}
-
 static void _InitBeaconParameters(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
@@ -635,7 +631,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	_InitEDCA(Adapter);
 	_InitRetryFunction(Adapter);
 	InitUsbAggregationSetting(Adapter);
-	_InitOperationMode(Adapter);/* todo */
 	_InitBeaconParameters(Adapter);
 
 	/*  */
-- 
2.34.1

