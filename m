Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB26D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h13so24415366wrp.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njy7Oa+du+KqHnyDswra+IdM9v4OtgIsCVAqZC3W0qU=;
        b=kJo8J046FBzQko4ifjU71w5I7PLUJcsOVY3Xp4Rx9bN5bURyihlZFWMK8ddg47ioBO
         oS7/KCTVC/9YX1n3psxeiqBj13cnFSAuN6pdj0xZjRLq39R4abIfUogthj1uj8nG0cl0
         YwIisW37xRwmERMK4oKUdTJS2xSZoCUtCAn6BuKv4Fkn+Ae5GFTptaP/zH69q4nCMbhS
         1YWUoekmEQTztr7KIv85jW9D5VFSDoWC5LJQsKLHs63Fxs//xq+Jf4KXlz/Drzc1lola
         cZl8PYZAVB3H91oWZf0qIN3dioULy02IjPOAVrehlmTKF+OUtSpm2KofRqVLwb5JXb/W
         oPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njy7Oa+du+KqHnyDswra+IdM9v4OtgIsCVAqZC3W0qU=;
        b=GHY2zT10x5sEVfLcuV3ReyE+lGCmtcPFsChN3w1NGs1oJkFhoBaiBzOGay9CA9+pYK
         xTi9NFTm3mMicRS3SuwmHB+yxuvDUwLs33Dm/FeU+M2gmagDk6W8No+gesI0Del9H/TR
         SgAulx8a6d19ubx/j0EIzgYlJAhdyHZcz34LdtQ9jT7piAZIC13d23cwRDrFo9b0U08T
         ViO7bWfSPJmNy0qki6eGBdPv8TXNK7fv7CA4/VAK8+9N79RtQUhuTN7jgXw8elf8sEIS
         75yOEQIrlxkG1tpPhlgHfeXHxUZHMAsEXZUCIje8X45XRZSNkeSQVad+oPb12Wb8TI76
         Kajg==
X-Gm-Message-State: AOAM5338q6gbe2uXflk2cx3wbKUIDEic/2dYJW3uSoMC5VDjVGJ1E9UM
	7szWZnX88fdtQh0C9Rc+050=
X-Google-Smtp-Source: ABdhPJybn+cpkfnqtrnTWIY5xPf5zNgQq4ABE+NTPjpC6EwQXc7dYNsvrOrz/EqRkFpxbl8b5Yhs9Q==
X-Received: by 2002:adf:8102:: with SMTP id 2mr18778787wrm.89.1629129560123;
        Mon, 16 Aug 2021 08:59:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/23] staging: r8188eu: remove unnecessary parentheses in core/rtw_cmd.c
Date: Mon, 16 Aug 2021 17:57:58 +0200
Message-Id: <20210816155818.24005-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_cmd.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ff6c5fa71101..65ca4a2895f8 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -832,7 +832,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->IELength;
 
-	if ((psecnetwork->IELength-12) < 255) {
+	if (psecnetwork->IELength-12 < 255) {
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], psecnetwork->IELength-12);
 	} else {
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], 255);
-- 
2.32.0

