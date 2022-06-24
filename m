Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7523A1
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 06:27:53 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so1901136pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=souzsk9ifgaOyhU9GyyRqJqftjYrRuWLP0PcFjYsfu8=;
        b=KyEw12z175h99BsAPf+680LU1Vw0hBAVoNyKMZ4NUwuf+4nIXSThxl/0N55GHg2y8o
         8kqU6KP7vF31ek/SIIZRj9KSjD/p1SdUc5XKkR96tv+Y9Qg01Sx3YAlD72NtYheZP38s
         oZp2QBfDJMcfcinxmS0Z7OwvrTrjkH7/MPN3Y4c3pousqF3/jt3oleM2Hld5QUgs/8lD
         kAsyOSG2uPj2YKcNzqWtciHRUKouUkgILH84cBIwuJJYfvQU/Ba9tM1uPcXErka4hru0
         T41gFV8rGj2MDjE7p3GKz0jeG91od8JHErxUiac3XQgmIG9xTto7syEnX6HeFVDoHsjY
         md8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=souzsk9ifgaOyhU9GyyRqJqftjYrRuWLP0PcFjYsfu8=;
        b=fq6FVUhVKULTUJIBI/s3BkhPvfw7ASgDfJWprGYKt0J6mWPiqgnTjulIzrH9Hwpuy4
         prEDiHBKxunFx3TQ1LsgGU8raxHD/tXmuXvJ+VT/CXFAwjcE+bRtHVDLRrZrlm37ptN2
         AGp3z1QNeXw9VgNjeu8OD1G2vh3JHkT6IjNFIdX1QXwJQBXqmlLH3JOUjRR3Ok4KEg3p
         6OLgAEddf+Lvw4MURxJ+Zgidhm9OIdgvclgepOx4DiOY22j3WOD+/m9GihY214WrnkZY
         NL67tuI0SchJYNircmvaMKjDVLpmlPM5Ke2tVQOiuxr+UyBA+WxCDbaVm0aISSTmauR2
         mgGw==
X-Gm-Message-State: AJIora+YCT8A/GUJuC4vqqQTU7RPYtYxvSdWGqDXIqO+1rGb4ioXZDGT
	62CZu1h6oHKi3+rj71fR/R1NXPmqWu3RvQ==
X-Google-Smtp-Source: AGRyM1vFrewjQ48AKeMSGqOtzS022Czh3FVGN2IYms/9D0wWur/GvFJ9xtZEUMTZOtbLzkC9uhM7SA==
X-Received: by 2002:a17:902:e5d0:b0:16a:6f96:ec5 with SMTP id u16-20020a170902e5d000b0016a6f960ec5mr109836plf.72.1656052072909;
        Thu, 23 Jun 2022 23:27:52 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id n22-20020a17090a161600b001ecd48b80a2sm3118421pja.5.2022.06.23.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 23:27:52 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v3] staging: r8188eu: core/rtw_recv.c: clean up nested if statements
Date: Thu, 23 Jun 2022 23:27:05 -0700
Message-Id: <20220624062705.436690-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623031515.402691-1-marcus.yu.56@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine two nested if statements into a single one to fix indentation
issue and improve readability, as suggested by checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 6564e82ddd66..020bc212532f 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -166,10 +166,8 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
 
 	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
 
-	if (padapter) {
-		if (pfree_recv_queue == &precvpriv->free_recv_queue)
-				precvpriv->free_recvframe_cnt++;
-	}
+	if (padapter && (pfree_recv_queue == &precvpriv->free_recv_queue))
+		precvpriv->free_recvframe_cnt++;
 
 	spin_unlock_bh(&pfree_recv_queue->lock);
 
-- 
2.36.1

