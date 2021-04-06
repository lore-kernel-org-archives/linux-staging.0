Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52059259E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 02:32:41 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j7so1973367plx.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 19:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=h8ugM46gCL76gBJzMhTW9CmhyaTuMvOLXXK4q2ofL4c=;
        b=jhLAfUpXkJozGAGaEGwbsNGpRtkiFeKIsZqaOQ1Szd5jb303YibVkasQ67Uag4uDa2
         3OCc/qfp+yHBerCudp+fhlvYhoUtShf8mQ3xKZA8mt+1blFwsChHjXFpvaXo8dt8steU
         dS1HTfZ2lMgDrPz+2xnJF8mHen5EW1R2W/smX8G3rEbMQ7Nudnae8d9iEJ8rSsO6sOIM
         sBU6LuNJd/n5jIIsvy2HFQrq6TVqJrUxyKhy759nOO+Gfr0Byd+ohaA/KrYB9ps8Gl1w
         nousXKJosPQs70z6cxYacA8aJ5Jrlg/JeKVdMdei+vc6IcSoZ9O3+xf6LqS/Lphepj4Y
         IQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=h8ugM46gCL76gBJzMhTW9CmhyaTuMvOLXXK4q2ofL4c=;
        b=SNMbXDUNWDRXeprpyjM2eFdKM5DJWcoeTtsCI+unXZO+9LmYzpxoPzsSQYFGvr8lIL
         0QunFt0utQ4kh18/d2AjkcOKNK9KM4t2MxIBGDYFk5N/WzFfDlZEzLG3x5SLtcigTK24
         JrozlB+R/2JPXNE1Ht+6lDapYW6zCiQoN/Iu21SYb6dcfLA04VbyDbFeidM1lJu1/Lmu
         2yYzu1xJn82sw/7S37eZZRd1p501yDXMkLm3Fm90Mv4SrBj5QUgyztGfcm2vSB/0CEkF
         XWnRikfnz5Crw9vxWGe1Zl5Q3MbYUqHaT8s03dvTHxsSNZvsBZB49un72afHCpZL+PYg
         BOgQ==
X-Gm-Message-State: AOAM531q1P3qPRKcuqfRYFzf2e9zKmYZK4amYZqzGLZRPMeqCaq1h7bc
	+FJbZo3IWTuAVUej8Af/JGs=
X-Google-Smtp-Source: ABdhPJzRS2dRHe4IPn9ZnN4Gu/6Zi3PIBhHp5paudp88N/AZO8k3PGBpyn2QqnDGo8/9m9Gh3YgYww==
X-Received: by 2002:a17:90a:5d10:: with SMTP id s16mr2069094pji.204.1617676360898;
        Mon, 05 Apr 2021 19:32:40 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id e7sm281196pfv.107.2021.04.05.19.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 19:32:40 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 1/4] staging: rtl8712: add period within a comment
Date: Mon,  5 Apr 2021 19:32:17 -0700
Message-Id: <f9f48ac6e93e814c51a7ed370d0b2988d2e3a602.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add a period to separate repeated words in a comment. The period preserves
the meaning of the comment while also stopping the checkpatch warning:
WARNING: Possible repeated word: 'fw'.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index c247f92207f5..d8a366338a2b 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -507,7 +507,7 @@ static void update_txdesc(struct xmit_frame *pxmitframe, uint *pmem, int sz)
 
 		/*offset 12*/
 		/* f/w will increase the seqnum by itself, driver pass the
-		 * correct priority to fw
+		 * correct priority to fw.
 		 * fw will check the correct priority for increasing the
 		 * seqnum per tid. about usb using 4-endpoint, qsel points out
 		 * the correct mapping between AC&Endpoint,
@@ -560,7 +560,7 @@ static void update_txdesc(struct xmit_frame *pxmitframe, uint *pmem, int sz)
 			ptxdesc->txdw2 |= cpu_to_le32(BMC);
 		/* offset 12 */
 		/* f/w will increase the seqnum by itself, driver pass the
-		 * correct priority to fw
+		 * correct priority to fw.
 		 * fw will check the correct priority for increasing the seqnum
 		 * per tid. about usb using 4-endpoint, qsel points out the
 		 * correct mapping between AC&Endpoint,
-- 
2.17.1

