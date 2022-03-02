Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492636136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n15so2621223plf.4
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/diaxepVKqVQthgHB5ZLX1zYhY6vcKwtc5iIGOs+iuI=;
        b=A1Yjo71UWe6hgMcsjR1IWM8cQzcCoNwnu9VyLeQfWccND1GYPHMr1BLDSI/IRqRAGQ
         U8ZLhb+5Od8F9sMchKYbf3aSZwWZRdziYGSwj9mXhA3gKez76HoFixasTJZVfMxXZH/Q
         bPHBa4YoRvMOQ/KaNBRB7rVk+mS0EBLg+K77qz4TXgOUNlHiQGkbUlVQj4X1YLtyvIWm
         1Z8JU3xAyiQmmJ9H1Eb+2TQXlzFygu0Q3QJyBktA7M/XL8rCzA7bSYgdoG9eLgxXOKKR
         PckgyFRHWKpmLuK9CbmrIaMcRFioOBexKYHfUcAJFyA2joghqk07g/ldKCBd0eCc/+qY
         /XEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/diaxepVKqVQthgHB5ZLX1zYhY6vcKwtc5iIGOs+iuI=;
        b=G8U4np2w/QQ0C4ssI7WA6I1xf8G1DklhA8qdjk0YPOPGrORfhtRnPWuLySRS/U69AP
         GVBk+vGl2yfS88a/TVE85TfG6KGJaUx4Xt9Ex5dko+nNG4KGfxEjkBLTM12rjtmo/2MG
         4MzE7K+i9WKa/UH8Wu+4YRY7wOzS9V03ZFAe/CjUxusBQT0PlQMpc57/yBXJa5y7G06I
         h81+H+VQnvYSBbkntb3j1x9Lti+Oa07ExOnp6DN16f6Jt7WPIRWzDgA2G44hpeNOSgCd
         /Ti8Kiv9dqdqIUZQ+c9CnOgHIrX+mngCWEv7TJciUeF0meF3GGhOBCCcgsDDGSeKTjh5
         LQkg==
X-Gm-Message-State: AOAM531VYFNqzVuj1ovYxH6z6VuEbGTch4I/KhJ6Ik/Ghim6f3xRayEV
	8Q8vgU9kuQ8NculxcqvZpRo=
X-Google-Smtp-Source: ABdhPJyi78ocWvndFMAaXGfhKdoPgJOWrt/C4izHFWGzfu72ny+IMV83ShOjCTfF5iEdZx2eqoRxHg==
X-Received: by 2002:a17:90a:b00d:b0:1bc:5d68:e7a8 with SMTP id x13-20020a17090ab00d00b001bc5d68e7a8mr1657182pjq.59.1646254098817;
        Wed, 02 Mar 2022 12:48:18 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:18 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 05/16] staging: r8188eu: mark check_indicate_seq as bool
Date: Thu,  3 Mar 2022 02:17:26 +0530
Message-Id: <20220302204737.49056-6-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark check_indicate_seq as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index d77d98351..402b58a02 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1466,7 +1466,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 	return ret;
 }
 
-static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
+static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
 {
 	u8	wsize = preorder_ctrl->wsize_b;
 	u16	wend = (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*  4096; */
-- 
2.30.2

