Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB93220
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:49 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gb36so14214623ejc.10
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ASeCfCa+tsT6FZmVxdA2dZywHETG+qUcSgANszr5T+c=;
        b=ItXLh/FKjWL3zvhF3x5irPSa03abQC7PAZVqmbYfXX/Hr/sEb3kthYuOWyVf3e0mna
         hDiJOUE3kWfza8aeZxhJ7p5mf9UyFpD0VPqQYZq/g6QG3ArIWwHrYzn5JNwXFsw1Ya8X
         pYY3bjUXbV240mYrRVplrSMdVl0dub9q+PyUTo6kPCDyqDARma05xsJXGyPmBowlR4u0
         NS7oz5izMD/q2vdp7+4Ho4c/EFQIxVeezxJktG7SnujSf0hIIUfXEMWeZJZw2AIIYYZc
         dYssj66iZbkJE5xauj8dfg30M+EBXEbt7kjaWkpYczFHkiCgji4QCLBPo+CcvtI1lR6Z
         C2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ASeCfCa+tsT6FZmVxdA2dZywHETG+qUcSgANszr5T+c=;
        b=k8UvCnasOV9qDU5gqgfgFE9FP19JItw5UzfpYbSbSPdA9kmrHVboj6bcmujOxCGPZf
         yF1P1kgRKaXp+41ky3y6RajmKqTG10rrGg3WAbBX34irkq6qqo1xkBiiJpTkDwlgSorl
         nVTvQxwW3MAeSm31aemMbtuuS90C0DG6uSotZJhtvCamxzEEUIJYGB7l5GsdfUHuTJP3
         B3LaJJX2T/lo//01dF9DK4wOVJGNCE2R8k32hIri5ZFJKAKvnI5TMYhsIgcRb/wlQjM+
         rKS2t4CMJjIQqbmQNY7OFq/CfOcpDWC2Eo7gOyXHsiDsXn7/xwYoSkiGlyfAVJLtdBx2
         ZKIw==
X-Gm-Message-State: ACgBeo2kzZc1+7KsM7L/riyUFfeSBkOilIPaKBzDlQG/Fu923YY6zPcZ
	H4c/atIKXRQAB27Y8HQbht0=
X-Google-Smtp-Source: AA6agR5S7xcNBdgyJebBooKqOm7QPNQNFF8xIBP1835Xq8l8ipZmklfEefRcIk2Ag1J8VPjicvNBsg==
X-Received: by 2002:a17:906:b2d4:b0:731:4594:8ba1 with SMTP id cf20-20020a170906b2d400b0073145948ba1mr8461682ejb.288.1661019408032;
        Sat, 20 Aug 2022 11:16:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/19] staging: r8188eu: rename rtw_os_pkt_complete()
Date: Sat, 20 Aug 2022 20:16:21 +0200
Message-Id: <20220820181623.12497-18-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_pkt_complete() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. Obviously we do not need an extra 'os'
in the function name that indicates that the function is operating
system specific. Rename it to rtw_pkt_complete().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index c324dada4f5b..f8d6f458b83e 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -229,7 +229,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	return res;
 }
 
-static void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
+static void rtw_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
 {
 	u16 queue;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -250,7 +250,7 @@ static void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
 void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
 {
 	if (pxframe->pkt)
-		rtw_os_pkt_complete(padapter, pxframe->pkt);
+		rtw_pkt_complete(padapter, pxframe->pkt);
 	pxframe->pkt = NULL;
 }
 
@@ -1376,7 +1376,7 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 	spin_unlock_bh(&pfree_xmit_queue->lock);
 
 	if (pndis_pkt)
-		rtw_os_pkt_complete(padapter, pndis_pkt);
+		rtw_pkt_complete(padapter, pndis_pkt);
 
 exit:
 
-- 
2.37.2

