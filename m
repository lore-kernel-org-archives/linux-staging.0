Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E89870
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z2so4890433wrl.5
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGwwT0pzC11+kIcwob060rB+3Es+ykFc90wh+44nCTg=;
        b=c1Unu8+Etr29sYP5S3SdLtnITsKgONw84a/korkFJZZLHgtG3hrL7JuUa9ypXY5Hn0
         7nksviisYwU6Op19WpBW1nRuaRVZ7RgG6aN9OZvyQl8E/Ney0jCBgHXV/OgzRQ1t0twW
         w3/nb4fS2VtgfX/Jxy+XidHTDWtMEYDUSwVRYuFYVyRD+9JI+SMvDmNvMCjE8b8KSvm8
         xwhsukLTXRTblM5wOoyosgzuSb4ZlOdRUHJ8LBw82gtowuai05j4IMhfT6rXW3mDTWgg
         8xvszvWqJCCyUO9t6rlQwNw0nEY0pYEOqU+8eOcYKybXq5MgKVYzzPWtSnlyOHiV3T4O
         NK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGwwT0pzC11+kIcwob060rB+3Es+ykFc90wh+44nCTg=;
        b=Mvr6PHxJLS6WHmWZB3FevetOQ+1hUAFo0BBP3l1xVoZiB00K0gb0YNWzFO9qqN9eU6
         QiiBZfAIvzVv/cpi9fw1DIXbNIb/08cLa92Ev2qkCxiCwxeLfJBX4LoOqxx0okOhOTg2
         ga9hMvsgGEmMAjjE/aYBUUmSHVZ4lG4AcZHX5oB3vhIVmNBT50sCrFRMfSyCMiLydtlW
         7R5D+kYDXTsD7Lnu+iuY7kjZGq6BU321GB6uECYTb/OIQ/e4Q2sVzjV/SDmgKGf76dY8
         kTkzokIYFvD7DoJ4V+ch1VwkhKuwlmIHcK4PE62sgM7dWzyS8jgZ9V+L2drUD/lZsGws
         wOTA==
X-Gm-Message-State: AOAM531YsYcIU510Qd7QFJnlTObNvkOPPhhd75aiekQbwdeXmy8rJsFC
	tUxkYKdntaVHwjCadidgAY8=
X-Google-Smtp-Source: ABdhPJxf1Sdlt0bYaUK4lkEj/yIiAsCwS303Gwrh2T4lN2pO/9tJNCbQddNEFamAR3BbSCSA/TgcVA==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr13601095wrv.222.1616749795205;
        Fri, 26 Mar 2021 02:09:55 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id o8sm1152269wmr.28.2021.03.26.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 09/15] staging: rtl8723bs: put parentheses on macros with complex values in include/hal_phy.h
Date: Fri, 26 Mar 2021 10:09:16 +0100
Message-Id: <44f6d3e16bd16581212ae665e0f22925070b2b42.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
27: FILE: drivers/staging/rtl8723bs/include/hal_phy.h:27:
+#define	RF6052_MAX_REG	\

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 90bb5d784674..5aec04f705b1 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -25,7 +25,7 @@
 #define	RF6052_MAX_REG_92C			0x7F
 
 #define	RF6052_MAX_REG	\
-		(RF6052_MAX_REG_88E > RF6052_MAX_REG_92C) ? RF6052_MAX_REG_88E : RF6052_MAX_REG_92C
+		((RF6052_MAX_REG_88E > RF6052_MAX_REG_92C) ? RF6052_MAX_REG_88E : RF6052_MAX_REG_92C)
 
 #define GET_RF6052_REAL_MAX_REG(_Adapter)	RF6052_MAX_REG_92C
 
-- 
2.20.1

