Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C53314B7
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365699; cv=none; b=nGa2p7lNWPhCZofdRo+ODCg5OHOw6zAden0wI466ez843OREhOSKJS7PFXMXkzQm+5Yz1B+QYT0NomrRA227tPxJ4JNcNiyGsY0XRtUqSPZOZgM+d6mtXQk4ffUMtFOiyzkf+aLhska9Glc6d3BbRLBdHFH5q+k4aPiI94k2jPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365699; c=relaxed/simple;
	bh=sWyB99+5sBWbk3HBJIRsGP07PNoJQbqM/Utdxj2XnjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmUEWrMR/3eR65QLOrRn8Cy+8Dz8A2hV03nYQnSg6pbKZxWDLVKt6vLjmxLRnbbBp8AJNCVRNtlQTfHQ70ls8A6LkiF9aJ69T0wpTapMTnF8KRe6hfWDr0HoCSjYoYBrh81cAGlcXw6kySLvdeukZbj48y4myrQg6XNNYLpDQjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cn5rY5hd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cn5rY5hd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fede2acso51285075ad.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776365698; x=1776970498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLeKkfzWHS5ML4Om9B8pQ3L/JlsStI2i/wsWT7w+17c=;
        b=Cn5rY5hdQLvbb/p4hZ5sqIX/2HOAdrxbjr0DOLzjAHfsv6aYXZAvCi3p7oU7omQWIc
         SzD2t//vl0MR4RjDUeiItwbMun9PmBEuh/2LPgb65bTNfIG/61UPsj7Eoewp1gP0qvqG
         tQFvV+0H38zGLPxbwDFqBFnGYHbM2ap0l4H+MOSCMC5YLMkP5b8S5v3jNk7CItI+wFMT
         xuwFdw9lziLW5iw6YIty/YnPymbvi0J5qMAvLTj3a4yKt/i5I9rTK3a9XrHXLfZ8g5nk
         4xzIeguTfRUgY9Qryf+1ttHo4S6PaDcHFWdTLbDCs8eFE8Q7sUkUVMVKVajnWHqPB9o0
         M1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365698; x=1776970498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PLeKkfzWHS5ML4Om9B8pQ3L/JlsStI2i/wsWT7w+17c=;
        b=hari0NX1BK8EAXEozAjNDpgSaZclVaiyWGUcAnZuPr3bjbJ+DVBSf1b+Fr9YqCE6ny
         jwtZzjF79s57tZQ2kM/Sno6cthOiqUCoAmd1dvbtsLmU2MGXJiPq+YYiZxh9TxPrQm2q
         ZUrJzflEc1yNLh3fmGHIsQ/m3MZMEeVrN3tFLeUTJJiSRld34r/IedyqRvKsPnCZ7ZO8
         XzNRk4DesT8K0jMd5lRrtLzjjsO9/aRC+80JfH3wcNDOkrq7dNw/EPNYkg0vi8KCiNno
         /WDYKWkvSGMCRuWJsHzTxTViXyu0s9tXa3RSfeKAtGbNDH5Y0ElnNFBD28qhMBGkkz2D
         lDQQ==
X-Forwarded-Encrypted: i=1; AFNElJ97a7IJ/S1w4gTwcm3I3anvI6VXajIMV990Wu/iSgBkP0bygoaJMIgnwHXbFn5Gl/yRavZUKEPdqY3PxOzf@lists.linux.dev
X-Gm-Message-State: AOJu0YwPEI16lvrDeKPV/WIXQAKOw7OhHWDRPQ7OcQ6MrhX/JksrW09I
	BdIaCqzXeTin9IU1+7Uj1sEe/btEZBFX5OflK+0KBoAwbxzgWsBcSwba
X-Gm-Gg: AeBDievWVUGcxwWQXHlMGTzCyXEM0BiVDJir+fxcDHLZoXbcHu3yyIn2JTnk/QZtdK3
	UxC+t/4dZ7O0ThA+oRR+LETF4hVoB6rieqHUCqzf3vFiE2/VGGakq/B8ZNKqkj410EzNl7szeDm
	/Rf3aI24FzocK3u6nHnxv7nXVWwouVbwcE1BwMGHb4xjND+RY29Jag/jHqCnYRkI4wpRgIf5xfi
	ss2GEWQSucdxWhll5Hf4B5eQhs99qoujMQOJQKVkSRCndoVlDi0Hct6PjLbJdKkUzRWLkWgyq01
	ev7TXhN3BbQO+8UbRVL3XStwFXY4CoBbT91CL1v5DIbUJvVBAqBvMwfgGhWXEgsvvHm3AsTAIKV
	/XCEZx+xDXYwRuE50EXUCsMrZKjQp14ZSHnJZqbuwcApcvwOJMreOfdeuzItaXOgQvqoqSrDZTF
	4+0zs8dMiNPgMZK4QFLFxI/hped1YZHumkFqnPSFvZgXNE0+/ovMdjnmknQZIZ0qabkj205dPOT
	4CN2loCoua4LYgilM/h03AFy6hyZvUfEyXe3ez3mvv6cg==
X-Received: by 2002:a17:902:8214:b0:2b4:5e7e:34ce with SMTP id d9443c01a7336-2b5f8f6674amr1059555ad.39.1776365697609;
        Thu, 16 Apr 2026 11:54:57 -0700 (PDT)
Received: from lucifer-Victus-by-HP-Gaming-Laptop-15-fa1xxx.iitbhu.local ([103.151.209.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782ceb25sm64369245ad.81.2026.04.16.11.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:54:57 -0700 (PDT)
From: Sachin Kumar <sachinkumar905846@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sachin Kumar <sachinkumar905846@gmail.com>
Subject: [PATCH v2] staging: fbtft: clarify TODO comment in fbtft-core
Date: Fri, 17 Apr 2026 00:24:38 +0530
Message-ID: <20260416185438.273165-1-sachinkumar905846@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
References: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wording of a TODO comment to better describe the
intended optimization. The comment now clearly states that
only the changed display area should be updated instead of
refreshing the entire screen.

Signed-off-by: Sachin Kumar <sachinkumar905846@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914..cff838955 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -414,7 +414,7 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
+	/* TODO: update only changed area, not entire display */
 	par->fbtftops.mkdirty(info, -1, 0);
 }
 
-- 
2.43.0

