Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689470
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:29:06 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id k21so2431474pll.10
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SmF2T8WgYPG3nuJ1m6KJ+pZhfGk3bKG/8cQrek9cOv0=;
        b=DrhVM3Dxmw6cPxVxOClxUTLttNQwxqwI017j57PAJppH2NIKnUVS8RpduAjDAOWdM3
         MttLZN6H2FOFgBesDbuEaMGGMNVmyC1EavEjBDws1xeuwvSc3YKCsmT9IYBgd2AE7aYq
         uIlbIPJUIq7pcdoAqeFkIjZsnxudbdYDKQSCc5pqJ7EUjGxwPX+FLcgVD7DgsZw//vgU
         CSArOLrAEt0SR4VGP49w0O6i89YNpwXF0OKb1xHxfAVzIpY9PoYciAyndkUNnlJU0Lwc
         VtrAB7Ti12+ANpc6bO3K4/CJS6CXHOkPX8Nc4wu9IGllW6kMSXAdIVweyhV/Ps7PQ6Ut
         /w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SmF2T8WgYPG3nuJ1m6KJ+pZhfGk3bKG/8cQrek9cOv0=;
        b=eOHKhjD21ALJtsfPGMfAbSCKAaG1nTHveAKOq0ha1oIxfjbSwm4VYeYpOdgktQ9GeH
         SDSgib4XAFU1LkwCWXaEZ28tuYD5z4VzloU0dWp3b3t5X+jQ+9pTmCSKyJExmazFBw0f
         v+/Chm9Y2NTTo65TeIyx5dHKtAhu/lOuFVGE0bH7iWW8HGA9dM4x6cVy0MAcmi0fh3dE
         n2UbsG5nS2NhHD1Xqvy+bMs5hw9oQ/cAM0vdyz/3lpM4McJc0PRKFdhkIpdO5RNCXsNj
         EmYYAVG6DLSUT079PVLgyNfwRPt/4uaeLVmadANePD2Gon6YLmZkM+3FE8wU2I0Hiy/7
         nOxg==
X-Gm-Message-State: AOAM530XSGKGcUJiC5xBu1oxVxcdi1CJqZbk87ghmqs3tgqWTmIH8oTh
	FwdOg6FS/lMbAcx5Q+tc8bU=
X-Google-Smtp-Source: ABdhPJxYiHoCk371qFQBpwndcP39qCKEiI5k/FXPKXFcmwLcx01aiGvnSYC5Ts0nU06exm8Qo/OX6A==
X-Received: by 2002:a17:902:e9c4:b029:eb:4626:feba with SMTP id 4-20020a170902e9c4b02900eb4626febamr234352plk.39.1618327746013;
        Tue, 13 Apr 2021 08:29:06 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id d18sm2146585pjx.46.2021.04.13.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:05 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:58:59 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 2/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <93922b42e91a1a22ff7373f2875da55543b8fcb0.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>

Reduced length of line as it was exceeding 100 characters by removing
comments from same line and adding it to previous line. This makes code
neater, and meets linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v2:- No changes.
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 438ec3ed7b6b..eb21cbc63af6 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -9,8 +9,12 @@
 /* from /drivers/staging/media/ipu3/include/videodev2.h */
 
 /* Vendor specific - used for IPU3 camera sub-system */
-#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
-#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
+
+/* IPU3 processing parameters */
+#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p')
+
+/* IPU3 3A statistics */
+#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's')
 
 /* from include/uapi/linux/v4l2-controls.h */
 #define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
-- 
2.30.2

