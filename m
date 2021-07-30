Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1AB72
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 14:54:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id p21so13542786edi.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EUYpGNRc+bZWd4eXG+Pz5fTX220aWFftXyXSfRx6Pfo=;
        b=VjBXTwImJHb+3fzN1KzTIPYcdKszZFYIVFTrp9y9ejOFqXEUL7HL5sh5+iUPP0IFf7
         czVjIeDaBs+VbgP217TukyVQ2R6YBSdTA9Wcc3PiEn+Zo3Qa0RoTrGUwrtzHRidHNcWs
         VehUrJeS+7/P30b75EGk6WH35U2BYDAFvUo6RANKijuNHUVj8KU7EdlaHCcRW+/FGNo4
         fz/0PDez2uxpe4qV+A1O3fGGBHinuneOe6d0MhurqsUvEHmg7Vg/Ak/mgxtWltMJbO3p
         B1Tf0FGKCllty06+bvX2//xqOSTJ2jMs0ZvN5M+++4wsQz402/JCVkOKyTLrcUGMdlTX
         r1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUYpGNRc+bZWd4eXG+Pz5fTX220aWFftXyXSfRx6Pfo=;
        b=sstyOUurD2O15IBUFxrdG/S++259Uk7LJzC5vkxIKPzOPWNGG/4d5Pj1artxRfIuD9
         D+jY82kz6aEfc6wyIo3nQlO+XWBHG4F1/Mo5HpGXCwr7S7dmoVXnMaEN1JYBSJz6XNRJ
         JUGe1TnTBWkIlittQrFMFCTb2pD6xL0CMKTcPswrUoVmqt4v0R+ejnjJL+L43rEdCrbo
         4r5nu7pDO5GuuP4jcwiPXzpgvqdh9nqVKMF/DxNslDIfEZ8Q1NGPF2QU7m+ZqvPXctkr
         LI+MehJ2rR/A1U7q0mLxceaqEw3zK/C28HHTYQ8vq7h9t2BGOvbmmvb6qXNFlK4bFPpI
         +HWg==
X-Gm-Message-State: AOAM5339vwxZaniRUoYMz4omVlQZ4kyx1lTu5Y46+lx7y6ytW4digQ8j
	gG/M6zzRLs9aCU8iFIr8UeQ=
X-Google-Smtp-Source: ABdhPJz5thhmML5rAzie7DuETH8qrqPzMxYfOSa2bXGtSJVXMEURv4Blx5Iy8eYZYImffqkNKG2tqg==
X-Received: by 2002:a05:6402:896:: with SMTP id e22mr3477386edy.246.1627656854641;
        Fri, 30 Jul 2021 07:54:14 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id e7sm638775ejt.80.2021.07.30.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:54:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8723bs: align condition to match open parentheses
Date: Fri, 30 Jul 2021 16:54:07 +0200
Message-Id: <941bd42ef6b7d76e80685b133046669a0ca82d8e.1627656773.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1627656773.git.fabioaiuto83@gmail.com>
References: <cover.1627656773.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following checkpatch issue:

CHECK: Alignment should match open parenthesis
54: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:609:
+		if (target->reserved[0] != 2 &&
+			target->reserved[0] >=
		pnetwork->network.reserved[0]

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index df599c2009b3..d3d068babb5e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -606,7 +606,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		/*  probe resp(3) > beacon(1) > probe req(2) */
 		if (target->reserved[0] != 2 &&
-			target->reserved[0] >= pnetwork->network.reserved[0]
+		    target->reserved[0] >= pnetwork->network.reserved[0]
 			) {
 			update_ie = true;
 		} else {
-- 
2.20.1

