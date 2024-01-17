Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49412B6F
	for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705482109; cv=none; b=W1Wrb6jqbC42J5HmbpOStXwbOl155jz5FMa+5PA4hqGZLE9AmI3gIMjGcsK1pWcf4GL6HCv74yLy49OlIiJafX0f/jwFFkblFmnlR+2jpB70bMLwbz3xy5KkJRtffnwgnPUnx1BsOZUdhRvzZdYMTWBEHGk0cnu7T/X1L4boUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705482109; c=relaxed/simple;
	bh=CFba6yBxMqahDhxXXbyJrpczbPpZcSOe7fz27cRHjRs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF+I/XmNVP+7JRQ5FimicoTvkZflZi3HqbGIEZH0/QBuZ5jAh/yu+tRToi6dZDeCpmWLmoxSuid7EYRNl1S8fzJirApp0l0zqEhVDr4TsCycS4w6MRJBoeH8LU7B5Hke+kxU564ZRmubr7MHAzpPcU7+o+cMllLXj5x4vQtjkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COtU3y+d; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COtU3y+d"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36082f3cb05so38182855ab.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705482108; x=1706086908; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3EbBfiXII+xqP/XocniUaecVX4i3H4jifFCHOQtVck=;
        b=COtU3y+d93EithwXNAjP2x/KLdiIdxQ/1k4XfF5+25/OYLrcGtF6LN8aNxNOOk+19f
         QBtbyVsTyTID3yGnnHAUAGZcl5siO2DQS94O3fIhmpZvXkic+j8w8Z9IhgJiZaYzcKWW
         LeWHvMIowqnK/ZHoOx3DySfX9FEdhVahs0VzCRbk/pWdpGGfg9uADmx5hBZXC2EEKmjd
         VVRzROyHhBGAyGqOuRBw47E41s8oIJ5SbFGO3ZEgDDW1NG7xjBHlI/D2kHRu4rkl7ypC
         oPvfF2VlFXKjSDcnjrBx3Cjwy9C8Ws4Snh1aWkr8GNeRt0LBpBhKSjxDf8SuPS46lz9h
         TDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705482108; x=1706086908;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3EbBfiXII+xqP/XocniUaecVX4i3H4jifFCHOQtVck=;
        b=i+04EMjNvsgvX4qdTSBGARADj4wx0s2V63A4T3lX14rAxeZgFEh5DJW/cME9w5f0Qv
         bD1qGL2hp9I/367+DUYOB3mgSjjwQydSwQ80Pefe6wv7MkVVTgS0ENFtyn6kA2bm6bu2
         93poIDAqrxXJdFKfs98ABxBDT/qTzIwLaCOqBI45CU4KAUwvjZyy9YktRjKg7/aJPZP2
         Lk5Eakr4vk0g3BS9+K/iA22nKR0obZb6YTDOSoFwRIY2YD+TtQqNCzijhguoA0lwwz/j
         8rt27hGG/1LTaY7psnLzjDo2NgyHcT3PB5TzCS6U0TeOXBADVy8GGsQlmgn+Km4xeTNu
         jF1g==
X-Gm-Message-State: AOJu0YzA6v4Y7Vp2jWr9emgVItwn5fMTHu+ZBJBUQlbxIEd/QvANNRKN
	loGlxjqlD1H2gpEgdLKUo0g=
X-Google-Smtp-Source: AGHT+IF/txay3bURG984EnkgcClPO8mxtHxppsINIYZVhy8bi5zPfnHfQiKBfFrL4SOKHCawBORVQQ==
X-Received: by 2002:a92:cac8:0:b0:361:8ce6:af64 with SMTP id m8-20020a92cac8000000b003618ce6af64mr1967974ilq.1.1705482107662;
        Wed, 17 Jan 2024 01:01:47 -0800 (PST)
Received: from LAPTOP-7VGLEE77 (19.216.252.27.dyn.cust.vf.net.nz. [27.252.216.19])
        by smtp.gmail.com with ESMTPSA id l23-20020a635b57000000b005cdf9c8e922sm11508014pgm.85.2024.01.17.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 01:01:47 -0800 (PST)
Date: Wed, 17 Jan 2024 22:00:33 +1300
From: Hoorad Farrokh <hourrad.f@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: remove unnecessary braces in while loop
Message-ID: <4vmxiuz5u2f2vehngdccj5q7bakpujagk72ty5ounfv2nfzxgr@lqkdn5fecc23>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a linux coding style.

Reported by checkpath:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 1593980d2c6a..0145c4da5ac0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -127,9 +127,8 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
 	phead = get_list_head(&pstapriv->free_sta_queue);
 	plist = get_next(phead);
 
-	while (phead != plist) {
+	while (phead != plist)
 		plist = get_next(plist);
-	}
 
 	spin_unlock_bh(&pstapriv->sta_hash_lock);
 }
-- 
2.42.0

