Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50FE72
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 18:17:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso7230494pjq.4
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QK06svqw7DyH5jd4WQQegPSwOLABf8o6RovqCiYy1aI=;
        b=GdDcYUUFcu40LOvVrFSUSjOdct8TJvYCny7rpi0ZRkFSVfR/5k0QoFQ4ka2tosX2mD
         /LvxPxJFXR/6FBmbVowLEe3MoVk8rOA1LQwvPCZpBIUbfJwYBhBkDKdfNfuHMqrHwqv0
         zBjOfRpyG4pyyBLu8mukkVE2CPpPe6castqRRG9OXFo2srraiomilfK74Cb5C6+Njpvb
         ZtnBOWZz0eGTHk6NhfRRCPwE2zoGCkXdUYX50rOi3G7x+LMi9WPAUqmDZiCvrID3/iTS
         e2HhcO6A4dJiEdT1aIa7Qvdf/orpoBMCmS1iINujGR2p2pAK48gN5GVZfZgHX/dxxL65
         PpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QK06svqw7DyH5jd4WQQegPSwOLABf8o6RovqCiYy1aI=;
        b=U/V95XdQloHlcfC7BqFhM4hfKJRqE361f/kqccFPqnlwPvx3Ev5qP7PCTJ6bR09ADN
         M+1ph/iTpEoxS9dc8hyuwkpUZ1HzHgAQm5E44O+gyoI9ioipKlW566Oc2buOSxeAJPuk
         mKyNzT9bvfwfQaWRvmuH4gFnTeDN3i5RV0iEvZ/ZjLX6mtDInISBgVsu9fo++LYrIp6b
         GIt3xBa3v15ItY7nzFMN5W+pzE9+Ib+wjr0UlD2GB+2BlTGKe83ekXkWkTl2mGvoa/OX
         lmfhTArmzDP/QEuy6+CKAtF+skUeK7J4MY1xOFTjIHPPe9U7pIbPlH+36qMxOeOMY8QE
         K5ng==
X-Gm-Message-State: AOAM533UGMlwSM+Z3aVPenhex7EsrMIHnhfjNVLdfMbSwCB/bavK3T3h
	ILJgSl7oqtBVTDRkVMBWoUs=
X-Google-Smtp-Source: ABdhPJxHJ5qdD6EpLAmrE4/35glO1pjDTLOTtmU/bxNMDeSr70Q8AwlhYP5UzNNPEl/HCqOJQr959w==
X-Received: by 2002:a17:902:ed82:b029:ef:48c8:128e with SMTP id e2-20020a170902ed82b02900ef48c8128emr14366631plj.72.1630174677122;
        Sat, 28 Aug 2021 11:17:57 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id c16sm10196931pfb.196.2021.08.28.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:17:56 -0700 (PDT)
Date: Sat, 28 Aug 2021 23:47:51 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc and
 memcpy
Message-ID: <YSp9z2/JmvHGhW5m@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 81d4255d1785..495fadd2b8c8 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 	}

 	if (ielen) {
-		buf = kzalloc(ielen, GFP_KERNEL);
+		buf = kmemdup(pie, ielen, GFP_KERNEL);
 		if (!buf) {
 			ret =  -ENOMEM;
 			goto exit;
 		}

-		memcpy(buf, pie, ielen);
-
 		/* dump */
 		{
 			int i;
--
2.32.0

