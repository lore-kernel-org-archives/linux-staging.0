Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B283FD3
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id c21so34999045edj.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8J0b/n/pwhYzMH+qtOX6Qmp8dqFy4rk3PZYvNn2b4c=;
        b=WqFntFslHdbEtxPj6GYJhEgJGv3fIZa1OjjkCfHq5CyOPwyzzlcReo5OWpVc7zVdz0
         J/5KAwLAxz1cfRhZ62JmpvJANPeDV+G6eM+S+6rjbvwam6qBHGsIP7hIdAL6qWeEzKft
         7AEKmkfKYpr3pEYzpKYDsigdSTVBFhLClTqxuYMDHUj9w7bSwRoX8byPalrdGKmofuTx
         5wGL0naUGWyq8SISv15KRCgKLxy/lI8wU0N16ShYuvNeElx5T+n2pj2PU1GKl/jFFgHJ
         yqaQJvDfXsxrpavXONAaH6IdA4Eye0gcD5wzdnNoSbkD4GR5fmvsZLvpJcwMXLkjZ8c7
         MIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8J0b/n/pwhYzMH+qtOX6Qmp8dqFy4rk3PZYvNn2b4c=;
        b=yWUu3g/q7At0HDFaSkafvdHz0YWSzDVnj8/alBOtTNPD256vsx4kNwE1Kz0KLCG9a9
         7h/cV7G+vSvAQ2NNrPr7AHtfghspDH6N8ezyhw5hrxVNNqVfGCliwZayCimVUz0SCZVs
         CV1UUM6qoTp2+NBusRpCd/cYxtOPlMJac00RnufX80eXnK3rkLJ5Wy8ZpvOK7NclSxYq
         8pLfZUMwY2P6uaQLBocpgbb84zfxHtD3KHwCbsFJTLYOo4Ga+fvt33aVFnrf4VFuXIe7
         9wrYIF0fhK4PkG0q/Y3rsjjKW4CC5ePn99lgwfWMelE9Cd93xxksGDre44d/bAPoI/Bs
         D6hw==
X-Gm-Message-State: AOAM531AXQw93bVeZiNcXnUihymYKhc7No5oRRlVeTnzmOxiBBe/afoy
	pcdyDPbGsHjkcIVxNBCqW8E=
X-Google-Smtp-Source: ABdhPJzCWMbqW4O1631UYz1NiKax6LgkFOh4eEd37wdLvM2744vuBoRxBKQSYzk8rHmsSnrLFBFlaA==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr11015083ejn.56.1632486450230;
        Fri, 24 Sep 2021 05:27:30 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:29 -0700 (PDT)
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
Subject: [PATCH v10 03/16] staging: r8188eu: remove test in usbctrl_vendorreq()
Date: Fri, 24 Sep 2021 14:26:52 +0200
Message-Id: <20210924122705.3781-4-fmdefrancesco@gmail.com>
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

Remove unnecessary test for "!io_buf" in usbctrl_vendorreq(). This test
is not necessary because io_buf has been assigned with the address of
a region of dynamically allocated memory (dvobj->usb_alloc_vendor_req_buf)
by rtw_init_intf_priv() in os_dep/usb_intf.c.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 84ec7c1346b1..61a016e3608f 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -34,12 +34,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 	/*  Acquire IO memory for vendorreq */
 	io_buf = dvobjpriv->usb_vendor_req_buf;
 
-	if (!io_buf) {
-		DBG_88E("[%s] io_buf == NULL\n", __func__);
-		status = -ENOMEM;
-		goto release_mutex;
-	}
-
 	if (requesttype == REALTEK_USB_VENQT_READ)
 		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
 	else
@@ -91,7 +85,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || status == len)
 			break;
 	}
-release_mutex:
+
 	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
 exit:
 	return status;
-- 
2.33.0

