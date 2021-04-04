Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894470
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i18so5317615wrm.5
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zv6blgVUmmcg0rrTba28HSVxaCH1kZzMtYvEm8Uvvjg=;
        b=Sd7DdYntWCEbA52OQ6osSzKs1EHKTdlo6ePTT0D8DGBA7eGRtt8J53UXh8nO2NBn73
         cAYk8exggiO3SgXP6+Cwfbh/jP+zL3McW/JFI9JaIo5nRZGONLrtLUD+fqVIbbAZ+jgH
         ETAraAFJ2bPuk08VVhlQaschmu3mkezAglt/bXUjZtULt8bDNKJ2No6kIXcGxGM8/ElK
         V73DfB4chG49wdj6gTourVz/h84CDfpvo4xtVj50xO//DP1wfBBbm99HaxqdxDzWqxJs
         asPOoI7Y6VyDd7idiW648NEGfZg+YQhK/Qw+uovvEUGbQMZOiHfYatIsx8AraV0XFsyF
         jqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zv6blgVUmmcg0rrTba28HSVxaCH1kZzMtYvEm8Uvvjg=;
        b=aIFh8aYy9XF80IkeglGofeYfdtUL9IPhnQZY3c7S71S6zuewkcX8HrnE9gbRgEiBya
         /Ddsr22kV2HbHhSB6d67HFNsjHAydjIvPlyPvQVmJc1W9Rbzb+JrJ/db3ZB1f598laQN
         Hz/e5S/M5q1HiYUz8L7r13HTxeJ/wt88Z0FWDL4qtYJ8BouryEaFeSEoXY/uGeAyaD7g
         cCKr/fsHK5Ql1qBgJ+QlTWW7Nm+JUDKqJRCkm/apPHNbMDQdck/NvrQp/K1OjekHJehR
         /TcUYRF7KDrwayfCOBApCsuVDNl6T4QITRaL5BDNo5Xel/YncCkCxma6ihmpqbM2n6MS
         jNUg==
X-Gm-Message-State: AOAM530CBwcUeizZj4D+JNmhFVFh7iehdCy8NZO/63NOnCBlwscGnODW
	aCCtw2dUlmfL/rzVxNABHLw=
X-Google-Smtp-Source: ABdhPJzkucPICGsyiO+ELiRtEeLavjifxl/6wKTV/4kZKku5x5IaUrE0URa9UikX5QXtO3L8yPBDgw==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr2112737wrt.4.1617545423794;
        Sun, 04 Apr 2021 07:10:23 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id p18sm23322353wrs.68.2021.04.04.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 20/30] staging: rtl8723bs: added spaces around operator in core/rtw_recv.c
Date: Sun,  4 Apr 2021 16:09:36 +0200
Message-Id: <6202df1b5383aa0a66810358495c2b1c9dd6c189.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

CHECK: spaces preferred around that '+' (ctx:VxV)
60: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:359:
+				if (miccode[i] != *(pframemic+i))
 				                             ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 2d749341d47b..953351f896c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -356,7 +356,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			bmic_err = false;
 
 			for (i = 0; i < 8; i++) {
-				if (miccode[i] != *(pframemic+i))
+				if (miccode[i] != *(pframemic + i))
 					bmic_err = true;
 			}
 
-- 
2.20.1

