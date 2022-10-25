Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E7EA4
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 09:12:46 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d26so10784155eje.10
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiyKXU5FxcBo4aQqXip+DivTGxVo/DuU5b7lG8hm9nY=;
        b=N+hlx+k2SXKWFiaDXDxEXL3461ZtjohMXc0sKc9tjykAPxjCG6LqEohmxBA1TsSLM6
         upsrJeB37h9M+z3m80c1fQ/x6+x1ZnOpq9/RZCvb6iU8FAvytsqVm3sz7QKpibjnv5/B
         MG0ViYyYuQO2Leb6BKBFnq4V6SNT3dlVpdd6pLPwg/FLQ/8eppJkxIU7QxO4dK7d5dF4
         pKaemWVBLB5hYMym1kB/U7VQhi7CekPVu77u9QwXUSWixAxDQtHPf6o0H9BPiuw2FfRD
         hkQIX8mU5EcJUh4Yjl+F8VnDtb5Mrj+SJcg0lTPqrVv416yhS1jh2ptDKfp1Q3Uw2V7d
         449A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiyKXU5FxcBo4aQqXip+DivTGxVo/DuU5b7lG8hm9nY=;
        b=bnRuFZevWrhDocBfbYRSeyr3/j68bM51vuFKpMEznO5bLcSV/mLk/+U8U/Ah/7WKX+
         bSAYsJ/f5+iKXYaw66sYaeH6oSdnwCDq/TK5Wctw1tjZnUEQmoIX/z0Yqo2EtLHRN+Ya
         9NlV4MrO3VLS4g2lNXWer6HzeUriDfmdLIS0C1YYMUTZv0CwbEyw4YZZkPxbgp/89htd
         d2Tn5TqzkQo8/YByW7HzNmoJJZgNCYKuoUw8sRgU2TuaKTyttxoXdb1ZWKjlXvzHa08X
         mWvD2mIb+3l3Or25IcLvEK9BVxtMw4JuvY131HAkjzthwZx3tdpM41Ruuj2kfrwNDyiL
         hE2A==
X-Gm-Message-State: ACrzQf0UMKRb+8oJm7Qjj/aF4B4u7LHZTDm/Xd71s5sYN5uBb6ANufYO
	i3KIY6mzb078MamXi2jTE4g=
X-Google-Smtp-Source: AMsMyM4N/OKd2AmDOmparUNDFZPpsU/fR47DrbDTYIypTubcUNU2WdBUWUrzBxPphI7T/oHKbd239g==
X-Received: by 2002:a17:907:6eac:b0:78d:ce9c:3761 with SMTP id sh44-20020a1709076eac00b0078dce9c3761mr31116005ejc.738.1666689164330;
        Tue, 25 Oct 2022 02:12:44 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id bo12-20020a170906d04c00b00780f24b797dsm1061953ejb.108.2022.10.25.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 02:12:44 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] staging: rtl8712: check for return value of _r8712_init_xmit_priv()
Date: Tue, 25 Oct 2022 11:12:25 +0200
Message-Id: <b550803561acf26af71f2377215c28b94435a644.1666688642.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666688642.git.namcaov@gmail.com>
References: <cover.1666688642.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of _r8712_init_xmit_priv() is never checked and the driver
always continue execution as if all is well. This will cause problems
if, for example, buffers cannot be allocated and the driver continue and
use those buffers.

Check for return value of _r8712_init_xmit_priv() and return error (if any)
during probing.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 12adb470d216..205b7d66a40a 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -308,7 +308,9 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
 		return ret;
-	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (ret)
+		return ret;
 	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
 	if (ret)
 		return ret;
-- 
2.25.1

