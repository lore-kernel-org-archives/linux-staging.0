Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387D2FB3
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:30 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v18so140059edc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0hf9oTNZKOUajfI54KCH2+7bKh2Aob9UZCoTzOKf0/U=;
        b=g+y2bwV4S5HSM7/UNhyVMgzYjpWPL5xZcVx1nwxxvUWEcN1AN2Jv6qlEn90Z2TtYHA
         3G6fNtVr48I53gEXLhNgxAbawFjjR0QQHcTRfHdpqNuv9XYuYDUjpWLs/ydplmeYIQXv
         pny8lPA0x+z42dztZGOG16vOtz7DV0skw68lhfB8aygr9WFnytySzN7EJNhbzrLANscP
         Y/ccJHK2n5z/mLRrlpLDrfopruR+Mk+QLRpSx/yJpXSr7vm6O3UAOpZzfuMnMbfrpLQ5
         4pIxFfvFn28dK3nPA+Es9J8aUFRJ2WvsEzhRHGI81CXmtDHW8PYBCpm2gsWFj4vvyw4c
         afFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0hf9oTNZKOUajfI54KCH2+7bKh2Aob9UZCoTzOKf0/U=;
        b=aIoLukp7VJQZUeH4bFWokR1xW20RlDcLpsG7XqLgdwVkGyRpOb2dZjcj0ozlt+VgJm
         NU7BIAvhhI966wQ2DnfyzOQcMDnCNEIql9SEx128AYkRbmVs1n3+iRyalj/R3xllQCl8
         jy9ofGi3FFUBKPR66w112hwBlqRHR2Or9tpoGKNQuRCEXINigfk+o7crU9YXuguYH+9C
         sNYqOeRFpdb8sMqk8laFA9TfglawUsCqmuE7rOX/N5OcEv2kqyQST9rnAeNp/zCz2XUM
         hDDjjNHRALWs1gI/BtkEfabNGKQux8LpRKTlB4gpwWv5cZDeiX/4uGMpPdx8yOlHNQin
         KwWg==
X-Gm-Message-State: AOAM5339IvtnSbNJssUVgKMaR55jqJ0uIM7L4fclE1aOGUtugxXvWNfE
	GHgdZC2Bm3xiIYHihgCD/Qg3tZNtXDk=
X-Google-Smtp-Source: ABdhPJz1qNDgMZOjFL0gYWMsFE9wBr4IWvS8BZN3HgpcFlDxgCaPFDgmKHAvNp5ynWlMV4L2jl2jvg==
X-Received: by 2002:a05:6402:150a:: with SMTP id f10mr4710563edw.318.1632486448860;
        Fri, 24 Sep 2021 05:27:28 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:28 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 02/16] staging: r8188eu: reorder declarations in usbctrl_vendorreq()
Date: Fri, 24 Sep 2021 14:26:51 +0200
Message-Id: <20210924122705.3781-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder variables declarations according to the "Reverse Xmas Tree"
style.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3e7bc510197e..84ec7c1346b1 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -13,10 +13,10 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 	struct adapter *adapt = intf->padapter;
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
+	int vendorreq_times = 0;
 	unsigned int pipe;
 	int status = 0;
 	u8 *io_buf;
-	int vendorreq_times = 0;
 
 	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
 		status = -EPERM;
-- 
2.33.0

