Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAA3FC8
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:18:58 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v24so77731060eda.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0hf9oTNZKOUajfI54KCH2+7bKh2Aob9UZCoTzOKf0/U=;
        b=RzG8WEV2SaAw9vef3rPjSCq21ZtGpdiuJUE0vGTkPXA/E3MGk2TmHlt4CrGVp1RZr7
         yq0rWNJmO6ZYMQxu0is9+wEjC1F4+hfccczJKxb+RvDny6EZ1D7cgmT13IojLI6QBLfd
         Nnht2UQnWUNU1zdz0cXO+836GQGzDjsLpfTUv6QNGQ4ZxliHo3FxOehSij/XdlCEIbnK
         HiUZJh1a6B4hCq+7d8mWufYyq+qddQ6bfdveRErMDVbmK8r4kTgkEpQ1/Va/xebCGUJo
         JeBTnkNxwdfZx2v4siG66pWEbfeXoYO1Gp+uwPbcCtcuIZDxmL+f9EEiAw/fhmuR8YrY
         gxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0hf9oTNZKOUajfI54KCH2+7bKh2Aob9UZCoTzOKf0/U=;
        b=lJSa3Ou+JJ/1Vun2/ezaXWfIk11Jut3y2a8Wet4p/uPfiNghHjPtjqn3fyffnO4mSi
         75sEWNj20q0zWNy5PCDUpwnZbkdUL5yHhykXJfnwfIc8JPI8r5+lDyzOKXBVFyISFqm3
         S78p0nh1mHgQ2FSuDyrBxDl2q8KnXSKXXvZqZJpBUe2WMNSoHQp46FhFhTeFENbHmcSh
         vBHLb2tGVHgFidqZh0u4PhVGXhy/7EAVqXq66HwtN0blZfrn+66kczyKtja3U3gK1R7H
         HZNcKM7OXJceB9Thy7KZUOI1ZltTW8BfTg6NkkQMXHvuVyrxhbQQkGncw/jYou51MXAH
         l8YQ==
X-Gm-Message-State: AOAM531/fuZMcr32AKAFm4v+4ZiUZqkinbfCXGlNJGHtPl2++FA2jRcA
	p26bszsjkl3y2lA5vtqwDTc=
X-Google-Smtp-Source: ABdhPJx7KNukFEXXEpPhp3OSqexrTXLxW+hbHVjTmK73kNECyQOY64XMlZGASWVXuLuzgW6uacw8KA==
X-Received: by 2002:a17:907:75ca:: with SMTP id jl10mr36668939ejc.302.1632248336588;
        Tue, 21 Sep 2021 11:18:56 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:18:56 -0700 (PDT)
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
Subject: [PATCH v9 02/16] staging: r8188eu: reorder declarations in usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:20 +0200
Message-Id: <20210921181834.29677-3-fmdefrancesco@gmail.com>
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

