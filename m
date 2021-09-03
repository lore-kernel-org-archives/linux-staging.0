Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364572
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 18:18:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id w4so134808ljh.13
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iIMKPB8xrPOdYW5+xiv+opBoM2BrTB5ajbOBWpHHX88=;
        b=lggNLKE1qEAeMghLueW6o2pFaFiCzeh8Q+scXoiDXs1dTpbkuXX+6VLpRzSC4E7T0g
         92xbnKIhqf1GCvhmDXyWLj5o7CwjMRnT1hnnuQsWsZLKKvzkydaW6vygjJKa5prDIdru
         c83UJO3q3JPtlAoYdw+g6jLgtGLKcav71kptAUGwuD2x+acrDervNBe1j9ngTC2/0t9P
         OaBgIGEfelsx5qn8UchjH/vHjkqo8FGaEH7ndjCCHH9JMWbEdhIjgq2N1FatWRWksLdK
         eS6v+Nozqt+tOa5/fnEWKv5qR1auFhTLRyiAtPFnq0AE1UF/H06bmOvC2wJicGUzVcli
         3Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iIMKPB8xrPOdYW5+xiv+opBoM2BrTB5ajbOBWpHHX88=;
        b=Zg1D2MpWoncN0hUdyQI56R0Zqqo1nt2LjRZmtEUOjSxRtMELFLH4fUC0K8eLdF6v5+
         h9paBNEBD4GFTt42rK3Y5o324cWPsF9taNsvFxRCUEj3f4HrlbBciq6wHThfIYejzHze
         jKHcl88KcObJu59kXiKjiD81XqD2QLNrZXosBfNIxNXQEY8yZRYksvqN15NFuYmCpvx/
         KtBAwu9o+cqjbxprmlYXdckWUzwHhGyUMRO4BWoRFPaZ4IJYIvDoTePs0aynbtklJeHG
         8G4xrGgYmz0HH93c8iHCKIEz3CUjYHJzMzVy4No7CE1wuHLNkqlOD6n7UIHimbTOf6w6
         9p7g==
X-Gm-Message-State: AOAM530e8wSrJjRgLk1C6o6H6D1NC74Ue+IFljdLAk9GDXdAlrsVZYQy
	1SrU+u+UeCauQxPqVpM2M9Q=
X-Google-Smtp-Source: ABdhPJw0f9f1EoPPij9K99CG+t/HAmm47ZwTEHOtHfVx/E/bpVNIJLAcySoiUHZI2ya9gsIZ9bMmlw==
X-Received: by 2002:a05:651c:102d:: with SMTP id w13mr225761ljm.229.1630693080643;
        Fri, 03 Sep 2021 11:18:00 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id o22sm15349lfr.32.2021.09.03.11.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:18:00 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: fix memory leak in rtw_set_key
Date: Fri,  3 Sep 2021 21:17:52 +0300
Message-Id: <ee783fbb71abb549505b84542223be7a7c905eea.1630692375.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before returning with an error we should free allocated buffers, since
they are not assigned to anywhere.

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 1115ff5d865a..bd991d7ed809 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1722,6 +1722,8 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 		psetkeyparm->grpkey = 1;
 		break;
 	default:
+		kfree(psetkeyparm);
+		kfree(pcmd);
 		res = _FAIL;
 		goto exit;
 	}
-- 
2.33.0

