Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563BC3FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d26so22222300wrc.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0jDxgei4bh80NCLp4kQich3bBzgtekPwpab1aROVMA=;
        b=r8t3DDqn0SQcZvx1pXh8E1rCQrWuemDJD98NFhU0nzSDRbVsJh/pp11rEBaofoCD2B
         +hxjTx32ZA4AuePGO3r/3gK9+fb25qj6vLuQWk+pOvrsGTs0P4uPsFgqXAClVl3tlMH8
         x8LGz+v4iaI75LTuLYZTUodzvTLmanBl4dP0j9W/e8E8RTR12wtGZbH3da8sm88G62H5
         Qf2DuahTQAsNnkKpKQs/IK/XbigYpZnK5Gnrp3/ofXiOuP0dr2FN/m7Lx6yfQEN/eKrd
         XdS/QKNT9gwJcTHnIbBlKnRDR+SlRRsaJ3hXaqaemq3yOryB8VifOU3VW3IRwslt1x+r
         2n4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0jDxgei4bh80NCLp4kQich3bBzgtekPwpab1aROVMA=;
        b=dIuPS/SE+aYTTWP1fsg9gjRxDf0zj1srxRK98o2ZI2SExKIaJcexYdx1eJYB+I5bcA
         t7FT3KIZCXqArrVi2jKlQilbjbZSyIZhVAdS+T2V9WkFndtiy2BmCK5LCKS86daapYJO
         vOpI62eYAGHyCSGFNoLWgS2vRuKp6y57Ihz9ssTOpydK8tIK7+o4wTyB4BRJV0DlK545
         KAVKWKJ374OFWti9RfCU3MCl4oUjriGytpGJnBCNiMiYz6xQ/y+C+6ES8ryhNXTa7TxZ
         aGfAiT4xmKvfpTktg81Oh4s15dH/+scXYW3vApAvRa2M2OuAOJezgyRuDCzuRok1whaa
         61Pw==
X-Gm-Message-State: AOAM533QlyeA4u05dagSpb+IiNeLpAjAiStJFkbAfbFjvmWtt31zmulW
	JO6fdgMg2t3eWV/Bv/i4Kj0=
X-Google-Smtp-Source: ABdhPJx1JqT2NS8B8Fr8XH3AQRj7OSzN1Ze8DZO658jh2OZAh1NDmuhjRSvp3jFcjQ8iyNFC6cpOfQ==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr25175000wrw.403.1630325742783;
        Mon, 30 Aug 2021 05:15:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/8] staging: r8188eu: ensure mac address buffer is properly aligned
Date: Mon, 30 Aug 2021 14:15:02 +0200
Message-Id: <20210830121508.6411-3-straube.linux@gmail.com>
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

Ensure the mac address buffer in struct eeprom_priv is properly
aligned for use with functions from <linux/etherdevice.h>.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index 9f8a9c070339..fb591a764dac 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -99,7 +99,7 @@ struct eeprom_priv {
 	u8		bautoload_fail_flag;
 	u8		bloadfile_fail_flag;
 	u8		bloadmac_fail_flag;
-	u8		mac_addr[6];	/* PermanentAddress */
+	u8		mac_addr[6] __aligned(2); /* PermanentAddress */
 	u16		channel_plan;
 	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
-- 
2.33.0

