Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B653FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:43 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x7so20898620edd.6
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2tlqcJMcGsGx5TiqtBgZeF8XSKZxGfxWP/NlXeWrtk=;
        b=NvuMCW+aUEe+rO34+i0dkfagyFCnUsHDoZ42Id4BtabVICgidjyzqXuwnPzOsX6Grc
         ebT5ss6v8EoWbXim8WUwAYcpRRYUDpPhd4eiKUmbK/nIT6TAUildorl2qBpadSv50KpV
         szniFl0+wPLeGEyL/WP+aR7g2Qkc+z3d0ftmNZp7BoRKyF2Ue8962ayPGCcD+IT4D/Zx
         BDAVS8/Zp7Q9WS7r4lsCEpv4Fd7KXFNxkX1sNPg6EwNL6twXGwtG6636A6pDHfUOtX5X
         Jy7G896EteGdUHQTrN3p39GOdrvCNfX7i7GRqbsrOxg0ZepxyDye9Zzv9KrcA3Kg85+X
         0xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2tlqcJMcGsGx5TiqtBgZeF8XSKZxGfxWP/NlXeWrtk=;
        b=Acb4lZ4BAB4sMl9g6iOifRX3wLbbOVwbe8kvJoqErtnoylelOFUX/E27SUTjy8oHh2
         992F/T/BwhOAar39/pro9+8IQlicRc1pzELhvLJYwF0IiKmVefcWKtiAPsm5PtipnyXw
         sjROI5iXDd10JSnsXGkoddYMuG8shsU2OF5iXcQxGsH2c0AptQ0N2eUw6xDFr9qYJK8t
         soN9aESmLqmR1mx/EM8CX7BkY4C59LammrYVydF2cl/QG8hZiPx6qVftZ08sjwuwKw/H
         nITGsNpaJ9R4qPuc9iJUhAwx4YvioNV7RRzsKZWMJzj+4E/RyalyPxsQpbaBNFyeiy3S
         5xlQ==
X-Gm-Message-State: AOAM530ni7lI3MC8GoT4NJBmE5hQxuQokpDlWdYM10R+9FwoEN4Q2q1V
	efbmeeBdg9BrwGirbBWHtRRmYyXIf9g=
X-Google-Smtp-Source: ABdhPJwjq3UnZNEU8xjnA8EyNdjPxAhejmwCUeOoIddLhztuXXKKdvT1reOW/sZmyGvFXLGcAlBQYg==
X-Received: by 2002:aa7:d814:: with SMTP id v20mr4709387edq.169.1632486461404;
        Fri, 24 Sep 2021 05:27:41 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:40 -0700 (PDT)
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
Subject: [PATCH v10 11/16] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Fri, 24 Sep 2021 14:27:00 +0200
Message-Id: <20210924122705.3781-12-fmdefrancesco@gmail.com>
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

Change the type of "data" from __le32 to __le16. The size of the data
that usbctrl_vendorreq() will read is two bytes in little endian order,
so the most suitable type is __le16.

With the old code, since the two most significant bytes of data are not
initialized, KMSan can likely detect the reading of uninitialized data,
so this change can prevent the checker from complaining.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3b50d2b5c0e3..04a878c1a87d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -109,11 +109,11 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	__le32 data;
+	__le16 data;
 
 	usbctrl_vendorreq(intf, value, &data, 2, REALTEK_USB_VENQT_READ);
 
-	return (u16)(le32_to_cpu(data) & 0xffff);
+	return le16_to_cpu(data);
 }
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
-- 
2.33.0

