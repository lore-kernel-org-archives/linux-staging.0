Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80EE3FC8
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:07 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id h17so77959865edj.6
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdFvvX5/HN7bvh9JTzeUFUGFd/lBuWQSjRE1lGqFFEU=;
        b=bgXxtD01Uth7YZjYyLEt3mG+K2B0n4KNi8SDebspVpxfNybeTQAqIzIQn4ktHQyp7m
         g4etEW/xepDscjdEZ0ezPNttfFKnvmXr+WG6DnUC906TDnl4h0z+22navJ7cpu1/yJoL
         2ZilIEZWFLx16KOCmAiLR1lpq6Hi4BkB+DwuL7GY+ggXVAolxFdsHdMaYS6h9ucPpD/p
         yrAwhF9wggAQblqhFDlQKTP40kNwGE6pDr7DgZNi5H14ZwzoUVK7T0nIN1GA44GqzVGM
         YC4u4u29TY3no1xQbnX/63F5R51qLBOxkeCIRCb0OwCPokIYG6mWjVXVtgfaL/6ytwo/
         +jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdFvvX5/HN7bvh9JTzeUFUGFd/lBuWQSjRE1lGqFFEU=;
        b=DZMWxCespTFSEtk6p3FipKktnMbH/hPSQD6sTeE6jXKFCtp5dxUBnYrMRAl6pZLq5L
         sj957/gY8YBUG2o2y3pSRBulp8RvRH6BLWXwbJ1zIls5fokXB/xRr7vrSGRrtPyDT1s9
         cnSeax2x/GesO/i6FgaFY97bnEYlgxxRQGKcq16rrqZf79AckqJxi92Vw0MG5HrSngYU
         XM0EcVVJWWY9aU6b4gsLFZCsaKOyCFiPU4nL5r2Au56yo/IUd+B8as8KCnj73riLQABJ
         rRFBU06Pw2gkpiSmKoQgsVh/k+JPKSzJTIKQFAmhSaQF3d/ZOp1grt9SlYK7C0vzS5Xw
         JFEQ==
X-Gm-Message-State: AOAM530dqbeLbGq9p3zVK4/1w5BaGugQhZPVHrOuNqbPw0YYlStv5glk
	MmL74lkZAofqoazDd6EVimE=
X-Google-Smtp-Source: ABdhPJwbufqOE53iQv7IYZ6RKdg5kWOWoID34lHShZxXOQNx199RoU0Af89/dYiRu3E6vDhl+OBjug==
X-Received: by 2002:a17:906:a0c9:: with SMTP id bh9mr36754521ejb.51.1632248346345;
        Tue, 21 Sep 2021 11:19:06 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v9 10/16] staging: r8188eu: remove a bitwise AND from rtw_writeN()
Date: Tue, 21 Sep 2021 20:18:28 +0200
Message-Id: <20210921181834.29677-11-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary bitwise AND because "length" can never be greater
than 0xffff since VENDOR_CMD_MAX_DATA_LEN is defined as '254'.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 8e4e578ed60b..3b50d2b5c0e3 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -176,7 +176,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	ret = usbctrl_vendorreq(intf, value, data, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intf, value, data, length, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0

