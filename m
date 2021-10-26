Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6505E72
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 03:55:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so489853pjd.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jT56R8thic/ZxbSI8kRsJDsnZUfYJtsBr78ZdkZB++g=;
        b=KTXsGqDUekb/etDelz3qvN9JZR/TMLaUheLzeZvpokHqY+rDelz+x8QQqMnuSxo8vx
         IahoSrHuzbmRjQvRie7WfRxB/bBQHTgBYDcYDrbayZlydlPEK9iCfjXmHJHuVxU51YS+
         3ZhH3UZNITCYZDcg4fh6rQwE6KjQ12f5sOakxfv4YGHKCjkea8VmZ9ZJW3yabbP7uFxr
         FFPgIC6YpffjvJSi55IoTT7aOpg+E6V1cwjJxDs6AZFmuYtYdYuItkSmCGmjxvGLDHQY
         RNH7RPOsH35KEqcMIOsAG+x5AwP7hUipnQyUlYbYjQooJIKU/zoVUFT6r8XWMqR9P/aW
         lY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jT56R8thic/ZxbSI8kRsJDsnZUfYJtsBr78ZdkZB++g=;
        b=QlrGKSbh9iNKtX99TnXrunYuPcptK7yf9qtB+2hcQqr2GCMLaEQ5CCWJWiiKYIOV2O
         wfBOj/h/O+4G3o2QlTTWXNpDMPm/YsZ11bI7U31g5dKGi2tOa/Tzy6/Jf+csH/RgLq29
         9Wz9cCP2QEQLDLw7t4ZlCj1mIuSzb0UqM+TOwyuQorzZmSrtvU+1sOVFexWRM/cdjNTf
         onfID7a+AEqfynw7OsUT/9Qlzm5jUEoNUS5XkH/wmqsFcPDSprRELmblyqGVtQ+0cgBm
         YKMBRQvDMn/EVUBOTwAy4oZRMDTsO0R4UvL3R9fRSMNdkA99kLFS7ODlGOX9eFcBzuis
         SE4Q==
X-Gm-Message-State: AOAM532C4L5BC2EWTsu8vLAgafxHzs5XbMtiSP1NQmlSdCO/44ODKcZT
	Y9j9+gpMOGXoBA4B2RrS4yM=
X-Google-Smtp-Source: ABdhPJx/tbq495MTTzwmabiKX0Rxbwvklp7Cbb+CJPJE5IPtAdBBLA/Y0DNZDBiyWzY0pKSuAfuljw==
X-Received: by 2002:a17:902:7e4b:b0:13d:b90d:cdc1 with SMTP id a11-20020a1709027e4b00b0013db90dcdc1mr20615321pln.72.1635220553779;
        Mon, 25 Oct 2021 20:55:53 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id t40sm5167291pfg.142.2021.10.25.20.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 20:55:53 -0700 (PDT)
Date: Tue, 26 Oct 2021 09:25:45 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove the goto from
 rtw_IOL_accquire_xmit_frame
Message-ID: <YXd8QdhiNX3B1nqe@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the goto statement from rtw_IOL_accquire_xmit_frame(). In this
function goto can be replace by return statement. As on goto label
exit, function only return it is not performing any cleanup. Avoiding
goto will improve the function readability.

Remove the assignment of NULL to local variable xmit_frame just before
return of function. As function return, local variable will be not
available on memory. So assigning a NULL value to local variable just
before function return does not required.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_iol.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index fe6078864158..7e78b47c1284 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -13,15 +13,14 @@ struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 	xmit_frame = rtw_alloc_xmitframe(pxmitpriv);
 	if (!xmit_frame) {
 		DBG_88E("%s rtw_alloc_xmitframe return null\n", __func__);
-		goto exit;
+		return NULL;
 	}

 	xmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 	if (!xmitbuf) {
 		DBG_88E("%s rtw_alloc_xmitbuf return null\n", __func__);
 		rtw_free_xmitframe(pxmitpriv, xmit_frame);
-		xmit_frame = NULL;
-		goto exit;
+		return NULL;
 	}

 	xmit_frame->frame_tag = MGNT_FRAMETAG;
@@ -35,7 +34,7 @@ struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 	pattrib->subtype = WIFI_BEACON;
 	pattrib->pktlen = 0;
 	pattrib->last_txcmdsz = 0;
-exit:
+
 	return xmit_frame;
 }

--
2.33.0

