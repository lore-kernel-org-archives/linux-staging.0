Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96713FC9
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g16so164961wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5mAXIxdQ3ZHOcZa3/XgL8+waFFw5ZKFjk5I33+w7UY=;
        b=Qgpq8DP/jGL+dyqlRelcUb+X5NEG/GP8R4MIynmZFu9Lv5GBs0nXrKQSS635jEKDLr
         TNlqFwYXAO69QYz+trt2j7sW9rcyPVmJV90YJUp7L2Qzr/aC5TF3B9/r5wKk6rJpNU10
         LKIhtduN9OXAu2qNSqJb054V1CG/ykf7Magsp7RaS+MOGUJEVGli6K/4VaYRvwTdc68g
         d8pABr9AngClTNdU0kair1BWvJwLYJ5k8U5Cgd7vVEM86CFnGtHNDQNHhf5rRRSczdZv
         pxuuoeTiKbQRzr35mqXGnwetBfB9F5QHY3UtjVSwfxC7PTCao+LwgP0jmZukOkO9m2HG
         L17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5mAXIxdQ3ZHOcZa3/XgL8+waFFw5ZKFjk5I33+w7UY=;
        b=UoOgbR9XktHOnOhA1iU7pWmVPCjk/nJSlETKhvHrzgWbrMPRvtGGqYPLFYYeM34rIu
         18HNN+BfO3bSWOcnnZWLcBD96mhyBwnTwEnbVNytFjigzPn60Cz/uOBsuWBbU8xv/DZZ
         PIJ6OjVsECk0rgBb9ypzUvNVrwWCSB+UF7QH5VCqplwovps6V/46btMbiAdA9PHx3HY+
         47c3iZQjO5NaglVCk7aVVmqz6GAob2nwg/YGFCDh/XSI13sj+KZUsVjydmqaMHz9Mpl0
         PeoQpc7TLBzec7mFDG0sd0QIXjb3DtVYJVVtEWErnjaiEozl+XaRUFYPZNt0IgZLgzL/
         L1jw==
X-Gm-Message-State: AOAM532tOiCdnKPXSKUS2td0pzLXiAQ+QrGhef9JC1N5u1R8fZfpgE+Z
	ce2ceYSHAqHd5/fPFLNE5/auvbXBnHiMNQ==
X-Google-Smtp-Source: ABdhPJyq7GRTP3Z5CbL05GI02YZI33qYuFblBXPF4l5dqGoX1PEAhcXOD0Ap8R2RCIo5Or4VL0J0lw==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr36978452wrr.173.1632253646165;
        Tue, 21 Sep 2021 12:47:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: r8188eu: remove PowerIndex_backup from struct dm_priv
Date: Tue, 21 Sep 2021 21:46:55 +0200
Message-Id: <20210921194658.10654-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field PowerIndex_backup of struct dm_priv is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 2209975c0b2d..bfe300730c16 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -30,7 +30,6 @@ struct	dm_priv {
 
 	/* for High Power */
 	u8 DynamicTxHighPowerLvl;/* Tx Power Control for Near/Far Range */
-	u8	PowerIndex_backup[6];
 };
 
 void rtl8188e_init_dm_priv(struct adapter *adapt);
-- 
2.33.0

