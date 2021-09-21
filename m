Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753872
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 07:34:44 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id c1so15732707pfp.10
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bF9+Kwfn7J49uwIO6g2s47av3jU4BAiRk3ofOE8TGxo=;
        b=aW64q1DW5XmITWIlAMoTrDOd28xiWhCwkhTwXudAdPo2nubWch8Ds4qlAVM0qgsp4P
         BItRrHsQXyRHxEl+NND6UVLQM0YEBW4lN3eHhb607y98YoifpIts0PfTnUKIjWcnxtOr
         thi7ThtvFhRQkhR4o4TbtME+FQ3m6ppcMaYYu4qQfLuPbPOaGbqfcG8kFvz6ruafqznx
         8QHtnBWlbvk+Zo2L3eHZ5tS220B29MrsMm1Ut19q67x5UaF2GBAFSaJGTrzI+BP3lL1f
         5pJ4AXs2iGIBPI3xnsLvZ2M/qUNwfyBX6yNYCVTaqIO72LCCmPj88Vzw9t8HP9toQC21
         hB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bF9+Kwfn7J49uwIO6g2s47av3jU4BAiRk3ofOE8TGxo=;
        b=uHUUrvzvzrKbbmy4KuW3V63+CAOlnWV0ajTYw/3ivwEFG8xE05E0n8f0qLUy4iltoM
         2aJO4MLccp53HylOlbhZyoHaVxNVOUuRde/iF5cJre8uDu8l3uTbdY5KukIwlZ98eyIt
         O1FkFt087sLvLoTTCwBGLO5W4vwp5J+HecxragIgFPA+gp9gEhpSApSubwtbHCeSXnAl
         RSAHDwscqoLlSuwWuBYoGcF+F6L5KmrF6j/Jt/WxfK22EpwceIFZ8fDYyamorXIUGchW
         vzw94oyVbrpd1A6YQC/l1ZiBSq9AaQbqFvNvFKafr2G4XCugSurn6r5j3qTwUS8XY9t4
         8eNg==
X-Gm-Message-State: AOAM532owgUnZ9vJndruG4WvFlMuGH4ObYRL+EYuoemqfy0Yfu9D03j/
	epu4drnDDUtM111ZC4s5bLs=
X-Google-Smtp-Source: ABdhPJw6ZwGxaugEdf5GoQzLvqC+7wCzPFlZRYgxnMpnNl35ml83OQ3KSy7+llpYY5uG0Megdpz+dw==
X-Received: by 2002:a62:1dc5:0:b0:43e:f8a4:49a7 with SMTP id d188-20020a621dc5000000b0043ef8a449a7mr29648570pfd.26.1632209683801;
        Tue, 21 Sep 2021 00:34:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id x8sm16565957pfq.131.2021.09.21.00.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:34:43 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rts5208: remove parentheses pair in sd.c
Date: Tue, 21 Sep 2021 13:03:49 +0530
Message-Id: <4a56facd2c04a321b091d3b7dbea87168e8ddd6e.1632209460.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632209460.git.benjamin.philip495@gmail.com>
References: <cover.1632209460.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I had missed a single parentheses pair in the commit for sd.c.
This commit removes the pair I missed.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/rts5208/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 71f04e317eff..d1fafd530c80 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -1335,7 +1335,7 @@ static int sd_switch_function(struct rtsx_chip *chip, u8 bus_width)
 			return STATUS_FAIL;
 	}
 
-	if (!func_to_switch || (func_to_switch == HS_SUPPORT)) {
+	if (!func_to_switch || func_to_switch == HS_SUPPORT) {
 		/* Do not try to switch current limit if the card doesn't
 		 * support UHS mode or we don't want it to support UHS mode
 		 */
-- 
2.31.1

