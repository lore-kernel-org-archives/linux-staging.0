Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F12FAE
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 08:29:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d21so8074618wra.12
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JRXWDzzmmi7hgEkppSE9hHSKWfVi/Hf7zbRE1ZVJpi8=;
        b=hftX7bZJVgWhT3vC1yEc1hoFpLXQYhBzlTOvTAXD4KJtPzhMFZQg01tlN9YSqJW/WP
         TECiE9bS0t5+b6X5EXb2iUQxruWq7iEtTSTa6fZFQGsdv+AEsnKXs6dMJS8tURyW5fcy
         m9n/MXmvKtmWJiaVadQXg4LIFHjyNFyk6ZKq2aTbKbS/9GvP1i3s1iV20GUBhvGDP1Ce
         Z8pB1JtQbcVLUlTsjJe19GwKXFx2rmMHERNMjPknMyq32WuNoxRfDpLKPG6D2SfYquRL
         ZJz5a15zhGC4GA/xwublCEsklCHb0FO+jAACN3HMS+H/3fiW8qBU0voWWWGcZPzD8FtO
         +t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JRXWDzzmmi7hgEkppSE9hHSKWfVi/Hf7zbRE1ZVJpi8=;
        b=a/MQQ9vhjkNhwxWzRi0RAgjNZM3rPn+CebkHmQXud5LyWqDhY99x5wjAxvcfMjRgVq
         Z90sNiwkGuBD82ilrvCrp3t+miOKVmkMdmEGXXOHi9zvNvlTzW1ot90UViqWnFpT2GQw
         OVk83/HnQLnk5CIOUoCQTs5q9W8kQxoIpf/3ix9iqi01fs1DywrTVJli4i8iTsx7NvyB
         myTKb32KIlVmjqeMg/R3eMG0LlvpbkKx8OyxIa+wjUMoPMWxJBiEIkXOP3a8t8SYSGH1
         bIOg4/+NptdJGnJXkcLEhlXhHpfG3K36jbU0vQMXZsRYIO5Sr/XKDDTjCsbmxPtcJh5V
         ZEag==
X-Gm-Message-State: AOAM5335yukTxUCl3fcynDEO0bOnbbH6tIOAezq++8L3bjSeIVWTDlWB
	P+9KOU+DxIJiOJF3ZNUlx/U=
X-Google-Smtp-Source: ABdhPJyoTnULr8CPcm/HkeUXT9jMsGe1PYvaz4XMrlyPHmGEiESimgRpRHJoS1f5rh+3w9/sLExjvQ==
X-Received: by 2002:adf:f683:: with SMTP id v3mr4747566wrp.423.1631780956709;
        Thu, 16 Sep 2021 01:29:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id d129sm7458079wmd.23.2021.09.16.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 01:29:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove RaSupport88E from struct odm_dm_struct
Date: Thu, 16 Sep 2021 10:29:06 +0200
Message-Id: <20210916082906.25294-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916082906.25294-1-straube.linux@gmail.com>
References: <20210916082906.25294-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field RaSupport88E of struct odm_dm_struct is unused.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 4fee0e9e0df3..265583a43494 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -847,13 +847,6 @@ struct odm_dm_struct {
 	struct odm_ra_info RAInfo[ODM_ASSOCIATE_ENTRY_NUM]; /* Use MacID as
 			* array index. STA MacID=0,
 			* VWiFi Client MacID={1, ODM_ASSOCIATE_ENTRY_NUM-1} */
-	/*  */
-	/*  2012/02/14 MH Add to share 88E ra with other SW team. */
-	/*  We need to colelct all support abilit to a proper area. */
-	/*  */
-	bool	RaSupport88E;
-
-	/*  Define ........... */
 
 	/*  Latest packet phy info (ODM write) */
 	struct odm_phy_dbg_info PhyDbgInfo;
-- 
2.33.0

