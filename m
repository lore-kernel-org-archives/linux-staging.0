Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CB72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:00:17 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id m6so2579176pfh.13
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4R4J9rlvTKoWzxXXHOcB/bA1tGLKkMYkfbOBsCAW1c0=;
        b=nK0Fz/vWMlj+h/f1e/AMVns+P+Nlx0FsYwdUi34OD1gY4QxbF1zXDQ15+7tAwKK3Y9
         vE33tZpy7wZmQOxSE+kIsqnH/ZLQdMBUrvyX2YnI9K/OqVEw70vGlw4Y2IcUpDa77K8O
         n262CJAlO7e9GJbDiW9K9pG2O98mObCXwBb4GGkTh+DD6/Bxe4lKYENKITL9ECbVQLly
         IRGTkoGwGUaRq7I190MEaVIfU/+btdynTNgaLw6oBn5HVWDM1/5NXB9StrzTcw4EQkfS
         93TZByu3LFh7DBx0T+2hiJgVDSm5DtET8XD2yixkA6YgXdkMW5u1PwisSbiWAwPMGA/0
         kecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4R4J9rlvTKoWzxXXHOcB/bA1tGLKkMYkfbOBsCAW1c0=;
        b=GbXqyy9MNLtGj6EU2F6ECP6sn4oYGx00VsYk3cbC027CMHfnGVLe3nP1+L6T4Lcqef
         2IhqgTK+N2q0QN5uF/rWiyTKfbYetjCzBjrTI7LKxBDTl8rboHWfsh8ddE8UJFNyNNWG
         gEFgDZMBlAmKIPng3ViSNPp0I45Guch1ZmPsqhZF34Hina0nrDGcjAW/LeMuf5TUYxmv
         vcUvW8wrScDrlNqrHy/n3gbZ+5SmlaaQP3hvdi3dECvNFnqDdYHBcfbHl4ml1ara3/j9
         IrxrZ60YWXSRju3/HszwbTVpmh25YB7LnRJ4WWFxVibvzAa5R9eBJ8CrfzzIEh9Cbymi
         bsHQ==
X-Gm-Message-State: AOAM531i+6PWoCMQwVs2HbvVqK1etd9PFMCBcYMv362xfgKxzY96Qyk5
	km97FWoCbfyDVSZ4n2kQYdI=
X-Google-Smtp-Source: ABdhPJym0I1PN2UCPPEzB9U4peV0Maxkqe55xorBpNwGFxR9FZpdQCnwBrl88776uCDZDnwsGGL73g==
X-Received: by 2002:a63:2f04:: with SMTP id v4mr17593682pgv.380.1630256416549;
        Sun, 29 Aug 2021 10:00:16 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id 10sm13062093pgd.12.2021.08.29.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 10:00:16 -0700 (PDT)
Date: Sun, 29 Aug 2021 22:30:09 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	straube.linux@gmail.com, ross.schm.dev@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v4] staging: r8188eu: core: remove null check before vfree
Message-ID: <YSu9GQa1A3s6FYQx@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove NULL check. NULL check before freeing function is not needed.
Correct the indentation.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V4:
- Add Change log below --- line

ChangeLog V3:
- Add change log.

ChangeLog V2:
- Correct the indentation.

 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index f6dffed53a60..c3600cb1790a 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -155,9 +155,8 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		/*===============================*/

-		if (pstapriv->pallocated_stainfo_buf)
-			vfree(pstapriv->pallocated_stainfo_buf);
-		}
+		vfree(pstapriv->pallocated_stainfo_buf);
+	}

 	return _SUCCESS;
 }
--
2.32.0

