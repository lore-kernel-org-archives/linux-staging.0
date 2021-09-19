Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEE3FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id eg28so31055610edb.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ktm/yZReSCWv5NkITk4sdfOLi4wFSyG0BAFOLT+GU08=;
        b=jqEAaMbueBa5q2pHXR8mOKvhRYDzEd2LCXE8BC7IGCmq8YJPiGF0BI8eQ2Y6N5i/xa
         A2Fn2u56IgDpeRq3WhbbXouRmsRmNWtLErvsqcisiv38NQqLntCoNKOu7aXh9E6oEBah
         Zw+SJMKPep48x1hbXc+VAFs07pWCvmepIvBcA2zgkOhhLXMgED//0bE+q2q7X92noDRH
         giyQXOjl+DM+Zpkk5SciSSj9Xv12DrbD1mTqbdzN6bJzlv9yrZkJsBg/1PDS/LCzXxKH
         LQAKx3ScQE7jCVqJWujYCMP9O0Wfbju+RGcpEKbWkzS0HkmHYWDet/8RiDeEgCXZMOii
         mXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktm/yZReSCWv5NkITk4sdfOLi4wFSyG0BAFOLT+GU08=;
        b=njEwFTtccivdt5z+OaWkyH8AhCgc+TFrscgE9qXR+FiCusUfbhy9vM2xEzen6onqw2
         OvHFw+D9CooWKHc8n1I3a3Z9dplLuaxMnHk7KW8lyuoC0jhsxmIDEB7UelrQnHSx7v3r
         sdFtubJuIJtbFOVUUq5H2fdkaDkqSGbeQHmpvF/h9VsVA73nmWhPE9Q++uywnsa0NYZt
         vAShlcxxol8xRN3hg6/nYqj9Qlxn8Baoi2Oml4b4n4f7hTuqxkwdKGyzmVJLePWtqA4V
         b1SO0pY9tZKVQXDcaJQe2Jw4pZ12npb/PaMlevLo/a1ItkgXiRazI0F5OvB+B0feG8c8
         KmtA==
X-Gm-Message-State: AOAM532bkAVmqJmazGs2swUUS0ZmKRuTPVGpefW4KruKqR+Ma8Q1jA5r
	BAuWOfAY/0ZZnWm5G+3l7KI=
X-Google-Smtp-Source: ABdhPJwtlVJRCgnubUXnFE8+omzMaTh9OHMdLkAk0NXqbO9fjJgUpspRD53oGCgnstA1mrsDxTQ6Xw==
X-Received: by 2002:aa7:d5c3:: with SMTP id d3mr26119351eds.151.1632095654060;
        Sun, 19 Sep 2021 16:54:14 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 09/19] staging: r8188eu: remove unnecessary braces in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:46 +0200
Message-Id: <20210919235356.4151-10-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3ca2959f4bcd..a270cb4249b5 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -72,9 +72,8 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 			} else {
 				/* status != len && status >= 0 */
 				if (status > 0) {
-					if (requesttype == REALTEK_USB_VENQT_READ) {
+					if (requesttype == REALTEK_USB_VENQT_READ)
 						memcpy(data, io_buf,  len);
-					}
 				}
 			}
 
-- 
2.33.0

