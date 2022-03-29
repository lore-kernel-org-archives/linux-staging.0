Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE812118
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:38:10 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a8so34074326ejc.8
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsMxFHOpT2A5HUis8VHCCczQTixH8ndtilKa6t51LrI=;
        b=Pq3ggJM3Rhl7SPfPzHmle6U9ZLOrNMFBynlGOnTYhnWdeWRFEFR9k5d0GC+wQ2k3BG
         CbXgwnDqAf6j3GK6U2PaQ87RBSfG2F7q+DxLCT5LwFyKzM5QXhsj9UldUsAPbwvUyVCL
         CCuoXg1PxryZlYsSHhthxfYHvFahI0f+UQHgCN/RGGMTxcosxnrOu0qnZKB5MG5WhEX4
         hp0kYFR94mptzFAPnduf1Oi9dMi0TfbOpwcYtM8PWRZp3Jz3k8EseLOYUs7lIrpHcRQY
         6QbKysFcmjBGyRxlRMaglVlR/sxVZ1TvhDqR2EcKuyI5LqwSCjkLvby9ANn4JXoUj9tG
         etIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsMxFHOpT2A5HUis8VHCCczQTixH8ndtilKa6t51LrI=;
        b=p67g6xqbaRgcZHP2gEGQhFz0ZRYWSSyNzjjPWOpOR5pbnLQ+MXZxlMfOTYNuSoI2Ps
         YxSyEVbo2hA6soDMhRlF58FewFQI6wVMd2ZFpFEKW7EJvPuvw7CuPkob8TfR4owS/UYY
         NIl3sWrlogUUbyANivfykvTdAk7glR5H8WgTjIwV2HJf3as7ZxdugODXLOzhMG5bk+Or
         Q0W7B+EPX6enmqHQMwcyj3m9AnRoNal8I9EEZXMRMDOm630+9x/2zZ1Rkq5aoc/TcIOH
         daifQDYpIWzL2Ps/Ogiy6UIVqgaaqKaSwZuLkSzItIQcfSENZvGa4aA8JQXFHGcdSFC1
         qo0w==
X-Gm-Message-State: AOAM5339F8TrD/3h8YzpQlf6395AaTYU1F2nnG/2LO9l5AgQEmftCL6f
	SlzDl3wIGNIJUXWQAEYX9ew=
X-Google-Smtp-Source: ABdhPJz0xqUQqT3sUKGA15qsP14r3IAHkIFxcD0kHKW7MrHMOmtXEEJtDpooSpjRdDfVk+jHjyb69Q==
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id z14-20020a170906434e00b006d0ed9c68bcmr32630418ejm.70.1648550288698;
        Tue, 29 Mar 2022 03:38:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006e03017d60csm7058151ejc.54.2022.03.29.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:38:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: convert rtw_usb_bulk_size_boundary() to bool
Date: Tue, 29 Mar 2022 12:37:55 +0200
Message-Id: <20220329103756.6740-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103756.6740-1-straube.linux@gmail.com>
References: <20220329103756.6740-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_usb_bulk_size_boundary() returns boolean values.
Change its return type from u8 to bool.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index cfcf6f84d2cf..5ee1c8c7940d 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -46,7 +46,7 @@ static inline void rtw_reset_continual_urb_error(struct dvobj_priv *dvobj)
 #define USB_HIGH_SPEED_BULK_SIZE	512
 #define USB_FULL_SPEED_BULK_SIZE	64
 
-static inline u8 rtw_usb_bulk_size_boundary(struct adapter *padapter, int buf_len)
+static inline bool rtw_usb_bulk_size_boundary(struct adapter *padapter, int buf_len)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
-- 
2.35.1

