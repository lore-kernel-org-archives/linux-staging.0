Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E97E;
	Thu, 20 Oct 2022 02:14:40 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 67so18934047pfz.12;
        Wed, 19 Oct 2022 19:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOPnQVDm1uAKZaYosB1mytuxMV4Sy6PQL9rIuuTadMA=;
        b=Tkq2h0XXIBtZb4SLlY3CjWI51sPYHo+Rnbpus2JveFpIvBGXGJFM1YSiUfVEWQuV+X
         6XAVgmZujVpxUqNgVAcwxf5VXKfuoJONR5/VixMSUSakRjR1jE3gKDnfC9nLgFPkEvSM
         //OqJAXlXcrDxBvQ1lrFnadFYbohDN+SjRL6x5cxTTDCKiaY4+si58LGvs4imHLG74io
         ItiwnVHuk5fiSIkpj5INWTGPhJn/yxeH8KJUFWZot12gqC/AoDazE+7TBsIH2fWoYpGP
         CAycea1c9+9+0hVnLq0QnY61+frH9ZRqoFN+Brl933Jd6w94bqsbUuOQFPsDMSZbRPmb
         SuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOPnQVDm1uAKZaYosB1mytuxMV4Sy6PQL9rIuuTadMA=;
        b=C9nEwAMye/xJLs2yZ50/g/Fo+O2n4PyebAYRfoyrCA07+kiX6qDeCuTnCJEYzEGK6w
         WoUYhx5ZtfW7zXmkcVx4+itUFYqDNZQHNbcq6g5ubn27RHrCL1WPST9AH5uSfps1kAG3
         bjk2tvKxnbYoFgbI4CKotOopwpGSzhAHWMZAPKW5oWTY+KdOw1ZXHacLb8NrJlvPSTqY
         MRgRzappNFyOjY8XzL635feU8VpqrI3+5skd9PTZRBL6KSv0VlcEL0RmQikS3DKNrKCs
         5ZYZ4C3Dwt01mPj3iExQlpRBUxf0oRwcB30LtDg4ICxA1jkYJPEMsVB1cgvUJwF1G19A
         YxVg==
X-Gm-Message-State: ACrzQf1r2snVDu8+eRtd7RZIGj5zsD4g0sBJwSivgA7YPOJvvluEos9y
	UxKB1/n6x9n8NOsFRQJQFOs=
X-Google-Smtp-Source: AMsMyM5Dr2TlH0gGTxnHEEsVWzmYNvyXTdzJ3oQXUX6XiAwO4DtVcVZ8C43jQNliO9NUCUYiJ47wnQ==
X-Received: by 2002:a63:2b4b:0:b0:440:2963:5863 with SMTP id r72-20020a632b4b000000b0044029635863mr9568549pgr.28.1666232079822;
        Wed, 19 Oct 2022 19:14:39 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79852000000b005631af4ece2sm11942936pfq.182.2022.10.19.19.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 19:14:39 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: align block comment stars
Date: Wed, 19 Oct 2022 19:10:52 -0700
Message-Id: <3d9738edd0992b72bf8fc8a05706a490772b5317.1666230736.git.eperi1024@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666230736.git.eperi1024@gmail.com>
References: <cover.1666230736.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align '*' on each line of block comment in rtw_ioctl_set.
Issue found by checkpatch.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 354e61a8f2bd..ac957035bf1a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -463,11 +463,11 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 }
 
 /*
-* rtw_get_cur_max_rate -
-* @adapter: pointer to struct adapter structure
-*
-* Return 0 or 100Kbps
-*/
+ * rtw_get_cur_max_rate -
+ * @adapter: pointer to struct adapter structure
+ *
+ * Return 0 or 100Kbps
+ */
 u16 rtw_get_cur_max_rate(struct adapter *adapter)
 {
 	int	i = 0;
-- 
2.34.1

