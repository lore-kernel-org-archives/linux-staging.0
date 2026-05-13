Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944B3BE623
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708261; cv=none; b=U6q1mJMEyk4UJdAf4vadrQERTUJRmH3vo7Rwn1rPl5YJTNDWkz7ZQhycSfAL8MqS7xvHRpjHD9X+X6gMKtkpuRbsK0XXB9yEHAjFbipqpFmwGSAY6F2WgvnROximwWtmQjoweoc01TlzrO4nKZ9IqYOsV20E+QdvG4fzy0Uh4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708261; c=relaxed/simple;
	bh=gCFEkt2MrEtpbOoq0MCu3sy6OH+2hunNUPgymLEWA9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sA3GtCL/QqObVn8r07crellKIlBuzI3hReANtEPiwHYpiN/mojE7vR+GjdYkM7hRaNsR3BV1KWWxoS43s6EG67dgt978hg9B1PWpCq+0N5vsRZY84uW7XrbGgGiQ1YEdAd0DuQNatLyRQCcs2jqDsw7212VZrto145z4ZVlR6XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0mhWixs; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0mhWixs"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-3025d725a05so754269eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708257; x=1779313057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcsDku5GDObv5GKWtk5iheXLWoh+l37TZtUepZPYSP0=;
        b=P0mhWixsOjXp80Kt+QuMG3Q+VtXCVX+/E1VOpm56QsOOAauB9IRisys1ubmM4EsTrt
         L7OCqUOo9edepCrVyfj/6q24hK5mAL51144Drw+iVQ00q+kANSs8avkKmA7ELXF46khZ
         cAezQr0DtLTdsKh0UQe9vyy5q5UdVfaiqsv0C/hrFjoDuYa4mOHywRRBtfNI0y/xiPUq
         LAVj49O3vOnzmBwu+QIrQeHj0lP3wK3V/ex7xBLRrT8giTkn0PqCL5rdxMazTAgBGbBX
         8k/MUYX05yIAoQ6oOQYyZbh0Hx9/6ghdt9AJo1f+2cP1orEmda3TxvRl79ziJm1z/qHU
         gtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708257; x=1779313057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mcsDku5GDObv5GKWtk5iheXLWoh+l37TZtUepZPYSP0=;
        b=FK9t4vjDDOH9FFpqA/TceyY4sF/2Y1QUcpRQVy1mSgJ77Z/DFaOLbOCBO6CHhflxGt
         +v8d7iFc1C15fq5ZObu9UIi0dlzh8+CmsD5MrwpdufFk11AWx42RPIBFSatOKF2uoQgx
         /IuOW556JKT8IK+NXo2xAYD3Mt/OLSwx8vsISJytW2P8IZt91tUcjLQ7GbjPiYzx2Ktm
         naBgHt3mY7mwJOyuIqmyMs7ls7W1gYSAi35fF31hWCh+tsilr5d/0zy0CYD2C3bX+ccZ
         p3zx4aBH6cA80bzN47HbfgnnayIE3AEu7uPrMMdH39sQqjVnIVibUOoRmBUvhW3BVM7e
         iYzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gVZ7+n4BRymB6RwXzBUBbHdiyWcRfxSnWrsEDx1jqKTRV5lNS1VU1X0OgPcLL5AWrduvBcdrAbkJUZF5b@lists.linux.dev
X-Gm-Message-State: AOJu0YwG9eEHmdnx+PNQmQlf2RE9UoWjK6NYfc0FwWDFBC4ihsktfZiD
	j30SBDL3ybHsPQ653JwoM/U73Y9rvghrkFDft7XtCRtt1zOXCFOGwbKk
X-Gm-Gg: Acq92OGfNbaA9yTiD1bUX9DV2UuqNVdVfFtc0oYdi/60QHPEIpls8dBTYdVSCtNn4l2
	BJqPwXIwZp7+3hiwr37W4UH6LaG39GLq0et4j+X47CHaXANq8IcW9H5N3SMzqzU7jGIueD1KKEQ
	nx3rGwMlvjXBP6cwPsjxJdaTu02fK/dkj39Jegk+43af5BDCvZMitbDtAjTi1zyaDsOrn1rgqSy
	NBVvmFn6f26caIMDsgcH6GI2C62SVtNkKuN0b4eXqjPIJXn1kMN2/zwdwlZ4w9JmZpye66QLeRV
	SgrYt9kGbVKSp/FuuF3gQXI/FmFQ1MyYUzGjEtHYuCegVzgbLHqFrPgrI558eTKGU73noDthiiq
	MQiDgPelqATU1giWnffT9fabAAkFprRPTsAoWLVcf0IU6r1UCEcHrDrHM0CEa8dZlVzXDeMVv9G
	3HP1tuVOzvJ8q7mu8ci2qeIHhPcW/A4AJFLPG7ySEktV9wybZ8rwdJ4Vg=
X-Received: by 2002:a05:7301:5783:b0:2ed:e17:d50c with SMTP id 5a478bee46e88-3011ac411f4mr3552819eec.31.1778708256584;
        Wed, 13 May 2026 14:37:36 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm732316eec.1.2026.05.13.14.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:37:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: make _rtw_enqueue_cmd return 0 on success
Date: Wed, 13 May 2026 21:37:19 +0000
Message-Id: <20260513213719.12246-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513213719.12246-4-dennylin0707@gmail.com>
References: <20260513213719.12246-1-dennylin0707@gmail.com>
 <20260513213719.12246-2-dennylin0707@gmail.com>
 <20260513213719.12246-3-dennylin0707@gmail.com>
 <20260513213719.12246-4-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the private helper _rtw_enqueue_cmd() to return 0 on
success instead of the legacy _SUCCESS value.

Keep rtw_enqueue_cmd() translating the result back to the
existing return convention for now.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b0596b52a9fd..4205f24a5a06 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -252,7 +252,7 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	unsigned long irqL;
 
 	if (!obj)
-		return _SUCCESS;
+		return 0;
 
 	/* spin_lock_bh(&queue->lock); */
 	spin_lock_irqsave(&queue->lock, irqL);
@@ -262,7 +262,7 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	/* spin_unlock_bh(&queue->lock); */
 	spin_unlock_irqrestore(&queue->lock, irqL);
 
-	return _SUCCESS;
+	return 0;
 }
 
 struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
@@ -328,10 +328,12 @@ int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 
 	res = _rtw_enqueue_cmd(&pcmdpriv->cmd_queue, cmd_obj);
 
-	if (res == _SUCCESS)
+	if (res == 0) {
 		complete(&pcmdpriv->cmd_queue_comp);
+		return _SUCCESS;
+	}
 
-	return res;
+	return _FAIL;
 }
 
 struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
-- 
2.34.1

