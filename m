Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C346D3FC6
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t15so15913602wrg.7
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/i9rKJcPxsCwJ6kNIOQV+qImhOF+UG8aTJL9Wyv+hOs=;
        b=noHnxrJcLvMQCWvRDvwpB3nwGLG6+rMkeQcfkJqFkDfcfTOqwK4DJorWksfevYNyd2
         YG2zvV64AKyyUpQVCmODZkzNXTwEfYi4L5TDMmjdQQRfGWuIW5qCZim2Qngl6ePTwQ1z
         pra1pQPbenoYg4e8XGX7NiDIWbg4sP670HhEpOgnKmsD5EFZVXnWCMIxluPtFnZyor+5
         30caJqA1CvPBALWuD5q2lURHxXly4bdn6Vq7096+XTyE98mp3RrQLIS+yqe4VeUgRfVo
         r/4f7DpOWEzrgg8BIiHcmSWZLn08QlWTIZ/WOgb7nG9pY0poF2vVVCaGhRz2hcxG2rcj
         fhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/i9rKJcPxsCwJ6kNIOQV+qImhOF+UG8aTJL9Wyv+hOs=;
        b=uYsncLFpZCZYtMt1gI2vDcrqStt2hzuw9Gd7h+MdxFr1D4yfpb4VbyVIsznnMUC6ed
         hVhPT9MX4+D7+X9gnQH4rg9kD7PQ6LtlTeqsEiK70pdF/e7U6qNE7kBNJ8anKAt31dkE
         V0DjINg/RSk+kKfLdO1YXfyZptDRwU0Y9gGDFJbONQQwcyuFSdj8oEKoHeIw7ZSMjmP8
         nkHxcFAgzKZG2wBW8gaKKm5wC6FmFDnuE3GRbe+cHsk8ewVRRsfZHTeDJj+HzSSk/sO6
         0qD3043D3ozUUMEuJv07JUcc34LjG6c8npqwXHrhlKeX6/J9dHmVjjQOqiNUbnzQpEPg
         mhfw==
X-Gm-Message-State: AOAM531QIEQDobLIqNAQov4mxndxXIVaDyuARjDbw7roq111Hh29L7Rl
	Cuz/WUgtsZDqlFhXOrajU0U=
X-Google-Smtp-Source: ABdhPJwAg6PQZI/w0tl85ZAwyZYNBpuF4+1ZuvSh4A7001LBNJbGPe3RdZbDo6mYUTh5OWavGtY9jw==
X-Received: by 2002:a5d:6e0c:: with SMTP id h12mr25913814wrz.334.1630325751249;
        Mon, 30 Aug 2021 05:15:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 8/8] staging: r8188eu: remove unnecessary parentheses
Date: Mon, 30 Aug 2021 14:15:08 +0200
Message-Id: <20210830121508.6411-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around a variable to improve
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index f76c762ccd4b..952ad3eec5bc 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1038,7 +1038,7 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 		DBG_88E("MAC Address from efuse error, assign random one !!!\n");
 	}
 
-	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", (mac_addr));
+	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", mac_addr);
 }
 
 void dump_ies(u8 *buf, u32 buf_len)
-- 
2.33.0

