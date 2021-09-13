Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A164C3FD6
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:21:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so568413wme.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZV13C/zz+ZK4eN3oVLerUIs4y8cKEdw7JYNg/SDTwQQ=;
        b=DgezZRIPqBxnzmgssoZORn/3koTutjN3ojuI01tX9ewMCJ8nxwhqCffov+lPuMBqCB
         j5/rYH9ysjf7sA5x20M4EnjwcA4OICg54TG2LRTemEJU20NY8eMzZ3i9x+nU4+BgB/jK
         9588sc8yV3bsfaI5/29W7ZHz+TDMfUKycielH5ebYFmN/v/B/V6GG2vLEFNUVNOrPhlL
         yF4yW8QE3bAuL7mntLPEPithm4LV2kAEfvRvQ+NWVLGM1/2KupFSqlqe1L639BOuvpa9
         vp8QRteTVJGfx+MALtK0Oriuo3C/NzvwQHewFIpAJHm1BKK2ZBHo9skmCZwdUGnVlSky
         k2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZV13C/zz+ZK4eN3oVLerUIs4y8cKEdw7JYNg/SDTwQQ=;
        b=VeUHWV6Ql6o502bafmaHvcaWohmN3bVpHsMk9kWgwlDQg/1p2Dly9DEei9m8Gb7gcC
         zMtYgXNtgqWqG4AGEaJEZvfs6k2Ey9DVSCq+cxCKudHTTV86+957n2U7MbncxAwoocd0
         YQSd5pHWGN9qHMgm6pOafbcd/e9J0JJAW9rS9W1rbZoKrNLEZgK1VJSn6jFiVhUopQuu
         gBevvNa0sQY50DlA1i6BgdEiBxeI1f6OaGM5w5HgoGWM7NCRdBS8DLtHt2VNJH+jnQFC
         KAb+Vz6q0mbr8DiK04sh+nGAVg+TMS61Qh5QlUlyI3YRExtInJ8uAp2iWFWlhf68BFer
         TBwg==
X-Gm-Message-State: AOAM531S6jnIYU2jChOstV7PVQX27CkEYt+e8qDreCd1DWs7WmiySDBV
	5beU4WwXWEOFoT4y8SMQiOs=
X-Google-Smtp-Source: ABdhPJznzcdnB6lpZhJKjUySGe8qzzvRB4At5/cRk1IQYna+qigNrgQ7jpb/hZUTLWvqgYe3WTgCFw==
X-Received: by 2002:a05:600c:35c4:: with SMTP id r4mr13119651wmq.194.1631560872076;
        Mon, 13 Sep 2021 12:21:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id m2sm475021wmm.3.2021.09.13.12.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:21:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: remove unnecessary include from odm_types.h
Date: Mon, 13 Sep 2021 21:20:43 +0200
Message-Id: <20210913192043.26527-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913192043.26527-1-straube.linux@gmail.com>
References: <20210913192043.26527-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Including basic_types.h is not needed in odm_types.h.
Remove the include.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_types.h b/drivers/staging/r8188eu/include/odm_types.h
index b8a8465f08f9..7b6a3c392f2a 100644
--- a/drivers/staging/r8188eu/include/odm_types.h
+++ b/drivers/staging/r8188eu/include/odm_types.h
@@ -17,8 +17,6 @@ enum HAL_STATUS {
 	HAL_STATUS_FAILURE,
 };
 
-#include "basic_types.h"
-
 #define SET_TX_DESC_ANTSEL_A_88E(__ptxdesc, __value)			\
 	le32p_replace_bits((__le32 *)(__ptxdesc + 8), __value, BIT(24))
 #define SET_TX_DESC_ANTSEL_B_88E(__ptxdesc, __value)			\
-- 
2.33.0

