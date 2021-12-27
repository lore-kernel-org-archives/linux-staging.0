Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA652C80
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 07:55:54 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id i5so10654711uaq.10
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 23:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q+MeYuRGV0NsF2AP1J4hMDWlr77F6+vb2TjV7qTkXr4=;
        b=VmN93Bvvz/EaSRdgUDCcFq/WOYY7G9Bvoh0vpigKJ0LqcCa/H/xwkJT4XSRqGhp3Os
         RzQ7z3SiJq//wb+2Vbib82x9jdyLWXlCKX7BWQ2RYqzdkWLYyNDc7YTfY3R/Qfl/4a5v
         TnyAamyAZJIaBjRRO6XhWdYc4wwlPegr9C750F8s1OURuKM5i9QE5K5/Jcwx5Q1qUw63
         dlcriA2KnYodUBictTNseN4Dbuo7276DhPQSJpf/T8/KTrsIfUGihFBMFneJ9t9lVsLB
         pCxeb6z0lFhzXtDcz5Oo01oFCTXxhoLvUgTske7HWma/uc7DFmZXh1fHGB2ulcXRibt1
         WjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q+MeYuRGV0NsF2AP1J4hMDWlr77F6+vb2TjV7qTkXr4=;
        b=z/eF/99LPb/GnoDGcBylrzSrLH2JOnyt8iiyGA1I5oQLgASuMjA/gkb8Tk6wbute45
         xWWp1dG4Ucy5w11tHPsNunlxz2nD6geBQGkDJmAY+h6F7z+2AwXh1+TA4bmmQMNTpycs
         gLdF9Y3NXNAL72ysuhHbyGSKawHo3svIiKD7k0KzvFFaQ+zK/a0mGxWe0IpD0JSb0nI6
         nYMPkmf0IsmeVtU8TNTi/3LhPLbFBoa/5Qn3UP+OekE7P83yo3JayBKG+7HgbEo7nVrh
         gjq//fZU0nPK9K64o5PsyNH/HxP76Rztjmop1odK1blIyhbV1nnHTQs3nQsDKceqc6aP
         sXDQ==
X-Gm-Message-State: AOAM532mY/FVc/6ZKygU3epPYaqxxgao4LstknXni44RsjfUs/1GdbPD
	FXmsgERQ715Zm6S8pwvE319u6L68xXv/9apxyTboD8+djPs=
X-Google-Smtp-Source: ABdhPJzWuSNLeTTp6ntAFLjT4Ruv5knjm6xIRDK3x1HQQzNAQthPW5Ir6r5zUiAlC8y+jklvaS5o49r0wxfl8Nmvdec=
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr4377716vst.65.1640591753420;
 Sun, 26 Dec 2021 23:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Kandur <sys.arch.adam@gmail.com>
Date: Mon, 27 Dec 2021 10:55:42 +0300
Message-ID: <CAE28pkPuP-H2A9Q2m3Eu8aOKQQj9uaVBFYX9XNQXu+Dnz38j9Q@mail.gmail.com>
Subject: [PATCH] qlge: replace goto
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I think this goto can be easily replaced. Hope, this is right.

---
 drivers/staging/qlge/qlge_mpi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
index 96a4de6d2b34..b739dd051c87 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -1122,7 +1122,8 @@ void qlge_mpi_port_cfg_work(struct work_struct *work)
        if (status) {
                netif_err(qdev, drv, qdev->ndev,
                          "Bug: Failed to get port config data.\n");
-               goto err;
+               clear_bit(QL_PORT_CFG, &qdev->flags);
+               return;
        }

        if (qdev->link_config & CFG_JUMBO_FRAME_SIZE &&
@@ -1135,14 +1136,9 @@ void qlge_mpi_port_cfg_work(struct work_struct *work)
        if (status) {
                netif_err(qdev, drv, qdev->ndev,
                          "Bug: Failed to set port config data.\n");
-               goto err;
+               qlge_queue_fw_error(qdev);
+               goto end;
        }
-end:
-       clear_bit(QL_PORT_CFG, &qdev->flags);
-       return;
-err:
-       qlge_queue_fw_error(qdev);
-       goto end;
 }

 /* Process an inter-device request.  This is issues by
-- 
2.34.0
