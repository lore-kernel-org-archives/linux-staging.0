Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A72FB0
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id ec55so2445753edb.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HaElkBZukImqyfYUL4Ia9Q9pWYvEVfPFLl5fxZCgIg=;
        b=EwNYuz70VcWo3edhithhQnESoF1zBsTjupyu3hqtJxjw+C/G84BB8OcYMbna//aKKt
         QnJw6duc6OlBaTAYYcVNb5JtzyZfJQ3K/2LzsB5KqOiFPpjDbIPZyCHRPPhoBi1n6iqk
         lq6ncK6kWMVXdgb/TKXWGaI2i5wrkPEKKeizgsLq65pSux2EcfAPOW0FkG3+FWL9ynNc
         Od/auxZF8+AC9wA/eai8Lxcib9T5EqUhyC5DBYAFcdUuxrbdCExsoQWH3LuSu4HJluE0
         hRC7yGsSILmg0Sij8Q/F13xKPKnKHJpodcVNjqbcpsLCkM1iwa190qYz4RrbsCZSpAUK
         N4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HaElkBZukImqyfYUL4Ia9Q9pWYvEVfPFLl5fxZCgIg=;
        b=RTX4K0zqOV6QqOQYRfh/xxxF1L7zVRe8gBelU1TfHX1bAIIj+j/NE2I4JAtMoCBef/
         wi9eYCeiMTR8wqiiQSEfBW/+duD5R6NaKpjGsKqlzl0TZUwPEEdq9l0IUAzcm6FOk2fc
         sHylKt7mN1E/RyT/eFMW6vGGywRkaTtcV2IgTftxAZ8u3K+TFqWYKDxtimJ/BbuLCuBK
         yk8ZmbTUnsKiUJ+8uHkHJVjZAJpMvKSKARsjR6T1qwGmpzM6w+0EqqPf1WeDSM3C/YI1
         O8gcCJa57RJixxtqNX6vF9sLubm/ix/UuBbeGRmzW26NjCwgBXmYVjkNtv+4gbmf8t6a
         Kpyw==
X-Gm-Message-State: AOAM530NWwp6U4TEXKweEToOomF2virIpr+BCQ34aLm9AKRB0wH09xou
	tQjhnsSyzsSnXUqNmo1Yg+o=
X-Google-Smtp-Source: ABdhPJwISIpcXoohRXxKz8GthXSnt0bBzPR4mmrKhBnOinVE+dd4xYP+ZSg3DErMeHBg5kF1rb9h7Q==
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr47484243edr.290.1626874667341;
        Wed, 21 Jul 2021 06:37:47 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id p13sm6430879edq.86.2021.07.21.06.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] staging: rtl8723bs: remove unused struct ndis_801_11_ai_resfi
Date: Wed, 21 Jul 2021 15:37:22 +0200
Message-Id: <23f5764080f84e3704654b11db455e4d5ad499bb.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused struct ndis_801_11_ai_resfi.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f0977b15c81e..b101a3ac40ff 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -107,12 +107,6 @@ enum {
 #define NDIS_802_11_AI_RESFI_STATUSCODE        2
 #define NDIS_802_11_AI_RESFI_ASSOCIATIONID     4
 
-struct ndis_801_11_ai_resfi {
-	u16 Capabilities;
-	u16 StatusCode;
-	u16 AssociationId;
-};
-
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
-- 
2.20.1

