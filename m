Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801672C9C
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 16:01:06 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r27so17478434oiw.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wOnglUl1uAYKVVD35GZiXd9FDxbCo7pVui2xMN5ng2k=;
        b=LJseETUvhhlpjfqgNVx4CkEqAukgFRYI+4hAvQuyuTMG1aluYNFiioHHhHs4YS6orY
         QvLKeQ/tPRb+MH5WMnOc5QQQ/GeQgikPY4Q95JRgpEcS1avO/RpiWsWIQqo0xJ2tG5G/
         xYyiZuW2V2dWr1wbRRR6AUoZQiqyIj9fiGWW0oCilwBHaHdHboG+hfT4HnpZ89ayd494
         EGyFj3a2IlfCrcZSZzq1I/6SQJgsojXE6/bXZyMFmEXPtl7yofVPS7I1QBLTxFA6jeUB
         2X481JyOAL+HWXKP1WW+Vuf6yIwzREwCk9Onf4KbDjkT/oSlLC/pomSsIAvyz0Jli+bY
         pwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wOnglUl1uAYKVVD35GZiXd9FDxbCo7pVui2xMN5ng2k=;
        b=5/t0cM7OAX+i1PA5i6TDj8DLt78xHSP0DvN4UlQkXF6UpNAKV8uDRJ25NhP39x+bnO
         8XU2MmoUPd7YQiThbowDtlRUKNWB5jCE91m5HlJQa4lIiJEec6vfVJRDmu04IuNkIvf2
         e63dUbsoN27vRae7ll5a86TGmHwzV62Dra2kzCcMPchdJj+UhKxgo2PL4BL3vCC770zl
         7fyya6JBxuMVeod5tdz4jUlRrJ+xGA2ki2IKiYKCaLuWxrQmT48wbP8JzZ3mQhF1+L3V
         g4Goz5E0LHR4dJnwQLENP+48/bLXeDkvyf0AbMrD9nSa/WBCXATvqQfXWLSNGCVK6awv
         JlbQ==
X-Gm-Message-State: AOAM533/IPiZfRJoSimq2HzYfwqiyMsHcAAv4BarSPwyu5OJfa0aooN0
	aB376vsoGDtDHLoNNLq4EMw=
X-Google-Smtp-Source: ABdhPJyD4UpToOvIQIFw9Irbe12rKVbwLrk8ws70xElXnFRMvNXDq7KX6BOTkKMWA9KfDBu0TUX8aA==
X-Received: by 2002:aca:f06:: with SMTP id 6mr173415oip.70.1644249664127;
        Mon, 07 Feb 2022 08:01:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id o144sm4157803ooo.25.2022.02.07.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 08:01:03 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: wfx: CHECK: usleep_range is preferred over udelay
Date: Mon,  7 Feb 2022 13:00:51 -0300
Message-Id: <20220207160051.27829-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the checks reported by checkpatch.pl for usleep_range.

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/wfx/bh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/bh.c b/drivers/staging/wfx/bh.c
index a0f9d1b53019..ebc7eaf93ef0 100644
--- a/drivers/staging/wfx/bh.c
+++ b/drivers/staging/wfx/bh.c
@@ -312,7 +312,7 @@ void wfx_bh_poll_irq(struct wfx_dev *wdev)
 			dev_err(wdev->dev, "time out while polling control register\n");
 			return;
 		}
-		udelay(200);
+		usleep_range(200, 200);
 	}
 	wfx_bh_request_rx(wdev);
 }
-- 
2.29.0

