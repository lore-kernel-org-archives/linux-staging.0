Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13817C;
	Sat,  2 Apr 2022 11:37:48 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d29so1563211wra.10;
        Sat, 02 Apr 2022 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LnSYZsmgMzEbq+f2jszfZPGO/GYBrKMzjlQ6YrWUQls=;
        b=JXrJ5pdAyvnT2m35Qe2NYxVQNjZD/GNWeN7qhYu8k9O08zpmkdKWt2KPC4cYqkiE5D
         tykqT3vxPqH6m14IGblD+qteKLFJEEqkaGLyUzNDBldteMA/Etvz4HDTJWtTxwh6QgtS
         FCYi/jPIvVstXjEiKotOZzDmI1aoZLktzrzCiBL2zrTcPKycfJ8M7cRlCnBO+VxKA631
         vlVEWKxYfeho3oBwpuRcPfKmDNodU6G3Vz51kPkdp5xmIyUBuPXgTYDFcPyo2e253Me3
         Vj+4dbNTOh+VTAgYbApmmi2HzZYs+C26DXh+YVeSVCtXjJ3inS2707+3fo01TW3zYwBQ
         sqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LnSYZsmgMzEbq+f2jszfZPGO/GYBrKMzjlQ6YrWUQls=;
        b=EvJVBACTeHrCf0Q0L6MWVRlcU2w7eO3k3X9kCroPuQPA4FxtmCsSE+0fNTZu2h85WW
         atwrCTUsUb+nVRDkNFqfpSqNR5ezk4rcMWj3juB+YibptJKIjHANTyK3F4u9gD24SkD0
         4pcnDzI6QYPe5nGQFKHLkIsgtN2i8zrUicqoC2T/VE8JRjbvuBL2do+2D28zqd/m6Gbd
         //m+GAmQn9g9pRi4PMyBomHIITZY3TYhU9etnyahmkOfaiYSipYx/A9GQTVk2vtdhWmE
         T1W9/Ii4UpvnRH0xFvq6WcbTXqy/EGo9gQF4KewyVbenFsQmV+FxPE3yJfG2sZ7N1k8Z
         v30g==
X-Gm-Message-State: AOAM532pPph+166SYP865fFg3swPXEv5TIMaP1/xK/+TjUHLs5n6g4La
	iO2MUSomgq9oG8zOiweHuiQ=
X-Google-Smtp-Source: ABdhPJwLGPMqJnCDSNX0CjZNkeF5DJSnc8T/AlGT+gWpjPBXK9f0h+QGLvPTZowCWhVEyOe1V+tfoA==
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id c10-20020adfe74a000000b001f025cb3ad5mr11057941wrn.231.1648899467165;
        Sat, 02 Apr 2022 04:37:47 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d440d000000b00203f2b010b1sm4368155wrq.44.2022.04.02.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:37:46 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 1/2] staging: wlan-ng: Fix Lines shouldn't end with '('
Date: Sat,  2 Apr 2022 13:37:32 +0200
Message-Id: <82bb0ca2bad1bafbaca8ded6fe82b94e4761f648.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
References: <cover.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "CHECK: Lines should not end with a '('"
for lines 331 and 485 Reported By checkpatch

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 7951bd63816f..69d616f19cff 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -328,8 +328,7 @@ static int prism2_scan(struct wiphy *wiphy,
 		(i < request->n_channels) && i < ARRAY_SIZE(prism2_channels);
 		i++)
 		msg1.channellist.data.data[i] =
-			ieee80211_frequency_to_channel(
-				request->channels[i]->center_freq);
+			ieee80211_frequency_to_channel(request->channels[i]->center_freq);
 	msg1.channellist.data.len = request->n_channels;
 
 	msg1.maxchanneltime.data = 250;
@@ -482,8 +481,7 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
 				goto exit;
 
 			/* send key to driver */
-			did = didmib_dot11smt_wepdefaultkeystable_key(
-					sme->key_idx + 1);
+			did = didmib_dot11smt_wepdefaultkeystable_key(sme->key_idx + 1);
 			result = prism2_domibset_pstr32(wlandev,
 							did, sme->key_len,
 							(u8 *)sme->key);
-- 
2.35.1

