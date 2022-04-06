Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB87E
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 06:19:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c42so1370034edf.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5W91nY5g2x/PNBMnEeWdlyukY7wlgLCqBSWWvoZMNo8=;
        b=hiUy4X2LA1nqaFfDcQ7InCwRGzw3PSPmausfWQ3ChZJ9uFDiaCL2dcjiwVSPNw/qAV
         sWSIN1HLyP/5jjej30IG9xImLT+sEbYB3qNiBkVCIQkWaFDqw4rB/0i42NDTGThmktde
         u0DW8ldMQ1ArwSCc25vweHnMh3EMlihmaTSX1lpFGxARcc6/NkI22D4S6hT74yEeWrf2
         bDYwO2bj+ogy8Rl83hJtIId+VNNHqGqkCrFd2H/l1oxP3ZGq4f8ascZOMBswR7mR9T26
         lkc26D4YMbvYUGFQljUip1MAZOsJ2GOwvv142MaXQPXBKP7wRnu9zXC4mfTPyCFERxE4
         NvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5W91nY5g2x/PNBMnEeWdlyukY7wlgLCqBSWWvoZMNo8=;
        b=zERypQPyZMSX6rpaXY+TKbHS74tqGopHyYfgt4HSePP11JlYBi8Z7azAnTvHwcIG5f
         TLhHD/Era+UXu+Az7unA18r6T39wXCPaRK2JU1QYlSz2J4vlZXinYbgwpayN/ODEDACr
         1MTKlCy4exWAMZ8/nbvUo9FQOZB1plNcP7CjQAVr3fLhfUKRoStzY4Q8XFxEyvQXuFmb
         txGxazTVBEEwyCZQ3/JfbrOnBrY+FEqOcUGqd9R+Nsk7YGNnvDZEFhNSKD81zBg4NtYL
         3gkg/DD8L5wY2+QGNmxOK6gqPxi4HcRtzgCQb6bjOe/J1xvU0UcH80BvBrkr69a8IqRm
         5dog==
X-Gm-Message-State: AOAM5320LSfc5zQDAQwVY4m+AteYelXEWYJnHAtrkiGhLFfqkPld2IPO
	slbYgpKq0ABUBOqQ/oWJbQg=
X-Google-Smtp-Source: ABdhPJxMQvIE9nIXz2sl2HyN4f2u8FCzHt4WeaO6gFBzfgNpMziy7VJQ3LnoEua7c0bTVhs78i2+KA==
X-Received: by 2002:a50:9e61:0:b0:419:d8e5:6236 with SMTP id z88-20020a509e61000000b00419d8e56236mr7124021ede.327.1649225953449;
        Tue, 05 Apr 2022 23:19:13 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm2475251edj.27.2022.04.05.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 23:19:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: use round_up() instead of _RND4()
Date: Wed,  6 Apr 2022 08:18:56 +0200
Message-Id: <20220406061859.9011-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406061859.9011-1-straube.linux@gmail.com>
References: <20220406061859.9011-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND4().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ecd0488c439b..4977a0b99415 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -264,7 +264,7 @@ int rtw_cmd_thread(void *context)
 			goto post_process;
 		}
 
-		pcmd->cmdsz = _RND4((pcmd->cmdsz));/* _RND4 */
+		pcmd->cmdsz = round_up(pcmd->cmdsz, 4);
 
 		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
 
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 56e5cbfec1f1..388c22751d09 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND4(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 2) + ((sz & 3) ? 1: 0)) << 2;
-	return val;
-}
-
 static inline u32 _RND8(u32 sz)
 {
 	u32	val;
-- 
2.35.1

