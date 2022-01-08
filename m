Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E42C9C
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 00:55:54 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id x18-20020a7bc212000000b00347cc83ec07so1512662wmi.4
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 16:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZeUHUZWxDxeensObwbjkGV/GC1wuDs3S5FK89IMeJ4=;
        b=6j3m67ME9247HChzfrdYL3VKRv/MROei8xh+98+nKPJTWHQAfqjaTW8EdeGMzb9gQR
         lwm01PkOJxbDcod+0bMgwSFx+oSQEArWDA3TxPp2R6nilHOrO0HxF7EZJ9DS0mg+nf/b
         Sh9wBmN6bF8x03pEouDlPtYcMArWoPmqt5OiQcq/dMJbzSsQ+4vlDaJqG9GWOFbmMzQ9
         SxVDQmZ7zkzsozPZWWdNL72Zh90r0ql91DrCvSKS051BJlrJS8wxzVKXHT/BWayaUgES
         v381m7kpYygeg8TmOt0hcHBzidWBwx8KQRzBi6QfbmrqBw7q9QpIUILxhYPb8PoVXMia
         r/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZeUHUZWxDxeensObwbjkGV/GC1wuDs3S5FK89IMeJ4=;
        b=2VKmtEbTDxOcxIGgpJpQ1mDbwY6+4W71kM+ZnDTL6THmVBvZyEkWEKuyG98k33p48P
         WdUxcGFH3oZYcDCX1ta+viirf9QGa4s80z+nBM3JHv9gQbxWOsCbIxREXa7CG2chcOLu
         g1qRJbEuR3apGRG/poqeaXtX9LMb/hLIJnDNzQbJXWTk7FJwuZ6lsVJEqHTB3kMXZQT5
         WUvZEaxmj8X9rq1GF3/Gj/dF0KpMqUYseY3cKg/Ytr+XraP4EZa42yGKWVRuXlCLqRPv
         zzHZsHSrC2gbeGdfidzwEIRLMjKelgQpoqZuJQuOTnrM3sxW0EBXINYipGLQKj+5DSYg
         qyCw==
X-Gm-Message-State: AOAM530T9cTRdPVQFFVLoXt6o847z9JnaIbaoBxbBkixmlS6qVm3zHpG
	FazDzMW1zumQXeZKMVc8c2Nq9A==
X-Google-Smtp-Source: ABdhPJwpLN+CzfcKC0RpG9YvyGuPfMfFYBc1t+jbBgzRtR+fyktl4S1MqY36VNJtzXR3RFHjHy5Xmw==
X-Received: by 2002:a05:600c:2188:: with SMTP id e8mr12989668wme.55.1641603352779;
        Fri, 07 Jan 2022 16:55:52 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id c18sm238853wrn.81.2022.01.07.16.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 16:55:52 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: r8188eu: convert DBG_88E calls in os_dep/xmit_linux.c
Date: Sat,  8 Jan 2022 00:55:47 +0000
Message-Id: <20220108005550.26264-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108005550.26264-1-phil@philpotter.co.uk>
References: <20220108005550.26264-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert three DBG_88E macro calls in core/rtw_ap.c to use netdev_dbg
as their information may be useful to observers, and this gets the
driver closer to the point of being able to remove DBG_88E itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/os_dep/xmit_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 088c294f2586..7287897b3f65 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -79,7 +79,7 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
 	for (i = 0; i < 8; i++) {
 		pxmitbuf->pxmit_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
 		if (!pxmitbuf->pxmit_urb[i]) {
-			DBG_88E("pxmitbuf->pxmit_urb[i]==NULL");
+			netdev_dbg(padapter->pnetdev, "pxmitbuf->pxmit_urb[i]==NULL");
 			return _FAIL;
 		}
 	}
@@ -188,14 +188,14 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 			memcpy(newskb->data, psta->hwaddr, 6);
 			res = rtw_xmit(padapter, &newskb);
 			if (res < 0) {
-				DBG_88E("%s()-%d: rtw_xmit() return error!\n", __func__, __LINE__);
+				netdev_dbg(padapter->pnetdev, "rtw_xmit() return error!\n");
 				pxmitpriv->tx_drop++;
 				dev_kfree_skb_any(newskb);
 			} else {
 				pxmitpriv->tx_pkts++;
 			}
 		} else {
-			DBG_88E("%s-%d: skb_copy() failed!\n", __func__, __LINE__);
+			netdev_dbg(padapter->pnetdev, "skb_copy() failed!\n");
 			pxmitpriv->tx_drop++;
 
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
-- 
2.33.1

