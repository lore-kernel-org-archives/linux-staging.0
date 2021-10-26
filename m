Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B572
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 04:24:25 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id f8so2610145plo.12
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 21:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8fRa6CBKBdS9xSCRdr3VRDYDNn+53KcgyCR1kCegMck=;
        b=lYAwi2DhCCM6KybejKaTcd1LPmTiEvzBA2TftM/UYgxOixgrJqY1vlIV5KxOCAaqAw
         IzZ2GrdLRxvd9aEcK2ElbThTfW3y+pMMLdno9lePomJdolFZqGSIvqcWjD+BBaXomIIY
         8Z+DiOgCXn51Ao4oBm0Ez2fXCqnv9UrxW+YNCrQffwqOG/SbjOvy8s9VzXJa1pDRidtl
         R0+6Csz0rOx5KjKsdMt0sWj+AP3CPqoy4/i5jxNsCvWSe0YiGb/IIY0Vf15gwX+YGnZB
         p5nQf+KJPO/hQ8ikOTS4LeKLxAJZ37LwIvu66Du1WmeLI2R4YGcn83aZ3GFshbARUY17
         P4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8fRa6CBKBdS9xSCRdr3VRDYDNn+53KcgyCR1kCegMck=;
        b=LvG2YmYJDFRzD+FMDa3VL9gx+U9qU8NLPYY60a81bZpcHOa7W6oog4wFF6ExcDSJ8I
         ymS8bfYv+PCDJjrCZTg9lEVKnaUEKHZSe42KCD5u6Izts8A91sRCDSxyGlBxd7Gugzug
         oYKTvROZCUSKSD5QEsoYxI7CQW84jU9i+DP6znumnkxQdpz1rwQ0mFp6IYMOE/EWsC+B
         SDShpNj9/BBYO3nOSvG0Orges4lpkOndj9gDr1LLim/VxFWOyXjwpCDeqt8Yv/jUxeaz
         Yd049sLlaWKyZXqmVclPeSipEd7ZnHigHQuqhDo3OxTrbtn9Bq+hC1r2OIIEYGXvYDNZ
         rfaQ==
X-Gm-Message-State: AOAM5302CwZjbcNy2dv7Tsg5D8MWOWX4MBkWY+Os5TaN852RQIaJC7CV
	zY9vRcGFgaMeSMTcxyyEzF8=
X-Google-Smtp-Source: ABdhPJwi2AhN9rYoVCJgNz7CjYf6mRMBu9SFpIJcbzohAfzXNIw6mbIeU2o2M7t4RWcaUrLod8m1bQ==
X-Received: by 2002:a17:90b:3809:: with SMTP id mq9mr25961664pjb.7.1635222265258;
        Mon, 25 Oct 2021 21:24:25 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id s22sm19993535pfe.76.2021.10.25.21.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 21:24:24 -0700 (PDT)
Date: Tue, 26 Oct 2021 09:54:18 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com,
	matthew.v.deangelis@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: remove local variable and goto
 statement
Message-ID: <YXeC8q6IooA4N1ZF@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the function rtw_validate_bssid() remove the goto statement.
As on goto exit label, function is returning without any cleanup.
In this function goto statement can be replace by simple return
statement, which will improve readability. After replacing
the goto statement local variable ret is also not needed. So
remove the ret local variable.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 8c11daff2d59..11e9421cad58 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -24,15 +24,10 @@ u8 rtw_validate_bssid(u8 *bssid)

 u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid)
 {
-	u8 ret = true;
-
-	if (ssid->ssid_length > 32) {
-		ret = false;
-		goto exit;
-	}
+	if (ssid->ssid_length > 32)
+		return false;

-exit:
-	return ret;
+	return true;
 }

 u8 rtw_do_join(struct adapter *padapter)
--
2.33.0

