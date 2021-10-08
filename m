Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D62C85
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 10:02:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v17so28016390wrv.9
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKJo8PQ8qCZ+w5l5NjxKVTa4Y5qVORlljgfVPolx7L0=;
        b=RM3zE3hhW+l1SbxfWPHkQ2Lh+ybH6D74fTeSry17W7mQLFy/X/KptWvzEBvuqQMdUT
         ZCJ7j+y3OHSd/E3XBmQA/SWDHWEwiqitv9U9QshyGG/uvgiyljJjqo6zmHdAvLTotOQO
         F65UFtWqbrD+GSXUIi8bkjFfCeaEjIS21E9VaDf9Ge/Pr1JS8JExMnruX7jzIamVSFo9
         Ao11pXwc73uFV/alESBLQutMjaeYhUkYNTmwneYdT2Kaj7mRutu1RSwkkfHW68DFH3DB
         c5lk5TaB9c2hyTbiW8TmzSKuOpSS0RKZV9jbqt+5DvjDesxWZxt5OgbSUjr2wd43+e+x
         jPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKJo8PQ8qCZ+w5l5NjxKVTa4Y5qVORlljgfVPolx7L0=;
        b=TbLLCZpkMJfr3SlUZVDS5UjDEDAhytSeeFjzJDyAZRAVXt9DItxfrK1yUtHGVrsOrX
         KVlhfL7ggKmSGvuAzI0Ii9XDWvEQHacqKyqDUZrJ38VYkTjaBouvwhfMFmVjUIOWeU5I
         xDPXqdr6fFbIOde5S7K2t4AKjNZAuHSP+fEIn20a+a2LzZnU+twvRZroBH2njrCsjrLA
         Rc1kRetqtT7Nclk/0xWEKAmOIJnZgBc6T5dJStuXoWn/tizCHxqboQOvIGxaXoGkAow8
         hVccw2OU6IR5VT+CpACPmhPLdjx3rRII64JYil4/bYoO+NtHtL5dgfHNbHwCt8IG8Au2
         z+iA==
X-Gm-Message-State: AOAM530QLw5ruLJcfnuO5OxzudvrduMw2dm9VdNqYE7rjTg/+TI8xpxB
	85AYrj0O1wKzuVo3rkovtoU=
X-Google-Smtp-Source: ABdhPJxj0gUM5/SprLYHHOJcPozOmnsMYc59x50iLkKK9ukRj2QwRj8koLY8IDCHvlLM6iHqc9roHA==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr2413166wma.150.1633687335920;
        Fri, 08 Oct 2021 03:02:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::40c9])
        by smtp.gmail.com with ESMTPSA id k10sm1998249wrh.64.2021.10.08.03.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:02:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused defines from rtw_sreset.h
Date: Fri,  8 Oct 2021 12:02:09 +0200
Message-Id: <20211008100209.28801-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused defines from rtw_sreset.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_sreset.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_sreset.h b/drivers/staging/r8188eu/include/rtw_sreset.h
index 47ad185c755f..45bc227d088a 100644
--- a/drivers/staging/r8188eu/include/rtw_sreset.h
+++ b/drivers/staging/r8188eu/include/rtw_sreset.h
@@ -21,10 +21,6 @@ struct sreset_priv {
 #define	USB_VEN_REQ_CMD_FAIL	BIT(0)
 #define	USB_READ_PORT_FAIL		BIT(1)
 #define	USB_WRITE_PORT_FAIL		BIT(2)
-#define	WIFI_MAC_TXDMA_ERROR	BIT(3)
-#define   WIFI_TX_HANG				BIT(4)
-#define	WIFI_RX_HANG				BIT(5)
-#define		WIFI_IF_NOT_EXIST			BIT(6)
 
 void sreset_init_value(struct adapter *padapter);
 void sreset_reset_value(struct adapter *padapter);
-- 
2.33.0

