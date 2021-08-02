Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486B70
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 22:37:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n11so11311762wmd.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 15:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1NYy3xMVa4GkO751TKcuObegthDWDqsbdIWZPwNk3T8=;
        b=fp14hetuEWvtVi1U9vDQzbHmtEf4HT7iARzzKd1/K8u2r1+4ZD+niYk9EnL3TX4lxk
         6HgiNN9dHbkkvBUoHTLJLD/Oy8BgjvfroQqV1MT7Sf5AzGZoh39DN8oNJ/zS9WoiZtXb
         Qlwp5BIauGrnv3kqnbh5ew83aHsCuB+zzpui8mq7gFutfY+gdmSdaDt4lryru0J0exbP
         Tk3ek7Rw5CzyBmrvidyu1tiMMxPxQLZYI4lYG1mXNXJxhHqtWRF9vIuUmesRYOBPVNVQ
         1IpKk2dJ1vrdUVVCYGzccf97XFAyB/NRRRFZpdCur+oaLwBjgkjDFBfrWkyg9R1MxQ3f
         djGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1NYy3xMVa4GkO751TKcuObegthDWDqsbdIWZPwNk3T8=;
        b=FUN4vRNaopWnvgxuWzd8nOFvW55NdXyn6bMG23QT+tdsUILUs9VtQy2n8xLsY/A01M
         Cx9dU8YQZzLByRWIqcwT58NKPAFv4ju7DcpRHjLXoM5Hww+5LxPmL9xmz31BXs5hxbM2
         A1yCNbJOs7Ym64sah3tqoZSXDymLU7RgoVtleQTyrbTn1Eq2itTkbYIQfHJjR6SHRHh+
         hFXuV3L1qCXt5plJ26OxLVRGNlY/IreBtPRdF/D4pHNGjUATyCrBUTDHg6lHtg3weAug
         qxmzXxX0FNizcSvRp9oLHwkUhBXaUhQeHqMVmaCz2eIMzhBi2wNOOuRwNVw/wOzpr4U9
         XHXA==
X-Gm-Message-State: AOAM531S38ftZSzkZpcam1z1Nz3zOxyT8obDUEUiNJZbZn7t7AItqkn9
	8gOP/RV2P+ySJbkOIc7qowA=
X-Google-Smtp-Source: ABdhPJzjLHYzabtB+5RvH+66k6gq3MnEMipWqyqjNoMKDpOmRIxYpLN6sWM2hJdy1PO2epxec9N11A==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr1100122wma.94.1627943826859;
        Mon, 02 Aug 2021 15:37:06 -0700 (PDT)
Received: from pc ([196.235.140.151])
        by smtp.gmail.com with ESMTPSA id f15sm12061885wrp.12.2021.08.02.15.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:37:06 -0700 (PDT)
Date: Mon, 2 Aug 2021 23:37:03 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Amey Narkhede <ameynarkhede03@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gdm724x: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <20210802223703.GA1425480@pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Based on the documentation of usb_[disable|enable]_autosuspend(), the
caller must hold udev's device lock.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/staging/gdm724x/gdm_usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
index 54bdb64f52e8..31b3b3e563c8 100644
--- a/drivers/staging/gdm724x/gdm_usb.c
+++ b/drivers/staging/gdm724x/gdm_usb.c
@@ -846,7 +846,9 @@ static int gdm_usb_probe(struct usb_interface *intf,
 	udev->intf = intf;
 
 	intf->needs_remote_wakeup = 1;
+	usb_lock_device(usbdev);
 	usb_enable_autosuspend(usbdev);
+	usb_unlock_device(usbdev);
 	pm_runtime_set_autosuspend_delay(&usbdev->dev, AUTO_SUSPEND_TIMER);
 
 	/* List up hosts with big endians, otherwise,
-- 
2.25.1

